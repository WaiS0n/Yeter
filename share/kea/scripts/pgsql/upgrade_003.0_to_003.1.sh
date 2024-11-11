#!/bin/sh

# Copyright (C) 2017-2023 Internet Systems Consortium, Inc. ("ISC")
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

if [ "$VERSION" != "3.0" ]; then
    printf 'This script upgrades 3.0 to 3.1. '
    printf 'Reported version is %s. Skipping upgrade.\n' "${VERSION}"
    exit 0
fi

psql "$@" >/dev/null <<EOF
START TRANSACTION;

-- This line starts the schema upgrade to version 3.1.

-- The 'client-id' host identifier type was missing in the
-- 2.0 -> 3.0 upgrade script. However, it was present in the
-- dhcpdb_create.pgsql file. This means that this entry may
-- or may not be present. By the conditional insert below we
-- will only insert it if it doesn't exist.
INSERT INTO host_identifier_type (type, name)
  SELECT 3, 'client-id'
    WHERE NOT EXISTS (
        SELECT type FROM host_identifier_type WHERE type = 3
    );

-- We also add a new identifier type: flex-id.
INSERT INTO host_identifier_type VALUES (4, 'flex-id');

-- Update the schema version number.
UPDATE schema_version
    SET version = '3', minor = '1';

-- This line concludes the schema upgrade to version 3.1.

-- Commit the script transaction.
COMMIT;

EOF
