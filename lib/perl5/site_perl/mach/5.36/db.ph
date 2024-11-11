require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_DB_H_)) {
    eval 'sub _DB_H_ () {1;}' unless defined(&_DB_H_);
    require 'sys/types.ph';
    require 'sys/cdefs.ph';
    require 'limits.ph';
    eval 'sub RET_ERROR () {-1;}' unless defined(&RET_ERROR);
    eval 'sub RET_SUCCESS () {0;}' unless defined(&RET_SUCCESS);
    eval 'sub RET_SPECIAL () {1;}' unless defined(&RET_SPECIAL);
    eval 'sub MAX_PAGE_NUMBER () {0xffffffff;}' unless defined(&MAX_PAGE_NUMBER);
    eval 'sub MAX_PAGE_OFFSET () {65535;}' unless defined(&MAX_PAGE_OFFSET);
    eval 'sub MAX_REC_NUMBER () {0xffffffff;}' unless defined(&MAX_REC_NUMBER);
    eval 'sub R_CURSOR () {1;}' unless defined(&R_CURSOR);
    eval 'sub __R_UNUSED () {2;}' unless defined(&__R_UNUSED);
    eval 'sub R_FIRST () {3;}' unless defined(&R_FIRST);
    eval 'sub R_IAFTER () {4;}' unless defined(&R_IAFTER);
    eval 'sub R_IBEFORE () {5;}' unless defined(&R_IBEFORE);
    eval 'sub R_LAST () {6;}' unless defined(&R_LAST);
    eval 'sub R_NEXT () {7;}' unless defined(&R_NEXT);
    eval 'sub R_NOOVERWRITE () {8;}' unless defined(&R_NOOVERWRITE);
    eval 'sub R_PREV () {9;}' unless defined(&R_PREV);
    eval 'sub R_SETCURSOR () {10;}' unless defined(&R_SETCURSOR);
    eval 'sub R_RECNOSYNC () {11;}' unless defined(&R_RECNOSYNC);
    eval("sub DB_BTREE () { 0; }") unless defined(&DB_BTREE);
    eval("sub DB_HASH () { 1; }") unless defined(&DB_HASH);
    eval("sub DB_RECNO () { 2; }") unless defined(&DB_RECNO);
    if((defined(&UINT_MAX) ? &UINT_MAX : undef) > 65535) {
	eval 'sub DB_LOCK () {0x20000000;}' unless defined(&DB_LOCK);
	eval 'sub DB_SHMEM () {0x40000000;}' unless defined(&DB_SHMEM);
	eval 'sub DB_TXN () {0x80000000;}' unless defined(&DB_TXN);
    } else {
	eval 'sub DB_LOCK () {0x2000;}' unless defined(&DB_LOCK);
	eval 'sub DB_SHMEM () {0x4000;}' unless defined(&DB_SHMEM);
	eval 'sub DB_TXN () {0x8000;}' unless defined(&DB_TXN);
    }
    eval 'sub BTREEMAGIC () {0x53162;}' unless defined(&BTREEMAGIC);
    eval 'sub BTREEVERSION () {3;}' unless defined(&BTREEVERSION);
    eval 'sub R_DUP () {0x1;}' unless defined(&R_DUP);
    eval 'sub HASHMAGIC () {0x61561;}' unless defined(&HASHMAGIC);
    eval 'sub HASHVERSION () {2;}' unless defined(&HASHVERSION);
    eval 'sub R_FIXEDLEN () {0x1;}' unless defined(&R_FIXEDLEN);
    eval 'sub R_NOKEY () {0x2;}' unless defined(&R_NOKEY);
    eval 'sub R_SNAPSHOT () {0x4;}' unless defined(&R_SNAPSHOT);
    if(defined(&__DBINTERFACE_PRIVATE)) {
	eval 'sub M_32_SWAP {
	    my($a) = @_;
    	    eval q({  &uint32_t  &_tmp = $a; ($a)[0] = (& &_tmp)[3]; ($a)[1] = (& &_tmp)[2]; ($a)[2] = (& &_tmp)[1]; ($a)[3] = (& &_tmp)[0]; });
	}' unless defined(&M_32_SWAP);
	eval 'sub P_32_SWAP {
	    my($a) = @_;
    	    eval q({  &uint32_t  &_tmp = *( &uint32_t *)$a; [0] = (& &_tmp)[3]; [1] = (& &_tmp)[2]; [2] = (& &_tmp)[1]; ($a)[3] = (& &_tmp)[0]; });
	}' unless defined(&P_32_SWAP);
	eval 'sub P_32_COPY {
	    my($a, $b) = @_;
    	    eval q({ (($b))[0] = (($a))[3]; (($b))[1] = (($a))[2]; (($b))[2] = (($a))[1]; (($b))[3] = (($a))[0]; });
	}' unless defined(&P_32_COPY);
	eval 'sub M_16_SWAP {
	    my($a) = @_;
    	    eval q({  &uint16_t  &_tmp = $a; ($a)[0] = (& &_tmp)[1]; ($a)[1] = (& &_tmp)[0]; });
	}' unless defined(&M_16_SWAP);
	eval 'sub P_16_SWAP {
	    my($a) = @_;
    	    eval q({  &uint16_t  &_tmp = *( &uint16_t *)$a; [0] = (& &_tmp)[1]; ($a)[1] = (& &_tmp)[0]; });
	}' unless defined(&P_16_SWAP);
	eval 'sub P_16_COPY {
	    my($a, $b) = @_;
    	    eval q({ (($b))[0] = (($a))[1]; (($b))[1] = (($a))[0]; });
	}' unless defined(&P_16_COPY);
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
    }
    if(defined(&__DBINTERFACE_PRIVATE)) {
    }
}
1;
