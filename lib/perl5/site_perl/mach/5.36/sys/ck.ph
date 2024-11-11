require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_CK_H_)) {
    eval 'sub _SYS_CK_H_ () {1;}' unless defined(&_SYS_CK_H_);
    if(defined(&_KERNEL)) {
	require 'ck_queue.ph';
	require 'ck_epoch.ph';
    } else {
	require 'sys/queue.ph';
	eval 'sub CK_STAILQ_HEAD () { &STAILQ_HEAD;}' unless defined(&CK_STAILQ_HEAD);
	eval 'sub CK_STAILQ_ENTRY () { &STAILQ_ENTRY;}' unless defined(&CK_STAILQ_ENTRY);
	eval 'sub CK_LIST_HEAD () { &LIST_HEAD;}' unless defined(&CK_LIST_HEAD);
	eval 'sub CK_LIST_ENTRY () { &LIST_ENTRY;}' unless defined(&CK_LIST_ENTRY);
	eval 'sub CK_SLIST_HEAD () { &SLIST_HEAD;}' unless defined(&CK_SLIST_HEAD);
	eval 'sub CK_SLIST_ENTRY () { &SLIST_ENTRY;}' unless defined(&CK_SLIST_ENTRY);
    }
}
1;
