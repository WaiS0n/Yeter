require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_UUID_H_)) {
    eval 'sub _UUID_H_ () {1;}' unless defined(&_UUID_H_);
    require 'sys/types.ph';
    require 'sys/uuid.ph';
    eval 'sub uuid_s_ok () {0;}' unless defined(&uuid_s_ok);
    eval 'sub uuid_s_bad_version () {1;}' unless defined(&uuid_s_bad_version);
    eval 'sub uuid_s_invalid_string_uuid () {2;}' unless defined(&uuid_s_invalid_string_uuid);
    eval 'sub uuid_s_no_memory () {3;}' unless defined(&uuid_s_no_memory);
}
1;
