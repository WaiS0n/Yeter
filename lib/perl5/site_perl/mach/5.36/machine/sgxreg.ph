require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_MACHINE_SGXREG_H_)) {
    eval 'sub _MACHINE_SGXREG_H_ () {1;}' unless defined(&_MACHINE_SGXREG_H_);
    eval 'sub SGX_SUCCESS () {0;}' unless defined(&SGX_SUCCESS);
    eval 'sub SGX_INVALID_SIG_STRUCT () {1;}' unless defined(&SGX_INVALID_SIG_STRUCT);
    eval 'sub SGX_INVALID_ATTRIBUTE () {2;}' unless defined(&SGX_INVALID_ATTRIBUTE);
    eval 'sub SGX_BLSTATE () {3;}' unless defined(&SGX_BLSTATE);
    eval 'sub SGX_INVALID_MEASUREMENT () {4;}' unless defined(&SGX_INVALID_MEASUREMENT);
    eval 'sub SGX_NOTBLOCKABLE () {5;}' unless defined(&SGX_NOTBLOCKABLE);
    eval 'sub SGX_PG_INVLD () {6;}' unless defined(&SGX_PG_INVLD);
    eval 'sub SGX_LOCKFAIL () {7;}' unless defined(&SGX_LOCKFAIL);
    eval 'sub SGX_INVALID_SIGNATURE () {8;}' unless defined(&SGX_INVALID_SIGNATURE);
    eval 'sub SGX_MAC_COMPARE_FAIL () {9;}' unless defined(&SGX_MAC_COMPARE_FAIL);
    eval 'sub SGX_PAGE_NOT_BLOCKED () {10;}' unless defined(&SGX_PAGE_NOT_BLOCKED);
    eval 'sub SGX_NOT_TRACKED () {11;}' unless defined(&SGX_NOT_TRACKED);
    eval 'sub SGX_VA_SLOT_OCCUPIED () {12;}' unless defined(&SGX_VA_SLOT_OCCUPIED);
    eval 'sub SGX_CHILD_PRESENT () {13;}' unless defined(&SGX_CHILD_PRESENT);
    eval 'sub SGX_ENCLAVE_ACT () {14;}' unless defined(&SGX_ENCLAVE_ACT);
    eval 'sub SGX_ENTRYEPOCH_LOCKED () {15;}' unless defined(&SGX_ENTRYEPOCH_LOCKED);
    eval 'sub SGX_INVALID_EINIT_TOKEN () {16;}' unless defined(&SGX_INVALID_EINIT_TOKEN);
    eval 'sub SGX_PREV_TRK_INCMPL () {17;}' unless defined(&SGX_PREV_TRK_INCMPL);
    eval 'sub SGX_PG_IS_SECS () {18;}' unless defined(&SGX_PG_IS_SECS);
    eval 'sub SGX_PAGE_ATTRIBUTES_MISMATCH () {19;}' unless defined(&SGX_PAGE_ATTRIBUTES_MISMATCH);
    eval 'sub SGX_PAGE_NOT_MODIFIABLE () {20;}' unless defined(&SGX_PAGE_NOT_MODIFIABLE);
    eval 'sub SGX_INVALID_CPUSVN () {32;}' unless defined(&SGX_INVALID_CPUSVN);
    eval 'sub SGX_INVALID_ISVSVN () {64;}' unless defined(&SGX_INVALID_ISVSVN);
    eval 'sub SGX_UNMASKED_EVENT () {128;}' unless defined(&SGX_UNMASKED_EVENT);
    eval 'sub SGX_INVALID_KEYNAME () {256;}' unless defined(&SGX_INVALID_KEYNAME);
    eval 'sub SECINFO_FLAGS_PT_S () {8;}' unless defined(&SECINFO_FLAGS_PT_S);
    eval 'sub SECINFO_FLAGS_PT_M () {(0xff <<  &SECINFO_FLAGS_PT_S);}' unless defined(&SECINFO_FLAGS_PT_M);
    eval 'sub SECS_ATTR_RSV4_SIZE () {7;}' unless defined(&SECS_ATTR_RSV4_SIZE);
    eval 'sub SECS_RSV1_SIZE () {24;}' unless defined(&SECS_RSV1_SIZE);
    eval 'sub SECS_RSV2_SIZE () {32;}' unless defined(&SECS_RSV2_SIZE);
    eval 'sub SECS_RSV3_SIZE () {96;}' unless defined(&SECS_RSV3_SIZE);
    eval 'sub SECS_RSV4_SIZE () {3836;}' unless defined(&SECS_RSV4_SIZE);
}
1;
