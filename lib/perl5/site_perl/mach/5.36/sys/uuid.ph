require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_UUID_H_)) {
    eval 'sub _SYS_UUID_H_ () {1;}' unless defined(&_SYS_UUID_H_);
    require 'sys/types.ph';
    eval 'sub _UUID_NODE_LEN () {6;}' unless defined(&_UUID_NODE_LEN);
    if(defined(&_KERNEL)) {
	eval 'sub UUID_NODE_LEN () { &_UUID_NODE_LEN;}' unless defined(&UUID_NODE_LEN);
	eval 'sub VUUIDF_EMPTYOK () {0x1;}' unless defined(&VUUIDF_EMPTYOK);
	eval 'sub VUUIDF_CHECKSEMANTICS () {0x2;}' unless defined(&VUUIDF_CHECKSEMANTICS);
    } else {
    }
}
1;
