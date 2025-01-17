require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_TIIO_H_)) {
    eval 'sub _SYS_TIIO_H_ () {1;}' unless defined(&_SYS_TIIO_H_);
    require 'sys/ioccom.ph';
    eval 'sub IF_ADMIN_STATUS_UP () {1;}' unless defined(&IF_ADMIN_STATUS_UP);
    eval 'sub IF_ADMIN_STATUS_DOWN () {2;}' unless defined(&IF_ADMIN_STATUS_DOWN);
    eval 'sub IF_ADMIN_STATUS_TESTING () {3;}' unless defined(&IF_ADMIN_STATUS_TESTING);
    eval 'sub IF_OPER_STATUS_UP () {1;}' unless defined(&IF_OPER_STATUS_UP);
    eval 'sub IF_OPER_STATUS_DOWN () {2;}' unless defined(&IF_OPER_STATUS_DOWN);
    eval 'sub IF_OPER_STATUS_TESTING () {3;}' unless defined(&IF_OPER_STATUS_TESTING);
    eval 'sub IF_OPER_STATUS_UNKNOWN () {4;}' unless defined(&IF_OPER_STATUS_UNKNOWN);
    eval 'sub IF_OPER_STATUS_DORMANT () {5;}' unless defined(&IF_OPER_STATUS_DORMANT);
    eval("sub TI_PARAM_NONE () { 0x00; }") unless defined(&TI_PARAM_NONE);
    eval("sub TI_PARAM_STAT_TICKS () { 0x01; }") unless defined(&TI_PARAM_STAT_TICKS);
    eval("sub TI_PARAM_RX_COAL_TICKS () { 0x02; }") unless defined(&TI_PARAM_RX_COAL_TICKS);
    eval("sub TI_PARAM_TX_COAL_TICKS () { 0x04; }") unless defined(&TI_PARAM_TX_COAL_TICKS);
    eval("sub TI_PARAM_RX_COAL_BDS () { 0x08; }") unless defined(&TI_PARAM_RX_COAL_BDS);
    eval("sub TI_PARAM_TX_COAL_BDS () { 0x10; }") unless defined(&TI_PARAM_TX_COAL_BDS);
    eval("sub TI_PARAM_TX_BUF_RATIO () { 0x20; }") unless defined(&TI_PARAM_TX_BUF_RATIO);
    eval("sub TI_PARAM_ALL () { 0x2f; }") unless defined(&TI_PARAM_ALL);
    eval("sub TI_TRACE_TYPE_NONE () { 0x00000000; }") unless defined(&TI_TRACE_TYPE_NONE);
    eval("sub TI_TRACE_TYPE_SEND () { 0x00000001; }") unless defined(&TI_TRACE_TYPE_SEND);
    eval("sub TI_TRACE_TYPE_RECV () { 0x00000002; }") unless defined(&TI_TRACE_TYPE_RECV);
    eval("sub TI_TRACE_TYPE_DMA () { 0x00000004; }") unless defined(&TI_TRACE_TYPE_DMA);
    eval("sub TI_TRACE_TYPE_EVENT () { 0x00000008; }") unless defined(&TI_TRACE_TYPE_EVENT);
    eval("sub TI_TRACE_TYPE_COMMAND () { 0x00000010; }") unless defined(&TI_TRACE_TYPE_COMMAND);
    eval("sub TI_TRACE_TYPE_MAC () { 0x00000020; }") unless defined(&TI_TRACE_TYPE_MAC);
    eval("sub TI_TRACE_TYPE_STATS () { 0x00000040; }") unless defined(&TI_TRACE_TYPE_STATS);
    eval("sub TI_TRACE_TYPE_TIMER () { 0x00000080; }") unless defined(&TI_TRACE_TYPE_TIMER);
    eval("sub TI_TRACE_TYPE_DISP () { 0x00000100; }") unless defined(&TI_TRACE_TYPE_DISP);
    eval("sub TI_TRACE_TYPE_MAILBOX () { 0x00000200; }") unless defined(&TI_TRACE_TYPE_MAILBOX);
    eval("sub TI_TRACE_TYPE_RECV_BD () { 0x00000400; }") unless defined(&TI_TRACE_TYPE_RECV_BD);
    eval("sub TI_TRACE_TYPE_LNK_PHY () { 0x00000800; }") unless defined(&TI_TRACE_TYPE_LNK_PHY);
    eval("sub TI_TRACE_TYPE_LNK_NEG () { 0x00001000; }") unless defined(&TI_TRACE_TYPE_LNK_NEG);
    eval("sub TI_TRACE_LEVEL_1 () { 0x10000000; }") unless defined(&TI_TRACE_LEVEL_1);
    eval("sub TI_TRACE_LEVEL_2 () { 0x20000000; }") unless defined(&TI_TRACE_LEVEL_2);
    eval 'sub TIIOCGETSTATS () { &_IOR(ord(\'T\'), 1, \'struct ti_stats\');}' unless defined(&TIIOCGETSTATS);
    eval 'sub TIIOCGETPARAMS () { &_IOR(ord(\'T\'), 2, \'struct ti_params\');}' unless defined(&TIIOCGETPARAMS);
    eval 'sub TIIOCSETPARAMS () { &_IOW(ord(\'T\'), 3, \'struct ti_params\');}' unless defined(&TIIOCSETPARAMS);
    eval 'sub TIIOCSETTRACE () { &_IOW(ord(\'T\'), 11,  &ti_trace_type);}' unless defined(&TIIOCSETTRACE);
    eval 'sub TIIOCGETTRACE () { &_IOWR(ord(\'T\'), 12, \'struct ti_trace_buf\');}' unless defined(&TIIOCGETTRACE);
    eval 'sub ALT_ATTACH () { &_IO(ord(\'a\'), 7);}' unless defined(&ALT_ATTACH);
    eval 'sub ALT_READ_TG_MEM () { &_IOWR(ord(\'a\'), 10, \'struct tg_mem\');}' unless defined(&ALT_READ_TG_MEM);
    eval 'sub ALT_WRITE_TG_MEM () { &_IOWR(ord(\'a\'), 11, \'struct tg_mem\');}' unless defined(&ALT_WRITE_TG_MEM);
    eval 'sub ALT_READ_TG_REG () { &_IOWR(ord(\'a\'), 12, \'struct tg_reg\');}' unless defined(&ALT_READ_TG_REG);
    eval 'sub ALT_WRITE_TG_REG () { &_IOWR(ord(\'a\'), 13, \'struct tg_reg\');}' unless defined(&ALT_WRITE_TG_REG);
}
1;
