require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_MSGBUF_H_)) {
    eval 'sub _SYS_MSGBUF_H_ () {1;}' unless defined(&_SYS_MSGBUF_H_);
    require 'sys/lock.ph';
    require 'sys/mutex.ph';
    eval 'sub MSG_MAGIC () {0x63062;}' unless defined(&MSG_MAGIC);
    eval 'sub MSGBUF_NEEDNL () {0x1;}' unless defined(&MSGBUF_NEEDNL);
    eval 'sub MSGBUF_WRAP () {0x2;}' unless defined(&MSGBUF_WRAP);
    eval 'sub MSGBUF_SEQNORM {
        my($mbp, $seq) = @_;
	    eval q(((($seq) + ($mbp)-> &msg_seqmod) % ($mbp)-> &msg_seqmod));
    }' unless defined(&MSGBUF_SEQNORM);
    eval 'sub MSGBUF_SEQ_TO_POS {
        my($mbp, $seq) = @_;
	    eval q((($seq) % ($mbp)-> &msg_size));
    }' unless defined(&MSGBUF_SEQ_TO_POS);
    eval 'sub MSGBUF_SEQADD {
        my($mbp, $seq1, $seq2) = @_;
	    eval q(((($seq1) + ($seq2)) % ($mbp)-> &msg_seqmod));
    }' unless defined(&MSGBUF_SEQADD);
    eval 'sub MSGBUF_SEQSUB {
        my($mbp, $seq1, $seq2) = @_;
	    eval q((($seq1) >= ($seq2) ? ($seq1) - ($seq2) : ($seq1) + ($mbp)-> &msg_seqmod - ($seq2)));
    }' unless defined(&MSGBUF_SEQSUB);
    if(defined(&_KERNEL)) {
	unless(defined(&MSGBUF_SIZE)) {
	    eval 'sub MSGBUF_SIZE () {(32768* 3);}' unless defined(&MSGBUF_SIZE);
	}
    }
}
1;
