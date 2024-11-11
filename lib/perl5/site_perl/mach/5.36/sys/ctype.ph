require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_CTYPE_H_)) {
    eval 'sub _SYS_CTYPE_H_ () {1;}' unless defined(&_SYS_CTYPE_H_);
    if(defined(&_KERNEL)) {
	eval 'sub isspace {
	    my($c) = @_;
    	    eval q({ ($c == ord(\' \' || (c >= \'\\\\t\' && c <= \'\\\\r\'))); });
	}' unless defined(&isspace);
	eval 'sub isascii {
	    my($c) = @_;
    	    eval q({ (($c & ~0x7f) == 0); });
	}' unless defined(&isascii);
	eval 'sub isupper {
	    my($c) = @_;
    	    eval q({ ($c >= ord(\'A\' && c <= \'Z\')); });
	}' unless defined(&isupper);
	eval 'sub islower {
	    my($c) = @_;
    	    eval q({ ($c >= ord(\'a\' && c <= \'z\')); });
	}' unless defined(&islower);
	eval 'sub isalpha {
	    my($c) = @_;
    	    eval q({ ( &isupper($c) ||  &islower($c)); });
	}' unless defined(&isalpha);
	eval 'sub isdigit {
	    my($c) = @_;
    	    eval q({ ($c >= ord(\'0\' && c <= \'9\')); });
	}' unless defined(&isdigit);
	eval 'sub isxdigit {
	    my($c) = @_;
    	    eval q({ ( &isdigit($c) || ($c >= ord(\'A\' && c <= \'F\') || (c >= \'a\' && c <= \'f\'))); });
	}' unless defined(&isxdigit);
	eval 'sub isprint {
	    my($c) = @_;
    	    eval q({ ($c >= ord(\' \' && c <= \'~\')); });
	}' unless defined(&isprint);
	eval 'sub toupper {
	    my($c) = @_;
    	    eval q({ ($c - 0x20 * (($c >= ord(\'a\') && (c <= \'z\')))); });
	}' unless defined(&toupper);
	eval 'sub tolower {
	    my($c) = @_;
    	    eval q({ ($c + 0x20 * (($c >= ord(\'A\') && (c <= \'Z\')))); });
	}' unless defined(&tolower);
    }
}
1;
