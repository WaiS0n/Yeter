require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_AIO_H_)) {
    eval 'sub _SYS_AIO_H_ () {1;}' unless defined(&_SYS_AIO_H_);
    require 'sys/types.ph';
    require 'sys/signal.ph';
    if(defined(&_KERNEL)) {
	require 'sys/queue.ph';
	require 'sys/event.ph';
	require 'sys/signalvar.ph';
	require 'sys/uio.ph';
    }
    eval 'sub AIO_CANCELED () {0x1;}' unless defined(&AIO_CANCELED);
    eval 'sub AIO_NOTCANCELED () {0x2;}' unless defined(&AIO_NOTCANCELED);
    eval 'sub AIO_ALLDONE () {0x3;}' unless defined(&AIO_ALLDONE);
    eval 'sub LIO_NOP () {0x;}' unless defined(&LIO_NOP);
    eval 'sub LIO_WRITE () {0x1;}' unless defined(&LIO_WRITE);
    eval 'sub LIO_READ () {0x2;}' unless defined(&LIO_READ);
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub LIO_VECTORED () {0x4;}' unless defined(&LIO_VECTORED);
	eval 'sub LIO_WRITEV () {( &LIO_WRITE |  &LIO_VECTORED);}' unless defined(&LIO_WRITEV);
	eval 'sub LIO_READV () {( &LIO_READ |  &LIO_VECTORED);}' unless defined(&LIO_READV);
    }
    if(defined(&_KERNEL) || defined(&_WANT_ALL_LIO_OPCODES)) {
	eval 'sub LIO_SYNC () {0x8;}' unless defined(&LIO_SYNC);
	eval 'sub LIO_DSYNC () {(0x10 |  &LIO_SYNC);}' unless defined(&LIO_DSYNC);
	eval 'sub LIO_MLOCK () {0x20;}' unless defined(&LIO_MLOCK);
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub LIO_FOFFSET () {0x40;}' unless defined(&LIO_FOFFSET);
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub AIO_OP2_FOFFSET () {0x1;}' unless defined(&AIO_OP2_FOFFSET);
	eval 'sub AIO_OP2_VECTORED () {0x2;}' unless defined(&AIO_OP2_VECTORED);
    }
    eval 'sub LIO_NOWAIT () {0x;}' unless defined(&LIO_NOWAIT);
    eval 'sub LIO_WAIT () {0x1;}' unless defined(&LIO_WAIT);
    eval 'sub AIO_LISTIO_MAX () {16;}' unless defined(&AIO_LISTIO_MAX);
    if(defined(&_KERNEL)) {
	unless(defined(&MAX_AIO_PROCS)) {
	    eval 'sub MAX_AIO_PROCS () {32;}' unless defined(&MAX_AIO_PROCS);
	}
	unless(defined(&TARGET_AIO_PROCS)) {
	    eval 'sub TARGET_AIO_PROCS () {4;}' unless defined(&TARGET_AIO_PROCS);
	}
	unless(defined(&AIOD_LIFETIME_DEFAULT)) {
	    eval 'sub AIOD_LIFETIME_DEFAULT () {(30*  &hz);}' unless defined(&AIOD_LIFETIME_DEFAULT);
	}
    }
    eval 'sub aio_iov () { &aio_buf;}' unless defined(&aio_iov);
    eval 'sub aio_iovcnt () { &aio_nbytes;}' unless defined(&aio_iovcnt);
    if(defined(&_KERNEL)) {
    } else {
	if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	}
	if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	}
	if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	}
    }
}
1;
