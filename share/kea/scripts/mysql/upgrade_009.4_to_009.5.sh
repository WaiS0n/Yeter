#!/bin/sh

# Copyright (C) 2020-2023 Internet Systems Consortium, Inc. ("ISC")
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

VERSION=$(mysql_version "$@")

if [ "$VERSION" != "9.4" ]; then
    printf 'This script upgrades 9.4 to 9.5. '
    printf 'Reported version is %s. Skipping upgrade.\n' "${VERSION}"
    exit 0
fi

mysql "$@" <<EOF
-- This line starts the schema upgrade to version 9.5.

# Add new reservations flags.
ALTER TABLE dhcp4_subnet
    ADD COLUMN reservations_global BOOL DEFAULT NULL,
    ADD COLUMN reservations_in_subnet BOOL DEFAULT NULL,
    ADD COLUMN reservations_out_of_pool BOOL DEFAULT NULL;

ALTER TABLE dhcp4_shared_network
    ADD COLUMN reservations_global BOOL DEFAULT NULL,
    ADD COLUMN reservations_in_subnet BOOL DEFAULT NULL,
    ADD COLUMN reservations_out_of_pool BOOL DEFAULT NULL;

ALTER TABLE dhcp6_subnet
    ADD COLUMN reservations_global BOOL DEFAULT NULL,
    ADD COLUMN reservations_in_subnet BOOL DEFAULT NULL,
    ADD COLUMN reservations_out_of_pool BOOL DEFAULT NULL;

ALTER TABLE dhcp6_shared_network
    ADD COLUMN reservations_global BOOL DEFAULT NULL,
    ADD COLUMN reservations_in_subnet BOOL DEFAULT NULL,
    ADD COLUMN reservations_out_of_pool BOOL DEFAULT NULL;

# Disable audit in this session
SET @disable_audit = 1;

# Translate reservation_mode to new flags.
# 0 is DISABLED
# 1 is OUT_OF_POOL
# 2 is GLOBAL
# 3 is ALL
UPDATE dhcp4_subnet
    SET reservations_global = FALSE,
        reservations_in_subnet = FALSE
    WHERE reservation_mode = 0;

UPDATE dhcp4_subnet
    SET reservations_global = FALSE,
        reservations_in_subnet = TRUE,
        reservations_out_of_pool = TRUE
    WHERE reservation_mode = 1;

UPDATE dhcp4_subnet
    SET reservations_global = TRUE,
        reservations_in_subnet = FALSE
    WHERE reservation_mode = 2;

UPDATE dhcp4_subnet
    SET reservations_global = FALSE,
        reservations_in_subnet = TRUE,
        reservations_out_of_pool = FALSE
    WHERE reservation_mode = 3;

UPDATE dhcp4_shared_network
    SET reservations_global = FALSE,
        reservations_in_subnet = FALSE
    WHERE reservation_mode = 0;

UPDATE dhcp4_shared_network
    SET reservations_global = FALSE,
        reservations_in_subnet = TRUE,
        reservations_out_of_pool = TRUE
    WHERE reservation_mode = 1;

UPDATE dhcp4_shared_network
    SET reservations_global = TRUE,
        reservations_in_subnet = FALSE
    WHERE reservation_mode = 2;

UPDATE dhcp4_shared_network
    SET reservations_global = FALSE,
        reservations_in_subnet = TRUE,
        reservations_out_of_pool = FALSE
    WHERE reservation_mode = 3;

UPDATE dhcp6_subnet
    SET reservations_global = FALSE,
        reservations_in_subnet = FALSE
    WHERE reservation_mode = 0;

UPDATE dhcp6_subnet
    SET reservations_global = FALSE,
        reservations_in_subnet = TRUE,
        reservations_out_of_pool = TRUE
    WHERE reservation_mode = 1;

UPDATE dhcp6_subnet
    SET reservations_global = TRUE,
        reservations_in_subnet = FALSE
    WHERE reservation_mode = 2;

UPDATE dhcp6_subnet
    SET reservations_global = FALSE,
        reservations_in_subnet = TRUE,
        reservations_out_of_pool = FALSE
    WHERE reservation_mode = 3;

UPDATE dhcp6_shared_network
    SET reservations_global = FALSE,
        reservations_in_subnet = FALSE
    WHERE reservation_mode = 0;

UPDATE dhcp6_shared_network
    SET reservations_global = FALSE,
        reservations_in_subnet = TRUE,
        reservations_out_of_pool = TRUE
    WHERE reservation_mode = 1;

UPDATE dhcp6_shared_network
    SET reservations_global = TRUE,
        reservations_in_subnet = FALSE
    WHERE reservation_mode = 2;

UPDATE dhcp6_shared_network
    SET reservations_global = FALSE,
        reservations_in_subnet = TRUE,
        reservations_out_of_pool = FALSE
    WHERE reservation_mode = 3;

# DROP reservation_mode
ALTER TABLE dhcp4_subnet DROP COLUMN reservation_mode;
ALTER TABLE dhcp4_shared_network DROP COLUMN reservation_mode;
ALTER TABLE dhcp6_subnet DROP COLUMN reservation_mode;
ALTER TABLE dhcp6_shared_network DROP COLUMN reservation_mode;

# Enable audit in this session
SET @disable_audit = 0;

# Update the schema version number.
UPDATE schema_version
    SET version = '9', minor = '5';

# This line concludes the schema upgrade to version 9.5.

EOF
