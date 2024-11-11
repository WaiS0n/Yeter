require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_RTPRIO_H_)) {
    eval 'sub _SYS_RTPRIO_H_ () {1;}' unless defined(&_SYS_RTPRIO_H_);
    require 'sys/priority.ph';
    eval 'sub RTP_PRIO_ITHD () { &PRI_ITHD;}' unless defined(&RTP_PRIO_ITHD);
    eval 'sub RTP_PRIO_REALTIME () { &PRI_REALTIME;}' unless defined(&RTP_PRIO_REALTIME);
    eval 'sub RTP_PRIO_NORMAL () { &PRI_TIMESHARE;}' unless defined(&RTP_PRIO_NORMAL);
    eval 'sub RTP_PRIO_IDLE () { &PRI_IDLE;}' unless defined(&RTP_PRIO_IDLE);
    eval 'sub RTP_PRIO_FIFO_BIT () { &PRI_FIFO_BIT;}' unless defined(&RTP_PRIO_FIFO_BIT);
    eval 'sub RTP_PRIO_FIFO () { &PRI_FIFO;}' unless defined(&RTP_PRIO_FIFO);
    eval 'sub RTP_PRIO_BASE {
        my($P) = @_;
	    eval q( &PRI_BASE($P));
    }' unless defined(&RTP_PRIO_BASE);
    eval 'sub RTP_PRIO_IS_REALTIME {
        my($P) = @_;
	    eval q( &PRI_IS_REALTIME($P));
    }' unless defined(&RTP_PRIO_IS_REALTIME);
    eval 'sub RTP_PRIO_NEED_RR {
        my($P) = @_;
	    eval q( &PRI_NEED_RR($P));
    }' unless defined(&RTP_PRIO_NEED_RR);
    eval 'sub RTP_PRIO_MIN () {0;}' unless defined(&RTP_PRIO_MIN);
    eval 'sub RTP_PRIO_MAX () {31;}' unless defined(&RTP_PRIO_MAX);
    eval 'sub RTP_LOOKUP () {0;}' unless defined(&RTP_LOOKUP);
    eval 'sub RTP_SET () {1;}' unless defined(&RTP_SET);
    unless(defined(&LOCORE)) {
	if(defined(&_KERNEL)) {
	}
    }
    unless(defined(&_KERNEL)) {
	require 'sys/cdefs.ph';
    }
}
1;
