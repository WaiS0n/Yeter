require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_PIDCTRL_H_)) {
    eval 'sub _SYS_PIDCTRL_H_ () {1;}' unless defined(&_SYS_PIDCTRL_H_);
    eval 'sub PIDCTRL_KPD () {3;}' unless defined(&PIDCTRL_KPD);
    eval 'sub PIDCTRL_KID () {4;}' unless defined(&PIDCTRL_KID);
    eval 'sub PIDCTRL_KDD () {8;}' unless defined(&PIDCTRL_KDD);
    eval 'sub PIDCTRL_BOUND () {4;}' unless defined(&PIDCTRL_BOUND);
}
1;
