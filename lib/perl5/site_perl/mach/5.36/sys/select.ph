require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_SELECT_H_)) {
    eval 'sub _SYS_SELECT_H_ () {1;}' unless defined(&_SYS_SELECT_H_);
    require 'sys/cdefs.ph';
    require 'sys/_types.ph';
    require 'sys/_sigset.ph';
    require 'sys/_timeval.ph';
    require 'sys/timespec.ph';
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
    }
    unless(defined(&_SIGSET_T_DECLARED)) {
	eval 'sub _SIGSET_T_DECLARED () {1;}' unless defined(&_SIGSET_T_DECLARED);
    }
    unless(defined(&FD_SETSIZE)) {
	eval 'sub FD_SETSIZE () {1024;}' unless defined(&FD_SETSIZE);
    }
    eval 'sub _NFDBITS () {($sizeof{ &__fd_mask} * 8);}' unless defined(&_NFDBITS);
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub NFDBITS () { &_NFDBITS;}' unless defined(&NFDBITS);
    }
    unless(defined(&_howmany)) {
	eval 'sub _howmany {
	    my($x, $y) = @_;
    	    eval q(((($x) + (($y) - 1)) / ($y)));
	}' unless defined(&_howmany);
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub fds_bits () { &__fds_bits;}' unless defined(&fds_bits);
    }
    eval 'sub __fdset_mask {
        my($n) = @_;
	    eval q((( &__fd_mask)1<< (($n) %  &_NFDBITS)));
    }' unless defined(&__fdset_mask);
    eval 'sub FD_CLR {
        my($n, $p) = @_;
	    eval q((($p)-> $__fds_bits[($n)/ &_NFDBITS] &= ~ &__fdset_mask($n)));
    }' unless defined(&FD_CLR);
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub FD_COPY {
	    my($f, $t) = @_;
    	    eval q(( &void)(*($t) = *($f)));
	}' unless defined(&FD_COPY);
    }
    eval 'sub FD_ISSET {
        my($n, $p) = @_;
	    eval q(((($p)-> $__fds_bits[($n)/ &_NFDBITS] &  &__fdset_mask($n)) != 0));
    }' unless defined(&FD_ISSET);
    eval 'sub FD_SET {
        my($n, $p) = @_;
	    eval q((($p)-> $__fds_bits[($n)/ &_NFDBITS] |=  &__fdset_mask($n)));
    }' unless defined(&FD_SET);
    eval 'sub FD_ZERO {
        my($p) = @_;
	    eval q( &do {  &fd_set * &_p;  &__size_t  &_n;  &_p = ($p);  &_n =  &_howmany( &FD_SETSIZE,  &_NFDBITS);  &while ( &_n > 0)  ($_$p->{__fds_bits[&}--_n]) = 0; }  &while (0));
    }' unless defined(&FD_ZERO);
    unless(defined(&_KERNEL)) {
	unless(defined(&_SELECT_DECLARED)) {
	    eval 'sub _SELECT_DECLARED () {1;}' unless defined(&_SELECT_DECLARED);
	}
    }
}
1;
