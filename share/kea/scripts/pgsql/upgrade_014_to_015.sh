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

VERSION=$(pgsql_version "$@")

if [ "$VERSION" != "14.0" ]; then
    printf 'This script upgrades 14.0 to 15.0. '
    printf 'Reported version is %s. Skipping upgrade.\n' "${VERSION}"
    exit 0
fi

psql "$@" >/dev/null <<EOF
START TRANSACTION;

-- This line starts the schema upgrade to version 15.0.

-- Add relay and remote id columns to DHCPv4 leases.
--
-- Note: these columns are only used for indexes, in particular they are
-- not exported by lease4 dump as values are also in the user context
ALTER TABLE lease4
    ADD COLUMN relay_id BYTEA DEFAULT NULL,
    ADD COLUMN remote_id BYTEA DEFAULT NULL;

-- Create relay and remote id indexes.
CREATE INDEX lease4_by_relay_id ON lease4 (relay_id);
CREATE INDEX lease4_by_remote_id ON lease4 (remote_id);

-- Update the schema version number.
UPDATE schema_version
    SET version = '15', minor = '0';

-- This line concludes the schema upgrade to version 15.0.

-- Commit the script transaction.
COMMIT;

EOF
