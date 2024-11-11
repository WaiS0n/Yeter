require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS__EVENTHANDLER_H_)) {
    eval 'sub _SYS__EVENTHANDLER_H_ () {1;}' unless defined(&_SYS__EVENTHANDLER_H_);
    require 'sys/queue.ph';
    eval 'sub EHE_DEAD_PRIORITY () {(-1);}' unless defined(&EHE_DEAD_PRIORITY);
    eval 'sub EVENTHANDLER_LIST_DECLARE {
        my($name) = @_;
	    eval q( &extern \'struct eventhandler_list\' * &_eventhandler_list_  $name);
    }' unless defined(&EVENTHANDLER_LIST_DECLARE);
    eval 'sub EVENTHANDLER_DECLARE {
        my($name, $type) = @_;
	    eval q(\'struct eventhandler_entry_\'  $name { \'struct eventhandler_entry\'  &ee; $type  &eh_func; }; \'struct __hack\');
    }' unless defined(&EVENTHANDLER_DECLARE);
}
1;
