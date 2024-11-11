require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&__AMD64_INCLUDE_EFI_H_)) {
    eval 'sub __AMD64_INCLUDE_EFI_H_ () {1;}' unless defined(&__AMD64_INCLUDE_EFI_H_);
    if(defined(&__clang__) || defined(&__GNUC__)  && ((defined(&__GNUC__) ? &__GNUC__ : undef) > 4|| (defined(&__GNUC__) ? &__GNUC__ : undef) == 4 && (defined(&__GNUC_MINOR__) ? &__GNUC_MINOR__ : undef) >= 4)) {
	eval 'sub EFIABI_ATTR () { &__attribute__(( &ms_abi));}' unless defined(&EFIABI_ATTR);
    }
    if(defined(&_KERNEL)) {
	require 'isa/rtc.ph';
	eval 'sub ARCH_MAY_USE_EFI () {1;}' unless defined(&ARCH_MAY_USE_EFI);
	eval 'sub EFI_TIME_LOCK () {
	    eval q( &mtx_lock( &atrtc_time_lock));
	}' unless defined(&EFI_TIME_LOCK);
	eval 'sub EFI_TIME_UNLOCK () {
	    eval q( &mtx_unlock( &atrtc_time_lock));
	}' unless defined(&EFI_TIME_UNLOCK);
	eval 'sub EFI_TIME_OWNED () {
	    eval q( &mtx_assert( &atrtc_time_lock,  &MA_OWNED));
	}' unless defined(&EFI_TIME_OWNED);
	eval 'sub EFI_RT_HANDLE_FAULTS_DEFAULT () {1;}' unless defined(&EFI_RT_HANDLE_FAULTS_DEFAULT);
    }
}
1;
