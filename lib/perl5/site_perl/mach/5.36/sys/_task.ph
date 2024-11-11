require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS__TASK_H_)) {
    eval 'sub _SYS__TASK_H_ () {1;}' unless defined(&_SYS__TASK_H_);
    require 'sys/queue.ph';
    eval 'sub TASK_ENQUEUED () {0x1;}' unless defined(&TASK_ENQUEUED);
    eval 'sub TASK_NOENQUEUE () {0x2;}' unless defined(&TASK_NOENQUEUE);
    eval 'sub TASK_NETWORK () {0x4;}' unless defined(&TASK_NETWORK);
    eval 'sub TASK_IS_NET {
        my($ta) = @_;
	    eval q((($ta)-> &ta_flags &  &TASK_NETWORK));
    }' unless defined(&TASK_IS_NET);
    if(defined(&_KERNEL)) {
    }
}
1;
