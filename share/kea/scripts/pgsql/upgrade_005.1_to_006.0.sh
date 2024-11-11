#!/bin/sh

# Copyright (C) 2019-2023 Internet Systems Consortium, Inc. ("ISC")
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

if [ "$VERSION" != "5.1" ]; then
    printf 'This script upgrades 5.1 to 6.0. '
    printf 'Reported version is %s. Skipping upgrade.\n' "${VERSION}"
    exit 0
fi

psql "$@" >/dev/null <<EOF
START TRANSACTION;

-- This line starts the schema upgrade to version 6.0.

-- Create a lower case hostname index for hosts.
CREATE INDEX hosts_by_hostname ON hosts (lower(hostname))
WHERE hostname IS NOT NULL;

-- Create a hostname index for lease4.
CREATE INDEX lease4_by_hostname ON lease4 (lower(hostname))
WHERE hostname IS NOT NULL;

-- Create a hostname index for lease6.
CREATE INDEX lease6_by_hostname ON lease6 (lower(hostname))
WHERE hostname IS NOT NULL;

-- Move to lower case hostnames in lease4 table.
-- Not required so in comment
-- UPDATE lease4 SET hostname = lower(hostname)
-- WHERE lower(hostname) != hostname;

-- Move to lower case hostnames in lease6 table.
-- Not required so in comment
-- UPDATE lease6 SET hostname = lower(hostname)
-- WHERE lower(hostname) != hostname;

-- Update the schema version number.
UPDATE schema_version
    SET version = '6', minor = '0';

-- This line concludes the schema upgrade to version 6.0.

-- Commit the script transaction.
COMMIT;

EOF
