require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_UTMPX_H_)) {
    eval 'sub _UTMPX_H_ () {1;}' unless defined(&_UTMPX_H_);
    require 'sys/cdefs.ph';
    require 'sys/_timeval.ph';
    require 'sys/_types.ph';
    unless(defined(&_PID_T_DECLARED)) {
	eval 'sub _PID_T_DECLARED () {1;}' unless defined(&_PID_T_DECLARED);
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
    } else {
    }
    eval 'sub EMPTY () {0;}' unless defined(&EMPTY);
    eval 'sub BOOT_TIME () {1;}' unless defined(&BOOT_TIME);
    eval 'sub OLD_TIME () {2;}' unless defined(&OLD_TIME);
    eval 'sub NEW_TIME () {3;}' unless defined(&NEW_TIME);
    eval 'sub USER_PROCESS () {4;}' unless defined(&USER_PROCESS);
    eval 'sub INIT_PROCESS () {5;}' unless defined(&INIT_PROCESS);
    eval 'sub LOGIN_PROCESS () {6;}' unless defined(&LOGIN_PROCESS);
    eval 'sub DEAD_PROCESS () {7;}' unless defined(&DEAD_PROCESS);
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub SHUTDOWN_TIME () {8;}' unless defined(&SHUTDOWN_TIME);
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub UTXDB_ACTIVE () {0;}' unless defined(&UTXDB_ACTIVE);
	eval 'sub UTXDB_LASTLOGIN () {1;}' unless defined(&UTXDB_LASTLOGIN);
	eval 'sub UTXDB_LOG () {2;}' unless defined(&UTXDB_LOG);
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
    }
}
1;
