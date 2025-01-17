#!/bin/sh

# Copyright (C) 2023 Internet Systems Consortium, Inc. ("ISC")
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
if test "${version}" != "14.0"; then
    printf 'This script upgrades 14.0 to 15.0. '
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
-- This line starts the schema upgrade to version 15.0.

-- Add cancelled (aka never-send) column to option tables.
ALTER TABLE dhcp4_options
    ADD COLUMN cancelled TINYINT(1) NOT NULL DEFAULT 0;

ALTER TABLE dhcp6_options
    ADD COLUMN cancelled TINYINT(1) NOT NULL DEFAULT 0;

-- Add offer_lifetime column to v4 tables.
ALTER TABLE dhcp4_shared_network
    ADD COLUMN offer_lifetime INT(10) DEFAULT NULL;

ALTER TABLE dhcp4_subnet
    ADD COLUMN offer_lifetime INT(10) DEFAULT NULL;

ALTER TABLE dhcp4_client_class
    ADD COLUMN offer_lifetime INT(10) DEFAULT NULL;

-- Update the schema version number.
UPDATE schema_version
    SET version = '15', minor = '0';

-- This line concludes the schema upgrade to version 15.0.

EOF
