#!/bin/sh

# Copyright (C) 2018-2023 Internet Systems Consortium, Inc. ("ISC")
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

if [ "$VERSION" != "3.2" ]; then
    printf 'This script upgrades 3.2 to 3.3. '
    printf 'Reported version is %s. Skipping upgrade.\n' "${VERSION}"
    exit 0
fi

psql "$@" >/dev/null <<EOF
START TRANSACTION;

-- This line starts the schema upgrade to version 3.3.

-- Change subnet ID columns type to BIGINT to match lease4/6 tables
ALTER TABLE hosts ALTER COLUMN dhcp4_subnet_id TYPE BIGINT;
ALTER TABLE hosts ALTER COLUMN dhcp6_subnet_id TYPE BIGINT;

ALTER TABLE dhcp4_options ALTER COLUMN dhcp4_subnet_id TYPE BIGINT;
ALTER TABLE dhcp6_options ALTER COLUMN dhcp6_subnet_id TYPE BIGINT;

-- Update the schema version number.
UPDATE schema_version
    SET version = '3', minor = '3';

-- This line concludes the schema upgrade to version 3.3.

-- Commit the script transaction.
COMMIT;

EOF