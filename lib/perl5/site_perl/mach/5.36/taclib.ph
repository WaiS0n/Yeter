require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_TACLIB_H_)) {
    eval 'sub _TACLIB_H_ () {1;}' unless defined(&_TACLIB_H_);
    require 'sys/types.ph';
    eval 'sub TAC_SRVR_SINGLE_CONNECT () {0x4;}' unless defined(&TAC_SRVR_SINGLE_CONNECT);
    eval 'sub TAC_AUTHEN_STATUS {
        my($s) = @_;
	    eval q((($s) & 0xff));
    }' unless defined(&TAC_AUTHEN_STATUS);
    eval 'sub TAC_AUTHEN_NOECHO {
        my($s) = @_;
	    eval q((($s) & (1<<8)));
    }' unless defined(&TAC_AUTHEN_NOECHO);
    eval 'sub TAC_AUTHOR_STATUS {
        my($s) = @_;
	    eval q((($s) & 0xff));
    }' unless defined(&TAC_AUTHOR_STATUS);
    eval 'sub TAC_AUTHEN_AV_COUNT {
        my($s) = @_;
	    eval q(((($s)>>8) & 0xff));
    }' unless defined(&TAC_AUTHEN_AV_COUNT);
    eval 'sub TAC_PRIV_LVL_MIN () {0x;}' unless defined(&TAC_PRIV_LVL_MIN);
    eval 'sub TAC_PRIV_LVL_USER () {0x1;}' unless defined(&TAC_PRIV_LVL_USER);
    eval 'sub TAC_PRIV_LVL_ROOT () {0xf;}' unless defined(&TAC_PRIV_LVL_ROOT);
    eval 'sub TAC_PRIV_LVL_MAX () {0xf;}' unless defined(&TAC_PRIV_LVL_MAX);
    eval 'sub TAC_AUTHEN_LOGIN () {0x1;}' unless defined(&TAC_AUTHEN_LOGIN);
    eval 'sub TAC_AUTHEN_CHPASS () {0x2;}' unless defined(&TAC_AUTHEN_CHPASS);
    eval 'sub TAC_AUTHEN_SENDPASS () {0x3;}' unless defined(&TAC_AUTHEN_SENDPASS);
    eval 'sub TAC_AUTHEN_SENDAUTH () {0x4;}' unless defined(&TAC_AUTHEN_SENDAUTH);
    eval 'sub TAC_AUTHEN_TYPE_NOT_SET () {0x;}' unless defined(&TAC_AUTHEN_TYPE_NOT_SET);
    eval 'sub TAC_AUTHEN_TYPE_ASCII () {0x1;}' unless defined(&TAC_AUTHEN_TYPE_ASCII);
    eval 'sub TAC_AUTHEN_TYPE_PAP () {0x2;}' unless defined(&TAC_AUTHEN_TYPE_PAP);
    eval 'sub TAC_AUTHEN_TYPE_CHAP () {0x3;}' unless defined(&TAC_AUTHEN_TYPE_CHAP);
    eval 'sub TAC_AUTHEN_TYPE_ARAP () {0x4;}' unless defined(&TAC_AUTHEN_TYPE_ARAP);
    eval 'sub TAC_AUTHEN_TYPE_MSCHAP () {0x5;}' unless defined(&TAC_AUTHEN_TYPE_MSCHAP);
    eval 'sub TAC_AUTHEN_SVC_NONE () {0x;}' unless defined(&TAC_AUTHEN_SVC_NONE);
    eval 'sub TAC_AUTHEN_SVC_LOGIN () {0x1;}' unless defined(&TAC_AUTHEN_SVC_LOGIN);
    eval 'sub TAC_AUTHEN_SVC_ENABLE () {0x2;}' unless defined(&TAC_AUTHEN_SVC_ENABLE);
    eval 'sub TAC_AUTHEN_SVC_PPP () {0x3;}' unless defined(&TAC_AUTHEN_SVC_PPP);
    eval 'sub TAC_AUTHEN_SVC_ARAP () {0x4;}' unless defined(&TAC_AUTHEN_SVC_ARAP);
    eval 'sub TAC_AUTHEN_SVC_PT () {0x5;}' unless defined(&TAC_AUTHEN_SVC_PT);
    eval 'sub TAC_AUTHEN_SVC_RCMD () {0x6;}' unless defined(&TAC_AUTHEN_SVC_RCMD);
    eval 'sub TAC_AUTHEN_SVC_X25 () {0x7;}' unless defined(&TAC_AUTHEN_SVC_X25);
    eval 'sub TAC_AUTHEN_SVC_NASI () {0x8;}' unless defined(&TAC_AUTHEN_SVC_NASI);
    eval 'sub TAC_AUTHEN_SVC_FWPROXY () {0x9;}' unless defined(&TAC_AUTHEN_SVC_FWPROXY);
    eval 'sub TAC_AUTHEN_STATUS_PASS () {0x1;}' unless defined(&TAC_AUTHEN_STATUS_PASS);
    eval 'sub TAC_AUTHEN_STATUS_FAIL () {0x2;}' unless defined(&TAC_AUTHEN_STATUS_FAIL);
    eval 'sub TAC_AUTHEN_STATUS_GETDATA () {0x3;}' unless defined(&TAC_AUTHEN_STATUS_GETDATA);
    eval 'sub TAC_AUTHEN_STATUS_GETUSER () {0x4;}' unless defined(&TAC_AUTHEN_STATUS_GETUSER);
    eval 'sub TAC_AUTHEN_STATUS_GETPASS () {0x5;}' unless defined(&TAC_AUTHEN_STATUS_GETPASS);
    eval 'sub TAC_AUTHEN_STATUS_RESTART () {0x6;}' unless defined(&TAC_AUTHEN_STATUS_RESTART);
    eval 'sub TAC_AUTHEN_STATUS_ERROR () {0x7;}' unless defined(&TAC_AUTHEN_STATUS_ERROR);
    eval 'sub TAC_AUTHEN_STATUS_FOLLOW () {0x21;}' unless defined(&TAC_AUTHEN_STATUS_FOLLOW);
    eval 'sub TAC_AUTHEN_METH_NOT_SET () {0x;}' unless defined(&TAC_AUTHEN_METH_NOT_SET);
    eval 'sub TAC_AUTHEN_METH_NONE () {0x1;}' unless defined(&TAC_AUTHEN_METH_NONE);
    eval 'sub TAC_AUTHEN_METH_KRB5 () {0x2;}' unless defined(&TAC_AUTHEN_METH_KRB5);
    eval 'sub TAC_AUTHEN_METH_LINE () {0x3;}' unless defined(&TAC_AUTHEN_METH_LINE);
    eval 'sub TAC_AUTHEN_METH_ENABLE () {0x4;}' unless defined(&TAC_AUTHEN_METH_ENABLE);
    eval 'sub TAC_AUTHEN_METH_LOCAL () {0x5;}' unless defined(&TAC_AUTHEN_METH_LOCAL);
    eval 'sub TAC_AUTHEN_METH_TACACSPLUS () {0x6;}' unless defined(&TAC_AUTHEN_METH_TACACSPLUS);
    eval 'sub TAC_AUTHEN_METH_RCMD () {0x20;}' unless defined(&TAC_AUTHEN_METH_RCMD);
    eval 'sub TAC_AUTHOR_STATUS_PASS_ADD () {0x1;}' unless defined(&TAC_AUTHOR_STATUS_PASS_ADD);
    eval 'sub TAC_AUTHOR_STATUS_PASS_REPL () {0x2;}' unless defined(&TAC_AUTHOR_STATUS_PASS_REPL);
    eval 'sub TAC_AUTHOR_STATUS_FAIL () {0x10;}' unless defined(&TAC_AUTHOR_STATUS_FAIL);
    eval 'sub TAC_AUTHOR_STATUS_ERROR () {0x11;}' unless defined(&TAC_AUTHOR_STATUS_ERROR);
    eval 'sub TAC_ACCT_MORE () {0x1;}' unless defined(&TAC_ACCT_MORE);
    eval 'sub TAC_ACCT_START () {0x2;}' unless defined(&TAC_ACCT_START);
    eval 'sub TAC_ACCT_STOP () {0x4;}' unless defined(&TAC_ACCT_STOP);
    eval 'sub TAC_ACCT_WATCHDOG () {0x8;}' unless defined(&TAC_ACCT_WATCHDOG);
    eval 'sub TAC_ACCT_STATUS_SUCCESS () {0x1;}' unless defined(&TAC_ACCT_STATUS_SUCCESS);
    eval 'sub TAC_ACCT_STATUS_ERROR () {0x2;}' unless defined(&TAC_ACCT_STATUS_ERROR);
    eval 'sub TAC_ACCT_STATUS_FOLLOW () {0x21;}' unless defined(&TAC_ACCT_STATUS_FOLLOW);
}
1;
