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

VERSION=$(pgsql_version "$@")

if [ "$VERSION" != "6.2" ]; then
    printf 'This script upgrades 6.2 to 7.0. '
    printf 'Reported version is %s. Skipping upgrade.\n' "${VERSION}"
    exit 0
fi

psql "$@" >/dev/null <<EOF
START TRANSACTION;

-- This line starts the schema upgrade to version 7.0.

-- Add a lot (20+) of tables for the config backend.

-- Adding on update trigger in MySQL is as easy as using this column definition in CREATE TABLE:
-- modification_ts TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
-- Sadly, Postgres has its own convoluted way of doing this. Luckily, the update pattern is
-- the same in many tables, so we can define the trigger function once and the use it everywhere.

-- First, we need to define a function that will do the actual job.
-- This is used in many, many tables.
CREATE OR REPLACE FUNCTION modification_ts_update()
  RETURNS trigger AS \$modification_ts_update\$
  BEGIN
    new.modification_ts = CURRENT_TIMESTAMP;
    RETURN NULL;
  END;

-- Second, we need to specify which language it was written in.
\$modification_ts_update\$ LANGUAGE plpgsql;

-- Create table modification and insert values for modification types.
CREATE TABLE modification (
  id smallint NOT NULL,
  modification_type VARCHAR(32) NOT NULL,
  PRIMARY KEY (id)
);
INSERT INTO modification VALUES (0,'create'), (1,'update'), (2,'delete');

-- Now create the table that holds different parameter data types.
CREATE TABLE parameter_data_type (
  id smallint NOT NULL,
  name VARCHAR(32) NOT NULL,
  PRIMARY KEY (id)
);
INSERT INTO parameter_data_type VALUES
    (0,'integer'),
    (1,'real'),
    (2,'boolean'),
    (4,'string');

-- This table doesn't exist in MySQL. However, it's nice to have an enum that explains what the values
-- in ddns_replace_client_name field in the dhcp{4,6}_shared_network table means.
CREATE TABLE ddns_replace_client_name_types (
  type INT8 PRIMARY KEY NOT NULL,
  name VARCHAR(32)
);
-- See enum ReplaceClientNameMode in src/lib/dhcpsrv/d2_client_cfg.h
INSERT INTO ddns_replace_client_name_types (type, name) VALUES
  (0, 'RCM_NEVER'),
  (1, 'RCM_ALWAYS'),
  (2, 'RCM_WHEN_PRESENT'),
  (3, 'RCM_WHEN_NOT_PRESENT');

-- Create table for DHCPv6 servers
CREATE TABLE dhcp6_server (
  id SERIAL PRIMARY KEY NOT NULL,
  tag VARCHAR(64) NOT NULL,
  description TEXT DEFAULT NULL,
  modification_ts TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE(tag)
);
CREATE INDEX dhcp6_server_idx1 ON dhcp6_server (modification_ts);
CREATE UNIQUE INDEX dhcp6_server_idx2 ON dhcp6_server(tag);
CREATE TRIGGER dhcp6_server_modification_ts_update
  AFTER UPDATE ON dhcp6_server
  FOR EACH ROW EXECUTE PROCEDURE modification_ts_update();

INSERT INTO dhcp6_server (tag, description) VALUES ('all','special type: all servers');

-- Create a table for storing IPv6 shared networks
CREATE TABLE dhcp6_shared_network (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(128) UNIQUE NOT NULL,
  client_class VARCHAR(128) DEFAULT NULL,
  interface VARCHAR(128) DEFAULT NULL,
  modification_ts TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
  preferred_lifetime BIGINT DEFAULT NULL,
  rapid_commit BOOLEAN DEFAULT NULL,
  rebind_timer BIGINT DEFAULT NULL,
  relay TEXT DEFAULT NULL,
  renew_timer BIGINT DEFAULT NULL,
  require_client_classes TEXT DEFAULT NULL,
  user_context JSON DEFAULT NULL,
  valid_lifetime BIGINT DEFAULT NULL,
  calculate_tee_times BOOLEAN DEFAULT NULL,
  t1_percent float DEFAULT NULL,
  t2_percent float DEFAULT NULL,
  interface_id BYTEA DEFAULT NULL, -- 128 bytes
  min_preferred_lifetime BIGINT DEFAULT NULL,
  max_preferred_lifetime BIGINT DEFAULT NULL,
  min_valid_lifetime BIGINT DEFAULT NULL,
  max_valid_lifetime BIGINT DEFAULT NULL,
  ddns_send_updates BOOLEAN DEFAULT NULL,
  ddns_override_no_update BOOLEAN DEFAULT NULL,
  ddns_override_client_update BOOLEAN DEFAULT NULL,
  ddns_replace_client_name INT8 DEFAULT NULL,
  ddns_generated_prefix VARCHAR(255) DEFAULT NULL,
  ddns_qualifying_suffix VARCHAR(255) DEFAULT NULL,
  reservations_global BOOLEAN DEFAULT NULL,
  reservations_in_subnet BOOLEAN DEFAULT NULL,
  reservations_out_of_pool BOOLEAN DEFAULT NULL,
  cache_threshold float DEFAULT NULL,
  cache_max_age BIGINT DEFAULT NULL,
  CONSTRAINT fk_ddns_replace_client_name FOREIGN KEY (ddns_replace_client_name)
    REFERENCES ddns_replace_client_name_types (type)
);
CREATE INDEX dhcp6_shared_network_idx1 ON dhcp6_shared_network (name);

CREATE TRIGGER dhcp6_shared_network_modification_ts_update
  AFTER UPDATE ON dhcp6_shared_network
  FOR EACH ROW EXECUTE PROCEDURE modification_ts_update();

-- Now we need to create a relationship between defined shared networks and the servers
CREATE TABLE dhcp6_shared_network_server (
  shared_network_id BIGINT NOT NULL,
  server_id BIGINT NOT NULL,
  modification_ts TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (shared_network_id, server_id),
  CONSTRAINT fk_dhcp6_shared_network_server_server_id FOREIGN KEY (server_id)
    REFERENCES dhcp6_server (id) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT fk_dhcp6_shared_network_server_shared_network_id FOREIGN KEY (shared_network_id)
    REFERENCES dhcp6_shared_network (id) ON DELETE CASCADE ON UPDATE NO ACTION
);
CREATE INDEX dhcp6_shared_network_server_idx1 ON dhcp6_shared_network_server (modification_ts);
CREATE INDEX dhcp6_shared_network_server_idx2 ON dhcp6_shared_network_server (server_id);

-- Create a list of IPv6 subnets
CREATE TABLE dhcp6_subnet (
  subnet_id BIGINT PRIMARY KEY NOT NULL,
  subnet_prefix VARCHAR(64) UNIQUE NOT NULL,
  client_class VARCHAR(128) DEFAULT NULL,
  interface VARCHAR(128) DEFAULT NULL,
  modification_ts TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
  preferred_lifetime BIGINT DEFAULT NULL,
  rapid_commit BOOLEAN DEFAULT NULL,
  rebind_timer BIGINT DEFAULT NULL,
  relay TEXT DEFAULT NULL,
  renew_timer BIGINT DEFAULT NULL,
  require_client_classes TEXT DEFAULT NULL,
  shared_network_name VARCHAR(128) DEFAULT NULL,
  user_context JSON DEFAULT NULL,
  valid_lifetime BIGINT DEFAULT NULL,
  calculate_tee_times BOOLEAN DEFAULT NULL,
  t1_percent float DEFAULT NULL,
  t2_percent float DEFAULT NULL,
  interface_id BYTEA DEFAULT NULL,
  min_preferred_lifetime BIGINT DEFAULT NULL,
  max_preferred_lifetime BIGINT DEFAULT NULL,
  min_valid_lifetime BIGINT DEFAULT NULL,
  max_valid_lifetime BIGINT DEFAULT NULL,
  ddns_send_updates BOOLEAN DEFAULT NULL,
  ddns_override_no_update BOOLEAN DEFAULT NULL,
  ddns_override_client_update BOOLEAN DEFAULT NULL,
  ddns_replace_client_name INT8 DEFAULT NULL,
  ddns_generated_prefix VARCHAR(255) DEFAULT NULL,
  ddns_qualifying_suffix VARCHAR(255) DEFAULT NULL,
  reservations_global BOOLEAN DEFAULT NULL,
  reservations_in_subnet BOOLEAN DEFAULT NULL,
  reservations_out_of_pool BOOLEAN DEFAULT NULL,
  cache_threshold float DEFAULT NULL,
  cache_max_age BIGINT DEFAULT NULL,
  CONSTRAINT fk_dhcp6_subnet_shared_network FOREIGN KEY (shared_network_name)
    REFERENCES dhcp6_shared_network (name) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT fk_ddns_replace_client_name FOREIGN KEY (ddns_replace_client_name)
    REFERENCES ddns_replace_client_name_types (type)
);

CREATE TRIGGER dhcp6_subnet_modification_ts_update
  AFTER UPDATE ON dhcp6_server
  FOR EACH ROW EXECUTE PROCEDURE modification_ts_update();

CREATE INDEX dhcp6_subnet_idx1 ON dhcp6_subnet (modification_ts);
CREATE INDEX dhcp6_subnet_idx2 ON dhcp6_subnet (shared_network_name);

-- Create a table that holds all address pools in IPv6.
CREATE TABLE dhcp6_pool (
  id SERIAL PRIMARY KEY NOT NULL,
  start_address inet NOT NULL,
  end_address inet NOT NULL,
  subnet_id BIGINT NOT NULL,
  modification_ts TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
  client_class VARCHAR(128) DEFAULT NULL,
  require_client_classes TEXT DEFAULT NULL,
  user_context JSON DEFAULT NULL,
  CONSTRAINT fk_dhcp6_pool_subnet_id FOREIGN KEY (subnet_id) REFERENCES dhcp6_subnet (subnet_id)
);
CREATE INDEX dhcp6_pool_idx1 ON dhcp6_pool (modification_ts);
CREATE INDEX dhcp6_pool_idx2 ON dhcp6_pool (subnet_id);

CREATE TRIGGER dhcp6_pool_modification_ts_update
  AFTER UPDATE ON dhcp6_pool
  FOR EACH ROW EXECUTE PROCEDURE modification_ts_update();

-- And now the same, but for PD pools.
CREATE TABLE dhcp6_pd_pool (
  id SERIAL PRIMARY KEY NOT NULL,
  prefix VARCHAR(45) NOT NULL,
  prefix_length SMALLINT NOT NULL,
  delegated_prefix_length SMALLINT NOT NULL,
  subnet_id BIGINT NOT NULL,
  modification_ts TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
  excluded_prefix VARCHAR(45) DEFAULT NULL,
  excluded_prefix_length SMALLINT NOT NULL,
  client_class VARCHAR(128) DEFAULT NULL,
  require_client_classes TEXT DEFAULT NULL,
  user_context JSON DEFAULT NULL,
  CONSTRAINT fk_dhcp6_pd_pool_subnet_id FOREIGN KEY (subnet_id) REFERENCES dhcp6_subnet(subnet_id)
);

CREATE INDEX dhcp6_pd_pool_idx1 ON dhcp6_pd_pool (modification_ts);
CREATE INDEX dhcp6_pd_pool_idx2 ON dhcp6_pd_pool (subnet_id);
CREATE TRIGGER dhcp6_pd_pool_modification_ts_update
  AFTER UPDATE ON dhcp6_pd_pool
  FOR EACH ROW EXECUTE PROCEDURE modification_ts_update();

CREATE TABLE dhcp6_subnet_server (
  subnet_id BIGINT NOT NULL,
  server_id BIGINT NOT NULL,
  modification_ts TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (subnet_id, server_id),
  CONSTRAINT fk_dhcp6_subnet_server_server_id
    FOREIGN KEY (server_id) REFERENCES dhcp6_server (id) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT fk_dhcp6_subnet_server_subnet_id
    FOREIGN KEY (subnet_id) REFERENCES dhcp6_subnet (subnet_id) ON DELETE CASCADE ON UPDATE NO ACTION,
  UNIQUE (subnet_id, server_id)
);
CREATE INDEX dhcp6_subnet_server_idx1 ON dhcp6_subnet_server(server_id);
CREATE INDEX dhcp6_subnet_server_idx2 ON dhcp6_subnet_server(modification_ts);
CREATE TRIGGER dhcp6_subnet_server_modification_ts_update
  AFTER UPDATE ON dhcp6_subnet_server
  FOR EACH ROW EXECUTE PROCEDURE modification_ts_update();

-- Create table for storing global DHCPv6 parameters.
CREATE TABLE dhcp6_global_parameter (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(128) NOT NULL,
  value TEXT NOT NULL,
  modification_ts TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
  parameter_type SMALLINT NOT NULL,
  CONSTRAINT fk_dhcp6_global_parameter_type FOREIGN KEY (parameter_type) REFERENCES parameter_data_type(id)
);

CREATE INDEX key_dhcp6_global_parameter_idx1 ON dhcp6_global_parameter(modification_ts);
CREATE INDEX key_dhcp6_global_parameter_idx2 ON dhcp6_global_parameter(name);

CREATE TRIGGER dhcp6_global_parameter_modification_ts_update
  AFTER UPDATE ON dhcp6_global_parameter
  FOR EACH ROW EXECUTE PROCEDURE modification_ts_update();

CREATE TABLE dhcp6_global_parameter_server (
  parameter_id BIGINT NOT NULL,
  server_id BIGINT NOT NULL,
  modification_ts TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (parameter_id, server_id),
  CONSTRAINT fk_dhcp6_global_parameter_server_parameter_id FOREIGN KEY (parameter_id)
    REFERENCES dhcp6_global_parameter(id) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT fk_dhcp6_global_parameter_server_server_id FOREIGN KEY (server_id)
    REFERENCES dhcp6_server(id) ON DELETE CASCADE ON UPDATE NO ACTION
);
CREATE INDEX key_dhcp6_global_parameter_server_idx1 ON dhcp6_global_parameter_server(modification_ts);
CREATE TRIGGER dhcp6_global_parameter_server_modification_ts_update
  AFTER UPDATE ON dhcp6_global_parameter_server
  FOR EACH ROW EXECUTE PROCEDURE modification_ts_update();

-- Create a table for storing DHCPv6 options.
ALTER TABLE dhcp6_options
  ADD COLUMN shared_network_name VARCHAR(128) DEFAULT NULL,
  ADD COLUMN pool_id BIGINT DEFAULT NULL,
  ADD COLUMN pd_pool_id BIGINT DEFAULT NULL,
  ADD CONSTRAINT fk_dhcp6_options_pd_pool FOREIGN KEY (pd_pool_id)
    REFERENCES dhcp6_pd_pool(id) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT fk_dhcp6_options_pool FOREIGN KEY (pool_id)
    REFERENCES dhcp6_pool (id) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT fk_dhcp6_options_shared_network FOREIGN KEY (shared_network_name)
    REFERENCES dhcp6_shared_network (name) ON DELETE CASCADE ON UPDATE CASCADE;

CREATE TRIGGER dhcp6_options_modification_ts_update
  AFTER UPDATE ON dhcp6_options
  FOR EACH ROW EXECUTE PROCEDURE modification_ts_update();

-- Now create a table for associating defined options with servers.
CREATE TABLE dhcp6_options_server (
  option_id BIGINT NOT NULL,
  server_id BIGINT NOT NULL,
  modification_ts TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (option_id, server_id),
  CONSTRAINT fk_dhcp6_options_server_option_id FOREIGN KEY (option_id)
    REFERENCES dhcp6_options (option_id) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT fk_dhcp6_options_server_server_id FOREIGN KEY (server_id)
    REFERENCES dhcp6_server (id) ON DELETE CASCADE ON UPDATE NO ACTION
);
CREATE INDEX dhcp6_options_server_idx1 ON dhcp6_options_server(server_id);
CREATE INDEX dhcp6_options_server_idx2 ON dhcp6_options_server(modification_ts);
CREATE TRIGGER dhcp6_options_server_modification_ts_update
  AFTER UPDATE ON dhcp6_options_server
  FOR EACH ROW EXECUTE PROCEDURE modification_ts_update();

-- This table is for storing IPv6 option definitions
CREATE TABLE dhcp6_option_def (
  id SERIAL PRIMARY KEY UNIQUE NOT NULL,
  code SMALLINT NOT NULL,
  name VARCHAR(128) NOT NULL,
  space VARCHAR(128) NOT NULL,
  type SMALLINT NOT NULL,
  modification_ts TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
  is_array BOOLEAN NOT NULL,
  encapsulate VARCHAR(128) NOT NULL,
  record_types VARCHAR DEFAULT NULL,
  user_context JSON DEFAULT NULL
);
CREATE INDEX dhcp6_option_def_idx1 ON dhcp6_option_def(modification_ts);
CREATE INDEX dhcp6_option_def_idx2 ON dhcp6_option_def(code, space);
CREATE TRIGGER dhcp6_option_def_modification_ts_update
  AFTER UPDATE ON dhcp6_option_def
  FOR EACH ROW EXECUTE PROCEDURE modification_ts_update();

-- and another table for storing relationship between option definitions and servers.
CREATE TABLE dhcp6_option_def_server (
  option_def_id BIGINT NOT NULL REFERENCES dhcp6_option_def (id) ON DELETE CASCADE ON UPDATE NO ACTION,
  server_id BIGINT NOT NULL REFERENCES dhcp6_server (id) ON DELETE CASCADE ON UPDATE NO ACTION,
  modification_ts TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (option_def_id, server_id)
);
CREATE TRIGGER dhcp6_option_def_server_modification_ts_update
  AFTER UPDATE ON dhcp6_option_def_server
  FOR EACH ROW EXECUTE PROCEDURE modification_ts_update();

-- Now create two tables for audit revisions...
CREATE TABLE dhcp6_audit_revision (
  id SERIAL PRIMARY KEY NOT NULL,
  modification_ts TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
  log_message TEXT DEFAULT NULL,
  server_id BIGINT DEFAULT NULL
);
CREATE TRIGGER dhcp6_audit_revision_modification_ts_update
  AFTER UPDATE ON dhcp6_audit_revision
  FOR EACH ROW EXECUTE PROCEDURE modification_ts_update();

-- ... and the DHCPv6 audit itself.
CREATE TABLE dhcp6_audit (
  id SERIAL UNIQUE NOT NULL,
  object_type VARCHAR(256) NOT NULL,
  object_id BIGINT NOT NULL,
  modification_type SMALLINT NOT NULL,
  revision_id BIGINT NOT NULL,
  CONSTRAINT fk_dhcp6_audit_modification_type FOREIGN KEY (modification_type)
    REFERENCES modification (id) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT fk_dhcp6_audit_revision FOREIGN KEY (revision_id)
    REFERENCES dhcp6_audit_revision (id) ON DELETE NO ACTION ON UPDATE CASCADE
);
CREATE TRIGGER dhcp6_audit_modification_ts_update
  AFTER UPDATE ON dhcp6_audit
  FOR EACH ROW EXECUTE PROCEDURE modification_ts_update();
CREATE INDEX dhcp6_audit_idx1 ON dhcp6_audit (modification_type);
CREATE INDEX dhcp6_audit_idx2 ON dhcp6_audit (revision_id);

-- Create table for DHCPv4 servers
CREATE TABLE dhcp4_server (
  id SERIAL PRIMARY KEY NOT NULL,
  tag VARCHAR(64) NOT NULL,
  description TEXT DEFAULT NULL,
  modification_ts TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE(tag)
);
CREATE INDEX dhcp4_server_modification_ts ON dhcp6_server (modification_ts);
CREATE TRIGGER dhcp4_server_modification_ts_update
  AFTER UPDATE ON dhcp4_server
  FOR EACH ROW EXECUTE PROCEDURE modification_ts_update();

INSERT INTO dhcp4_server (tag, description) VALUES ('all','special type: all servers');

-- Create table for storing global DHCPv4 parameters.
CREATE TABLE dhcp4_global_parameter (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(128) NOT NULL,
  value TEXT NOT NULL,
  modification_ts TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
  parameter_type SMALLINT NOT NULL,
  CONSTRAINT fk_dhcp6_global_parameter_type FOREIGN KEY (parameter_type) REFERENCES parameter_data_type(id)
);
CREATE INDEX dhcp4_global_parameter_idx1 ON dhcp4_global_parameter(modification_ts);
CREATE INDEX dhcp4_global_parameter_idx2 ON dhcp4_global_parameter(name);

CREATE TRIGGER dhcp4_global_parameter_modification_ts_update
  AFTER UPDATE ON dhcp4_global_parameter
  FOR EACH ROW EXECUTE PROCEDURE modification_ts_update();

-- and create mapping for the global DHCPv4 parameters mapping to servers
CREATE TABLE dhcp4_global_parameter_server (
  parameter_id BIGINT NOT NULL,
  server_id BIGINT NOT NULL,
  modification_ts TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (parameter_id, server_id),
  CONSTRAINT fk_dhcp4_global_parameter_server_parameter_id FOREIGN KEY (parameter_id)
    REFERENCES dhcp4_global_parameter(id) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT fk_dhcp4_global_parameter_server_server_id FOREIGN KEY (server_id)
    REFERENCES dhcp4_server(id) ON DELETE CASCADE ON UPDATE NO ACTION
);
CREATE INDEX key_dhcp4_global_parameter_idx1 ON dhcp4_global_parameter_server(modification_ts);
CREATE TRIGGER dhcp4_global_parameter_server_modification_ts_update
  AFTER UPDATE ON dhcp4_global_parameter_server
  FOR EACH ROW EXECUTE PROCEDURE modification_ts_update();

-- Create a table for storing IPv4 shared networks
CREATE TABLE dhcp4_shared_network (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(128) UNIQUE NOT NULL,
  client_class VARCHAR(128) DEFAULT NULL,
  interface VARCHAR(128) DEFAULT NULL,
  match_client_id BOOLEAN DEFAULT NULL,
  modification_ts TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
  rebind_timer BIGINT DEFAULT NULL,
  relay TEXT DEFAULT NULL,
  renew_timer BIGINT DEFAULT NULL,
  require_client_classes TEXT DEFAULT NULL,
  user_context JSON DEFAULT NULL,
  valid_lifetime BIGINT DEFAULT NULL,
  authoritative BOOLEAN DEFAULT NULL,
  calculate_tee_times BOOLEAN DEFAULT NULL,
  t1_percent float DEFAULT NULL,
  t2_percent float DEFAULT NULL,
  boot_file_name VARCHAR(128) DEFAULT NULL,
  next_server inet DEFAULT NULL,   -- let's use type inet
  server_hostname VARCHAR(64) DEFAULT NULL,
  min_valid_lifetime BIGINT DEFAULT NULL,
  max_valid_lifetime BIGINT DEFAULT NULL,
  ddns_send_updates BOOLEAN DEFAULT NULL,
  ddns_override_no_update BOOLEAN DEFAULT NULL,
  ddns_override_client_update BOOLEAN DEFAULT NULL,
  ddns_replace_client_name INT8 DEFAULT NULL,
  ddns_generated_prefix VARCHAR(255) DEFAULT NULL,
  ddns_qualifying_suffix VARCHAR(255) DEFAULT NULL,
  reservations_global BOOLEAN DEFAULT NULL,
  reservations_in_subnet BOOLEAN DEFAULT NULL,
  reservations_out_of_pool BOOLEAN DEFAULT NULL,
  cache_threshold float DEFAULT NULL,
  cache_max_age BIGINT DEFAULT NULL,
  CONSTRAINT fk_ddns_replace_client_name FOREIGN KEY (ddns_replace_client_name)
    REFERENCES ddns_replace_client_name_types (type)
);

CREATE UNIQUE INDEX dhcp4_shared_network_idx1 ON dhcp4_shared_network (name);
CREATE INDEX dhcp4_shared_network_idx2 ON dhcp4_shared_network (modification_ts);

CREATE TRIGGER dhcp4_shared_network_modification_ts_update
  AFTER UPDATE ON dhcp4_shared_network
  FOR EACH ROW EXECUTE PROCEDURE modification_ts_update();

-- Now we need to create a relationship between defined shared networks and the servers
CREATE TABLE dhcp4_shared_network_server (
  shared_network_id BIGINT NOT NULL,
  server_id BIGINT NOT NULL,
  modification_ts TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (shared_network_id, server_id),
  CONSTRAINT fk_dhcp4_shared_network_server_server_id FOREIGN KEY (server_id)
    REFERENCES dhcp4_server (id) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT fk_dhcp4_shared_network_server_shared_network_id FOREIGN KEY (shared_network_id)
    REFERENCES dhcp4_shared_network (id) ON DELETE CASCADE ON UPDATE NO ACTION
);
CREATE INDEX dhcp4_shared_network_server_idx1 ON dhcp4_shared_network_server (modification_ts);
CREATE INDEX dhcp4_shared_network_server_idx2 ON dhcp4_shared_network_server (server_id);

-- Create a list of IPv4 subnets
CREATE TABLE dhcp4_subnet (
  subnet_id BIGINT PRIMARY KEY NOT NULL,
  subnet_prefix VARCHAR(64) UNIQUE NOT NULL,
  interface_4o6 VARCHAR(128) DEFAULT NULL,
  interface_id_4o6 VARCHAR(128) DEFAULT NULL,
  subnet_4o6 VARCHAR(64) DEFAULT NULL,
  boot_file_name VARCHAR(128) DEFAULT NULL,
  client_class VARCHAR(128) DEFAULT NULL,
  interface VARCHAR(128) DEFAULT NULL,
  match_client_id BOOLEAN DEFAULT NULL,
  modification_ts TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
  next_server inet DEFAULT NULL,
  rebind_timer BIGINT DEFAULT NULL,
  relay TEXT DEFAULT NULL,
  renew_timer BIGINT DEFAULT NULL,
  require_client_classes TEXT DEFAULT NULL,
  server_hostname VARCHAR(64) DEFAULT NULL,
  shared_network_name VARCHAR(128) DEFAULT NULL,
  user_context JSON DEFAULT NULL,
  valid_lifetime BIGINT DEFAULT NULL,
  authoritative BOOLEAN DEFAULT NULL,
  calculate_tee_times BOOLEAN DEFAULT NULL,
  t1_percent float DEFAULT NULL,
  t2_percent float DEFAULT NULL,
  min_valid_lifetime BIGINT DEFAULT NULL,
  max_valid_lifetime BIGINT DEFAULT NULL,
  ddns_send_updates BOOLEAN DEFAULT NULL,
  ddns_override_no_update BOOLEAN DEFAULT NULL,
  ddns_override_client_update BOOLEAN DEFAULT NULL,
  ddns_replace_client_name INT8 DEFAULT NULL,
  ddns_generated_prefix VARCHAR(255) DEFAULT NULL,
  ddns_qualifying_suffix VARCHAR(255) DEFAULT NULL,
  reservations_global BOOLEAN DEFAULT NULL,
  reservations_in_subnet BOOLEAN DEFAULT NULL,
  reservations_out_of_pool BOOLEAN DEFAULT NULL,
  cache_threshold float DEFAULT NULL,
  cache_max_age BIGINT DEFAULT NULL,
  CONSTRAINT fk_dhcp4_subnet_shared_network FOREIGN KEY (shared_network_name)
    REFERENCES dhcp4_shared_network (name) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT fk_ddns_replace_client_name FOREIGN KEY (ddns_replace_client_name)
    REFERENCES ddns_replace_client_name_types (type)
);

CREATE TRIGGER dhcp4_subnet_modification_ts_update
  AFTER UPDATE ON dhcp4_subnet
  FOR EACH ROW EXECUTE PROCEDURE modification_ts_update();

CREATE INDEX dhcp4_subnet_idx1 ON dhcp4_subnet (modification_ts);
CREATE INDEX dhcp4_subnet_idx2 ON dhcp4_subnet (shared_network_name);

CREATE TABLE dhcp4_subnet_server (
  subnet_id BIGINT NOT NULL,
  server_id BIGINT NOT NULL,
  modification_ts TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (subnet_id, server_id),
  CONSTRAINT fk_dhcp6_subnet_server_server_id
    FOREIGN KEY (server_id) REFERENCES dhcp6_server (id) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT fk_dhcp6_subnet_server_subnet_id
    FOREIGN KEY (subnet_id) REFERENCES dhcp6_subnet (subnet_id) ON DELETE CASCADE ON UPDATE NO ACTION,
  UNIQUE (subnet_id, server_id)
);
CREATE INDEX dhcp4_subnet_server_idx1 ON dhcp4_subnet_server(server_id);
CREATE INDEX dhcp4_subnet_server_idx2 ON dhcp4_subnet_server(modification_ts);
CREATE TRIGGER dhcp4_subnet_server_modification_ts_update
  AFTER UPDATE ON dhcp4_subnet_server
  FOR EACH ROW EXECUTE PROCEDURE modification_ts_update();

-- Create a table that holds all address pools in IPv4.
CREATE TABLE dhcp4_pool (
  id SERIAL PRIMARY KEY NOT NULL,
  start_address inet NOT NULL,
  end_address inet NOT NULL,
  subnet_id BIGINT NOT NULL,
  modification_ts TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
  client_class VARCHAR(128) DEFAULT NULL,
  require_client_classes TEXT DEFAULT NULL,
  user_context JSON DEFAULT NULL,
  CONSTRAINT fk_dhcp4_pool_subnet_id FOREIGN KEY (subnet_id) REFERENCES dhcp4_subnet (subnet_id)
);
CREATE INDEX dhcp4_pool_idx1 ON dhcp4_pool (modification_ts);
CREATE INDEX dhcp4_pool_idx2 ON dhcp4_pool (subnet_id);

CREATE TRIGGER dhcp4_pool_modification_ts_update
  AFTER UPDATE ON dhcp4_pool
  FOR EACH ROW EXECUTE PROCEDURE modification_ts_update();

-- Create a table for storing DHCPv4 options.
ALTER TABLE dhcp4_options
  ADD COLUMN shared_network_name VARCHAR(128) DEFAULT NULL,
  ADD COLUMN pool_id BIGINT DEFAULT NULL,
  ADD COLUMN modification_ts TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
  ADD CONSTRAINT fk_dhcp4_options_pool FOREIGN KEY (pool_id)
    REFERENCES dhcp4_pool (id) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT fk_dhcp4_options_shared_network FOREIGN KEY (shared_network_name)
    REFERENCES dhcp4_shared_network (name) ON DELETE CASCADE ON UPDATE CASCADE;

CREATE TRIGGER dhcp4_options_modification_ts_update
  AFTER UPDATE ON dhcp4_options
  FOR EACH ROW EXECUTE PROCEDURE modification_ts_update();

-- Now create a table for associating defined v4 options with servers.
CREATE TABLE dhcp4_options_server (
  option_id BIGINT NOT NULL,
  server_id BIGINT NOT NULL,
  modification_ts TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (option_id, server_id),
  CONSTRAINT fk_dhcp4_options_server_option_id FOREIGN KEY (option_id)
    REFERENCES dhcp4_options (option_id) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT fk_dhcp4_options_server_server_id FOREIGN KEY (server_id)
    REFERENCES dhcp4_server (id) ON DELETE CASCADE ON UPDATE NO ACTION
);
CREATE INDEX dhcp4_options_server_idx1 ON dhcp4_options_server(server_id);
CREATE INDEX dhcp4_options_server_idx2 ON dhcp4_options_server(modification_ts);
CREATE TRIGGER dhcp4_options_server_modification_ts_update
  AFTER UPDATE ON dhcp4_options_server
  FOR EACH ROW EXECUTE PROCEDURE modification_ts_update();

-- This table is for storing IPv4 option definitions
CREATE TABLE dhcp4_option_def (
  id SERIAL PRIMARY KEY UNIQUE NOT NULL,
  code SMALLINT NOT NULL,
  name VARCHAR(128) NOT NULL,
  space VARCHAR(128) NOT NULL,
  type SMALLINT NOT NULL,
  modification_ts TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
  is_array BOOLEAN NOT NULL,
  encapsulate VARCHAR(128) NOT NULL,
  record_types VARCHAR DEFAULT NULL,
  user_context JSON DEFAULT NULL
);
CREATE INDEX dhcp4_option_def_idx1 ON dhcp4_option_def(modification_ts);
CREATE INDEX dhcp4_option_def_idx2 ON dhcp4_option_def(code, space);
CREATE TRIGGER dhcp4_option_def_modification_ts_update
  AFTER UPDATE ON dhcp4_option_def
  FOR EACH ROW EXECUTE PROCEDURE modification_ts_update();

-- and another table for storing relationship between option definitions and servers.
CREATE TABLE dhcp4_option_def_server (
  option_def_id BIGINT NOT NULL REFERENCES dhcp6_option_def (id) ON DELETE CASCADE ON UPDATE NO ACTION,
  server_id BIGINT NOT NULL REFERENCES dhcp4_server (id) ON DELETE CASCADE ON UPDATE NO ACTION,
  modification_ts TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (option_def_id, server_id)
);
CREATE TRIGGER dhcp4_option_def_server_modification_ts_update
  AFTER UPDATE ON dhcp4_option_def_server
  FOR EACH ROW EXECUTE PROCEDURE modification_ts_update();

-- Now create two tables for audit revisions...
CREATE TABLE dhcp4_audit_revision (
  id SERIAL PRIMARY KEY NOT NULL,
  modification_ts TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
  log_message TEXT DEFAULT NULL,
  server_id BIGINT DEFAULT NULL
);
CREATE TRIGGER dhcp4_audit_revision_modification_ts_update
  AFTER UPDATE ON dhcp4_audit_revision
  FOR EACH ROW EXECUTE PROCEDURE modification_ts_update();

-- ... and the DHCPv4 audit itself.
CREATE TABLE dhcp4_audit (
  id SERIAL UNIQUE NOT NULL,
  object_type VARCHAR(256) NOT NULL,
  object_id BIGINT NOT NULL,
  modification_type SMALLINT NOT NULL,
  revision_id BIGINT NOT NULL,
  CONSTRAINT fk_dhcp4_audit_modification_type FOREIGN KEY (modification_type)
    REFERENCES modification (id) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT fk_dhcp4_audit_revision FOREIGN KEY (revision_id)
    REFERENCES dhcp4_audit_revision (id) ON DELETE NO ACTION ON UPDATE CASCADE
);
CREATE TRIGGER dhcp4_audit_modification_ts_update
  AFTER UPDATE ON dhcp4_audit
  FOR EACH ROW EXECUTE PROCEDURE modification_ts_update();
CREATE INDEX dhcp4_audit_idx1 ON dhcp4_audit (modification_type);
CREATE INDEX dhcp4_audit_idx2 ON dhcp4_audit (revision_id);

-- Stores a TEXT value to a session variable
-- name name of session variable to set
-- value TEXT value to store
CREATE OR REPLACE FUNCTION set_session_value(name text, value TEXT)
RETURNS VOID
AS \$\$
DECLARE
BEGIN
    PERFORM set_config(name, value, false);
    RETURN;

    EXCEPTION
    WHEN OTHERS THEN
        RAISE EXCEPTION 'set_session_value(%) : value:[%] failed, sqlstate: %', name, value, sqlstate;
END;\$\$
LANGUAGE plpgsql;

-- Stores a BIGINT value to a session variable
-- Note the value converted to TEXT and then stored as Postgresql does
-- not support any other data type in session variables.
-- name name of session variable to set
-- value BIGINT value to store
CREATE OR REPLACE FUNCTION set_session_value(name text, value BIGINT)
RETURNS VOID
AS \$\$
BEGIN
    PERFORM set_config(name, cast(value as text), false);
    RETURN;

    EXCEPTION
    WHEN OTHERS THEN
        RAISE EXCEPTION 'set_session_value(%) : value:[%] failed, sqlstate: %', name, value, sqlstate;
END;\$\$
LANGUAGE plpgsql;

-- Stores a BOOLEAN value to a session variable
-- Note the value converted to TEXT and then stored as Postgresql does
-- not support any other data type in session variables.
-- name name of session variable to set
-- value BOOLEAN value to store
CREATE OR REPLACE FUNCTION set_session_value(name text, value BOOLEAN)
RETURNS VOID
AS \$\$
BEGIN
    PERFORM set_config(name, cast(value as text), false);
    RETURN;

    EXCEPTION
    WHEN OTHERS THEN
        RAISE EXCEPTION 'set_session_value(%) : value:[%] failed, sqlstate: %', name, value, sqlstate;
END;\$\$
LANGUAGE plpgsql;

-- Fetches a text value from the session configuration.
-- param name name of the session variable to fetch
-- If the name is not found it returns NULL.
-- Postgresql allows you to store custom session values
-- but throws an exception if they have not first been
-- set.  This allows us to be a bit more graceful.
CREATE OR REPLACE FUNCTION get_session_value(name TEXT)
RETURNS TEXT
AS \$\$
DECLARE
    text_value TEXT := '';
BEGIN
    text_value = current_setting(name);
    RETURN(text_value);

    EXCEPTION
    WHEN undefined_object THEN
        -- Variable has not been initialized so return NULL
        RETURN NULL;
    WHEN OTHERS THEN
        RAISE EXCEPTION 'get_session_value(%, TEXT) failed, sqlstate: %', name, sqlstate;
END;\$\$
LANGUAGE plpgsql;

-- Fetches an BIGINT value from the session configuration.
-- param name name of the session variable to fetch
-- If the name is not found it returns zero.
CREATE OR REPLACE FUNCTION get_session_big_int(name text)
RETURNS BIGINT
AS \$\$
DECLARE
    int_value BIGINT := 0;
    text_value TEXT := '';
BEGIN
    text_value = get_session_value(name);
    IF text_value is NULL or text_value = '' THEN
        RETURN(0);
    END IF;

    int_value = cast(text_value as BIGINT);
    RETURN(int_value);

    EXCEPTION
    WHEN OTHERS THEN
        RAISE EXCEPTION 'get_session_big_int(%) failed - text:[%] , sqlstate: %', name, text_value, sqlstate;

END;\$\$
LANGUAGE plpgsql;

-- Fetches an BOOLEAN value from the session configuration.
-- param name name of the session variable to fetch
-- If the name is not found it returns zero.
CREATE OR REPLACE FUNCTION get_session_boolean(name text)
RETURNS BOOLEAN
AS \$\$
DECLARE
    bool_value BOOLEAN := false;
    text_value TEXT := '';
BEGIN
    text_value = get_session_value(name);
    IF text_value is NULL or text_value = '' THEN
        RETURN(false);
    END IF;

    bool_value = cast(text_value as BOOLEAN);
    RETURN(bool_value);

    EXCEPTION
    WHEN OTHERS THEN
        RAISE EXCEPTION 'get_session_boolean(%) failed - text:[%] , sqlstate: %', name, text_value, sqlstate;

END;\$\$
LANGUAGE plpgsql;

-- -----------------------------------------------------
-- Stored procedure which creates a new entry in the
-- dhcp4_audit_revision table and sets appropriate session
-- variables to be used while creating the audit entries
-- by triggers. This procedure should be called at the
-- beginning of a transaction which modifies configuration
-- data in the database, e.g. when new subnet is added.
--
-- Parameters:
-- - audit_ts timestamp to be associated with the audit
--   revision.
-- - server_tag is used to retrieve the server_id which
--   associates the changes applied with the particular
--   server or all servers.
-- - audit_log_message is a log message associates with
--   the audit revision.
-- - cascade_transaction is assigned to a session
--   variable which is used in some triggers to determine
--   if the audit entry should be created for them or
--   not. Specifically, this is used when DHCP options
--   are inserted, updated or deleted. If such modification
--   is a part of the larger change (e.g. change in the
--   subnet the options belong to) the dedicated audit
--   entry for options must not be created. On the other
--   hand, if the global option is being added, the
--   audit entry for the option must be created because
--   it is the sole object modified in that case.
--   Session variable disable_audit is used to disable
--   the procedure when wiping the database during
--   unit tests.  This avoids issues with revision_id
--   being null.
-- -----------------------------------------------------
CREATE OR REPLACE FUNCTION createAuditRevisionDHCP4(audit_ts TIMESTAMP WITH TIME ZONE,
                                                    server_tag VARCHAR(64),
                                                    audit_log_message TEXT,
                                                    cascade_transaction BOOLEAN)
RETURNS VOID
LANGUAGE plpgsql
AS \$\$
DECLARE
    disable_audit BOOLEAN := false;
    audit_revision_id BIGINT;
    srv_id BIGINT;
BEGIN
    -- Fetch session value for disable_audit.
    disable_audit := get_session_boolean('kea.disable_audit');
    IF disable_audit = false THEN
        SELECT id INTO srv_id FROM dhcp4_server WHERE tag = server_tag;
        INSERT INTO dhcp4_audit_revision (modification_ts, server_id, log_message)
            VALUES (audit_ts, srv_id, audit_log_message) returning id INTO audit_revision_id;

        -- Update pertinent session variables.
        PERFORM set_session_value('kea.audit_revision_id', audit_revision_id);
        PERFORM set_session_value('kea.cascade_transaction', cascade_transaction);
    END IF;
    RETURN;
END;\$\$;

-- -----------------------------------------------------
-- Stored procedure which creates a new entry in the
-- dhcp4_audit table. It should be called from the
-- triggers of the tables where the config modifications
-- are applied. The audit_revision_id variable contains
-- the revision id to be placed in the audit entries.
--
-- The following parameters are passed to this procedure:
-- - object_type_val: name of the table to be associated
--   with the applied changes.
-- - object_id_val: identifier of the modified object in
--   that table.
-- - modification_type_val: string value indicating the
--   type of the change, i.e. 'create', 'update' or
--   'delete'.
--   Session variable disable_audit is used to disable
--   the procedure when wiping the database during
--   unit tests.  This avoids issues with revision_id
--   being null.
-- ----------------------------------------------------
CREATE OR REPLACE FUNCTION createAuditEntryDHCP4(object_type_val VARCHAR(256),
                                                 object_id_val BIGINT,
                                                 modification_type_val VARCHAR(32))
RETURNS VOID
LANGUAGE plpgsql
as \$\$
DECLARE
    audit_revision_id BIGINT;
    disable_audit BOOLEAN := false;
BEGIN
    -- Fetch session value for disable_audit.
    disable_audit := get_session_boolean('kea.disable_audit');

    IF disable_audit IS NULL OR disable_audit = false THEN
        -- Fetch session value most recently created audit_revision_id.
        audit_revision_id := get_session_big_int('kea.audit_revision_id');
        INSERT INTO dhcp4_audit (object_type, object_id, modification_type, revision_id)
            VALUES (object_type_val, object_id_val,
                (SELECT id FROM modification WHERE modification_type = modification_type_val),
                 audit_revision_id);
    END IF;
    RETURN;
END;\$\$;

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
    id SERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(128) UNIQUE NOT NULL,
    test TEXT,
    next_server INET DEFAULT NULL,
    server_hostname VARCHAR(128) DEFAULT NULL,
    boot_file_name VARCHAR(512) DEFAULT NULL,
    only_if_required BOOLEAN NOT NULL DEFAULT false,
    valid_lifetime BIGINT DEFAULT NULL,
    min_valid_lifetime BIGINT DEFAULT NULL,
    max_valid_lifetime BIGINT DEFAULT NULL,
    depend_on_known_directly BOOLEAN NOT NULL DEFAULT false,
    follow_class_name VARCHAR(128) DEFAULT NULL,
    modification_ts TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX key_dhcp4_client_class_modification_ts on dhcp4_client_class (modification_ts);

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
    class_id BIGINT PRIMARY KEY NOT NULL,
    order_index BIGINT NOT NULL,
    depend_on_known_indirectly BOOLEAN NOT NULL DEFAULT false,
    CONSTRAINT fk_dhcp4_client_class_order_class_id FOREIGN KEY (class_id)
        REFERENCES dhcp4_client_class (id) ON DELETE CASCADE
);

CREATE INDEX key_dhcp4_client_class_order_index on dhcp4_client_class_order (order_index);

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
CREATE OR REPLACE FUNCTION setClientClass4Order(id BIGINT,
                                                new_follow_class_name VARCHAR(128),
                                                old_follow_class_name VARCHAR(128))
RETURNS VOID
LANGUAGE plpgsql
AS \$\$
DECLARE
    -- Used to fetch class's current value for depend_on_known_indirectly
    l_depend_on_known_indirectly BIGINT := 0;

    -- Optionally set if the follow_class_name column value is specified.
    follow_class_index BIGINT;
BEGIN
    -- Fetch the class's current value of depend_on_known_indirectly.
    SELECT depend_on_known_indirectly INTO l_depend_on_known_indirectly
        FROM dhcp4_client_class_order WHERE id = class_id;

    -- Save it to the current session for use elsewhere during this transaction.
    -- Note this does not work prior to Postgres 9.2 unless the variables are
    -- defined in postgresql.conf. I think for now we put up with CB not supported
    -- prior to 9.2 or we tell people how to edit the conf file.
    PERFORM set_session_value('kea.depend_on_known_indirectly', l_depend_on_known_indirectly);

    -- Bail if the class is updated without re-positioning.
    IF(
       l_depend_on_known_indirectly IS NOT NULL AND
       ((new_follow_class_name IS NULL AND old_follow_class_name IS NULL) OR
        (new_follow_class_name = old_follow_class_name))
    ) THEN
        -- The depend_on_known_indirectly is set to 0 because this procedure is invoked
        -- whenever the dhcp4_client_class record is updated. Such update may include
        -- test expression changes impacting the dependency on KNOWN/UNKNOWN classes.
        -- This value will be later adjusted when dependencies are inserted.
        -- TKM should we update the session value also or is it moot?
        UPDATE dhcp4_client_class_order SET depend_on_known_indirectly = false
            WHERE class_id = id;
        RETURN;
    END IF;

    IF new_follow_class_name IS NOT NULL THEN
        -- Get the position of the class after which the new class should be added.
        SELECT o.order_index INTO follow_class_index
            FROM dhcp4_client_class AS c
            INNER JOIN dhcp4_client_class_order AS o
                ON c.id = o.class_id
            WHERE c.name = new_follow_class_name;

        IF follow_class_index IS NULL THEN
            -- The class with a name specified with new_follow_class_name does
            -- not exist.
            RAISE EXCEPTION 'Class %s does not exist.', new_follow_class_name
                USING ERRCODE = 'sql_routine_exception';
        END IF;

        -- We need to place the new class at the position of follow_class_index + 1.
        -- There may be a class at this position already.
        IF EXISTS(SELECT * FROM dhcp4_client_class_order WHERE order_index = follow_class_index + 1) THEN
            -- There is a class at this position already. Let's move all classes
            -- starting from this position by one to create a spot for the new
            -- class.
            UPDATE dhcp4_client_class_order
                SET order_index = order_index + 1
            WHERE order_index >= follow_class_index + 1;
            -- TKM postgresql doesn't like order by here, does it matter?
            -- ORDER BY order_index DESC;
        END IF;

    ELSE
        -- A caller did not specify the new_follow_class_name value. Let's append the
        -- new class at the end of the hierarchy.
        SELECT MAX(order_index) INTO follow_class_index FROM dhcp4_client_class_order;
        IF follow_class_index IS NULL THEN
            -- Apparently, there are no classes. Let's start from 0.
            follow_class_index = 0;
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
        RAISE EXCEPTION 'Unable to move class with id %s because it would break its dependencies', id
            USING ERRCODE = 'sql_routine_exception';
    END IF;

    -- The depend_on_known_indirectly is set to 0 because this procedure is invoked
    -- whenever the dhcp4_client_class record is updated. Such update may include
    -- test expression changes impacting the dependency on KNOWN/UNKNOWN classes.
    -- This value will be later adjusted when dependencies are inserted.
    -- ON CONFLICT required 9.5 or later
    UPDATE dhcp4_client_class_order
        SET order_index = follow_class_index + 1,
            depend_on_known_indirectly = l_depend_on_known_indirectly
        WHERE class_id = id;
    IF FOUND THEN
        RETURN;
    END IF;

    INSERT INTO  dhcp4_client_class_order(class_id, order_index, depend_on_known_indirectly)
        VALUES (id, follow_class_index + 1, 0);
    RETURN;
END;\$\$;

-- -----------------------------------------------------------------------
-- Trigger procedure to position an inserted class within the class hierarchy
-- and create audit.
-- -----------------------------------------------------------------------
CREATE OR REPLACE FUNCTION func_dhcp4_client_class_AINS() RETURNS trigger AS \$dhcp4_client_class_AINS\$
BEGIN
    PERFORM setClientClass4Order(NEW.id, NEW.follow_class_name, NULL);
    PERFORM createAuditEntryDHCP4('dhcp4_client_class', NEW.id, 'create');
    RETURN NULL;
END;
\$dhcp4_client_class_AINS\$
LANGUAGE plpgsql;

-- Create dhcp4_client_class insert trigger
CREATE TRIGGER dhcp4_client_class_AINS
    AFTER INSERT ON dhcp4_client_class
        FOR EACH ROW EXECUTE PROCEDURE func_dhcp4_client_class_AINS();

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
CREATE OR REPLACE FUNCTION func_dhcp4_client_class_AUPD() RETURNS trigger AS \$dhcp4_client_class_AUPD\$
BEGIN
    PERFORM set_session_value('kea.depend_on_known_directly', OLD.depend_on_known_directly);
    PERFORM set_session_value('kea.client_class_id', NEW.id);
    PERFORM setClientClass4Order(NEW.id, NEW.follow_class_name, OLD.follow_class_name);
    PERFORM createAuditEntryDHCP4('dhcp4_client_class', NEW.id, 'update');
    RETURN NULL;
END;
\$dhcp4_client_class_AUPD\$
LANGUAGE plpgsql;

-- Create dhcp4_client_class update insert trigger
CREATE TRIGGER dhcp4_client_class_AUPD
    AFTER UPDATE ON dhcp4_client_class
        FOR EACH ROW EXECUTE PROCEDURE func_dhcp4_client_class_AUPD();

-- -----------------------------------------------------------------------
-- Trigger procedure to create the audit entry for client class delete.
-- -----------------------------------------------------------------------
CREATE OR REPLACE FUNCTION func_dhcp4_client_class_ADEL() RETURNS trigger AS \$dhcp4_client_class_ADEL\$
BEGIN
    PERFORM createAuditEntryDHCP4('dhcp4_client_class', OLD.id, 'delete');
    RETURN NULL;
END;
\$dhcp4_client_class_ADEL\$
LANGUAGE plpgsql;

-- Create dhcp4_client_class delete trigger
CREATE TRIGGER dhcp4_client_class_ADEL
    AFTER DELETE ON dhcp4_client_class
        FOR EACH ROW EXECUTE PROCEDURE func_dhcp4_client_class_ADEL();

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
    class_id BIGINT PRIMARY KEY NOT NULL,
    dependency_id BIGINT NOT NULL,

    CONSTRAINT dhcp4_client_class_class_id FOREIGN KEY (class_id)
        REFERENCES dhcp4_client_class (id) ON DELETE CASCADE,
    CONSTRAINT dhcp4_client_class_dependency_id FOREIGN KEY (dependency_id)
        REFERENCES dhcp4_client_class (id)
);

CREATE INDEX dhcp4_client_class_dependency_id_idx on dhcp4_client_class_dependency (dependency_id);

-- -----------------------------------------------------------------------
-- Stored procedure verifying if class dependency is met. It includes
-- checking if referenced classes exist, are associated with the same
-- server or all servers, and are defined before the class specified with
-- class_id.
--
-- Parameters:
-- - p_class_id id client class,
-- - p_dependency_id id of the dependency.
-- -----------------------------------------------------------------------
CREATE OR REPLACE FUNCTION checkDHCPv4ClientClassDependency(p_class_id BIGINT,
                                                            p_dependency_id BIGINT)
RETURNS VOID
LANGUAGE plpgsql
AS \$\$
DECLARE
    class_index BIGINT;
    dependency_index BIGINT;
BEGIN
    -- We could check the same with a constraint but later in this
    -- trigger we use this value to verify if the dependencies are
    -- met.
    IF p_class_id IS NULL THEN
        RAISE EXCEPTION 'Client class id must not be NULL.'
            USING ERRCODE = 'sql_routine_exception';
    END IF;

    IF p_dependency_id IS NULL THEN
        RAISE EXCEPTION 'Class dependency id must not be NULL.'
            USING ERRCODE = 'sql_routine_exception';
    END IF;

    -- Dependencies on self make no sense.
    IF p_class_id = p_dependency_id THEN
        RAISE EXCEPTION 'Client class must not have dependency on self.'
            USING ERRCODE = 'sql_routine_exception';
    END IF;

    -- Check position of our class in the hierarchy.
    SELECT o.order_index INTO class_index FROM dhcp4_client_class AS c
        INNER JOIN dhcp4_client_class_order AS o ON c.id = o.class_id
        WHERE c.id = p_class_id;

    IF class_index IS NULL THEN
        RAISE EXCEPTION 'Client class with id % does not exist.', p_class_id
            USING ERRCODE = 'sql_routine_exception';
    END IF;

    -- Check position of the dependency.
    SELECT o.order_index INTO dependency_index FROM dhcp4_client_class AS c
        INNER JOIN dhcp4_client_class_order AS o ON c.id = o.class_id
        WHERE c.id = p_dependency_id;

    IF dependency_index IS NULL THEN
        RAISE EXCEPTION 'Dependency class with id % does not exist.', p_dependency_id
            USING ERRCODE = 'sql_routine_exception';
    END IF;

    -- The dependency must not be later than our class.
    IF dependency_index > class_index THEN
        RAISE EXCEPTION
            'Client class with id % must not depend on class defined later with id %',
            p_class_id, p_dependency_id USING ERRCODE = 'sql_routine_exception';
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
                ON t2.class_id = p_dependency_id AND (t2.server_id = 1 OR t2.server_id = t1.server_id)
        WHERE t1.class_id = p_class_id AND t2.server_id IS NULL
        LIMIT 1
    ) THEN
        RAISE EXCEPTION 'Unmet dependencies for client class with id %', class_id
            USING ERRCODE = 'sql_routine_exception';
    END IF;
    RETURN;
END;\$\$;

-- -----------------------------------------------------------------------
-- Trigger verifying if class dependency is met. It includes checking
-- if referenced classes exist, are associated with the same server
-- or all servers, and are defined before the class specified with
-- class_id.
-- -----------------------------------------------------------------------
CREATE OR REPLACE FUNCTION func_dhcp4_client_class_check_dependency_BINS()
    RETURNS trigger AS \$dhcp4_client_class_check_dependency_BINS\$
BEGIN
    PERFORM checkDHCPv4ClientClassDependency(NEW.class_id, NEW.dependency_id);
    RETURN NULL;
END;
\$dhcp4_client_class_check_dependency_BINS\$
LANGUAGE plpgsql;

-- Create dhcp4_client_class_check_dependency_BINS before insert trigger.
CREATE TRIGGER dhcp4_client_class_check_dependency_BINS
    BEFORE INSERT ON dhcp4_client_class_dependency
        FOR EACH ROW EXECUTE PROCEDURE func_dhcp4_client_class_check_dependency_BINS();

-- -----------------------------------------------------------------------
-- Stored procedure setting client class indirect dependency on KNOWN or
-- UNKNOWN built-in classes by checking this flag for the client classes
-- on which it depends.
--
-- Parameters:
-- - client_class_id id of the client class which dependency is set,
-- - dependency_id id of the client class on which the given class depends.
-- -----------------------------------------------------------------------
CREATE OR REPLACE FUNCTION updateDHCPv4ClientClassKnownDependency(client_class_id BIGINT,
                                                                  dependency_id BIGINT)
RETURNS VOID
LANGUAGE plpgsql
AS \$\$
DECLARE
    dependency BOOLEAN;
BEGIN
    -- Check if the dependency class references KNOWN/UNKNOWN.
    SELECT depend_on_known_directly INTO dependency FROM dhcp4_client_class
        WHERE id = dependency_id;

    -- If it doesn't, check if the dependency references KNOWN/UNKNOWN
    -- indirectly (via other classes).
    IF dependency = false THEN
        SELECT depend_on_known_indirectly INTO dependency FROM dhcp4_client_class_order
            WHERE class_id = dependency_id;
    END IF;

    IF dependency = true THEN
        UPDATE dhcp4_client_class_order
            SET depend_on_known_indirectly = true
        WHERE class_id = client_class_id;
    END IF;
    RETURN;
END;\$\$;

-- -----------------------------------------------------------------------
-- Trigger setting client class indirect dependency on KNOWN or UNKNOWN
-- built-in classes by checking this flag for the client classes on which
-- it depends.
-- -----------------------------------------------------------------------
CREATE OR REPLACE FUNCTION func_dhcp4_client_class_dependency_AINS()
    RETURNS TRIGGER AS \$dhcp4_client_class_dependency_AINS\$
BEGIN
    PERFORM updateDHCPv4ClientClassKnownDependency(NEW.class_id, NEW.dependency_id);
    RETURN NULL;
END;
\$dhcp4_client_class_dependency_AINS\$
LANGUAGE plpgsql;

-- Create dhcp4_client_class_check_dependency_AINS after insert trigger.
CREATE TRIGGER dhcp4_client_class_dependency_AINS
    AFTER INSERT ON dhcp4_client_class_dependency
        FOR EACH ROW EXECUTE PROCEDURE func_dhcp4_client_class_dependency_AINS();

-- -----------------------------------------------------------------------
-- Stored procedure to be executed before committing a transaction
-- updating a DHCPv4 client class. It verifies if the class dependency on
-- KNOWN or UNKNOWN built-in classes has changed as a result of the
-- update. It signals an error if it has changed and there is at least
-- one class depending on this class.
-- -----------------------------------------------------------------------
CREATE OR REPLACE FUNCTION checkDHCPv4ClientClassKnownDependencyChange()
RETURNS VOID
LANGUAGE plpgsql
AS \$\$
DECLARE
    depended BOOLEAN := false;
    depends BOOLEAN := false;
    client_class_id BIGINT;
    depend_on_known_directly BOOLEAN;
    depend_on_known_indirectly BOOLEAN;
BEGIN

    -- Session variables are set upon a client class update.
    client_class_id := get_session_big_int('kea.client_class_id');
    IF client_class_id IS NOT NULL THEN
        -- Check if any of the classes depend on this class. If not,
        -- it is ok to change the dependency on KNOWN/UNKNOWN.
        IF EXISTS(
            SELECT 1 FROM dhcp4_client_class_dependency
            WHERE dependency_id = client_class_id LIMIT 1
        ) THEN
            -- Using the session variables, determine whether the client class
            -- depended on KNOWN/UNKNOWN before the update.
            depend_on_known_directly := get_session_boolean('kea.depend_on_known_directly');
            depend_on_known_indirectly := get_session_boolean('kea.depend_on_known_indirectly');
            IF depend_on_known_directly = true OR depend_on_known_indirectly = true THEN
                SET depended = true;
            END IF;

            -- Check if the client class depends on KNOWN/UNKNOWN after the update.
            SELECT depend_on_known_directly INTO depends FROM dhcp4_client_class
                WHERE id = client_class_id;

            -- If it doesn't depend directly, check indirect dependencies.
            IF depends = false THEN
                SELECT depend_on_known_indirectly INTO depends FROM dhcp4_client_class_order
                    WHERE class_id = client_class_id;
            END IF;

            -- The resulting dependency on KNOWN/UNKNOWN must not change.
            IF depended <> depends THEN
                RAISE EXCEPTION 'Class dependency on KNOWN/UNKNOWN built-in classes must not change.'
                    USING ERRCODE = 'sql_routine_exception';
            END IF;
        END IF;
    END IF;
    RETURN;
END;\$\$;

-- -----------------------------------------------------------------------
-- Create table matching DHCPv4 classes with the servers.
-- -----------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS dhcp4_client_class_server (
    class_id BIGINT NOT NULL,
    server_id BIGINT NOT NULL,
    modification_ts  TIMESTAMP WITH TIME ZONE NULL DEFAULT NULL,
    PRIMARY KEY (class_id,server_id),
    CONSTRAINT fk_dhcp4_client_class_class_id FOREIGN KEY (class_id)
        REFERENCES dhcp4_client_class (id)
        ON DELETE CASCADE,
    CONSTRAINT fk_dhcp4_client_class_server_id FOREIGN KEY (server_id)
        REFERENCES dhcp4_server (id)
);

CREATE INDEX fk_dhcp4_client_class_server_id ON dhcp4_client_class_server (server_id);

-- -----------------------------------------------------
-- Stored procedure which creates a new entry in the
-- dhcp6_audit_revision table and sets appropriate session
-- variables to be used while creating the audit entries
-- by triggers. This procedure should be called at the
-- beginning of a transaction which modifies configuration
-- data in the database, e.g. when new subnet is added.
--
-- Parameters:
-- - audit_ts timestamp to be associated with the audit
--   revision.
-- - server_tag is used to retrieve the server_id which
--   associates the changes applied with the particular
--   server or all servers.
-- - audit_log_message is a log message associates with
--   the audit revision.
-- - cascade_transaction is assigned to a session
--   variable which is used in some triggers to determine
--   if the audit entry should be created for them or
--   not. Specifically, this is used when DHCP options
--   are inserted, updated or deleted. If such modification
--   is a part of the larger change (e.g. change in the
--   subnet the options belong to) the dedicated audit
--   entry for options must not be created. On the other
--   hand, if the global option is being added, the
--   audit entry for the option must be created because
--   it is the sole object modified in that case.
--   Session variable disable_audit is used to disable
--   the procedure when wiping the database during
--   unit tests.  This avoids issues with revision_id
--   being null.
-- -----------------------------------------------------
CREATE OR REPLACE FUNCTION createAuditRevisionDHCP6(audit_ts TIMESTAMP WITH TIME ZONE,
                                                    server_tag VARCHAR(64),
                                                    audit_log_message TEXT,
                                                    cascade_transaction BOOLEAN)
RETURNS VOID
LANGUAGE plpgsql
AS \$\$
DECLARE
    disable_audit BOOLEAN := false;
    audit_revision_id BIGINT;
    srv_id BIGINT;
BEGIN
    -- Fetch session value for disable_audit.
    disable_audit := get_session_boolean('kea.disable_audit');
    IF disable_audit = false THEN
        SELECT id INTO srv_id FROM dhcp6_server WHERE tag = server_tag;
        INSERT INTO dhcp6_audit_revision (modification_ts, server_id, log_message)
            VALUES (audit_ts, srv_id, audit_log_message) returning id INTO audit_revision_id;

        -- Update pertinent session variables.
        PERFORM set_session_value('kea.audit_revision_id', audit_revision_id);
        PERFORM set_session_value('kea.cascade_transaction', cascade_transaction);
    END IF;
    RETURN;
END;\$\$;

-- -----------------------------------------------------
-- Stored procedure which creates a new entry in the
-- dhcp6_audit table. It should be called from the
-- triggers of the tables where the config modifications
-- are applied. The audit_revision_id variable contains
-- the revision id to be placed in the audit entries.
--
-- The following parameters are passed to this procedure:
-- - object_type_val: name of the table to be associated
--   with the applied changes.
-- - object_id_val: identifier of the modified object in
--   that table.
-- - modification_type_val: string value indicating the
--   type of the change, i.e. 'create', 'update' or
--   'delete'.
--   Session variable disable_audit is used to disable
--   the procedure when wiping the database during
--   unit tests.  This avoids issues with revision_id
--   being null.
-- ----------------------------------------------------
CREATE OR REPLACE FUNCTION createAuditEntryDHCP6(object_type_val VARCHAR(256),
                                                 object_id_val BIGINT,
                                                 modification_type_val VARCHAR(32))
RETURNS VOID
LANGUAGE plpgsql
AS \$\$
DECLARE
    audit_revision_id BIGINT;
    disable_audit BOOLEAN := false;
BEGIN
    -- Fetch session value for disable_audit.
    disable_audit := get_session_boolean('kea.disable_audit');
    IF disable_audit = false THEN
        -- Fetch session value most recently created audit_revision_id.
        audit_revision_id := get_session_big_int('kea.audit_revision_id');
        INSERT INTO dhcp6_audit (object_type, object_id, modification_type, revision_id)
            VALUES (object_type_val, object_id_val,
                (SELECT id FROM modification WHERE modification_type = modification_type_val),
                 audit_revision_id);
    END IF;
    RETURN;
END;\$\$;

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
    id SERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(128) UNIQUE NOT NULL,
    test TEXT,
    only_if_required BOOLEAN NOT NULL DEFAULT false,
    valid_lifetime BIGINT DEFAULT NULL,
    min_valid_lifetime BIGINT DEFAULT NULL,
    max_valid_lifetime BIGINT DEFAULT NULL,
    depend_on_known_directly BOOLEAN NOT NULL DEFAULT false,
    follow_class_name VARCHAR(128) DEFAULT NULL,
    modification_ts TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX key_dhcp6_client_class_modification_ts on dhcp6_client_class (modification_ts);

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
    class_id BIGINT PRIMARY KEY NOT NULL,
    order_index BIGINT NOT NULL,
    depend_on_known_indirectly BOOLEAN NOT NULL DEFAULT false,
    CONSTRAINT fk_dhcp6_client_class_order_class_id FOREIGN KEY (class_id)
        REFERENCES dhcp6_client_class (id) ON DELETE CASCADE
);

CREATE INDEX key_dhcp6_client_class_order_index on dhcp6_client_class_order (order_index);

-- -----------------------------------------------------------------------
-- Stored procedure positioning an inserted or updated client class
-- within the class hierarchy, depending on the value of the
-- new_follow_class_name parameter.
--
-- Parameters:
-- - id id of the positioned class,
-- - new_follow_class_name name of the class after which this class should be
--   positioned within the class hierarchy.
-- - old_follow_class_name previous name of the class after which this
--   class was positioned within the class hierarchy.
-- -----------------------------------------------------------------------
CREATE OR REPLACE FUNCTION setClientClass6Order(id BIGINT,
                                                new_follow_class_name VARCHAR(128),
                                                old_follow_class_name VARCHAR(128))
RETURNS VOID
LANGUAGE plpgsql
AS \$\$
DECLARE
    -- Used to fetch class's current value for depend_on_known_indirectly
    l_depend_on_known_indirectly BIGINT := 0;

    -- Optionally set if the follow_class_name column value is specified.
    follow_class_index BIGINT;
BEGIN
    -- Fetch the class's current value of depend_on_known_indirectly.
    SELECT depend_on_known_indirectly INTO l_depend_on_known_indirectly
        FROM dhcp6_client_class_order WHERE id = class_id;

    -- Save it to the current session for use elsewhere during this transaction.
    -- Note this does not work prior to Postgres 9.2 unless the variables are
    -- defined in postgresql.conf. I think for now we put up with CB not supported
    -- prior to 9.2 or we tell people how to edit the conf file.
    PERFORM set_session_value('kea.depend_on_known_indirectly', l_depend_on_known_indirectly);

    -- Bail if the class is updated without re-positioning.
    IF(
       l_depend_on_known_indirectly IS NOT NULL AND
       ((new_follow_class_name IS NULL AND old_follow_class_name IS NULL) OR
        (new_follow_class_name = old_follow_class_name))
    ) THEN
        -- The depend_on_known_indirectly is set to 0 because this procedure is invoked
        -- whenever the dhcp6_client_class record is updated. Such update may include
        -- test expression changes impacting the dependency on KNOWN/UNKNOWN classes.
        -- This value will be later adjusted when dependencies are inserted.
        -- TKM should we update the session value also or is it moot?
        UPDATE dhcp6_client_class_order SET depend_on_known_indirectly = false
            WHERE class_id = id;
        RETURN;
    END IF;

    IF new_follow_class_name IS NOT NULL THEN
        -- Get the position of the class after which the new class should be added.
        SELECT o.order_index INTO follow_class_index
            FROM dhcp6_client_class AS c
            INNER JOIN dhcp6_client_class_order AS o
                ON c.id = o.class_id
            WHERE c.name = new_follow_class_name;

        IF follow_class_index IS NULL THEN
            -- The class with a name specified with new_follow_class_name does
            -- not exist.
            RAISE EXCEPTION 'Class %s does not exist.', new_follow_class_name
                USING ERRCODE = 'sql_routine_exception';
        END IF;

        -- We need to place the new class at the position of follow_class_index + 1.
        -- There may be a class at this position already.
        IF EXISTS(SELECT * FROM dhcp6_client_class_order WHERE order_index = follow_class_index + 1) THEN
            -- There is a class at this position already. Let's move all classes
            -- starting from this position by one to create a spot for the new
            -- class.
            UPDATE dhcp6_client_class_order
                SET order_index = order_index + 1
            WHERE order_index >= follow_class_index + 1;
            -- TKM postgresql doesn't like order by here, does it matter?
            -- ORDER BY order_index DESC;
        END IF;

    ELSE
        -- A caller did not specify the new_follow_class_name value. Let's append the
        -- new class at the end of the hierarchy.
        SELECT MAX(order_index) INTO follow_class_index FROM dhcp6_client_class_order;
        IF follow_class_index IS NULL THEN
            -- Apparently, there are no classes. Let's start from 0.
            follow_class_index = 0;
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
        RAISE EXCEPTION 'Unable to move class with id %s because it would break its dependencies', id
            USING ERRCODE = 'sql_routine_exception';
    END IF;

    -- The depend_on_known_indirectly is set to 0 because this procedure is invoked
    -- whenever the dhcp6_client_class record is updated. Such update may include
    -- test expression changes impacting the dependency on KNOWN/UNKNOWN classes.
    -- This value will be later adjusted when dependencies are inserted.
    -- TKM - note that ON CONFLICT requires PostgreSQL 9.5 or later.
    UPDATE dhcp6_client_class_order
        SET order_index = follow_class_index + 1,
            depend_on_known_indirectly = l_depend_on_known_indirectly
        WHERE class_id = id;
    IF FOUND THEN
        RETURN;
    END IF;

    INSERT INTO  dhcp6_client_class_order(class_id, order_index, depend_on_known_indirectly)
        VALUES (id, follow_class_index + 1, 0);
    RETURN;
END;\$\$;

-- -----------------------------------------------------------------------
-- Trigger procedure to position an inserted class within the class hierarchy
-- and create audit.
-- -----------------------------------------------------------------------
CREATE OR REPLACE FUNCTION func_dhcp6_client_class_AINS() RETURNS trigger AS \$dhcp6_client_class_AINS\$
BEGIN
    PERFORM setClientClass6Order(NEW.id, NEW.follow_class_name, NULL);
    PERFORM createAuditEntryDHCP6('dhcp6_client_class', NEW.id, 'create');
    RETURN NULL;
END;
\$dhcp6_client_class_AINS\$
LANGUAGE plpgsql;

-- Create dhcp6_client_class insert trigger
CREATE TRIGGER dhcp6_client_class_AINS
    AFTER INSERT ON dhcp6_client_class
        FOR EACH ROW EXECUTE PROCEDURE func_dhcp6_client_class_AINS();

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
CREATE OR REPLACE FUNCTION func_dhcp6_client_class_AUPD() RETURNS trigger AS \$dhcp6_client_class_AUPD\$
BEGIN
    PERFORM set_session_value('kea.depend_on_known_directly', OLD.depend_on_known_directly);
    PERFORM set_session_value('kea.client_class_id', NEW.id);
    PERFORM setClientClass6Order(NEW.id, NEW.follow_class_name, OLD.follow_class_name);
    PERFORM createAuditEntryDHCP6('dhcp6_client_class', NEW.id, 'update');
    RETURN NULL;
END;
\$dhcp6_client_class_AUPD\$
LANGUAGE plpgsql;

-- Create dhcp6_client_class update insert trigger
CREATE TRIGGER dhcp6_client_class_AUPD
    AFTER UPDATE ON dhcp6_client_class
        FOR EACH ROW EXECUTE PROCEDURE func_dhcp6_client_class_AUPD();

-- -----------------------------------------------------------------------
-- Trigger procedure to create the audit entry for client class delete.
-- -----------------------------------------------------------------------
CREATE OR REPLACE FUNCTION func_dhcp6_client_class_ADEL() RETURNS trigger AS \$dhcp6_client_class_ADEL\$
BEGIN
    PERFORM createAuditEntryDHCP6('dhcp6_client_class', OLD.id, 'delete');
    RETURN NULL;
END;
\$dhcp6_client_class_ADEL\$
LANGUAGE plpgsql;

-- Create dhcp6_client_class delete trigger
CREATE TRIGGER dhcp6_client_class_ADEL
    AFTER DELETE ON dhcp6_client_class
        FOR EACH ROW EXECUTE PROCEDURE func_dhcp6_client_class_ADEL();

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
    class_id BIGINT PRIMARY KEY NOT NULL,
    dependency_id BIGINT NOT NULL,

    CONSTRAINT dhcp6_client_class_class_id FOREIGN KEY (class_id)
        REFERENCES dhcp6_client_class (id) ON DELETE CASCADE,
    CONSTRAINT dhcp6_client_class_dependency_id FOREIGN KEY (dependency_id)
        REFERENCES dhcp6_client_class (id)
);

CREATE INDEX dhcp6_client_class_dependency_id_idx on dhcp6_client_class_dependency (dependency_id);

-- -----------------------------------------------------------------------
-- Stored procedure verifying if class dependency is met. It includes
-- checking if referenced classes exist, are associated with the same
-- server or all servers, and are defined before the class specified with
-- class_id.
--
-- Parameters:
-- - p_class_id id client class,
-- - p_dependency_id id of the dependency.
-- -----------------------------------------------------------------------
CREATE OR REPLACE FUNCTION checkDHCPv6ClientClassDependency(p_class_id BIGINT,
                                                            p_dependency_id BIGINT)
RETURNS VOID
LANGUAGE plpgsql
AS \$\$
DECLARE
    class_index BIGINT;
    dependency_index BIGINT;
BEGIN
    -- We could check the same with a constraint but later in this
    -- trigger we use this value to verify if the dependencies are
    -- met.
    IF p_class_id IS NULL THEN
        RAISE EXCEPTION 'Client class id must not be NULL.'
            USING ERRCODE = 'sql_routine_exception';
    END IF;

    IF p_dependency_id IS NULL THEN
        RAISE EXCEPTION 'Class dependency id must not be NULL.'
            USING ERRCODE = 'sql_routine_exception';
    END IF;

    -- Dependencies on self make no sense.
    IF p_class_id = p_dependency_id THEN
        RAISE EXCEPTION 'Client class must not have dependency on self.'
            USING ERRCODE = 'sql_routine_exception';
    END IF;

    -- Check position of our class in the hierarchy.
    SELECT o.order_index INTO class_index FROM dhcp6_client_class AS c
        INNER JOIN dhcp6_client_class_order AS o ON c.id = o.class_id
        WHERE c.id = p_class_id;

    IF class_index IS NULL THEN
        RAISE EXCEPTION 'Client class with id % does not exist.', p_class_id
            USING ERRCODE = 'sql_routine_exception';
    END IF;

    -- Check position of the dependency.
    SELECT o.order_index INTO dependency_index FROM dhcp6_client_class AS c
        INNER JOIN dhcp6_client_class_order AS o ON c.id = o.class_id
        WHERE c.id = p_dependency_id;

    IF dependency_index IS NULL THEN
        RAISE EXCEPTION 'Dependency class with id % does not exist.', p_dependency_id
            USING ERRCODE = 'sql_routine_exception';
    END IF;

    -- The dependency must not be later than our class.
    IF dependency_index > class_index THEN
        RAISE EXCEPTION
            'Client class with id % must not depend on class defined later with id %',
            p_class_id, p_dependency_id USING ERRCODE = 'sql_routine_exception';
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
                ON t2.class_id = p_dependency_id AND (t2.server_id = 1 OR t2.server_id = t1.server_id)
        WHERE t1.class_id = p_class_id AND t2.server_id IS NULL
        LIMIT 1
    ) THEN
        RAISE EXCEPTION 'Unmet dependencies for client class with id %', p_class_id
            USING ERRCODE = 'sql_routine_exception';
    END IF;
    RETURN;
END;\$\$;

-- -----------------------------------------------------------------------
-- Trigger verifying if class dependency is met. It includes checking
-- if referenced classes exist, are associated with the same server
-- or all servers, and are defined before the class specified with
-- class_id.
-- -----------------------------------------------------------------------
CREATE OR REPLACE FUNCTION func_dhcp6_client_class_check_dependency_BINS()
    RETURNS trigger AS \$dhcp6_client_class_check_dependency_BINS\$
BEGIN
    PERFORM checkDHCPv6ClientClassDependency(NEW.class_id, NEW.dependency_id);
    RETURN NULL;
END;
\$dhcp6_client_class_check_dependency_BINS\$
LANGUAGE plpgsql;

-- Create dhcp6_client_class_check_dependency_BINS before insert trigger.
CREATE TRIGGER dhcp6_client_class_check_dependency_BINS
    BEFORE INSERT ON dhcp6_client_class_dependency
        FOR EACH ROW EXECUTE PROCEDURE func_dhcp6_client_class_check_dependency_BINS();

-- -----------------------------------------------------------------------
-- Stored procedure setting client class indirect dependency on KNOWN or
-- UNKNOWN built-in classes by checking this flag for the client classes
-- on which it depends.
--
-- Parameters:
-- - client_class_id id of the client class which dependency is set,
-- - dependency_id id of the client class on which the given class depends.
-- -----------------------------------------------------------------------
CREATE OR REPLACE FUNCTION updateDHCPv6ClientClassKnownDependency(client_class_id BIGINT,
                                                                  dependency_id BIGINT)
RETURNS VOID
LANGUAGE plpgsql
AS \$\$
DECLARE
    dependency BOOLEAN;
BEGIN
    -- Check if the dependency class references KNOWN/UNKNOWN.
    SELECT depend_on_known_directly INTO dependency FROM dhcp6_client_class
        WHERE id = dependency_id;

    -- If it doesn't, check if the dependency references KNOWN/UNKNOWN
    -- indirectly (via other classes).
    IF dependency = false THEN
        SELECT depend_on_known_indirectly INTO dependency FROM dhcp6_client_class_order
            WHERE class_id = dependency_id;
    END IF;

    IF dependency = true THEN
        UPDATE dhcp6_client_class_order
            SET depend_on_known_indirectly = true
        WHERE class_id = client_class_id;
    END IF;
    RETURN;
END;\$\$;

-- -----------------------------------------------------------------------
-- Trigger setting client class indirect dependency on KNOWN or UNKNOWN
-- built-in classes by checking this flag for the client classes on which
-- it depends.
-- -----------------------------------------------------------------------
CREATE OR REPLACE FUNCTION func_dhcp6_client_class_dependency_AINS()
    RETURNS TRIGGER AS \$dhcp6_client_class_dependency_AINS\$
BEGIN
    PERFORM updateDHCPv6ClientClassKnownDependency(NEW.class_id, NEW.dependency_id);
    RETURN NULL;
END;
\$dhcp6_client_class_dependency_AINS\$
LANGUAGE plpgsql;

-- Create dhcp6_client_class_check_dependency_AINS after insert trigger.
CREATE TRIGGER dhcp6_client_class_dependency_AINS
    AFTER INSERT ON dhcp6_client_class_dependency
        FOR EACH ROW EXECUTE PROCEDURE func_dhcp6_client_class_dependency_AINS();

-- -----------------------------------------------------------------------
-- Stored procedure to be executed before committing a transaction
-- updating a DHCPv6 client class. It verifies if the class dependency on
-- KNOWN or UNKNOWN built-in classes has changed as a result of the
-- update. It signals an error if it has changed and there is at least
-- one class depending on this class.
-- -----------------------------------------------------------------------
CREATE OR REPLACE FUNCTION checkDHCPv6ClientClassKnownDependencyChange()
RETURNS VOID
LANGUAGE plpgsql
AS \$\$
DECLARE
    depended BOOLEAN := false;
    depends BOOLEAN := false;
    client_class_id BIGINT;
    depend_on_known_directly BOOLEAN;
    depend_on_known_indirectly BOOLEAN;
BEGIN

    -- Session variables are set upon a client class update.
    client_class_id := get_session_big_int('kea.client_class_id');
    IF client_class_id IS NOT NULL THEN
        -- Check if any of the classes depend on this class. If not,
        -- it is ok to change the dependency on KNOWN/UNKNOWN.
        IF EXISTS(
            SELECT 1 FROM dhcp6_client_class_dependency
            WHERE dependency_id = client_class_id LIMIT 1
        ) THEN
            -- Using the session variables, determine whether the client class
            -- depended on KNOWN/UNKNOWN before the update.
            depend_on_known_directly := get_session_boolean('kea.depend_on_known_directly');
            depend_on_known_indirectly := get_session_boolean('kea.depend_on_known_indirectly');
            IF depend_on_known_directly = true OR depend_on_known_indirectly = true THEN
                SET depended = true;
            END IF;

            -- Check if the client class depends on KNOWN/UNKNOWN after the update.
            SELECT depend_on_known_directly INTO depends FROM dhcp6_client_class
                WHERE id = client_class_id;

            -- If it doesn't depend directly, check indirect dependencies.
            IF depends = false THEN
                SELECT depend_on_known_indirectly INTO depends FROM dhcp6_client_class_order
                    WHERE class_id = client_class_id;
            END IF;

            -- The resulting dependency on KNOWN/UNKNOWN must not change.
            IF depended <> depends THEN
                RAISE EXCEPTION 'Class dependency on KNOWN/UNKNOWN built-in classes must not change.'
                    USING ERRCODE = 'sql_routine_exception';
            END IF;
        END IF;
    END IF;
    RETURN;
END;\$\$;

-- -----------------------------------------------------------------------
-- Create table matching DHCPv6 classes with the servers.
-- -----------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS dhcp6_client_class_server (
    class_id BIGINT NOT NULL,
    server_id BIGINT NOT NULL,
    modification_ts  TIMESTAMP WITH TIME ZONE NULL DEFAULT NULL,
    PRIMARY KEY (class_id,server_id),
    CONSTRAINT fk_dhcp6_client_class_class_id FOREIGN KEY (class_id)
        REFERENCES dhcp6_client_class (id)
        ON DELETE CASCADE,
    CONSTRAINT fk_dhcp6_client_class_server_id FOREIGN KEY (server_id)
        REFERENCES dhcp6_server (id)
);

CREATE INDEX fk_dhcp6_client_class_server_id ON dhcp6_client_class_server (server_id);

-- Trigger function for dhcp4_pool_BDEL called BEFORE DELETE on dhcp4_pool
-- It removes pool specific options upon removal of the pool.
CREATE OR REPLACE FUNCTION func_dhcp4_pool_BDEL() RETURNS TRIGGER AS \$dhcp4_pool_BDEL\$
BEGIN
    DELETE FROM dhcp4_options WHERE scope_id = 5 AND pool_id = OLD.id;
    RETURN OLD;
END;
\$dhcp4_pool_BDEL\$
LANGUAGE plpgsql;

CREATE TRIGGER dhcp4_pool_BDEL
    BEFORE DELETE ON dhcp4_pool
        FOR EACH ROW EXECUTE PROCEDURE func_dhcp4_pool_BDEL();

-- Trigger function for dhcp6_pool_BDEL called BEFORE DELETE on dhcp6_pool
-- It removes pool specific options upon removal of the pool.
CREATE OR REPLACE FUNCTION func_dhcp6_pool_BDEL() RETURNS TRIGGER AS \$dhcp6_pool_BDEL\$
BEGIN
    DELETE FROM dhcp6_options WHERE scope_id = 5 AND pool_id = OLD.id;
    RETURN OLD;
END;
\$dhcp6_pool_BDEL\$
LANGUAGE plpgsql;

CREATE TRIGGER dhcp6_pool_BDEL
    BEFORE DELETE ON dhcp6_pool
        FOR EACH ROW EXECUTE PROCEDURE func_dhcp6_pool_BDEL();

-- Trigger function for dhcp4_global_parameter_AINS called AFTER INSERT on dhcp4_global_parameter
CREATE OR REPLACE FUNCTION func_dhcp4_global_parameter_AINS() RETURNS TRIGGER AS \$dhcp4_global_parameter_AINS\$
BEGIN
    PERFORM createAuditEntryDHCP4('dhcp4_global_parameter', NEW.id, 'create');
    RETURN NULL;
END;
\$dhcp4_global_parameter_AINS\$
LANGUAGE plpgsql;

CREATE TRIGGER dhcp4_global_parameter_AINS
    AFTER INSERT ON dhcp4_global_parameter
        FOR EACH ROW EXECUTE PROCEDURE func_dhcp4_global_parameter_AINS();

-- Trigger function for dhcp4_global_parameter_AUPD called AFTER UPDATE on dhcp4_global_parameter
CREATE OR REPLACE FUNCTION func_dhcp4_global_parameter_AUPD() RETURNS TRIGGER AS \$dhcp4_global_parameter_AUPD\$
BEGIN
    PERFORM createAuditEntryDHCP4('dhcp4_global_parameter', NEW.id, 'update');
    RETURN NULL;
END;
\$dhcp4_global_parameter_AUPD\$
LANGUAGE plpgsql;

CREATE TRIGGER dhcp4_global_parameter_AUPD
    AFTER UPDATE ON dhcp4_global_parameter
        FOR EACH ROW EXECUTE PROCEDURE func_dhcp4_global_parameter_AUPD();

-- Trigger function for dhcp4_global_parameter_ADEL called AFTER DELETE on dhcp4_global_parameter
CREATE OR REPLACE FUNCTION func_dhcp4_global_parameter_ADEL() RETURNS TRIGGER AS \$dhcp4_global_parameter_ADEL\$
BEGIN
    PERFORM createAuditEntryDHCP4('dhcp4_global_parameter', OLD.id, 'delete');
    RETURN NULL;
END;
\$dhcp4_global_parameter_ADEL\$
LANGUAGE plpgsql;

CREATE TRIGGER dhcp4_global_parameter_ADEL
    AFTER DELETE ON dhcp4_global_parameter
        FOR EACH ROW EXECUTE PROCEDURE func_dhcp4_global_parameter_ADEL();

-- Trigger function for dhcp4_subnet_AINS called AFTER INSERT on dhcp4_subnet
CREATE OR REPLACE FUNCTION func_dhcp4_subnet_AINS() RETURNS TRIGGER AS \$dhcp4_subnet_AINS\$
BEGIN
    PERFORM createAuditEntryDHCP4('dhcp4_subnet', NEW.subnet_id, 'create');
    RETURN NULL;
END;
\$dhcp4_subnet_AINS\$
LANGUAGE plpgsql;

CREATE TRIGGER dhcp4_subnet_AINS
    AFTER INSERT ON dhcp4_subnet
        FOR EACH ROW EXECUTE PROCEDURE func_dhcp4_subnet_AINS();

-- Trigger function for dhcp4_subnet_AUPD called AFTER UPDATE on dhcp4_subnet
CREATE OR REPLACE FUNCTION func_dhcp4_subnet_AUPD() RETURNS TRIGGER AS \$dhcp4_subnet_AUPD\$
BEGIN
    PERFORM createAuditEntryDHCP4('dhcp4_subnet', NEW.subnet_id, 'update');
    RETURN NULL;
END;
\$dhcp4_subnet_AUPD\$
LANGUAGE plpgsql;

CREATE TRIGGER dhcp4_subnet_AUPD
    AFTER UPDATE ON dhcp4_subnet
        FOR EACH ROW EXECUTE PROCEDURE func_dhcp4_subnet_AUPD();

-- Trigger function for dhcp4_shared_network_AINS called AFTER INSERT on dhcp4_shared_network
CREATE OR REPLACE FUNCTION func_dhcp4_shared_network_AINS() RETURNS TRIGGER AS \$dhcp4_shared_network_AINS\$
BEGIN
    PERFORM createAuditEntryDHCP4('dhcp4_shared_network', NEW.id, 'create');
    RETURN NULL;
END;
\$dhcp4_shared_network_AINS\$
LANGUAGE plpgsql;

CREATE TRIGGER dhcp4_shared_network_AINS
    AFTER INSERT ON dhcp4_shared_network
        FOR EACH ROW EXECUTE PROCEDURE func_dhcp4_shared_network_AINS();

-- Trigger function for dhcp4_shared_network_AUPD called AFTER UPDATE on dhcp4_shared_network
CREATE OR REPLACE FUNCTION func_dhcp4_shared_network_AUPD() RETURNS TRIGGER AS \$dhcp4_shared_network_AUPD\$
BEGIN
    PERFORM createAuditEntryDHCP4('dhcp4_shared_network', NEW.id, 'update');
    RETURN NULL;
END;
\$dhcp4_shared_network_AUPD\$
LANGUAGE plpgsql;

CREATE TRIGGER dhcp4_shared_network_AUPD
    AFTER UPDATE ON dhcp4_shared_network
        FOR EACH ROW EXECUTE PROCEDURE func_dhcp4_shared_network_AUPD();

-- Trigger function for dhcp4_shared_network_ADEL called AFTER DELETE on dhcp4_shared_network
CREATE OR REPLACE FUNCTION func_dhcp4_shared_network_ADEL() RETURNS TRIGGER AS \$dhcp4_shared_network_ADEL\$
BEGIN
    PERFORM createAuditEntryDHCP4('dhcp4_shared_network', OLD.id, 'delete');
    RETURN NULL;
END;
\$dhcp4_shared_network_ADEL\$
LANGUAGE plpgsql;

CREATE TRIGGER dhcp4_shared_network_ADEL
    AFTER DELETE ON dhcp4_shared_network
        FOR EACH ROW EXECUTE PROCEDURE func_dhcp4_shared_network_ADEL();

-- Trigger function for dhcp4_option_def_AINS called AFTER INSERT on dhcp4_option_def
CREATE OR REPLACE FUNCTION func_dhcp4_option_def_AINS() RETURNS TRIGGER AS \$dhcp4_option_def_AINS\$
BEGIN
    PERFORM createAuditEntryDHCP4('dhcp4_option_def', NEW.id, 'create');
    RETURN NULL;
END;
\$dhcp4_option_def_AINS\$
LANGUAGE plpgsql;

CREATE TRIGGER dhcp4_option_def_AINS
    AFTER INSERT ON dhcp4_option_def
        FOR EACH ROW EXECUTE PROCEDURE func_dhcp4_option_def_AINS();

-- Trigger function for dhcp4_option_def_AUPD called AFTER UPDATE on dhcp4_option_def
CREATE OR REPLACE FUNCTION func_dhcp4_option_def_AUPD() RETURNS TRIGGER AS \$dhcp4_option_def_AUPD\$
BEGIN
    PERFORM createAuditEntryDHCP4('dhcp4_option_def', NEW.id, 'update');
    RETURN NULL;
END;
\$dhcp4_option_def_AUPD\$
LANGUAGE plpgsql;

CREATE TRIGGER dhcp4_option_def_AUPD
    AFTER UPDATE ON dhcp4_option_def
        FOR EACH ROW EXECUTE PROCEDURE func_dhcp4_option_def_AUPD();

-- Trigger function for dhcp4_option_def_ADEL called AFTER DELETE on dhcp4_option_def
CREATE OR REPLACE FUNCTION func_dhcp4_option_def_ADEL() RETURNS TRIGGER AS \$dhcp4_option_def_ADEL\$
BEGIN
    PERFORM createAuditEntryDHCP4('dhcp4_option_def', OLD.id, 'delete');
    RETURN NULL;
END;
\$dhcp4_option_def_ADEL\$
LANGUAGE plpgsql;

CREATE TRIGGER dhcp4_option_def_ADEL
    AFTER DELETE ON dhcp4_option_def
        FOR EACH ROW EXECUTE PROCEDURE func_dhcp4_option_def_ADEL();

-- -----------------------------------------------------
--
-- Stored procedure which updates modification timestamp of
-- a parent object when an option is modified.
--
-- The following parameters are passed to the procedure:
-- - modification_type: 'create', 'update' or 'delete'
-- - scope_id: identifier of the option scope, e.g.
--   global, subnet specific etc.
-- - option_id: identifier of the option.
-- - p_subnet_id: identifier of the subnet if the option
--   belongs to the subnet.
-- - host_id: identifier of the host if the option
-- - belongs to the host.
-- - network_name: shared network name if the option
--   belongs to the shared network.
-- - pool_id: identifier of the pool if the option
--   belongs to the pool.
-- - p_modification_ts: modification timestamp of the
--   option.
--   Some arguments are prefixed with "p_" to avoid ambiguity
--   with column names in SQL statements. PostgreSQL does not
--   allow table aliases to be used with column names in update
--   set expressions.
-- -----------------------------------------------------
CREATE OR REPLACE FUNCTION createOptionAuditDHCP4(modification_type VARCHAR,
                                                  scope_id SMALLINT,
                                                  option_id INT,
                                                  p_subnet_id BIGINT,
                                                  host_id INT,
                                                  network_name VARCHAR,
                                                  pool_id BIGINT,
                                                  p_modification_ts TIMESTAMP WITH TIME ZONE)
RETURNS VOID
LANGUAGE plpgsql
AS \$\$
DECLARE
    -- These variables will hold shared network id and subnet id that
    -- we will select.
    snid VARCHAR(128);
    sid BIGINT;
    cascade_transaction BOOLEAN := true;
    ct TEXT;
BEGIN
    -- Cascade transaction flag is set to true to prevent creation of
    -- the audit entries for the options when the options are
    -- created as part of the parent object creation or update.
    -- For example: when the option is added as part of the subnet
    -- addition, the cascade transaction flag is equal to true. If
    -- the option is added into the existing subnet the cascade
    -- transaction is equal to false. Note that depending on the option
    -- scope the audit entry will contain the object_type value
    -- of the parent object to cause the server to replace the
    -- entire subnet. The only case when the object_type will be
    -- set to 'dhcp4_options' is when a global option is added.
    -- Global options do not have the owner.

    cascade_transaction := get_session_boolean('kea.cascade_transaction');
    IF cascade_transaction = false THEN
        -- todo: host manager hasn't been updated to use audit
        -- mechanisms so ignore host specific options for now.
        IF scope_id = 0 THEN
            -- If a global option is added or modified, create audit
            -- entry for the 'dhcp4_options' table.
            PERFORM createAuditEntryDHCP4('dhcp4_options', option_id, modification_type);
        ELSEIF scope_id = 1 THEN
            -- If subnet specific option is added or modified, update
            -- the modification timestamp of this subnet to allow the
            -- servers to refresh the subnet information. This will
            -- also result in creating an audit entry for this subnet.
            UPDATE dhcp4_subnet SET modification_ts = p_modification_ts
                WHERE subnet_id = p_subnet_id;
        ELSEIF scope_id = 4 THEN
            -- If shared network specific option is added or modified,
            -- update the modification timestamp of this shared network
            -- to allow the servers to refresh the shared network
            -- information. This will also result in creating an
            -- audit entry for this shared network.
           SELECT id INTO snid FROM dhcp4_shared_network WHERE name = network_name LIMIT 1;
           UPDATE dhcp4_shared_network SET modification_ts = p_modification_ts
                WHERE id = snid;
        ELSEIF scope_id = 5 THEN
            -- If pool specific option is added or modified, update
            -- the modification timestamp of the owning subnet.
            SELECT dhcp4_pool.subnet_id INTO sid FROM dhcp4_pool WHERE id = pool_id;
            UPDATE dhcp4_subnet SET modification_ts = p_modification_ts
                WHERE subnet_id = sid;
        END IF;
    END IF;
    RETURN;
END;\$\$;

-- Trigger function for dhcp4_options_AINS called AFTER INSERT on dhcp4_options
CREATE OR REPLACE FUNCTION func_dhcp4_options_AINS() RETURNS TRIGGER AS \$dhcp4_options_AINS\$
BEGIN
    PERFORM createOptionAuditDHCP4('create', NEW.scope_id, NEW.option_id, NEW.dhcp4_subnet_id,
                                   NEW.host_id, NEW.shared_network_name, NEW.pool_id,
                                   NEW.modification_ts);
    RETURN NULL;
END;
\$dhcp4_options_AINS\$
LANGUAGE plpgsql;

CREATE TRIGGER dhcp4_options_AINS
    AFTER INSERT ON dhcp4_options
        FOR EACH ROW EXECUTE PROCEDURE func_dhcp4_options_AINS();

-- Trigger function for dhcp4_options_AUPD called AFTER UPDATE on dhcp4_options
CREATE OR REPLACE FUNCTION func_dhcp4_options_AUPD() RETURNS TRIGGER AS \$dhcp4_options_AUPD\$
BEGIN
    PERFORM createOptionAuditDHCP4('update', NEW.scope_id, NEW.option_id, NEW.dhcp4_subnet_id,
                                   NEW.host_id, NEW.shared_network_name, NEW.pool_id,
                                   NEW.modification_ts);
    RETURN NULL;
END;
\$dhcp4_options_AUPD\$
LANGUAGE plpgsql;

CREATE TRIGGER dhcp4_options_AUPD
    AFTER UPDATE ON dhcp4_options
        FOR EACH ROW EXECUTE PROCEDURE func_dhcp4_options_AUPD();

-- Trigger function for dhcp4_options_ADEL called AFTER DELETE on dhcp4_options
CREATE OR REPLACE FUNCTION func_dhcp4_options_ADEL() RETURNS TRIGGER AS \$dhcp4_options_ADEL\$
BEGIN
    PERFORM createOptionAuditDHCP4('delete', OLD.scope_id, OLD.option_id, OLD.dhcp4_subnet_id,
                                   OLD.host_id, OLD.shared_network_name, OLD.pool_id,
                                   NOW());
    RETURN NULL;
END;
\$dhcp4_options_ADEL\$
LANGUAGE plpgsql;

CREATE TRIGGER dhcp4_options_ADEL
    AFTER DELETE ON dhcp4_options
        FOR EACH ROW EXECUTE PROCEDURE func_dhcp4_options_ADEL();

-- Trigger function for dhcp6_global_parameter_AINS called AFTER INSERT on dhcp6_global_parameter
CREATE OR REPLACE FUNCTION func_dhcp6_global_parameter_AINS() RETURNS TRIGGER AS \$dhcp6_global_parameter_AINS\$
BEGIN
    PERFORM createAuditEntryDHCP6('dhcp6_global_parameter', NEW.id, 'create');
    RETURN NULL;
END;
\$dhcp6_global_parameter_AINS\$
LANGUAGE plpgsql;

CREATE TRIGGER dhcp6_global_parameter_AINS
    AFTER INSERT ON dhcp6_global_parameter
        FOR EACH ROW EXECUTE PROCEDURE func_dhcp6_global_parameter_AINS();

-- Trigger function for dhcp6_global_parameter_AUPD called AFTER UPDATE on dhcp6_global_parameter
CREATE OR REPLACE FUNCTION func_dhcp6_global_parameter_AUPD() RETURNS TRIGGER AS \$dhcp6_global_parameter_AUPD\$
BEGIN
    PERFORM createAuditEntryDHCP6('dhcp6_global_parameter', NEW.id, 'update');
    RETURN NULL;
END;
\$dhcp6_global_parameter_AUPD\$
LANGUAGE plpgsql;

CREATE TRIGGER dhcp6_global_parameter_AUPD
    AFTER UPDATE ON dhcp6_global_parameter
        FOR EACH ROW EXECUTE PROCEDURE func_dhcp6_global_parameter_AUPD();

-- Trigger function for dhcp6_global_parameter_ADEL called AFTER DELETE on dhcp6_global_parameter
CREATE OR REPLACE FUNCTION func_dhcp6_global_parameter_ADEL() RETURNS TRIGGER AS \$dhcp6_global_parameter_ADEL\$
BEGIN
    PERFORM createAuditEntryDHCP6('dhcp6_global_parameter', OLD.id, 'delete');
    RETURN NULL;
END;
\$dhcp6_global_parameter_ADEL\$
LANGUAGE plpgsql;

CREATE TRIGGER dhcp6_global_parameter_ADEL
    AFTER DELETE ON dhcp6_global_parameter
        FOR EACH ROW EXECUTE PROCEDURE func_dhcp6_global_parameter_ADEL();

-- Trigger function for dhcp6_subnet_AINS called AFTER INSERT on dhcp6_subnet
CREATE OR REPLACE FUNCTION func_dhcp6_subnet_AINS() RETURNS TRIGGER AS \$dhcp6_subnet_AINS\$
BEGIN
    PERFORM createAuditEntryDHCP6('dhcp6_subnet', NEW.subnet_id, 'create');
    RETURN NULL;
END;
\$dhcp6_subnet_AINS\$
LANGUAGE plpgsql;

CREATE TRIGGER dhcp6_subnet_AINS
    AFTER INSERT ON dhcp6_subnet
        FOR EACH ROW EXECUTE PROCEDURE func_dhcp6_subnet_AINS();

-- Trigger function for dhcp6_subnet_AUPD called AFTER UPDATE on dhcp6_subnet
CREATE OR REPLACE FUNCTION func_dhcp6_subnet_AUPD() RETURNS TRIGGER AS \$dhcp6_subnet_AUPD\$
BEGIN
    PERFORM createAuditEntryDHCP6('dhcp6_subnet', NEW.subnet_id, 'update');
    RETURN NULL;
END;
\$dhcp6_subnet_AUPD\$
LANGUAGE plpgsql;

CREATE TRIGGER dhcp6_subnet_AUPD
    AFTER UPDATE ON dhcp6_subnet
        FOR EACH ROW EXECUTE PROCEDURE func_dhcp6_subnet_AUPD();

-- Trigger function for dhcp6_shared_network_AINS called AFTER INSERT on dhcp6_shared_network
CREATE OR REPLACE FUNCTION func_dhcp6_shared_network_AINS() RETURNS TRIGGER AS \$dhcp6_shared_network_AINS\$
BEGIN
    PERFORM createAuditEntryDHCP6('dhcp6_shared_network', NEW.id, 'create');
    RETURN NULL;
END;
\$dhcp6_shared_network_AINS\$
LANGUAGE plpgsql;

CREATE TRIGGER dhcp6_shared_network_AINS
    AFTER INSERT ON dhcp6_shared_network
        FOR EACH ROW EXECUTE PROCEDURE func_dhcp6_shared_network_AINS();

-- Trigger function for dhcp6_shared_network_AUPD called AFTER UPDATE on dhcp6_shared_network
CREATE OR REPLACE FUNCTION func_dhcp6_shared_network_AUPD() RETURNS TRIGGER AS \$dhcp6_shared_network_AUPD\$
BEGIN
    PERFORM createAuditEntryDHCP6('dhcp6_shared_network', NEW.id, 'update');
    RETURN NULL;
END;
\$dhcp6_shared_network_AUPD\$
LANGUAGE plpgsql;

CREATE TRIGGER dhcp6_shared_network_AUPD
    AFTER UPDATE ON dhcp6_shared_network
        FOR EACH ROW EXECUTE PROCEDURE func_dhcp6_shared_network_AUPD();

-- Trigger function for dhcp6_shared_network_ADEL called AFTER DELETE on dhcp6_shared_network
CREATE OR REPLACE FUNCTION func_dhcp6_shared_network_ADEL() RETURNS TRIGGER AS \$dhcp6_shared_network_ADEL\$
BEGIN
    PERFORM createAuditEntryDHCP6('dhcp6_shared_network', OLD.id, 'delete');
    RETURN NULL;
END;
\$dhcp6_shared_network_ADEL\$
LANGUAGE plpgsql;

CREATE TRIGGER dhcp6_shared_network_ADEL
    AFTER DELETE ON dhcp6_shared_network
        FOR EACH ROW EXECUTE PROCEDURE func_dhcp6_shared_network_ADEL();

-- Trigger function for dhcp6_option_def_AINS called AFTER INSERT on dhcp6_option_def
CREATE OR REPLACE FUNCTION func_dhcp6_option_def_AINS() RETURNS TRIGGER AS \$dhcp6_option_def_AINS\$
BEGIN
    PERFORM createAuditEntryDHCP6('dhcp6_option_def', NEW.id, 'create');
    RETURN NULL;
END;
\$dhcp6_option_def_AINS\$
LANGUAGE plpgsql;

CREATE TRIGGER dhcp6_option_def_AINS
    AFTER INSERT ON dhcp6_option_def
        FOR EACH ROW EXECUTE PROCEDURE func_dhcp6_option_def_AINS();

-- Trigger function for dhcp6_option_def_AUPD called AFTER UPDATE on dhcp6_option_def
CREATE OR REPLACE FUNCTION func_dhcp6_option_def_AUPD() RETURNS TRIGGER AS \$dhcp6_option_def_AUPD\$
BEGIN
    PERFORM createAuditEntryDHCP6('dhcp6_option_def', NEW.id, 'update');
    RETURN NULL;
END;
\$dhcp6_option_def_AUPD\$
LANGUAGE plpgsql;

CREATE TRIGGER dhcp6_option_def_AUPD
    AFTER UPDATE ON dhcp6_option_def
        FOR EACH ROW EXECUTE PROCEDURE func_dhcp6_option_def_AUPD();

-- Trigger function for dhcp6_option_def_ADEL called AFTER DELETE on dhcp6_option_def
CREATE OR REPLACE FUNCTION func_dhcp6_option_def_ADEL() RETURNS TRIGGER AS \$dhcp6_option_def_ADEL\$
BEGIN
    PERFORM createAuditEntryDHCP6('dhcp6_option_def', OLD.id, 'delete');
    RETURN NULL;
END;
\$dhcp6_option_def_ADEL\$
LANGUAGE plpgsql;

CREATE TRIGGER dhcp6_option_def_ADEL
    AFTER DELETE ON dhcp6_option_def
        FOR EACH ROW EXECUTE PROCEDURE func_dhcp6_option_def_ADEL();

-- - pool_id: identifier of the pool if the option
--   belongs to the pool.
-- - pd_pool_id: identifier of the pool if the option
--   belongs to the pd pool.
-- - modification_ts: modification timestamp of the
--   option.
-- -----------------------------------------------------
CREATE OR REPLACE FUNCTION createOptionAuditDHCP6(modification_type VARCHAR(32),
                                                  scope_id SMALLINT,
                                                  option_id INT,
                                                  subnet_id BIGINT,
                                                  host_id INT,
                                                  network_name VARCHAR(128),
                                                  pool_id BIGINT,
                                                  pd_pool_id BIGINT,
                                                  modification_ts TIMESTAMP WITH TIME ZONE)
RETURNS VOID
LANGUAGE plpgsql
AS \$\$
DECLARE
    -- These variables will hold shared network id and subnet id that
    -- we will select.
    snid VARCHAR(128);
    sid BIGINT;
    cascade_transaction BOOLEAN := false;

BEGIN
    -- Cascade transaction flag is set to true to prevent creation of
    -- the audit entries for the options when the options are
    -- created as part of the parent object creation or update.
    -- For example: when the option is added as part of the subnet
    -- addition, the cascade transaction flag is equal to true. If
    -- the option is added into the existing subnet the cascade
    -- transaction is equal to false. Note that depending on the option
    -- scope the audit entry will contain the object_type value
    -- of the parent object to cause the server to replace the
    -- entire subnet. The only case when the object_type will be
    -- set to 'dhcp6_options' is when a global option is added.
    -- Global options do not have the owner.
    cascade_transaction := get_session_boolean('kea.cascade_transaction');
    IF cascade_transaction = false THEN
        -- todo: host manager hasn't been updated to use audit
        -- mechanisms so ignore host specific options for now.
        IF scope_id = 0 THEN
            -- If a global option is added or modified, create audit
            -- entry for the 'dhcp6_options' table.
            PERFORM createAuditEntryDHCP6('dhcp6_options', option_id, modification_type);
        ELSEIF scope_id = 1 THEN
            -- If subnet specific option is added or modified, create
            -- audit entry for the entire subnet, which indicates that
            -- it should be treated as the subnet update.
            PERFORM createAuditEntryDHCP6('dhcp6_subnet', subnet_id, 'update');
        ELSEIF scope_id = 4 THEN
            -- If shared network specific option is added or modified,
            -- create audit entry for the shared network which
            -- indicates that it should be treated as the shared
            -- network update.
           SELECT id INTO snid FROM dhcp6_shared_network
                WHERE name = network_name LIMIT 1;
           PERFORM createAuditEntryDHCP6('dhcp6_shared_network', snid, 'update');
        ELSEIF scope_id = 5 THEN
            -- If pool specific option is added or modified, create
            -- audit entry for the subnet which this pool belongs to.
            SELECT dhcp6_pool.subnet_id INTO sid FROM dhcp6_pool WHERE id = pool_id;
            PERFORM createAuditEntryDHCP6('dhcp6_subnet', sid, 'update');
        ELSEIF scope_id = 6 THEN
            -- If pd pool specific option is added or modified, create
            -- audit entry for the subnet which this pd pool belongs to.
            SELECT dhcp6_pd_pool.subnet_id INTO sid FROM dhcp6_pd_pool
                WHERE id = pd_pool_id;
            PERFORM createAuditEntryDHCP6('dhcp6_subnet', sid, 'update');
        END IF;
    END IF;
    RETURN;
END;\$\$;

-- Trigger function for dhcp6_options_AINS called AFTER INSERT on dhcp6_options
CREATE OR REPLACE FUNCTION func_dhcp6_options_AINS() RETURNS TRIGGER AS \$dhcp6_options_AINS\$
BEGIN
    PERFORM createOptionAuditDHCP6('create', NEW.scope_id, NEW.option_id, NEW.dhcp6_subnet_id,
                                   NEW.host_id, NEW.shared_network_name, NEW.pool_id,
                                   NEW.pd_pool_id, NEW.modification_ts);
    RETURN NULL;
END;
\$dhcp6_options_AINS\$
LANGUAGE plpgsql;

CREATE TRIGGER dhcp6_options_AINS
    AFTER INSERT ON dhcp6_options
        FOR EACH ROW EXECUTE PROCEDURE func_dhcp6_options_AINS();

-- Trigger function for dhcp6_options_AUPD called AFTER UPDATE on dhcp6_options
CREATE OR REPLACE FUNCTION func_dhcp6_options_AUPD() RETURNS TRIGGER AS \$dhcp6_options_AUPD\$
BEGIN
    PERFORM createOptionAuditDHCP6('update', NEW.scope_id, NEW.option_id, NEW.dhcp6_subnet_id,
                                   NEW.host_id, NEW.shared_network_name, NEW.pool_id,
                                   NEW.pd_pool_id, NEW.modification_ts);
    RETURN NULL;
END;
\$dhcp6_options_AUPD\$
LANGUAGE plpgsql;

CREATE TRIGGER dhcp6_options_AUPD
    AFTER UPDATE ON dhcp6_options
        FOR EACH ROW EXECUTE PROCEDURE func_dhcp6_options_AUPD();

-- Trigger function for dhcp6_options_ADEL called AFTER DELETE on dhcp6_options
CREATE OR REPLACE FUNCTION func_dhcp6_options_ADEL() RETURNS TRIGGER AS \$dhcp6_options_ADEL\$
BEGIN
    PERFORM createOptionAuditDHCP6('delete', OLD.scope_id, OLD.option_id, OLD.dhcp6_subnet_id,
                                   OLD.host_id, OLD.shared_network_name, OLD.pool_id,
                                   OLD.pd_pool_id, NOW());
    RETURN NULL;
END;
\$dhcp6_options_ADEL\$
LANGUAGE plpgsql;

CREATE TRIGGER dhcp6_options_ADEL
    AFTER DELETE ON dhcp6_options
        FOR EACH ROW EXECUTE PROCEDURE func_dhcp6_options_ADEL();

-- Trigger function for dhcp4_server_AINS called AFTER INSERT on dhcp4_server
CREATE OR REPLACE FUNCTION func_dhcp4_server_AINS() RETURNS TRIGGER AS \$dhcp4_server_AINS\$
BEGIN
    PERFORM createAuditEntryDHCP4('dhcp4_server', NEW.id, 'create');
    RETURN NULL;
END;
\$dhcp4_server_AINS\$
LANGUAGE plpgsql;

CREATE TRIGGER dhcp4_server_AINS
    AFTER INSERT ON dhcp4_server
        FOR EACH ROW EXECUTE PROCEDURE func_dhcp4_server_AINS();

-- Trigger function for dhcp4_server_AUPD called AFTER UPDATE on dhcp4_server
CREATE OR REPLACE FUNCTION func_dhcp4_server_AUPD() RETURNS TRIGGER AS \$dhcp4_server_AUPD\$
BEGIN
    PERFORM createAuditEntryDHCP4('dhcp4_server', NEW.id, 'update');
    RETURN NULL;
END;
\$dhcp4_server_AUPD\$
LANGUAGE plpgsql;

CREATE TRIGGER dhcp4_server_AUPD
    AFTER UPDATE ON dhcp4_server
        FOR EACH ROW EXECUTE PROCEDURE func_dhcp4_server_AUPD();

-- Trigger function for dhcp4_server_ADEL called AFTER DELETE on dhcp4_server
CREATE OR REPLACE FUNCTION func_dhcp4_server_ADEL() RETURNS TRIGGER AS \$dhcp4_server_ADEL\$
BEGIN
    PERFORM createAuditEntryDHCP4('dhcp4_server', OLD.id, 'delete');
    RETURN NULL;
END;
\$dhcp4_server_ADEL\$
LANGUAGE plpgsql;

CREATE TRIGGER dhcp4_server_ADEL
    AFTER DELETE ON dhcp4_server
        FOR EACH ROW EXECUTE PROCEDURE func_dhcp4_server_ADEL();

-- Trigger function for dhcp6_server_AINS called AFTER INSERT on dhcp6_server
CREATE OR REPLACE FUNCTION func_dhcp6_server_AINS() RETURNS TRIGGER AS \$dhcp6_server_AINS\$
BEGIN
    PERFORM createAuditEntryDHCP6('dhcp6_server', NEW.id, 'create');
    RETURN NULL;
END;
\$dhcp6_server_AINS\$
LANGUAGE plpgsql;

CREATE TRIGGER dhcp6_server_AINS
    AFTER INSERT ON dhcp6_server
        FOR EACH ROW EXECUTE PROCEDURE func_dhcp6_server_AINS();

-- Trigger function for dhcp6_server_AUPD called AFTER UPDATE on dhcp6_server
CREATE OR REPLACE FUNCTION func_dhcp6_server_AUPD() RETURNS TRIGGER AS \$dhcp6_server_AUPD\$
BEGIN
    PERFORM createAuditEntryDHCP6('dhcp6_server', NEW.id, 'update');
    RETURN NULL;
END;
\$dhcp6_server_AUPD\$
LANGUAGE plpgsql;

CREATE TRIGGER dhcp6_server_AUPD
    AFTER UPDATE ON dhcp6_server
        FOR EACH ROW EXECUTE PROCEDURE func_dhcp6_server_AUPD();

-- Trigger function for dhcp6_server_ADEL called AFTER DELETE on dhcp6_server
CREATE OR REPLACE FUNCTION func_dhcp6_server_ADEL() RETURNS TRIGGER AS \$dhcp6_server_ADEL\$
BEGIN
    PERFORM createAuditEntryDHCP6('dhcp6_server', OLD.id, 'delete');
    RETURN NULL;
END;
\$dhcp6_server_ADEL\$
LANGUAGE plpgsql;

CREATE TRIGGER dhcp6_server_ADEL
    AFTER DELETE ON dhcp6_server
        FOR EACH ROW EXECUTE PROCEDURE func_dhcp6_server_ADEL();

-- Trigger function for dhcp4_shared_network_BDEL called BEFORE DELETE on dhcp4_shared_network
CREATE OR REPLACE FUNCTION func_dhcp4_shared_network_BDEL() RETURNS TRIGGER AS \$dhcp4_shared_network_BDEL\$
BEGIN
    PERFORM createAuditEntryDHCP4('dhcp4_shared_network', OLD.id, 'delete');
    DELETE FROM dhcp4_options WHERE shared_network_name = OLD.name;
    RETURN OLD;
END;
\$dhcp4_shared_network_BDEL\$
LANGUAGE plpgsql;

CREATE TRIGGER dhcp4_shared_network_BDEL
    BEFORE DELETE ON dhcp4_shared_network
        FOR EACH ROW EXECUTE PROCEDURE func_dhcp4_shared_network_BDEL();

-- Trigger function for dhcp4_subnet_BDEL called BEFORE DELETE on dhcp4_subnet
CREATE OR REPLACE FUNCTION func_dhcp4_subnet_BDEL() RETURNS TRIGGER AS \$dhcp4_subnet_BDEL\$
BEGIN
    PERFORM createAuditEntryDHCP4('dhcp4_subnet', OLD.subnet_id, 'delete');
    DELETE FROM dhcp4_pool WHERE subnet_id = OLD.subnet_id;
    DELETE FROM dhcp4_options WHERE dhcp4_subnet_id = OLD.subnet_id;
    RETURN OLD;
END;
\$dhcp4_subnet_BDEL\$
LANGUAGE plpgsql;

CREATE TRIGGER dhcp4_subnet_BDEL
    BEFORE DELETE ON dhcp4_subnet
        FOR EACH ROW EXECUTE PROCEDURE func_dhcp4_subnet_BDEL();

-- Trigger function for dhcp6_shared_network_BDEL called BEFORE DELETE on dhcp6_shared_network
CREATE OR REPLACE FUNCTION func_dhcp6_shared_network_BDEL() RETURNS TRIGGER AS \$dhcp6_shared_network_BDEL\$
BEGIN
    PERFORM createAuditEntryDHCP6('dhcp6_shared_network', OLD.id, 'delete');
    DELETE FROM dhcp6_options WHERE shared_network_name = OLD.name;
    RETURN OLD;
END;
\$dhcp6_shared_network_BDEL\$
LANGUAGE plpgsql;

CREATE TRIGGER dhcp6_shared_network_BDEL
    BEFORE DELETE ON dhcp6_shared_network
        FOR EACH ROW EXECUTE PROCEDURE func_dhcp6_shared_network_BDEL();

-- Trigger function for dhcp6_subnet_BDEL called BEFORE DELETE on dhcp6_subnet
CREATE OR REPLACE FUNCTION func_dhcp6_subnet_BDEL() RETURNS TRIGGER AS \$dhcp6_subnet_BDEL\$
BEGIN
    PERFORM createAuditEntryDHCP6('dhcp6_subnet', OLD.subnet_id, 'delete');
    DELETE FROM dhcp6_pool WHERE subnet_id = OLD.subnet_id;
    DELETE FROM dhcp6_pd_pool WHERE subnet_id = OLD.subnet_id;
    DELETE FROM dhcp6_options WHERE dhcp6_subnet_id = OLD.subnet_id;
    RETURN OLD;
END;
\$dhcp6_subnet_BDEL\$
LANGUAGE plpgsql;

CREATE TRIGGER dhcp6_subnet_BDEL
    BEFORE DELETE ON dhcp6_subnet
        FOR EACH ROW EXECUTE PROCEDURE func_dhcp6_subnet_BDEL();

-- Trigger function for dhcp6_pd_pool_BDEL called BEFORE DELETE on dhcp6_pd_pool
CREATE OR REPLACE FUNCTION func_dhcp6_pd_pool_BDEL() RETURNS TRIGGER AS \$dhcp6_pd_pool_BDEL\$
BEGIN
    DELETE FROM dhcp6_options WHERE scope_id = 6 AND pd_pool_id = OLD.id;
    RETURN OLD;
END;
\$dhcp6_pd_pool_BDEL\$
LANGUAGE plpgsql;

-- Update the schema version number.
UPDATE schema_version
    SET version = '7', minor = '0';

-- This line concludes the schema upgrade to version 7.0.

-- Commit the script transaction.
COMMIT;

EOF