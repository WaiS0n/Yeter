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
if test "${version}" != "11.0"; then
    printf 'This script upgrades 11.0 to 12.0. '
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

mysql "$@" <<EOF
-- This line starts the schema upgrade to version 12.0.

-- Ensure that dhcp_client_class is NULL when an option does not
-- belong to any client class. Later, we will add foreign keys for
-- the dhcp_client_class columns, and it requires that the columns
-- are NULL when there are no corresponding client classes.
SET @disable_audit = 1;
UPDATE dhcp4_options SET dhcp_client_class = NULL
    WHERE scope_id <> 2;
UPDATE dhcp6_options SET dhcp_client_class = NULL
    WHERE scope_id <> 2;
SET @disable_audit = 0;

-- Add a foreign keys referencing a client classes. If an option is
-- associated with a client class, the option will be deleted
-- along with the deleted client class.
ALTER TABLE dhcp4_options
    ADD CONSTRAINT fk_dhcp4_options_client_class
        FOREIGN KEY (dhcp_client_class)
    REFERENCES dhcp4_client_class (name)
    ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE dhcp6_options
    ADD CONSTRAINT fk_dhcp6_options_client_class
        FOREIGN KEY (dhcp_client_class)
    REFERENCES dhcp6_client_class (name)
    ON DELETE CASCADE ON UPDATE CASCADE;

-- Update the schema version number.
UPDATE schema_version
    SET version = '12', minor = '0';

-- This line concludes the schema upgrade to version 12.0.

EOF