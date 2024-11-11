require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_FTS_H_)) {
    eval 'sub _FTS_H_ () {1;}' unless defined(&_FTS_H_);
    require 'sys/_types.ph';
    eval 'sub FTS_COMFOLLOW () {0x1;}' unless defined(&FTS_COMFOLLOW);
    eval 'sub FTS_LOGICAL () {0x2;}' unless defined(&FTS_LOGICAL);
    eval 'sub FTS_NOCHDIR () {0x4;}' unless defined(&FTS_NOCHDIR);
    eval 'sub FTS_NOSTAT () {0x8;}' unless defined(&FTS_NOSTAT);
    eval 'sub FTS_PHYSICAL () {0x10;}' unless defined(&FTS_PHYSICAL);
    eval 'sub FTS_SEEDOT () {0x20;}' unless defined(&FTS_SEEDOT);
    eval 'sub FTS_XDEV () {0x40;}' unless defined(&FTS_XDEV);
    eval 'sub FTS_WHITEOUT () {0x80;}' unless defined(&FTS_WHITEOUT);
    eval 'sub FTS_OPTIONMASK () {0xff;}' unless defined(&FTS_OPTIONMASK);
    eval 'sub FTS_NAMEONLY () {0x100;}' unless defined(&FTS_NAMEONLY);
    eval 'sub FTS_STOP () {0x200;}' unless defined(&FTS_STOP);
    eval 'sub fts_bignum () { &fts_number;}' unless defined(&fts_bignum);
    eval 'sub FTS_ROOTPARENTLEVEL () {-1;}' unless defined(&FTS_ROOTPARENTLEVEL);
    eval 'sub FTS_ROOTLEVEL () {0;}' unless defined(&FTS_ROOTLEVEL);
    eval 'sub FTS_D () {1;}' unless defined(&FTS_D);
    eval 'sub FTS_DC () {2;}' unless defined(&FTS_DC);
    eval 'sub FTS_DEFAULT () {3;}' unless defined(&FTS_DEFAULT);
    eval 'sub FTS_DNR () {4;}' unless defined(&FTS_DNR);
    eval 'sub FTS_DOT () {5;}' unless defined(&FTS_DOT);
    eval 'sub FTS_DP () {6;}' unless defined(&FTS_DP);
    eval 'sub FTS_ERR () {7;}' unless defined(&FTS_ERR);
    eval 'sub FTS_F () {8;}' unless defined(&FTS_F);
    eval 'sub FTS_INIT () {9;}' unless defined(&FTS_INIT);
    eval 'sub FTS_NS () {10;}' unless defined(&FTS_NS);
    eval 'sub FTS_NSOK () {11;}' unless defined(&FTS_NSOK);
    eval 'sub FTS_SL () {12;}' unless defined(&FTS_SL);
    eval 'sub FTS_SLNONE () {13;}' unless defined(&FTS_SLNONE);
    eval 'sub FTS_W () {14;}' unless defined(&FTS_W);
    eval 'sub FTS_DONTCHDIR () {0x1;}' unless defined(&FTS_DONTCHDIR);
    eval 'sub FTS_SYMFOLLOW () {0x2;}' unless defined(&FTS_SYMFOLLOW);
    eval 'sub FTS_ISW () {0x4;}' unless defined(&FTS_ISW);
    eval 'sub FTS_AGAIN () {1;}' unless defined(&FTS_AGAIN);
    eval 'sub FTS_FOLLOW () {2;}' unless defined(&FTS_FOLLOW);
    eval 'sub FTS_NOINSTR () {3;}' unless defined(&FTS_NOINSTR);
    eval 'sub FTS_SKIP () {4;}' unless defined(&FTS_SKIP);
    require 'sys/cdefs.ph';
    eval 'sub fts_get_clientptr {
        my($fts) = @_;
	    eval q((($fts)-> &fts_clientptr));
    }' unless defined(&fts_get_clientptr);
    eval 'sub fts_get_stream {
        my($ftsent) = @_;
	    eval q((($ftsent)-> &fts_fts));
    }' unless defined(&fts_get_stream);
}
1;
