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

if [ "$VERSION" != "13.0" ]; then
    printf 'This script upgrades 13.0 to 14.0. '
    printf 'Reported version is %s. Skipping upgrade.\n' "${VERSION}"
    exit 0
fi

psql "$@" >/dev/null <<EOF
START TRANSACTION;

-- This line starts the schema upgrade to version 14.0.

-- Add cancelled (aka never-send) column to option tables.

ALTER TABLE dhcp4_options ADD COLUMN cancelled BOOLEAN NOT NULL DEFAULT 'f';
ALTER TABLE dhcp6_options ADD COLUMN cancelled BOOLEAN NOT NULL DEFAULT 'f';

-- Add offer_lifetime column to v4 tables.
ALTER TABLE dhcp4_shared_network
    ADD COLUMN offer_lifetime BIGINT DEFAULT NULL;

ALTER TABLE dhcp4_subnet
    ADD COLUMN offer_lifetime BIGINT DEFAULT NULL;

ALTER TABLE dhcp4_client_class
    ADD COLUMN offer_lifetime BIGINT DEFAULT NULL;

-- Update the schema version number.
UPDATE schema_version
    SET version = '14', minor = '0';

-- This line concludes the schema upgrade to version 14.0.

-- Commit the script transaction.
COMMIT;

EOF
