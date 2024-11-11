require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_SYSLIMITS_H_)) {
    eval 'sub _SYS_SYSLIMITS_H_ () {1;}' unless defined(&_SYS_SYSLIMITS_H_);
    if(!defined(&_STANDALONE)  && !defined(&_KERNEL)  && !defined(&_LIMITS_H_)  && !defined(&_SYS_PARAM_H_)) {
	warn("\"No\ user\-serviceable\ parts\ inside\.\"");
    }
    unless(defined(&__ILP32__)) {
	eval 'sub ARG_MAX () {(2* 256* 1024);}' unless defined(&ARG_MAX);
    } else {
	eval 'sub ARG_MAX () {(256* 1024);}' unless defined(&ARG_MAX);
    }
    unless(defined(&CHILD_MAX)) {
	eval 'sub CHILD_MAX () {40;}' unless defined(&CHILD_MAX);
    }
    eval 'sub MAX_CANON () {255;}' unless defined(&MAX_CANON);
    eval 'sub MAX_INPUT () {255;}' unless defined(&MAX_INPUT);
    eval 'sub NAME_MAX () {255;}' unless defined(&NAME_MAX);
    unless(defined(&NGROUPS_MAX)) {
	eval 'sub NGROUPS_MAX () {1023;}' unless defined(&NGROUPS_MAX);
    }
    unless(defined(&OPEN_MAX)) {
	eval 'sub OPEN_MAX () {64;}' unless defined(&OPEN_MAX);
    }
    eval 'sub PATH_MAX () {1024;}' unless defined(&PATH_MAX);
    eval 'sub PIPE_BUF () {512;}' unless defined(&PIPE_BUF);
    eval 'sub IOV_MAX () {1024;}' unless defined(&IOV_MAX);
}
1;
