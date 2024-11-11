require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_MIXER_H_)) {
    eval 'sub _MIXER_H_ () {1;}' unless defined(&_MIXER_H_);
    require 'sys/cdefs.ph';
    require 'sys/queue.ph';
    require 'sys/soundcard.ph';
    require 'limits.ph';
    eval 'sub MIX_ISSET {
        my($n,$f) = @_;
	    eval q((((1 << ($n)) & ($f)) ? 1: 0));
    }' unless defined(&MIX_ISSET);
    eval 'sub MIX_ISDEV {
        my($m,$n) = @_;
	    eval q( &MIX_ISSET($n, ($m)-> &devmask));
    }' unless defined(&MIX_ISDEV);
    eval 'sub MIX_ISMUTE {
        my($m,$n) = @_;
	    eval q( &MIX_ISSET($n, ($m)-> &mutemask));
    }' unless defined(&MIX_ISMUTE);
    eval 'sub MIX_ISREC {
        my($m,$n) = @_;
	    eval q( &MIX_ISSET($n, ($m)-> &recmask));
    }' unless defined(&MIX_ISREC);
    eval 'sub MIX_ISRECSRC {
        my($m,$n) = @_;
	    eval q( &MIX_ISSET($n, ($m)-> &recsrc));
    }' unless defined(&MIX_ISRECSRC);
    eval 'sub MIX_VOLMIN () {0.0 &f;}' unless defined(&MIX_VOLMIN);
    eval 'sub MIX_VOLMAX () {1.0 &f;}' unless defined(&MIX_VOLMAX);
    eval 'sub MIX_VOLNORM {
        my($v) = @_;
	    eval q((($v) / 100.0 &f));
    }' unless defined(&MIX_VOLNORM);
    eval 'sub MIX_VOLDENORM {
        my($v) = @_;
	    eval q(((($v) * 100.0 &f + 0.5 &f)));
    }' unless defined(&MIX_VOLDENORM);
    eval 'sub MIX_MUTE () {0x1;}' unless defined(&MIX_MUTE);
    eval 'sub MIX_UNMUTE () {0x2;}' unless defined(&MIX_UNMUTE);
    eval 'sub MIX_TOGGLEMUTE () {0x4;}' unless defined(&MIX_TOGGLEMUTE);
    eval 'sub MIX_ADDRECSRC () {0x1;}' unless defined(&MIX_ADDRECSRC);
    eval 'sub MIX_REMOVERECSRC () {0x2;}' unless defined(&MIX_REMOVERECSRC);
    eval 'sub MIX_SETRECSRC () {0x4;}' unless defined(&MIX_SETRECSRC);
    eval 'sub MIX_TOGGLERECSRC () {0x8;}' unless defined(&MIX_TOGGLERECSRC);
    eval 'sub MIX_MODE_MIXER () {0x1;}' unless defined(&MIX_MODE_MIXER);
    eval 'sub MIX_MODE_PLAY () {0x2;}' unless defined(&MIX_MODE_PLAY);
    eval 'sub MIX_MODE_REC () {0x4;}' unless defined(&MIX_MODE_REC);
}
1;
