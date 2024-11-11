require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&__OMP_H)) {
    eval 'sub __OMP_H () {1;}' unless defined(&__OMP_H);
    require 'stddef.ph';
    require 'stdlib.ph';
    require 'stdint.ph';
    eval 'sub KMP_VERSION_MAJOR () {5;}' unless defined(&KMP_VERSION_MAJOR);
    eval 'sub KMP_VERSION_MINOR () {0;}' unless defined(&KMP_VERSION_MINOR);
    eval 'sub KMP_VERSION_BUILD () {20140926;}' unless defined(&KMP_VERSION_BUILD);
    eval 'sub KMP_BUILD_DATE () {"No_Timestamp";}' unless defined(&KMP_BUILD_DATE);
    if(defined(&__cplusplus)) {
    }
    eval 'sub omp_set_affinity_format () { &ompc_set_affinity_format;}' unless defined(&omp_set_affinity_format);
    eval 'sub omp_get_affinity_format () { &ompc_get_affinity_format;}' unless defined(&omp_get_affinity_format);
    eval 'sub omp_display_affinity () { &ompc_display_affinity;}' unless defined(&omp_display_affinity);
    eval 'sub omp_capture_affinity () { &ompc_capture_affinity;}' unless defined(&omp_capture_affinity);
    if(defined(&_WIN32)) {
	eval 'sub __KAI_KMPC_CONVENTION () { &__cdecl;}' unless defined(&__KAI_KMPC_CONVENTION);
	unless(defined(&__KMP_IMP)) {
	    eval 'sub __KMP_IMP () { &__declspec( &dllimport);}' unless defined(&__KMP_IMP);
	}
    } else {
	eval 'sub __KAI_KMPC_CONVENTION () {1;}' unless defined(&__KAI_KMPC_CONVENTION);
	unless(defined(&__KMP_IMP)) {
	    eval 'sub __KMP_IMP () {1;}' unless defined(&__KMP_IMP);
	}
    }
    eval("sub omp_sched_static () { 1; }") unless defined(&omp_sched_static);
    eval("sub omp_sched_dynamic () { 2; }") unless defined(&omp_sched_dynamic);
    eval("sub omp_sched_guided () { 3; }") unless defined(&omp_sched_guided);
    eval("sub omp_sched_auto () { 4; }") unless defined(&omp_sched_auto);
    eval("sub omp_sched_monotonic () { 0x80000000; }") unless defined(&omp_sched_monotonic);
    eval("sub omp_sync_hint_none () { 0; }") unless defined(&omp_sync_hint_none);
    eval("sub omp_lock_hint_none () { omp_sync_hint_none; }") unless defined(&omp_lock_hint_none);
    eval("sub omp_sync_hint_uncontended () { 1; }") unless defined(&omp_sync_hint_uncontended);
    eval("sub omp_lock_hint_uncontended () { omp_sync_hint_uncontended; }") unless defined(&omp_lock_hint_uncontended);
    eval("sub omp_sync_hint_contended () { (1<<1); }") unless defined(&omp_sync_hint_contended);
    eval("sub omp_lock_hint_contended () { omp_sync_hint_contended; }") unless defined(&omp_lock_hint_contended);
    eval("sub omp_sync_hint_nonspeculative () { (1<<2); }") unless defined(&omp_sync_hint_nonspeculative);
    eval("sub omp_lock_hint_nonspeculative () { omp_sync_hint_nonspeculative; }") unless defined(&omp_lock_hint_nonspeculative);
    eval("sub omp_sync_hint_speculative () { (1<<3); }") unless defined(&omp_sync_hint_speculative);
    eval("sub omp_lock_hint_speculative () { omp_sync_hint_speculative; }") unless defined(&omp_lock_hint_speculative);
    eval("sub kmp_lock_hint_hle () { (1<<16); }") unless defined(&kmp_lock_hint_hle);
    eval("sub kmp_lock_hint_rtm () { (1<<17); }") unless defined(&kmp_lock_hint_rtm);
    eval("sub kmp_lock_hint_adaptive () { (1<<18); }") unless defined(&kmp_lock_hint_adaptive);
    eval("sub omp_ipr_fr_id () { -1; }") unless defined(&omp_ipr_fr_id);
    eval("sub omp_ipr_fr_name () { -2; }") unless defined(&omp_ipr_fr_name);
    eval("sub omp_ipr_vendor () { -3; }") unless defined(&omp_ipr_vendor);
    eval("sub omp_ipr_vendor_name () { -4; }") unless defined(&omp_ipr_vendor_name);
    eval("sub omp_ipr_device_num () { -5; }") unless defined(&omp_ipr_device_num);
    eval("sub omp_ipr_platform () { -6; }") unless defined(&omp_ipr_platform);
    eval("sub omp_ipr_device () { -7; }") unless defined(&omp_ipr_device);
    eval("sub omp_ipr_device_context () { -8; }") unless defined(&omp_ipr_device_context);
    eval("sub omp_ipr_targetsync () { -9; }") unless defined(&omp_ipr_targetsync);
    eval("sub omp_ipr_first () { -9; }") unless defined(&omp_ipr_first);
    eval 'sub omp_interop_none () {0;}' unless defined(&omp_interop_none);
    eval("sub omp_irc_no_value () { 1; }") unless defined(&omp_irc_no_value);
    eval("sub omp_irc_success () { 0; }") unless defined(&omp_irc_success);
    eval("sub omp_irc_empty () { -1; }") unless defined(&omp_irc_empty);
    eval("sub omp_irc_out_of_range () { -2; }") unless defined(&omp_irc_out_of_range);
    eval("sub omp_irc_type_int () { -3; }") unless defined(&omp_irc_type_int);
    eval("sub omp_irc_type_ptr () { -4; }") unless defined(&omp_irc_type_ptr);
    eval("sub omp_irc_type_str () { -5; }") unless defined(&omp_irc_type_str);
    eval("sub omp_irc_other () { -6; }") unless defined(&omp_irc_other);
    eval("sub omp_ifr_cuda () { 1; }") unless defined(&omp_ifr_cuda);
    eval("sub omp_ifr_cuda_driver () { 2; }") unless defined(&omp_ifr_cuda_driver);
    eval("sub omp_ifr_opencl () { 3; }") unless defined(&omp_ifr_opencl);
    eval("sub omp_ifr_sycl () { 4; }") unless defined(&omp_ifr_sycl);
    eval("sub omp_ifr_hip () { 5; }") unless defined(&omp_ifr_hip);
    eval("sub omp_ifr_level_zero () { 6; }") unless defined(&omp_ifr_level_zero);
    eval("sub omp_ifr_last () { 7; }") unless defined(&omp_ifr_last);
    eval("sub omp_proc_bind_false () { 0; }") unless defined(&omp_proc_bind_false);
    eval("sub omp_proc_bind_true () { 1; }") unless defined(&omp_proc_bind_true);
    eval("sub omp_proc_bind_master () { 2; }") unless defined(&omp_proc_bind_master);
    eval("sub omp_proc_bind_close () { 3; }") unless defined(&omp_proc_bind_close);
    eval("sub omp_proc_bind_spread () { 4; }") unless defined(&omp_proc_bind_spread);
    eval("sub omp_control_tool_notool () { -2; }") unless defined(&omp_control_tool_notool);
    eval("sub omp_control_tool_nocallback () { -1; }") unless defined(&omp_control_tool_nocallback);
    eval("sub omp_control_tool_success () { 0; }") unless defined(&omp_control_tool_success);
    eval("sub omp_control_tool_ignored () { 1; }") unless defined(&omp_control_tool_ignored);
    eval("sub omp_control_tool_start () { 1; }") unless defined(&omp_control_tool_start);
    eval("sub omp_control_tool_pause () { 2; }") unless defined(&omp_control_tool_pause);
    eval("sub omp_control_tool_flush () { 3; }") unless defined(&omp_control_tool_flush);
    eval("sub omp_control_tool_end () { 4; }") unless defined(&omp_control_tool_end);
    eval("sub omp_atk_sync_hint () { 1; }") unless defined(&omp_atk_sync_hint);
    eval("sub omp_atk_alignment () { 2; }") unless defined(&omp_atk_alignment);
    eval("sub omp_atk_access () { 3; }") unless defined(&omp_atk_access);
    eval("sub omp_atk_pool_size () { 4; }") unless defined(&omp_atk_pool_size);
    eval("sub omp_atk_fallback () { 5; }") unless defined(&omp_atk_fallback);
    eval("sub omp_atk_fb_data () { 6; }") unless defined(&omp_atk_fb_data);
    eval("sub omp_atk_pinned () { 7; }") unless defined(&omp_atk_pinned);
    eval("sub omp_atk_partition () { 8; }") unless defined(&omp_atk_partition);
    eval("sub omp_atv_false () { 0; }") unless defined(&omp_atv_false);
    eval("sub omp_atv_true () { 1; }") unless defined(&omp_atv_true);
    eval("sub omp_atv_contended () { 3; }") unless defined(&omp_atv_contended);
    eval("sub omp_atv_uncontended () { 4; }") unless defined(&omp_atv_uncontended);
    eval("sub omp_atv_serialized () { 5; }") unless defined(&omp_atv_serialized);
    eval("sub omp_atv_sequential () { omp_atv_serialized; }") unless defined(&omp_atv_sequential);
    eval("sub omp_atv_private () { 6; }") unless defined(&omp_atv_private);
    eval("sub omp_atv_all () { 7; }") unless defined(&omp_atv_all);
    eval("sub omp_atv_thread () { 8; }") unless defined(&omp_atv_thread);
    eval("sub omp_atv_pteam () { 9; }") unless defined(&omp_atv_pteam);
    eval("sub omp_atv_cgroup () { 10; }") unless defined(&omp_atv_cgroup);
    eval("sub omp_atv_default_mem_fb () { 11; }") unless defined(&omp_atv_default_mem_fb);
    eval("sub omp_atv_null_fb () { 12; }") unless defined(&omp_atv_null_fb);
    eval("sub omp_atv_abort_fb () { 13; }") unless defined(&omp_atv_abort_fb);
    eval("sub omp_atv_allocator_fb () { 14; }") unless defined(&omp_atv_allocator_fb);
    eval("sub omp_atv_environment () { 15; }") unless defined(&omp_atv_environment);
    eval("sub omp_atv_nearest () { 16; }") unless defined(&omp_atv_nearest);
    eval("sub omp_atv_blocked () { 17; }") unless defined(&omp_atv_blocked);
    eval("sub omp_atv_interleaved () { 18; }") unless defined(&omp_atv_interleaved);
    eval 'sub omp_atv_default () {(( &omp_uintptr_t)-1);}' unless defined(&omp_atv_default);
    if(defined(&_WIN32)) {
    } else {
	if((defined(&__cplusplus) ? &__cplusplus : undef) >= 201103) {
	    if((defined(&__cplusplus) ? &__cplusplus : undef) >= 201103) {
	    }
	    if(defined(&__cplusplus)) {
	    } else {
	    }
	    if(defined(&_WIN32)) {
	    } else {
		eval("sub KMP_EVENT_MAX_HANDLE () { UINTPTR_MAX; }") unless defined(&KMP_EVENT_MAX_HANDLE);
	    }
	    eval("sub omp_pause_resume () { 0; }") unless defined(&omp_pause_resume);
	    eval("sub omp_pause_soft () { 1; }") unless defined(&omp_pause_soft);
	    eval("sub omp_pause_hard () { 2; }") unless defined(&omp_pause_hard);
	    if(defined(&_OPENMP)  && (defined(&_OPENMP) ? &_OPENMP : undef) >= 201811) {
	    }
	    undef(&__KAI_KMPC_CONVENTION) if defined(&__KAI_KMPC_CONVENTION);
	    undef(&__KMP_IMP) if defined(&__KMP_IMP);
	    if(defined(&__cplusplus)) {
	    }
	}
1;
