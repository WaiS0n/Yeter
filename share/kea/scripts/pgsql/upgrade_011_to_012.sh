#!/bin/sh

# Copyright (C) 2022-2023 Internet Systems Consortium, Inc. ("ISC")
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

VERSION=$(pgsql_version "$@")

if [ "$VERSION" != "11.0" ]; then
    printf 'This script upgrades 11.0 to 12.0. '
    printf 'Reported version is %s. Skipping upgrade.\n' "${VERSION}"
    exit 0
fi

psql "$@" >/dev/null <<EOF
START TRANSACTION;

-- This line starts the schema upgrade to version 12.0.

-- Modify shared-network-name foreign key constraint on dhcp4_subnet to not perform
-- the update when the network is deleted the cascaded update will not execute
-- dhcp4_subnet update trigger leaving the updated subnets without audit_entries.
ALTER TABLE dhcp4_subnet
    DROP CONSTRAINT fk_dhcp4_subnet_shared_network,
    ADD CONSTRAINT fk_dhcp4_subnet_shared_network FOREIGN KEY (shared_network_name)
         REFERENCES dhcp4_shared_network (name)
         ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Modify BEFORE delete trigger function on dhcp4_shared_network to explicitly
-- update dhcp4_subnets. This ensures there are audit entries for updated
-- subnets.
-- Trigger function for dhcp4_shared_network_BDEL called BEFORE DELETE on dhcp4_shared_network
CREATE OR REPLACE FUNCTION func_dhcp4_shared_network_BDEL() RETURNS TRIGGER AS \$dhcp4_shared_network_BDEL\$
BEGIN
    PERFORM createAuditEntryDHCP4('dhcp4_shared_network', OLD.id, 'delete');
    -- Explicitly update subnets now rather than via foreign key constraint, this ensures the
    -- audit entries for subnets will preceded that of the shared-network, keeping the order
    -- of the entries the same as they are for MySQL.
    UPDATE dhcp4_subnet SET shared_network_name = NULL WHERE shared_network_name = OLD.name;
    DELETE FROM dhcp4_options WHERE shared_network_name = OLD.name;
    RETURN OLD;
END;
\$dhcp4_shared_network_BDEL\$
LANGUAGE plpgsql;

-- Modify shared-network-name foreign key constraint on dhcp6_subnet to not perform
-- the update when the network is deleted the cascaded update will not execute
-- dhcp6_subnet update trigger leaving the updated subnets without audit_entries.
ALTER TABLE dhcp6_subnet
    DROP CONSTRAINT fk_dhcp6_subnet_shared_network,
    ADD CONSTRAINT fk_dhcp6_subnet_shared_network FOREIGN KEY (shared_network_name)
         REFERENCES dhcp6_shared_network (name)
         ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Modify BEFORE delete trigger function on dhcp6_shared_network to explicitly
-- update dhcp6_subnets. This ensures there are audit entries for updated
-- subnets.
-- Trigger function for dhcp6_shared_network_BDEL called BEFORE DELETE on dhcp6_shared_network
CREATE OR REPLACE FUNCTION func_dhcp6_shared_network_BDEL() RETURNS TRIGGER AS \$dhcp6_shared_network_BDEL\$
BEGIN
    PERFORM createAuditEntryDHCP6('dhcp6_shared_network', OLD.id, 'delete');
    -- Explicitly update subnets now rather than via foreign key constraint, this ensures the
    -- audit entries for subnets will preceded that of the shared-network, keeping the order
    -- of the entries the same as they are for MySQL.
    UPDATE dhcp6_subnet SET shared_network_name = NULL WHERE shared_network_name = OLD.name;
    DELETE FROM dhcp6_options WHERE shared_network_name = OLD.name;
    RETURN OLD;
END;
\$dhcp6_shared_network_BDEL\$
LANGUAGE plpgsql;

-- Add user_context column to client class tables.
ALTER TABLE dhcp4_client_class ADD COLUMN user_context JSON DEFAULT NULL;
ALTER TABLE dhcp6_client_class ADD COLUMN user_context JSON DEFAULT NULL;

-- Update the schema version number.
UPDATE schema_version
    SET version = '12', minor = '0';

-- This line concludes the schema upgrade to version 12.0.

-- Commit the script transaction.
COMMIT;

EOF
