#!/bin/sh

# Copyright (C) 2021-2023 Internet Systems Consortium, Inc. ("ISC")
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

# shellcheck disable=SC1091
# SC1091: Not following: ... was not specified as input (see shellcheck -x).

# Exit with error if commands exit with non-zero and if undefined variables are
# used.
set -eu

# shellcheck disable=SC2034
# SC2034: ... appears unused. Verify use (or export if used externally).
prefix="/usr/local"

# Include utilities. Use installed version if available and
# use build version if it isn't.
if test -f "${prefix}/share/kea/scripts/admin-utils.sh"; then
    . "${prefix}/share/kea/scripts/admin-utils.sh"
else
    . "/usr/obj/usr/ports/net/kea/work/kea-2.4.1/src/bin/admin/admin-utils.sh"
fi

# Check version.
version=$(mysql_version "${@}")
if test "${version}" != "9.6"; then
    printf 'This script upgrades 9.6 to 10.0. '
    printf 'Reported version is %s. Skipping upgrade.\n' "${version}"
    exit 0
fi

# Get the schema name from database argument. We need this to
# query information_schema for the right database.
for arg in "${@}"
do
    if ! printf '%s' "${arg}" | grep -Eq -- '^--'
    then
        schema="$arg"
        break
    fi
done

# Make sure we have the schema.
if [ -z "$schema" ]
then
    printf "Could not find database schema name in cmd line args: %s\n" "${*}"
    exit 255
fi

shrink_tag_column() {
    local schema="${1-}"; shift
    local table="${1-}"; shift

    # Check if the table already has a correct server tag length.
    sql="SELECT CHARACTER_MAXIMUM_LENGTH FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='${schema}' AND TABLE_NAME='${table}' AND COLUMN_NAME='tag'"
    if ! taglen=$(mysql -N -B "${@}" -e "${sql}")
    then
        printf 'shrink_tag_column: schema query failed [%s]\n' "${sql}"
        exit 255
    fi

    # We aim for the length of 64 characters.
    if [ "$taglen" -ne 64 ]
    then
        # Check if any of the tags are longer than 64 characters.
        sql="SELECT COUNT(*) FROM $table WHERE CHAR_LENGTH(tag) > 64 LIMIT 1"
        if ! longtag=$(mysql -N -B "${@}" -e "${sql}")
        then
            printf 'shrink_tag_column: select query failed [%s]\n' "${sql}"
            exit 255
        fi
        # Report an error if there are any server tags exceeding 64 characters.
        # A user should fix the tags and rerun this migration.
        if [ "$longtag" -eq 1 ]
        then
            printf 'shrink_tag_column: failed to resize server tag column for table %s.\n' "${table}"
            printf 'Ensure that no server tags are longer than 64 characters and rerun this migration.\n'
            printf 'The remote-server4-set and remote-server6-set commands from  the cb_cmds hooks\n'
            printf 'library can be used to modify the tags.\n'
            exit 255
        fi
        # If there are no long server tags we can safely alter the column.
        sql="ALTER TABLE $table MODIFY COLUMN tag VARCHAR(64) NOT NULL"
        if ! mysql -N -B "${@}" -e "${sql}"
        then
            printf 'shrink_tag_column: alter query failed [%s]\n' "${sql}"
            exit 255
        fi
    fi
}

shrink_tag_column "${schema}" dhcp4_server "${@}"
shrink_tag_column "${schema}" dhcp6_server "${@}"

mysql "$@" <<EOF
-- This line starts the schema upgrade to version 10.0.

-- -----------------------------------------------------------------------
-- Create a table holding the DHCPv4 client classes. Most table
-- columns map directly to respective client class properties in
-- Kea configuration. The depend_on_known_directly column is
-- explicitly set in an insert or update statement to indicate
-- if the client class directly depends on KNOWN or UNKNOWN
-- built-in classes. A caller should determine it by evaluating
-- a test expression before inserting or updating the client
-- class in the database. The nullable follow_class_name column
-- can be used for positioning the inserted or updated client
-- class within the class hierarchy. Set this column value to
-- an existing class name, after which this class should be
-- placed in the class hierarchy. See dhcp4_client_class_order
-- description for the details of how classes are ordered.
-- -----------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS dhcp4_client_class (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(128) NOT NULL,
    test TEXT,
    next_server INT UNSIGNED DEFAULT NULL,
    server_hostname VARCHAR(128) DEFAULT NULL,
    boot_file_name VARCHAR(512) DEFAULT NULL,
    only_if_required TINYINT NOT NULL DEFAULT '0',
    valid_lifetime INT DEFAULT NULL,
    min_valid_lifetime INT DEFAULT NULL,
    max_valid_lifetime INT DEFAULT NULL,
    depend_on_known_directly TINYINT NOT NULL DEFAULT '0',
    follow_class_name VARCHAR(128) DEFAULT NULL,
    modification_ts TIMESTAMP NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY id_UNIQUE (id),
    UNIQUE KEY name_UNIQUE (name),
    KEY key_dhcp4_client_class_modification_ts (modification_ts)
) ENGINE=InnoDB;

-- -----------------------------------------------------------------------
-- Create a table for ordering client classes and holding information
-- about indirect dependencies on KNOWN/UKNOWN built-in client classes.
-- Each class in the dhcp4_client_class table has a corresponding row
-- in the dhcp4_client_class_order table. A caller should not modify
-- the contents of this table. Its entries are automatically created
-- upon inserting or updating client classes in the dhcp4_client_classes
-- using triggers. The order_index designates the position of the client
-- class within the class hierarchy. If the follow_class_name value of
-- the dhcp4_client_class table is set to NULL, the client class is
-- appended at the end of the hierarchy. The assigned order_index
-- value for that class is set to a maximum current value + 1.
-- If the follow_client_class specifies a name of an existing class,
-- the generated order_index is set to an id of that class + 1, and
-- the order_index values of the later classes are incremented by 1.
-- The depend_on_known_indirectly column holds a boolean value indicating
-- whether the given class depends on KNOWN/UKNOWN built-in classes
-- via other classes, i.e. it depends on classes that directly or
-- indirectly depend on these built-ins. This value is auto-generated
-- by a trigger on the dhcp4_client_class_dependency table.
-- -----------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS dhcp4_client_class_order (
    class_id BIGINT UNSIGNED NOT NULL,
    order_index BIGINT UNSIGNED NOT NULL,
    depend_on_known_indirectly TINYINT NOT NULL DEFAULT '0',
    PRIMARY KEY (class_id),
    KEY key_dhcp4_client_class_order_index (order_index),
    CONSTRAINT fk_dhcp4_client_class_order_class_id FOREIGN KEY (class_id)
        REFERENCES dhcp4_client_class (id) ON DELETE CASCADE
) ENGINE=InnoDB;

DROP TRIGGER IF EXISTS dhcp4_client_class_AINS;
DROP TRIGGER IF EXISTS dhcp4_client_class_AUPD;
DROP TRIGGER IF EXISTS dhcp4_client_class_ADEL;
DROP PROCEDURE IF EXISTS setClientClass4Order;

-- -----------------------------------------------------------------------
-- Stored procedure positioning an inserted or updated client class
-- within the class hierarchy, depending on the value of the
-- follow_class_name parameter.
--
-- Parameters:
-- - id id of the positioned class,
-- - follow_class_name name of the class after which this class should be
--   positioned within the class hierarchy.
-- - old_follow_class_name previous name of the class after which this
--   class was positioned within the class hierarchy.
-- -----------------------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE setClientClass4Order(IN id BIGINT UNSIGNED,
                                      IN follow_class_name VARCHAR(128),
                                      IN old_follow_class_name VARCHAR(128))
proc_label:BEGIN
    -- This variable will be optionally set if the follow_class_name
    -- column value is specified.
    DECLARE follow_class_index BIGINT UNSIGNED;
    DECLARE msg TEXT;

    -- Remember currently used value of depend_on_known_indirectly.
    SET @depend_on_known_indirectly = (
        SELECT depend_on_known_indirectly FROM dhcp4_client_class_order WHERE id = class_id
    );

    -- Bail if the class is updated without re-positioning.
    IF(
        @depend_on_known_indirectly IS NOT NULL AND
        ((follow_class_name IS NULL AND old_follow_class_name IS NULL) OR
         (follow_class_name = old_follow_class_name))
    ) THEN
        -- The depend_on_known_indirectly is set to 0 because this procedure is invoked
        -- whenever the dhcp4_client_class record is updated. Such update may include
        -- test expression changes impacting the dependency on KNOWN/UNKNOWN classes.
        -- This value will be later adjusted when dependencies are inserted.
        UPDATE dhcp4_client_class_order SET depend_on_known_indirectly = 0
            WHERE class_id = id;
        LEAVE proc_label;
    END IF;

    IF follow_class_name IS NOT NULL THEN
        -- Get the position of the class after which the new class should be added.
        SET follow_class_index = (
            SELECT o.order_index FROM dhcp4_client_class AS c
                INNER JOIN dhcp4_client_class_order AS o
                    ON c.id = o.class_id
            WHERE c.name = follow_class_name
        );
        IF follow_class_index IS NULL THEN
            -- The class with a name specified with follow_class_name does
            -- not exist.
            SET msg = CONCAT('Class ', follow_class_name, ' does not exist.');
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
        END IF;
        -- We need to place the new class at the position of follow_class_index + 1.
        -- There may be a class at this position already.
        IF EXISTS(SELECT * FROM dhcp4_client_class_order WHERE order_index = follow_class_index + 1) THEN
            -- There is a class at this position already. Let's move all classes
            -- starting from this position by one to create a spot for the new
            -- class.
            UPDATE dhcp4_client_class_order
                SET order_index = order_index + 1
            WHERE order_index >= follow_class_index + 1
            ORDER BY order_index DESC;
        END IF;
    ELSE
        -- A caller did not specify the follow_class_name value. Let's append the
        -- new class at the end of the hierarchy.
        SET follow_class_index = (SELECT MAX(order_index) FROM dhcp4_client_class_order);
        IF follow_class_index IS NULL THEN
            -- Apparently, there are no classes. Let's start from 0.
            SET follow_class_index = 0;
        END IF;
    END IF;

    -- Check if moving the class doesn't break dependent classes.
    IF EXISTS(
        SELECT 1 FROM dhcp4_client_class_dependency AS d
            INNER JOIN dhcp4_client_class_order AS o
                ON d.class_id = o.class_id
            WHERE d.dependency_id = id AND o.order_index < follow_class_index + 1
        LIMIT 1
    ) THEN
        SET msg = CONCAT('Unable to move class with id ', id, ' because it would break its dependencies');
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
    END IF;

    -- The depend_on_known_indirectly is set to 0 because this procedure is invoked
    -- whenever the dhcp4_client_class record is updated. Such update may include
    -- test expression changes impacting the dependency on KNOWN/UNKNOWN classes.
    -- This value will be later adjusted when dependencies are inserted.
    REPLACE INTO dhcp4_client_class_order(class_id, order_index, depend_on_known_indirectly)
        VALUES (id, follow_class_index + 1, 0);
END $$
DELIMITER ;

-- -----------------------------------------------------------------------
-- Trigger to position an inserted class within the class hierarchy
-- and create audit.
-- -----------------------------------------------------------------------
DELIMITER $$
CREATE TRIGGER dhcp4_client_class_AINS AFTER INSERT ON dhcp4_client_class FOR EACH ROW BEGIN
    CALL setClientClass4Order(NEW.id, NEW.follow_class_name, NULL);
    CALL createAuditEntryDHCP4('dhcp4_client_class', NEW.id, "create");
END $$
DELIMITER ;

-- -----------------------------------------------------------------------
-- Trigger to position an updated class within the class hierarchy,
-- create audit and remember the direct dependency on the
-- KNOWN/UNKNOWN built-in classes before the class update.
-- When updating a client class, it is very important to ensure that
-- its dependency on KNOWN or UNKNOWN built-in client classes is not
-- changed. It is because there may be other classes that depend on
-- these built-ins via this class. Changing the dependency would break
-- the chain of dependencies for other classes. Here, we store the
-- information about the dependency in the session variables. Their
-- values will be compared with the new dependencies after an update.
-- If they change, an error will be signaled.
-- -----------------------------------------------------------------------
DELIMITER $$
CREATE TRIGGER dhcp4_client_class_AUPD AFTER UPDATE ON dhcp4_client_class FOR EACH ROW BEGIN
    SET @depend_on_known_directly = OLD.depend_on_known_directly;
    SET @client_class_id = NEW.id;
    CALL setClientClass4Order(NEW.id, NEW.follow_class_name, OLD.follow_class_name);
    CALL createAuditEntryDHCP4('dhcp4_client_class', NEW.id, "update");
END $$
DELIMITER ;

-- -----------------------------------------------------------------------
-- Trigger to create dhcp4_client_class audit.
-- -----------------------------------------------------------------------
DELIMITER $$
CREATE TRIGGER dhcp4_client_class_ADEL AFTER DELETE ON dhcp4_client_class FOR EACH ROW BEGIN
    CALL createAuditEntryDHCP4('dhcp4_client_class', OLD.id, "delete");
END $$
DELIMITER ;

-- -----------------------------------------------------------------------
-- Create a table associating client classes stored in the
-- dhcp4_client_class table with their dependencies. There is
-- an M:N relationship between these tables. Each class may have
-- many dependencies (created using member operator in test expression),
-- and each class may be a dependency for many other classes. A caller
-- is responsible for inserting dependencies for a class after inserting
-- or updating it in the dhcp4_client_class table. A caller should
-- delete all existing dependencies for an updated client class, evaluate
-- test expression to discover new dependencies (in case test expression
-- has changed), and insert new dependencies to this table.
-- -----------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS dhcp4_client_class_dependency (
    class_id BIGINT UNSIGNED NOT NULL,
    dependency_id BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY (class_id,dependency_id),
    KEY dhcp4_client_class_dependency_id_idx (dependency_id),
    CONSTRAINT dhcp4_client_class_class_id FOREIGN KEY (class_id)
        REFERENCES dhcp4_client_class (id) ON DELETE CASCADE,
    CONSTRAINT dhcp4_client_class_dependency_id FOREIGN KEY (dependency_id)
        REFERENCES dhcp4_client_class (id)
) ENGINE=InnoDB;

DROP TRIGGER IF EXISTS dhcp4_client_class_dependency_BINS;
DROP PROCEDURE IF EXISTS checkDHCPv4ClientClassDependency;

-- -----------------------------------------------------------------------
-- Stored procedure verifying if class dependency is met. It includes
-- checking if referenced classes exist, are associated with the same
-- server or all servers, and are defined before the class specified with
-- class_id.
--
-- Parameters:
-- - class_id id client class,
-- - dependency_id id of the dependency.
-- -----------------------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE checkDHCPv4ClientClassDependency(IN class_id BIGINT UNSIGNED,
                                                  IN dependency_id BIGINT UNSIGNED)
BEGIN
    DECLARE class_index BIGINT UNSIGNED;
    DECLARE dependency_index BIGINT UNSIGNED;
    DECLARE err_msg TEXT;

    -- We could check the same with a constraint but later in this
    -- trigger we use this value to verify if the dependencies are
    -- met.
    IF class_id IS NULL THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Client class id must not be NULL.';
    END IF;
    IF dependency_id IS NULL THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Class dependency id must not be NULL.';
    END IF;
    -- Dependencies on self make no sense.
    IF class_id = dependency_id THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Client class must not have dependency on self.';
    END IF;
    -- Check position of our class in the hierarchy.
    SET class_index = (
        SELECT o.order_index FROM dhcp4_client_class AS c
            INNER JOIN dhcp4_client_class_order AS o
                ON c.id = o.class_id
        WHERE c.id = class_id);
    IF class_index IS NULL THEN
        SET err_msg = CONCAT('Client class with id ', class_id, ' does not exist.');
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = err_msg;
    END IF;
    -- Check position of the dependency.
    SET dependency_index = (
        SELECT o.order_index FROM dhcp4_client_class AS c
            INNER JOIN dhcp4_client_class_order AS o ON c.id = o.class_id
        WHERE c.id = dependency_id
    );
    IF dependency_index IS NULL THEN
        SET err_msg = CONCAT('Client class with id ', dependency_id, ' does not exist.');
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = err_msg;
    END IF;
    -- The dependency must not be later than our class.
    IF dependency_index > class_index THEN
        SET err_msg = CONCAT('Client class with id ', class_id, ' must not depend on class defined later with id ', dependency_id);
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = err_msg;
    END IF;

    -- Check if all servers associated with the new class have dependent
    -- classes configured. This catches the cases that class A belongs to
    -- server1 and depends on class B which belongs only to server 2.
    -- It is fine if the class B belongs to all servers in this case.
    -- Make a SELECT on the dhcp4_client_class_server table to gather
    -- all servers to which the class belongs. LEFT JOIN it with the
    -- same table, selecting all records matching the dependency class
    -- and the servers to which the new class belongs. If there are
    -- any NULL records joined it implies that some dependencies are
    -- not met (didn't find a dependency for at least one server).
    IF EXISTS(
        SELECT 1 FROM dhcp4_client_class_server AS t1
            LEFT JOIN dhcp4_client_class_server AS t2
                ON t2.class_id = dependency_id AND (t2.server_id = 1 OR t2.server_id = t1.server_id)
        WHERE t1.class_id = class_id AND t2.server_id IS NULL
        LIMIT 1
    ) THEN
        SET err_msg = CONCAT('Unmet dependencies for client class with id ', class_id);
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = err_msg;
    END IF;
END $$
DELIMITER ;

-- -----------------------------------------------------------------------
-- Trigger verifying if class dependency is met. It includes checking
-- if referenced classes exist, are associated with the same server
-- or all servers, and are defined before the class specified with
-- class_id.
-- -----------------------------------------------------------------------
DELIMITER $$
CREATE TRIGGER dhcp4_client_class_check_dependency_BINS BEFORE INSERT ON dhcp4_client_class_dependency FOR EACH ROW
BEGIN
    CALL checkDHCPv4ClientClassDependency(NEW.class_id, NEW.dependency_id);
END $$
DELIMITER ;

DROP TRIGGER IF EXISTS dhcp4_client_class_dependency_AINS;
DROP PROCEDURE IF EXISTS updateDHCPv4ClientClassKnownDependency;

-- -----------------------------------------------------------------------
-- Stored procedure setting client class indirect dependency on KNOWN or
-- UNKNOWN built-in classes by checking this flag for the client classes
-- on which it depends.
--
-- Parameters:
-- - client_class_id id of the client class which dependency is set,
-- - dependency_id id of the client class on which the given class depends.
-- -----------------------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE updateDHCPv4ClientClassKnownDependency(IN client_class_id BIGINT UNSIGNED,
                                                        IN dependency_id BIGINT UNSIGNED)
BEGIN
    DECLARE dependency TINYINT;
    -- Check if the dependency class references KNOWN/UNKNOWN.
    SET dependency = (
        SELECT depend_on_known_directly FROM dhcp4_client_class
        WHERE id = dependency_id
    );
    -- If it doesn't, check if the dependency references KNOWN/UNKNOWN
    -- indirectly (via other classes).
    IF dependency = 0 THEN
        SET dependency = (
            SELECT depend_on_known_indirectly FROM dhcp4_client_class_order
            WHERE class_id = dependency_id
        );
    END IF;
    IF dependency <> 0 THEN
        UPDATE dhcp4_client_class_order
            SET depend_on_known_indirectly = 1
        WHERE class_id = client_class_id;
    END IF;
END $$
DELIMITER ;

-- -----------------------------------------------------------------------
-- Trigger setting client class indirect dependency on KNOWN or UNKNOWN
-- built-in classes by checking this flag for the client classes on which
-- it depends.
-- -----------------------------------------------------------------------
DELIMITER $$
CREATE TRIGGER dhcp4_client_class_dependency_AINS AFTER INSERT ON dhcp4_client_class_dependency FOR EACH ROW
BEGIN
    CALL updateDHCPv4ClientClassKnownDependency(NEW.class_id, NEW.dependency_id);
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS checkDHCPv4ClientClassKnownDependencyChange;

-- -----------------------------------------------------------------------
-- Stored procedure to be executed before committing a transaction
-- updating a DHCPv4 client class. It verifies if the class dependency on
-- KNOWN or UNKNOWN built-in classes has changed as a result of the
-- update. It signals an error if it has changed and there is at least
-- one class depending on this class.
-- -----------------------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE checkDHCPv4ClientClassKnownDependencyChange()
BEGIN
    DECLARE depended TINYINT DEFAULT 0;
    DECLARE depends TINYINT DEFAULT 0;

    -- Session variables are set upon a client class update.
    IF @client_class_id IS NOT NULL THEN
        -- Check if any of the classes depend on this class. If not,
        -- it is ok to change the dependency on KNOWN/UNKNOWN.
        IF EXISTS(
            SELECT 1 FROM dhcp4_client_class_dependency
            WHERE dependency_id = @client_class_id LIMIT 1
        ) THEN
            -- Using the session variables, determine whether the client class
            -- depended on KNOWN/UNKNOWN before the update.
            IF @depend_on_known_directly <> 0 OR @depend_on_known_indirectly <> 0 THEN
                SET depended = 1;
            END IF;
            -- Check if the client class depends on KNOWN/UNKNOWN after the update.
            SET depends = (
                SELECT depend_on_known_directly FROM dhcp4_client_class
                WHERE id = @client_class_id
            );
            -- If it doesn't depend directly, check indirect dependencies.
            IF depends = 0 THEN
                SET depends = (
                    SELECT depend_on_known_indirectly FROM dhcp4_client_class_order
                    WHERE class_id = @client_class_id
                );
            END IF;
            -- The resulting dependency on KNOWN/UNKNOWN must not change.
            IF depended <> depends THEN
                SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'Class dependency on KNOWN/UNKNOWN built-in classes must not change.';
            END IF;
        END IF;
    END IF;
END $$
DELIMITER ;

-- -----------------------------------------------------------------------
-- Create table matching DHCPv4 classes with the servers.
-- -----------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS dhcp4_client_class_server (
    class_id bigint unsigned NOT NULL,
    server_id bigint unsigned NOT NULL,
    modification_ts timestamp NULL DEFAULT NULL,
    PRIMARY KEY (class_id,server_id),
    KEY fk_dhcp4_client_class_server_id (server_id),
    CONSTRAINT fk_dhcp4_client_class_class_id FOREIGN KEY (class_id)
        REFERENCES dhcp4_client_class (id)
        ON DELETE CASCADE,
    CONSTRAINT fk_dhcp4_client_class_server_id FOREIGN KEY (server_id)
        REFERENCES dhcp4_server (id)
) ENGINE=InnoDB;

-- -----------------------------------------------------------------------
-- Extend the table holding DHCPv4 option definitions with a nullable
-- column matching option defintions with client classes.
-- -----------------------------------------------------------------------
ALTER TABLE dhcp4_option_def
    ADD COLUMN class_id BIGINT UNSIGNED NULL DEFAULT NULL;

ALTER TABLE dhcp4_option_def
  ADD CONSTRAINT fk_dhcp4_option_def_client_class_id
    FOREIGN KEY (class_id)
    REFERENCES dhcp4_client_class (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

-- -----------------------------------------------------------------------
-- Create a table holding the DHCPv6 client classes. Most table
-- columns map directly to respective client class properties in
-- Kea configuration. The depend_on_known_directly column is
-- explicitly set in an insert or update statement to indicate
-- if the client class directly depends on KNOWN or UNKNOWN
-- built-in classes. A caller should determine it by evaluating
-- a test expression before inserting or updating the client
-- class in the database. The nullable follow_class_name column
-- can be used for positioning the inserted or updated client
-- class within the class hierarchy. Set this column value to
-- an existing class name, after which this class should be
-- placed in the class hierarchy. See dhcp6_client_class_order
-- description for the details of how classes are ordered.
-- -----------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS dhcp6_client_class (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(128) NOT NULL,
    test TEXT,
    only_if_required TINYINT NOT NULL DEFAULT '0',
    valid_lifetime INT DEFAULT NULL,
    min_valid_lifetime INT DEFAULT NULL,
    max_valid_lifetime INT DEFAULT NULL,
    depend_on_known_directly TINYINT NOT NULL DEFAULT '0',
    follow_class_name VARCHAR(128) DEFAULT NULL,
    modification_ts TIMESTAMP NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY id_UNIQUE (id),
    UNIQUE KEY name_UNIQUE (name),
    KEY key_dhcp6_client_class_modification_ts (modification_ts)
) ENGINE=InnoDB;

-- -----------------------------------------------------------------------
-- Create a table for ordering client classes and holding information
-- about indirect dependencies on KNOWN/UKNOWN built-in client classes.
-- Each class in the dhcp6_client_class table has a corresponding row
-- in the dhcp6_client_class_order table. A caller should not modify
-- the contents of this table. Its entries are automatically created
-- upon inserting or updating client classes in the dhcp6_client_classes
-- using triggers. The order_index designates the position of the client
-- class within the class hierarchy. If the follow_class_name value of
-- the dhcp6_client_class table is set to NULL, the client class is
-- appended at the end of the hierarchy. The assigned order_index
-- value for that class is set to a maximum current value + 1.
-- If the follow_client_class specifies a name of an existing class,
-- the generated order_index is set to an id of that class + 1, and
-- the order_index values of the later classes are incremented by 1.
-- The depend_on_known_indirectly column holds a boolean value indicating
-- whether the given class depends on KNOWN/UKNOWN built-in classes
-- via other classes, i.e. it depends on classes that directly or
-- indirectly depend on these built-ins. This value is auto-generated
-- by a trigger on the dhcp6_client_class_dependency table.
-- -----------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS dhcp6_client_class_order (
    class_id BIGINT UNSIGNED NOT NULL,
    order_index BIGINT UNSIGNED NOT NULL,
    depend_on_known_indirectly TINYINT NOT NULL DEFAULT '0',
    PRIMARY KEY (class_id),
    KEY key_dhcp6_client_class_order_index (order_index),
    CONSTRAINT fk_dhcp6_client_class_order_class_id FOREIGN KEY (class_id)
        REFERENCES dhcp6_client_class (id) ON DELETE CASCADE
) ENGINE=InnoDB;

DROP TRIGGER IF EXISTS dhcp6_client_class_AINS;
DROP TRIGGER IF EXISTS dhcp6_client_class_AUPD;
DROP TRIGGER IF EXISTS dhcp6_client_class_ADEL;
DROP PROCEDURE IF EXISTS setClientClass6Order;

-- -----------------------------------------------------------------------
-- Stored procedure positioning an inserted or updated client class
-- within the class hierarchy, depending on the value of the
-- follow_class_name parameter.
--
-- Parameters:
-- - id id of the positioned class,
-- - follow_class_name name of the class after which this class should be
--   positioned within the class hierarchy.
-- - old_follow_class_name previous name of the class after which this
--   class was positioned within the class hierarchy.
-- -----------------------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE setClientClass6Order(IN id BIGINT UNSIGNED,
                                      IN follow_class_name VARCHAR(128),
                                      IN old_follow_class_name VARCHAR(128))
proc_label:BEGIN
    -- This variable will be optionally set if the follow_class_name
    -- column value is specified.
    DECLARE follow_class_index BIGINT UNSIGNED;
    DECLARE msg TEXT;

    -- Remember currently used value of depend_on_known_indirectly.
    SET @depend_on_known_indirectly = (
        SELECT depend_on_known_indirectly FROM dhcp6_client_class_order WHERE id = class_id
    );

    -- Bail if the class is updated without re-positioning.
    IF(
        @depend_on_known_indirectly IS NOT NULL AND
        ((follow_class_name IS NULL AND old_follow_class_name IS NULL) OR
         (follow_class_name = old_follow_class_name))
    ) THEN
        -- The depend_on_known_indirectly is set to 0 because this procedure is invoked
        -- whenever the dhcp6_client_class record is updated. Such update may include
        -- test expression changes impacting the dependency on KNOWN/UNKNOWN classes.
        -- This value will be later adjusted when dependencies are inserted.
        UPDATE dhcp6_client_class_order SET depend_on_known_indirectly = 0
            WHERE class_id = id;
        LEAVE proc_label;
    END IF;

    IF follow_class_name IS NOT NULL THEN
        -- Get the position of the class after which the new class should be added.
        SET follow_class_index = (
            SELECT o.order_index FROM dhcp6_client_class AS c
                INNER JOIN dhcp6_client_class_order AS o
                    ON c.id = o.class_id
            WHERE c.name = follow_class_name
        );
        IF follow_class_index IS NULL THEN
            -- The class with a name specified with follow_class_name does
            -- not exist.
            SET msg = CONCAT('Class ', follow_class_name, ' does not exist.');
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
        END IF;
        -- We need to place the new class at the position of follow_class_index + 1.
        -- There may be a class at this position already.
        IF EXISTS(SELECT * FROM dhcp6_client_class_order WHERE order_index = follow_class_index + 1) THEN
            -- There is a class at this position already. Let's move all classes
            -- starting from this position by one to create a spot for the new
            -- class.
            UPDATE dhcp6_client_class_order
                SET order_index = order_index + 1
            WHERE order_index >= follow_class_index + 1
            ORDER BY order_index DESC;
        END IF;
    ELSE
        -- A caller did not specify the follow_class_name value. Let's append the
        -- new class at the end of the hierarchy.
        SET follow_class_index = (SELECT MAX(order_index) FROM dhcp6_client_class_order);
        IF follow_class_index IS NULL THEN
            -- Apparently, there are no classes. Let's start from 0.
            SET follow_class_index = 0;
        END IF;
    END IF;

    -- Check if moving the class doesn't break dependent classes.
    IF EXISTS(
        SELECT 1 FROM dhcp6_client_class_dependency AS d
            INNER JOIN dhcp6_client_class_order AS o
                ON d.class_id = o.class_id
            WHERE d.dependency_id = id AND o.order_index < follow_class_index + 1
        LIMIT 1
    ) THEN
        SET msg = CONCAT('Unable to move class with id ', id, ' because it would break its dependencies');
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
    END IF;

    -- The depend_on_known_indirectly is set to 0 because this procedure is invoked
    -- whenever the dhcp6_client_class record is updated. Such update may include
    -- test expression changes impacting the dependency on KNOWN/UNKNOWN classes.
    -- This value will be later adjusted when dependencies are inserted.
    REPLACE INTO dhcp6_client_class_order(class_id, order_index, depend_on_known_indirectly)
        VALUES (id, follow_class_index + 1, 0);
END $$
DELIMITER ;

-- -----------------------------------------------------------------------
-- Trigger to position an inserted class within the class hierarchy
-- and create audit.
-- -----------------------------------------------------------------------
DELIMITER $$
CREATE TRIGGER dhcp6_client_class_AINS AFTER INSERT ON dhcp6_client_class FOR EACH ROW BEGIN
    CALL setClientClass6Order(NEW.id, NEW.follow_class_name, NULL);
    CALL createAuditEntryDHCP6('dhcp6_client_class', NEW.id, "create");
END $$
DELIMITER ;

-- -----------------------------------------------------------------------
-- Trigger to position an updated class within the class hierarchy,
-- create audit and remember the direct dependency on the
-- KNOWN/UNKNOWN built-in classes before the class update.
-- When updating a client class, it is very important to ensure that
-- its dependency on KNOWN or UNKNOWN built-in client classes is not
-- changed. It is because there may be other classes that depend on
-- these built-ins via this class. Changing the dependency would break
-- the chain of dependencies for other classes. Here, we store the
-- information about the dependency in the session variables. Their
-- values will be compared with the new dependencies after an update.
-- If they change, an error will be signaled.
-- -----------------------------------------------------------------------
DELIMITER $$
CREATE TRIGGER dhcp6_client_class_AUPD AFTER UPDATE ON dhcp6_client_class FOR EACH ROW BEGIN
    SET @depend_on_known_directly = OLD.depend_on_known_directly;
    SET @client_class_id = NEW.id;
    CALL setClientClass6Order(NEW.id, NEW.follow_class_name, OLD.follow_class_name);
    CALL createAuditEntryDHCP6('dhcp6_client_class', NEW.id, "update");
END $$
DELIMITER ;

-- -----------------------------------------------------------------------
-- Trigger to create dhcp6_client_class audit.
-- -----------------------------------------------------------------------
DELIMITER $$
CREATE TRIGGER dhcp6_client_class_ADEL AFTER DELETE ON dhcp6_client_class FOR EACH ROW BEGIN
    CALL createAuditEntryDHCP6('dhcp6_client_class', OLD.id, "delete");
END $$
DELIMITER ;

-- -----------------------------------------------------------------------
-- Create a table associating client classes stored in the
-- dhcp6_client_class table with their dependencies. There is
-- an M:N relationship between these tables. Each class may have
-- many dependencies (created using member operator in test expression),
-- and each class may be a dependency for many other classes. A caller
-- is responsible for inserting dependencies for a class after inserting
-- or updating it in the dhcp6_client_class table. A caller should
-- delete all existing dependencies for an updated client class, evaluate
-- test expression to discover new dependencies (in case test expression
-- has changed), and insert new dependencies to this table.
-- -----------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS dhcp6_client_class_dependency (
    class_id BIGINT UNSIGNED NOT NULL,
    dependency_id BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY (class_id,dependency_id),
    KEY dhcp6_client_class_dependency_id_idx (dependency_id),
    CONSTRAINT dhcp6_client_class_class_id FOREIGN KEY (class_id)
        REFERENCES dhcp6_client_class (id) ON DELETE CASCADE,
    CONSTRAINT dhcp6_client_class_dependency_id FOREIGN KEY (dependency_id)
        REFERENCES dhcp6_client_class (id)
) ENGINE=InnoDB;

DROP TRIGGER IF EXISTS dhcp6_client_class_dependency_BINS;
DROP PROCEDURE IF EXISTS checkDHCPv6ClientClassDependency;

-- -----------------------------------------------------------------------
-- Stored procedure verifying if class dependency is met. It includes
-- checking if referenced classes exist, are associated with the same
-- server or all servers, and are defined before the class specified with
-- class_id.
--
-- Parameters:
-- - class_id id client class,
-- - dependency_id id of the dependency.
-- -----------------------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE checkDHCPv6ClientClassDependency(IN class_id BIGINT UNSIGNED,
                                                  IN dependency_id BIGINT UNSIGNED)
BEGIN
    DECLARE class_index BIGINT UNSIGNED;
    DECLARE dependency_index BIGINT UNSIGNED;
    DECLARE err_msg TEXT;

    -- We could check the same with a constraint but later in this
    -- trigger we use this value to verify if the dependencies are
    -- met.
    IF class_id IS NULL THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Client class id must not be NULL.';
    END IF;
    IF dependency_id IS NULL THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Class dependency id must not be NULL.';
    END IF;
    -- Dependencies on self make no sense.
    IF class_id = dependency_id THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Client class must not have dependency on self.';
    END IF;
    -- Check position of our class in the hierarchy.
    SET class_index = (
        SELECT o.order_index FROM dhcp6_client_class AS c
            INNER JOIN dhcp6_client_class_order AS o
                ON c.id = o.class_id
        WHERE c.id = class_id);
    IF class_index IS NULL THEN
        SET err_msg = CONCAT('Client class with id ', class_id, ' does not exist.');
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = err_msg;
    END IF;
    -- Check position of the dependency.
    SET dependency_index = (
        SELECT o.order_index FROM dhcp6_client_class AS c
            INNER JOIN dhcp6_client_class_order AS o ON c.id = o.class_id
        WHERE c.id = dependency_id
    );
    IF dependency_index IS NULL THEN
        SET err_msg = CONCAT('Client class with id ', dependency_id, ' does not exist.');
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = err_msg;
    END IF;
    -- The dependency must not be later than our class.
    IF dependency_index > class_index THEN
        SET err_msg = CONCAT('Client class with id ', class_id, ' must not depend on class defined later with id ', dependency_id);
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = err_msg;
    END IF;

    -- Check if all servers associated with the new class have dependent
    -- classes configured. This catches the cases that class A belongs to
    -- server1 and depends on class B which belongs only to server 2.
    -- It is fine if the class B belongs to all servers in this case.
    -- Make a SELECT on the dhcp6_client_class_server table to gather
    -- all servers to which the class belongs. LEFT JOIN it with the
    -- same table, selecting all records matching the dependency class
    -- and the servers to which the new class belongs. If there are
    -- any NULL records joined it implies that some dependencies are
    -- not met (didn't find a dependency for at least one server).
    IF EXISTS(
        SELECT 1 FROM dhcp6_client_class_server AS t1
            LEFT JOIN dhcp6_client_class_server AS t2
                ON t2.class_id = dependency_id AND (t2.server_id = 1 OR t2.server_id = t1.server_id)
        WHERE t1.class_id = class_id AND t2.server_id IS NULL
        LIMIT 1
    ) THEN
        SET err_msg = CONCAT('Unmet dependencies for client class with id ', class_id);
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = err_msg;
    END IF;
END $$
DELIMITER ;

-- -----------------------------------------------------------------------
-- Trigger verifying if class dependency is met. It includes checking
-- if referenced classes exist, are associated with the same server
-- or all servers, and are defined before the class specified with
-- class_id.
-- -----------------------------------------------------------------------
DELIMITER $$
CREATE TRIGGER dhcp6_client_class_check_dependency_BINS BEFORE INSERT ON dhcp6_client_class_dependency FOR EACH ROW
BEGIN
    CALL checkDHCPv6ClientClassDependency(NEW.class_id, NEW.dependency_id);
END $$
DELIMITER ;

DROP TRIGGER IF EXISTS dhcp6_client_class_dependency_AINS;
DROP PROCEDURE IF EXISTS updateDHCPv6ClientClassKnownDependency;

-- -----------------------------------------------------------------------
-- Stored procedure setting client class indirect dependency on KNOWN or
-- UNKNOWN built-in classes by checking this flag for the client classes
-- on which it depends.
--
-- Parameters:
-- - client_class_id id of the client class which dependency is set,
-- - dependency_id id of the client class on which the given class depends.
-- -----------------------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE updateDHCPv6ClientClassKnownDependency(IN client_class_id BIGINT UNSIGNED,
                                                        IN dependency_id BIGINT UNSIGNED)
BEGIN
    DECLARE dependency TINYINT;
    -- Check if the dependency class references KNOWN/UNKNOWN.
    SET dependency = (
        SELECT depend_on_known_directly FROM dhcp6_client_class
        WHERE id = dependency_id
    );
    -- If it doesn't, check if the dependency references KNOWN/UNKNOWN
    -- indirectly (via other classes).
    IF dependency = 0 THEN
        SET dependency = (
            SELECT depend_on_known_indirectly FROM dhcp6_client_class_order
            WHERE class_id = dependency_id
        );
    END IF;
    IF dependency <> 0 THEN
        UPDATE dhcp6_client_class_order
            SET depend_on_known_indirectly = 1
        WHERE class_id = client_class_id;
    END IF;
END $$
DELIMITER ;

-- -----------------------------------------------------------------------
-- Trigger setting client class indirect dependency on KNOWN or UNKNOWN
-- built-in classes by checking this flag for the client classes on which
-- it depends.
-- -----------------------------------------------------------------------
DELIMITER $$
CREATE TRIGGER dhcp6_client_class_dependency_AINS AFTER INSERT ON dhcp6_client_class_dependency FOR EACH ROW
BEGIN
    CALL updateDHCPv6ClientClassKnownDependency(NEW.class_id, NEW.dependency_id);
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS checkDHCPv6ClientClassKnownDependencyChange;

-- -----------------------------------------------------------------------
-- Stored procedure to be executed before committing a transaction
-- updating a DHCPv6 client class. It verifies if the class dependency on
-- KNOWN or UNKNOWN built-in classes has changed as a result of the
-- update. It signals an error if it has changed and there is at least
-- one class depending on this class.
-- -----------------------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE checkDHCPv6ClientClassKnownDependencyChange()
BEGIN
    DECLARE depended TINYINT DEFAULT 0;
    DECLARE depends TINYINT DEFAULT 0;

    -- Session variables are set upon a client class update.
    IF @client_class_id IS NOT NULL THEN
        -- Check if any of the classes depend on this class. If not,
        -- it is ok to change the dependency on KNOWN/UNKNOWN.
        IF EXISTS(
            SELECT 1 FROM dhcp6_client_class_dependency
            WHERE dependency_id = @client_class_id LIMIT 1
        ) THEN
            -- Using the session variables, determine whether the client class
            -- depended on KNOWN/UNKNOWN before the update.
            IF @depend_on_known_directly <> 0 OR @depend_on_known_indirectly <> 0 THEN
                SET depended = 1;
            END IF;
            -- Check if the client class depends on KNOWN/UNKNOWN after the update.
            SET depends = (
                SELECT depend_on_known_directly FROM dhcp6_client_class
                WHERE id = @client_class_id
            );
            -- If it doesn't depend directly, check indirect dependencies.
            IF depends = 0 THEN
                SET depends = (
                    SELECT depend_on_known_indirectly FROM dhcp6_client_class_order
                    WHERE class_id = @client_class_id
                );
            END IF;
            -- The resulting dependency on KNOWN/UNKNOWN must not change.
            IF depended <> depends THEN
                SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'Class dependency on KNOWN/UNKNOWN built-in classes must not change.';
            END IF;
        END IF;
    END IF;
END $$
DELIMITER ;

-- -----------------------------------------------------------------------
-- Create table matching DHCPv6 classes with the servers.
-- -----------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS dhcp6_client_class_server (
    class_id bigint unsigned NOT NULL,
    server_id bigint unsigned NOT NULL,
    modification_ts timestamp NULL DEFAULT NULL,
    PRIMARY KEY (class_id,server_id),
    KEY fk_dhcp6_client_class_server_id (server_id),
    CONSTRAINT fk_dhcp6_client_class_class_id FOREIGN KEY (class_id)
        REFERENCES dhcp6_client_class (id)
        ON DELETE CASCADE,
    CONSTRAINT fk_dhcp6_client_class_server_id FOREIGN KEY (server_id)
        REFERENCES dhcp6_server (id)
) ENGINE=InnoDB;

-- -----------------------------------------------------------------------
-- Extend the table holding DHCPv6 option definitions with a nullable
-- column matching option defintions with client classes.
-- -----------------------------------------------------------------------
ALTER TABLE dhcp6_option_def
    ADD COLUMN class_id BIGINT UNSIGNED NULL DEFAULT NULL;

ALTER TABLE dhcp6_option_def
  ADD CONSTRAINT fk_dhcp6_option_def_client_class_id
    FOREIGN KEY (class_id)
    REFERENCES dhcp6_client_class (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

# Update the schema version number.
UPDATE schema_version
    SET version = '10', minor = '0';

# This line concludes the schema upgrade to version 10.0.

EOF