require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_FETCH_H_INCLUDED)) {
    eval 'sub _FETCH_H_INCLUDED () {1;}' unless defined(&_FETCH_H_INCLUDED);
    eval 'sub _LIBFETCH_VER () {"libfetch/2.0";}' unless defined(&_LIBFETCH_VER);
    eval 'sub URL_SCHEMELEN () {16;}' unless defined(&URL_SCHEMELEN);
    eval 'sub URL_USERLEN () {256;}' unless defined(&URL_USERLEN);
    eval 'sub URL_PWDLEN () {256;}' unless defined(&URL_PWDLEN);
    eval 'sub SCHEME_FTP () {"ftp";}' unless defined(&SCHEME_FTP);
    eval 'sub SCHEME_HTTP () {"http";}' unless defined(&SCHEME_HTTP);
    eval 'sub SCHEME_HTTPS () {"https";}' unless defined(&SCHEME_HTTPS);
    eval 'sub SCHEME_FILE () {"file";}' unless defined(&SCHEME_FILE);
    eval 'sub FETCH_ABORT () {1;}' unless defined(&FETCH_ABORT);
    eval 'sub FETCH_AUTH () {2;}' unless defined(&FETCH_AUTH);
    eval 'sub FETCH_DOWN () {3;}' unless defined(&FETCH_DOWN);
    eval 'sub FETCH_EXISTS () {4;}' unless defined(&FETCH_EXISTS);
    eval 'sub FETCH_FULL () {5;}' unless defined(&FETCH_FULL);
    eval 'sub FETCH_INFO () {6;}' unless defined(&FETCH_INFO);
    eval 'sub FETCH_MEMORY () {7;}' unless defined(&FETCH_MEMORY);
    eval 'sub FETCH_MOVED () {8;}' unless defined(&FETCH_MOVED);
    eval 'sub FETCH_NETWORK () {9;}' unless defined(&FETCH_NETWORK);
    eval 'sub FETCH_OK () {10;}' unless defined(&FETCH_OK);
    eval 'sub FETCH_PROTO () {11;}' unless defined(&FETCH_PROTO);
    eval 'sub FETCH_RESOLV () {12;}' unless defined(&FETCH_RESOLV);
    eval 'sub FETCH_SERVER () {13;}' unless defined(&FETCH_SERVER);
    eval 'sub FETCH_TEMP () {14;}' unless defined(&FETCH_TEMP);
    eval 'sub FETCH_TIMEOUT () {15;}' unless defined(&FETCH_TIMEOUT);
    eval 'sub FETCH_UNAVAIL () {16;}' unless defined(&FETCH_UNAVAIL);
    eval 'sub FETCH_UNKNOWN () {17;}' unless defined(&FETCH_UNKNOWN);
    eval 'sub FETCH_URL () {18;}' unless defined(&FETCH_URL);
    eval 'sub FETCH_VERBOSE () {19;}' unless defined(&FETCH_VERBOSE);
    eval 'sub MAXERRSTRING () {256;}' unless defined(&MAXERRSTRING);
}
1;
