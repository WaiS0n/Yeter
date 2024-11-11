require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_NSS_H_)) {
    eval 'sub _NSS_H_ () {1;}' unless defined(&_NSS_H_);
    require 'nsswitch.ph';
    eval("sub NSS_STATUS_TRYAGAIN () { -2; }") unless defined(&NSS_STATUS_TRYAGAIN);
    eval("sub NSS_STATUS_UNAVAIL () { -1; }") unless defined(&NSS_STATUS_UNAVAIL);
    eval("sub NSS_STATUS_NOTFOUND () { 0; }") unless defined(&NSS_STATUS_NOTFOUND);
    eval("sub NSS_STATUS_SUCCESS () { 1; }") unless defined(&NSS_STATUS_SUCCESS);
    eval("sub NSS_STATUS_RETURN () { 2; }") unless defined(&NSS_STATUS_RETURN);
    eval 'sub __nss_compat_result {
        my($rv, $err) = @_;
	    eval q((($rv ==  &NSS_STATUS_TRYAGAIN  && $err ==  &ERANGE) ?  &NS_RETURN : ($rv ==  &NSS_STATUS_TRYAGAIN) ?  &NS_TRYAGAIN : ($rv ==  &NSS_STATUS_UNAVAIL) ?  &NS_UNAVAIL : ($rv ==  &NSS_STATUS_NOTFOUND) ?  &NS_NOTFOUND : ($rv ==  &NSS_STATUS_SUCCESS) ?  &NS_SUCCESS : ($rv ==  &NSS_STATUS_RETURN) ?  &NS_RETURN : 0));
    }' unless defined(&__nss_compat_result);
}
1;
