require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_GPT_H_)) {
    eval 'sub _SYS_GPT_H_ () {1;}' unless defined(&_SYS_GPT_H_);
    require 'sys/uuid.ph';
    eval 'sub GPT_UUID_TYPE () {\'struct uuid\';}' unless defined(&GPT_UUID_TYPE);
    require 'sys/disk/gpt.ph';
}
1;
