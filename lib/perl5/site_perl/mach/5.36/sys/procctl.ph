require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_PROCCTL_H_)) {
    eval 'sub _SYS_PROCCTL_H_ () {1;}' unless defined(&_SYS_PROCCTL_H_);
    unless(defined(&_KERNEL)) {
	require 'sys/types.ph';
	require 'sys/wait.ph';
    }
    eval 'sub PROC_PROCCTL_MD_MIN () {0x10000000;}' unless defined(&PROC_PROCCTL_MD_MIN);
    require 'machine/procctl.ph';
    eval 'sub PROC_SPROTECT () {1;}' unless defined(&PROC_SPROTECT);
    eval 'sub PROC_REAP_ACQUIRE () {2;}' unless defined(&PROC_REAP_ACQUIRE);
    eval 'sub PROC_REAP_RELEASE () {3;}' unless defined(&PROC_REAP_RELEASE);
    eval 'sub PROC_REAP_STATUS () {4;}' unless defined(&PROC_REAP_STATUS);
    eval 'sub PROC_REAP_GETPIDS () {5;}' unless defined(&PROC_REAP_GETPIDS);
    eval 'sub PROC_REAP_KILL () {6;}' unless defined(&PROC_REAP_KILL);
    eval 'sub PROC_TRACE_CTL () {7;}' unless defined(&PROC_TRACE_CTL);
    eval 'sub PROC_TRACE_STATUS () {8;}' unless defined(&PROC_TRACE_STATUS);
    eval 'sub PROC_TRAPCAP_CTL () {9;}' unless defined(&PROC_TRAPCAP_CTL);
    eval 'sub PROC_TRAPCAP_STATUS () {10;}' unless defined(&PROC_TRAPCAP_STATUS);
    eval 'sub PROC_PDEATHSIG_CTL () {11;}' unless defined(&PROC_PDEATHSIG_CTL);
    eval 'sub PROC_PDEATHSIG_STATUS () {12;}' unless defined(&PROC_PDEATHSIG_STATUS);
    eval 'sub PROC_ASLR_CTL () {13;}' unless defined(&PROC_ASLR_CTL);
    eval 'sub PROC_ASLR_STATUS () {14;}' unless defined(&PROC_ASLR_STATUS);
    eval 'sub PROC_PROTMAX_CTL () {15;}' unless defined(&PROC_PROTMAX_CTL);
    eval 'sub PROC_PROTMAX_STATUS () {16;}' unless defined(&PROC_PROTMAX_STATUS);
    eval 'sub PROC_STACKGAP_CTL () {17;}' unless defined(&PROC_STACKGAP_CTL);
    eval 'sub PROC_STACKGAP_STATUS () {18;}' unless defined(&PROC_STACKGAP_STATUS);
    eval 'sub PROC_NO_NEW_PRIVS_CTL () {19;}' unless defined(&PROC_NO_NEW_PRIVS_CTL);
    eval 'sub PROC_NO_NEW_PRIVS_STATUS () {20;}' unless defined(&PROC_NO_NEW_PRIVS_STATUS);
    eval 'sub PROC_WXMAP_CTL () {21;}' unless defined(&PROC_WXMAP_CTL);
    eval 'sub PROC_WXMAP_STATUS () {22;}' unless defined(&PROC_WXMAP_STATUS);
    eval 'sub PPROT_OP {
        my($x) = @_;
	    eval q((($x) & 0xf));
    }' unless defined(&PPROT_OP);
    eval 'sub PPROT_SET () {1;}' unless defined(&PPROT_SET);
    eval 'sub PPROT_CLEAR () {2;}' unless defined(&PPROT_CLEAR);
    eval 'sub PPROT_FLAGS {
        my($x) = @_;
	    eval q((($x) & ~0xf));
    }' unless defined(&PPROT_FLAGS);
    eval 'sub PPROT_DESCEND () {0x10;}' unless defined(&PPROT_DESCEND);
    eval 'sub PPROT_INHERIT () {0x20;}' unless defined(&PPROT_INHERIT);
    eval 'sub REAPER_STATUS_OWNED () {0x1;}' unless defined(&REAPER_STATUS_OWNED);
    eval 'sub REAPER_STATUS_REALINIT () {0x2;}' unless defined(&REAPER_STATUS_REALINIT);
    eval 'sub REAPER_PIDINFO_VALID () {0x1;}' unless defined(&REAPER_PIDINFO_VALID);
    eval 'sub REAPER_PIDINFO_CHILD () {0x2;}' unless defined(&REAPER_PIDINFO_CHILD);
    eval 'sub REAPER_PIDINFO_REAPER () {0x4;}' unless defined(&REAPER_PIDINFO_REAPER);
    eval 'sub REAPER_PIDINFO_ZOMBIE () {0x8;}' unless defined(&REAPER_PIDINFO_ZOMBIE);
    eval 'sub REAPER_PIDINFO_STOPPED () {0x10;}' unless defined(&REAPER_PIDINFO_STOPPED);
    eval 'sub REAPER_PIDINFO_EXITING () {0x20;}' unless defined(&REAPER_PIDINFO_EXITING);
    eval 'sub REAPER_KILL_CHILDREN () {0x1;}' unless defined(&REAPER_KILL_CHILDREN);
    eval 'sub REAPER_KILL_SUBTREE () {0x2;}' unless defined(&REAPER_KILL_SUBTREE);
    eval 'sub PROC_TRACE_CTL_ENABLE () {1;}' unless defined(&PROC_TRACE_CTL_ENABLE);
    eval 'sub PROC_TRACE_CTL_DISABLE () {2;}' unless defined(&PROC_TRACE_CTL_DISABLE);
    eval 'sub PROC_TRACE_CTL_DISABLE_EXEC () {3;}' unless defined(&PROC_TRACE_CTL_DISABLE_EXEC);
    eval 'sub PROC_TRAPCAP_CTL_ENABLE () {1;}' unless defined(&PROC_TRAPCAP_CTL_ENABLE);
    eval 'sub PROC_TRAPCAP_CTL_DISABLE () {2;}' unless defined(&PROC_TRAPCAP_CTL_DISABLE);
    eval 'sub PROC_ASLR_FORCE_ENABLE () {1;}' unless defined(&PROC_ASLR_FORCE_ENABLE);
    eval 'sub PROC_ASLR_FORCE_DISABLE () {2;}' unless defined(&PROC_ASLR_FORCE_DISABLE);
    eval 'sub PROC_ASLR_NOFORCE () {3;}' unless defined(&PROC_ASLR_NOFORCE);
    eval 'sub PROC_ASLR_ACTIVE () {0x80000000;}' unless defined(&PROC_ASLR_ACTIVE);
    eval 'sub PROC_PROTMAX_FORCE_ENABLE () {1;}' unless defined(&PROC_PROTMAX_FORCE_ENABLE);
    eval 'sub PROC_PROTMAX_FORCE_DISABLE () {2;}' unless defined(&PROC_PROTMAX_FORCE_DISABLE);
    eval 'sub PROC_PROTMAX_NOFORCE () {3;}' unless defined(&PROC_PROTMAX_NOFORCE);
    eval 'sub PROC_PROTMAX_ACTIVE () {0x80000000;}' unless defined(&PROC_PROTMAX_ACTIVE);
    eval 'sub PROC_STACKGAP_ENABLE () {0x1;}' unless defined(&PROC_STACKGAP_ENABLE);
    eval 'sub PROC_STACKGAP_DISABLE () {0x2;}' unless defined(&PROC_STACKGAP_DISABLE);
    eval 'sub PROC_STACKGAP_ENABLE_EXEC () {0x4;}' unless defined(&PROC_STACKGAP_ENABLE_EXEC);
    eval 'sub PROC_STACKGAP_DISABLE_EXEC () {0x8;}' unless defined(&PROC_STACKGAP_DISABLE_EXEC);
    eval 'sub PROC_NO_NEW_PRIVS_ENABLE () {1;}' unless defined(&PROC_NO_NEW_PRIVS_ENABLE);
    eval 'sub PROC_NO_NEW_PRIVS_DISABLE () {2;}' unless defined(&PROC_NO_NEW_PRIVS_DISABLE);
    eval 'sub PROC_WX_MAPPINGS_PERMIT () {0x1;}' unless defined(&PROC_WX_MAPPINGS_PERMIT);
    eval 'sub PROC_WX_MAPPINGS_DISALLOW_EXEC () {0x2;}' unless defined(&PROC_WX_MAPPINGS_DISALLOW_EXEC);
    eval 'sub PROC_WXORX_ENFORCE () {0x80000000;}' unless defined(&PROC_WXORX_ENFORCE);
    unless(defined(&_KERNEL)) {
    }
}
1;
