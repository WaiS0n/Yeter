require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&__SYS_MEMBARRIER_H__)) {
    eval 'sub __SYS_MEMBARRIER_H__ () {1;}' unless defined(&__SYS_MEMBARRIER_H__);
    require 'sys/cdefs.ph';
    eval("sub MEMBARRIER_CMD_QUERY () { 0x00000000; }") unless defined(&MEMBARRIER_CMD_QUERY);
    eval("sub MEMBARRIER_CMD_GLOBAL () { 0x00000001; }") unless defined(&MEMBARRIER_CMD_GLOBAL);
    eval("sub MEMBARRIER_CMD_SHARED () { MEMBARRIER_CMD_GLOBAL; }") unless defined(&MEMBARRIER_CMD_SHARED);
    eval("sub MEMBARRIER_CMD_GLOBAL_EXPEDITED () { 0x00000002; }") unless defined(&MEMBARRIER_CMD_GLOBAL_EXPEDITED);
    eval("sub MEMBARRIER_CMD_REGISTER_GLOBAL_EXPEDITED () { 0x00000004; }") unless defined(&MEMBARRIER_CMD_REGISTER_GLOBAL_EXPEDITED);
    eval("sub MEMBARRIER_CMD_PRIVATE_EXPEDITED () { 0x00000008; }") unless defined(&MEMBARRIER_CMD_PRIVATE_EXPEDITED);
    eval("sub MEMBARRIER_CMD_REGISTER_PRIVATE_EXPEDITED () { 0x00000010; }") unless defined(&MEMBARRIER_CMD_REGISTER_PRIVATE_EXPEDITED);
    eval("sub MEMBARRIER_CMD_PRIVATE_EXPEDITED_SYNC_CORE () { 0x00000020; }") unless defined(&MEMBARRIER_CMD_PRIVATE_EXPEDITED_SYNC_CORE);
    eval("sub MEMBARRIER_CMD_REGISTER_PRIVATE_EXPEDITED_SYNC_CORE () { 0x00000040; }") unless defined(&MEMBARRIER_CMD_REGISTER_PRIVATE_EXPEDITED_SYNC_CORE);
    eval("sub MEMBARRIER_CMD_PRIVATE_EXPEDITED_RSEQ () { 0x00000080; }") unless defined(&MEMBARRIER_CMD_PRIVATE_EXPEDITED_RSEQ);
    eval("sub MEMBARRIER_CMD_REGISTER_PRIVATE_EXPEDITED_RSEQ () { 0x00000100; }") unless defined(&MEMBARRIER_CMD_REGISTER_PRIVATE_EXPEDITED_RSEQ);
    eval("sub MEMBARRIER_CMD_FLAG_CPU () { 0x00000001; }") unless defined(&MEMBARRIER_CMD_FLAG_CPU);
    unless(defined(&_KERNEL)) {
    }
}
1;