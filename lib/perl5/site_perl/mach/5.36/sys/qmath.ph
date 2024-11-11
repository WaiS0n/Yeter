require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_QMATH_H_)) {
    eval 'sub _SYS_QMATH_H_ () {1;}' unless defined(&_SYS_QMATH_H_);
    require 'machine/_stdint.ph';
    if(defined(&__GNUC__)  && !defined(&__clang__)) {
	eval 'sub Q_BT {
	    my($q) = @_;
    	    eval q( &__typeof(1* $q));
	}' unless defined(&Q_BT);
    } else {
	eval 'sub Q_BT {
	    my($q) = @_;
    	    eval q( &__typeof($q));
	}' unless defined(&Q_BT);
    }
    eval 'sub Q_TC {
        my($q, $v) = @_;
	    eval q((( &__typeof($q))($v)));
    }' unless defined(&Q_TC);
    eval 'sub Q_NTBITS {
        my($q) = @_;
	    eval q((( &uint32_t)($sizeof{$q} << 3)));
    }' unless defined(&Q_NTBITS);
    eval 'sub Q_NCBITS () {(( &uint32_t)3);}' unless defined(&Q_NCBITS);
    eval 'sub Q_NFCBITS {
        my($q) = @_;
	    eval q((( &uint32_t)((( &Q_GCRAW($q) & 0x3) + 1) << (( &Q_GCRAW($q) & 0x4) ? 4: 1))));
    }' unless defined(&Q_NFCBITS);
    eval 'sub Q_MINNFBITS {
        my($q) = @_;
	    eval q((( &uint32_t)(2)));
    }' unless defined(&Q_MINNFBITS);
    eval 'sub Q_MAXNFBITS {
        my($q) = @_;
	    eval q((( &uint32_t)( &Q_NTBITS($q) -  &Q_SIGNED($q) -  &Q_NCBITS)));
    }' unless defined(&Q_MAXNFBITS);
    eval 'sub Q_NFBITS {
        my($q) = @_;
	    eval q(( &Q_NFCBITS($q) >  &Q_MAXNFBITS($q) ?  &Q_MAXNFBITS($q) :  &Q_NFCBITS($q)));
    }' unless defined(&Q_NFBITS);
    eval 'sub Q_NIBITS {
        my($q) = @_;
	    eval q((( &uint32_t)( &Q_NTBITS($q) -  &Q_RPSHFT($q) -  &Q_SIGNED($q))));
    }' unless defined(&Q_NIBITS);
    eval 'sub Q_RPSHFT {
        my($q) = @_;
	    eval q(( &Q_NCBITS +  &Q_NFBITS($q)));
    }' unless defined(&Q_RPSHFT);
    eval 'sub Q_SIGNSHFT {
        my($q) = @_;
	    eval q(( &Q_NTBITS($q) - 1));
    }' unless defined(&Q_SIGNSHFT);
    eval 'sub Q_SSIGN {
        my($q, $isneg) = @_;
	    eval q((($q) = (( &Q_SIGNED($q)  && ($isneg)) ? ($q) | (1 <<  &Q_SIGNSHFT($q)) : ($q) & ~(1 <<  &Q_SIGNSHFT($q)))));
    }' unless defined(&Q_SSIGN);
    eval 'sub Q_CRAWMASK {
        my($q) = @_;
	    eval q(0x7);
    }' unless defined(&Q_CRAWMASK);
    eval 'sub Q_SRAWMASK {
        my($q) = @_;
	    eval q((1 <<  &Q_SIGNSHFT($q)));
    }' unless defined(&Q_SRAWMASK);
    eval 'sub Q_GCRAW {
        my($q) = @_;
	    eval q((($q) &  &Q_CRAWMASK($q)));
    }' unless defined(&Q_GCRAW);
    eval 'sub Q_GCVAL {
        my($q) = @_;
	    eval q( &Q_GCRAW($q));
    }' unless defined(&Q_GCVAL);
    eval 'sub Q_SCVAL {
        my($q, $cv) = @_;
	    eval q((($q) = (($q) & ~ &Q_CRAWMASK($q)) | ($cv)));
    }' unless defined(&Q_SCVAL);
    eval 'sub Q_IFRAWMASK {
        my($q) = @_;
	    eval q( &Q_TC($q,  &Q_SIGNED($q) ? ~( &Q_SRAWMASK($q) |  &Q_CRAWMASK($q)) : ~ &Q_CRAWMASK($q)));
    }' unless defined(&Q_IFRAWMASK);
    eval 'sub Q_IFMAXVAL {
        my($q) = @_;
	    eval q( &Q_TC($q,  &Q_IFRAWMASK($q) >>  &Q_NCBITS));
    }' unless defined(&Q_IFMAXVAL);
    eval 'sub Q_IFMINVAL {
        my($q) = @_;
	    eval q( &Q_TC($q,  &Q_SIGNED($q) ? - &Q_IFMAXVAL($q) : 0));
    }' unless defined(&Q_IFMINVAL);
    eval 'sub Q_IFVALIMASK {
        my($q) = @_;
	    eval q( &Q_TC($q, ~ &Q_IFVALFMASK($q)));
    }' unless defined(&Q_IFVALIMASK);
    eval 'sub Q_IFVALFMASK {
        my($q) = @_;
	    eval q( &Q_TC($q, (1 <<  &Q_NFBITS($q)) - 1));
    }' unless defined(&Q_IFVALFMASK);
    eval 'sub Q_GIFRAW {
        my($q) = @_;
	    eval q( &Q_TC($q, ($q) &  &Q_IFRAWMASK($q)));
    }' unless defined(&Q_GIFRAW);
    eval 'sub Q_GIFABSVAL {
        my($q) = @_;
	    eval q( &Q_TC($q,  &Q_GIFRAW($q) >>  &Q_NCBITS));
    }' unless defined(&Q_GIFABSVAL);
    eval 'sub Q_GIFVAL {
        my($q) = @_;
	    eval q( &Q_TC($q,  &Q_LTZ($q) ? - &Q_GIFABSVAL($q) :  &Q_GIFABSVAL($q)));
    }' unless defined(&Q_GIFVAL);
    eval 'sub Q_SIFVAL {
        my($q, $ifv) = @_;
	    eval q((($q) = (($q) & (~( &Q_SRAWMASK($q) |  &Q_IFRAWMASK($q)))) | ( &Q_TC($q,  &Q_ABS($ifv)) <<  &Q_NCBITS) | ( &Q_LTZ($ifv) ? 1 <<  &Q_SIGNSHFT($q) : 0)));
    }' unless defined(&Q_SIFVAL);
    eval 'sub Q_SIFVALS {
        my($q, $iv, $fv) = @_;
	    eval q((($q) = (($q) & (~( &Q_SRAWMASK($q) |  &Q_IFRAWMASK($q)))) | ( &Q_TC($q,  &Q_ABS($iv)) <<  &Q_RPSHFT($q)) | ( &Q_TC($q,  &Q_ABS($fv)) <<  &Q_NCBITS) | ( &Q_LTZ($iv) ||  &Q_LTZ($fv) ? 1 <<  &Q_SIGNSHFT($q) : 0)));
    }' unless defined(&Q_SIFVALS);
    eval 'sub Q_IRAWMASK {
        my($q) = @_;
	    eval q( &Q_TC($q,  &Q_IFRAWMASK($q) & ~ &Q_FRAWMASK($q)));
    }' unless defined(&Q_IRAWMASK);
    eval 'sub Q_IMAXVAL {
        my($q) = @_;
	    eval q( &Q_TC($q,  &Q_IRAWMASK($q) >>  &Q_RPSHFT($q)));
    }' unless defined(&Q_IMAXVAL);
    eval 'sub Q_IMINVAL {
        my($q) = @_;
	    eval q( &Q_TC($q,  &Q_SIGNED($q) ? - &Q_IMAXVAL($q) : 0));
    }' unless defined(&Q_IMINVAL);
    eval 'sub Q_GIRAW {
        my($q) = @_;
	    eval q( &Q_TC($q, ($q) &  &Q_IRAWMASK($q)));
    }' unless defined(&Q_GIRAW);
    eval 'sub Q_GIABSVAL {
        my($q) = @_;
	    eval q( &Q_TC($q,  &Q_GIRAW($q) >>  &Q_RPSHFT($q)));
    }' unless defined(&Q_GIABSVAL);
    eval 'sub Q_GIVAL {
        my($q) = @_;
	    eval q( &Q_TC($q,  &Q_LTZ($q) ? - &Q_GIABSVAL($q) :  &Q_GIABSVAL($q)));
    }' unless defined(&Q_GIVAL);
    eval 'sub Q_SIVAL {
        my($q, $iv) = @_;
	    eval q((($q) = (($q) & ~( &Q_SRAWMASK($q) |  &Q_IRAWMASK($q))) | ( &Q_TC($q,  &Q_ABS($iv)) <<  &Q_RPSHFT($q)) | ( &Q_LTZ($iv) ? 1 <<  &Q_SIGNSHFT($q) : 0)));
    }' unless defined(&Q_SIVAL);
    eval 'sub Q_FRAWMASK {
        my($q) = @_;
	    eval q( &Q_TC($q, ((1 <<  &Q_NFBITS($q)) - 1) <<  &Q_NCBITS));
    }' unless defined(&Q_FRAWMASK);
    eval 'sub Q_FMAXVAL {
        my($q) = @_;
	    eval q( &Q_TC($q,  &Q_FRAWMASK($q) >>  &Q_NCBITS));
    }' unless defined(&Q_FMAXVAL);
    eval 'sub Q_GFRAW {
        my($q) = @_;
	    eval q( &Q_TC($q, ($q) &  &Q_FRAWMASK($q)));
    }' unless defined(&Q_GFRAW);
    eval 'sub Q_GFABSVAL {
        my($q) = @_;
	    eval q( &Q_TC($q,  &Q_GFRAW($q) >>  &Q_NCBITS));
    }' unless defined(&Q_GFABSVAL);
    eval 'sub Q_GFVAL {
        my($q) = @_;
	    eval q( &Q_TC($q,  &Q_LTZ($q) ? - &Q_GFABSVAL($q) :  &Q_GFABSVAL($q)));
    }' unless defined(&Q_GFVAL);
    eval 'sub Q_SFVAL {
        my($q, $fv) = @_;
	    eval q((($q) = (($q) & ~( &Q_SRAWMASK($q) |  &Q_FRAWMASK($q))) | ( &Q_TC($q,  &Q_ABS($fv)) <<  &Q_NCBITS) | ( &Q_LTZ($fv) ? 1 <<  &Q_SIGNSHFT($q) : 0)));
    }' unless defined(&Q_SFVAL);
    eval 'sub Q_BITSPERBASEDOWN {
        my($base) = @_;
	    eval q(( &flsll($base) - 1));
    }' unless defined(&Q_BITSPERBASEDOWN);
    eval 'sub Q_BITSPERBASEUP {
        my($base) = @_;
	    eval q(( &flsll($base) - ( &__builtin_popcountll($base) == 1)));
    }' unless defined(&Q_BITSPERBASEUP);
    eval 'sub Q_BITSPERBASE {
        my($base, $rnd) = @_;
	    eval q( &Q_BITSPERBASE$rnd($base));
    }' unless defined(&Q_BITSPERBASE);
    eval 'sub Q_NIBITS2NCHARS {
        my($nbits, $base) = @_;
	    eval q(({ \'int\'  &_bitsperbase =  &Q_BITSPERBASE($base,  &DOWN); ((($nbits) +  &_bitsperbase - 1) /  &_bitsperbase); }));
    }' unless defined(&Q_NIBITS2NCHARS);
    eval 'sub Q_NFBITS2NCHARS {
        my($nbits, $base) = @_;
	    eval q(($nbits));
    }' unless defined(&Q_NFBITS2NCHARS);
    eval 'sub Q_MAXSTRLEN {
        my($q, $base) = @_;
	    eval q((2+  &Q_NIBITS2NCHARS( &Q_NIBITS($q), $base) +  &Q_NFBITS2NCHARS( &Q_NFBITS($q), $base) +  &Q_SIGNED($q)));
    }' unless defined(&Q_MAXSTRLEN);
    eval 'sub Q_IBITS2CH {
        my($q, $bits, $base) = @_;
	    eval q(({  &__typeof($bits)  &_tmp = ($bits) / ($base); \'int\'  &_idx = ($bits) - ( &_tmp * ($base)); ($bits) =  &_tmp; \\"0123456789abcdef\\"[ &_idx]; }));
    }' unless defined(&Q_IBITS2CH);
    eval 'sub Q_FBITS2CH {
        my($q, $bits, $base) = @_;
	    eval q(({ \'int\'  &_carry = 0,  &_idx,  &_nfbits =  &Q_NFBITS($q),  &_shift = 0;  &if ( &_nfbits >  &Q_BITSPERBASEUP($base)) {  &_shift =  &_nfbits >> 1;  &_carry = ((($bits) & ((1 <<  &_shift) - 1)) * ($base)) >>  &_shift; }  &_idx = (((($bits) >>  &_shift) * ($base)) +  &_carry) >> ( &_nfbits -  &_shift); ($bits) *= ($base); ($bits) &= (1 <<  &_nfbits) - 1; \\"0123456789abcdef\\"[ &_idx]; }));
    }' unless defined(&Q_FBITS2CH);
    eval 'sub Q_TOSTR {
        my($q, $prec, $base, $s, $slen) = @_;
	    eval q(({ \'char\' * &_r, * &_s = $s; \'int\'  &_i;  &if ( &Q_LTZ($q)  && (( &ptrdiff_t)($slen)) > 0) * &_s++ = ord(\'-\';							Q_BT(q) _part = Q_GIABSVAL(q);						_r = _s;								do {										 				if ((_s - (s)) < ((ptrdiff_t)(slen)))						*_s++ = Q_IBITS2CH(q, _part, base);				else										_r = NULL;						} while (_part > 0 && _r != NULL);					if (!((_s - (s)) < ((ptrdiff_t)(slen))))					_r = NULL;							_i = (_s - _r) >> 1;  		while (_i-- > 0 && _r != NULL) {						 			*_s = *(_r + _i);  			*(_r + _i) = *(_s - _i - 1);  		*(_s - _i - 1) = *_s;  		}									_i = (prec);								if (_i != 0 && _r != NULL) {							if ((_s - (s)) < ((ptrdiff_t)(slen)))						*_s++ = \'.\';							else										_r = NULL;							_part = Q_GFABSVAL(q);							if (_i < 0 || _i > (int)Q_NFBITS(q))						_i = Q_NFBITS(q);						while (_i-- > 0 && _r != NULL) {						 				if ((_s - (s)) < ((ptrdiff_t)(slen)))						*_s++ = Q_FBITS2CH(q, _part, base);				else										_r = NULL;						}								}									if ((_s - (s)) < ((ptrdiff_t)(slen)) && _r != NULL)				*_s = \'\\\\0\';							else {										_r = NULL;								if (((ptrdiff_t)(slen)) > 0)							*(s) = \'\\\\0\'); } ( &_r !=  &NULL ?  &_s :  &_r); }));
    }' unless defined(&Q_TOSTR);
    eval 'sub Q_SHL {
        my($q, $iv) = @_;
	    eval q(( &Q_LTZ($iv) ? -( &int64_t)( &Q_ABS($iv) <<  &Q_NFBITS($q)) :  &Q_TC($q, $iv) <<  &Q_NFBITS($q)));
    }' unless defined(&Q_SHL);
    eval 'sub Q_RELPREC {
        my($a, $b) = @_;
	    eval q(( &Q_NFBITS -  &Q_NFBITS($b)));
    }' unless defined(&Q_RELPREC);
    eval 'sub Q_CTRLINI {
        my($rpshft) = @_;
	    eval q(((($rpshft) <= 8) ? ((($rpshft) - 1) >> 1) : (0x4 | ((($rpshft) - 1) >> 4))));
    }' unless defined(&Q_CTRLINI);
    eval 'sub Q_DFV2BFV {
        my($dfv, $nfbits) = @_;
	    eval q(({  &uint64_t  &_bfv = 0,  &_thresh = 5,  &_tmp = $dfv; \'int\'  &_i = $sizeof{\\"\\"$dfv} - 1;  &while (-- &_i > 0) { &_thresh *= 10;}  &_i = ($nfbits) - 1;  &while ( &_i >= 0) {  &if ( &_thresh <=  &_tmp) {  &_bfv |= 1 <<  &_i;  &_tmp =  &_tmp -  &_thresh; }  &_i--;  &_tmp <<= 1; }  &_bfv; }));
    }' unless defined(&Q_DFV2BFV);
    eval 'sub Q_INI {
        my($q, $iv, $dfv, $rpshft) = @_;
	    eval q(({ (*($q)) =  &Q_CTRLINI($rpshft);  &Q_SIFVALS(*($q), $iv,  &Q_DFV2BFV($dfv,  &Q_NFBITS(*($q)))); }));
    }' unless defined(&Q_INI);
    eval 'sub Q_PRECEQ {
        my($a, $b) = @_;
	    eval q(( &Q_NFBITS($a) ==  &Q_NFBITS($b)));
    }' unless defined(&Q_PRECEQ);
    eval 'sub Q_SIGNED {
        my($n) = @_;
	    eval q(( &Q_TC($n, -1) < 0));
    }' unless defined(&Q_SIGNED);
    eval 'sub Q_LTZ {
        my($n) = @_;
	    eval q(( &Q_SIGNED($n)  && (($n) &  &Q_SRAWMASK($n))));
    }' unless defined(&Q_LTZ);
    eval 'sub Q_ABS {
        my($n) = @_;
	    eval q(( &Q_LTZ($n) ? -($n) : ($n)));
    }' unless defined(&Q_ABS);
    eval 'sub Q_QABS {
        my($q) = @_;
	    eval q(( &Q_SIGNED($q) ? ($q) & ~ &Q_SRAWMASK($q) : ($q)));
    }' unless defined(&Q_QABS);
    eval 'sub Q_Q2F {
        my($q) = @_;
	    eval q(( &Q_GIFVAL / (1 <<  &Q_NFBITS($q))));
    }' unless defined(&Q_Q2F);
    eval 'sub Q_Q2D {
        my($q) = @_;
	    eval q(( &Q_GIFVAL / (1 <<  &Q_NFBITS($q))));
    }' unless defined(&Q_Q2D);
    eval 'sub Q_QCMPQ {
        my($a, $b, $intcmp, $fraccmp) = @_;
	    eval q((( &Q_GIVAL($a) $intcmp  &Q_GIVAL($b)) || (( &Q_GIVAL($a) ==  &Q_GIVAL($b))  && ( &Q_GFVAL($a) $fraccmp  &Q_GFVAL($b)))));
    }' unless defined(&Q_QCMPQ);
    eval 'sub Q_QLTQ {
        my($a, $b) = @_;
	    eval q( &Q_QCMPQ($a, $b, <, <));
    }' unless defined(&Q_QLTQ);
    eval 'sub Q_QLEQ {
        my($a, $b) = @_;
	    eval q( &Q_QCMPQ($a, $b, <, <=));
    }' unless defined(&Q_QLEQ);
    eval 'sub Q_QGTQ {
        my($a, $b) = @_;
	    eval q( &Q_QCMPQ($a, $b, >, >));
    }' unless defined(&Q_QGTQ);
    eval 'sub Q_QGEQ {
        my($a, $b) = @_;
	    eval q( &Q_QCMPQ($a, $b, >, >=));
    }' unless defined(&Q_QGEQ);
    eval 'sub Q_QEQ {
        my($a, $b) = @_;
	    eval q( &Q_QCMPQ($a, $b, ==, ==));
    }' unless defined(&Q_QEQ);
    eval 'sub Q_QNEQ {
        my($a, $b) = @_;
	    eval q( &Q_QCMPQ($a, $b, !=, !=));
    }' unless defined(&Q_QNEQ);
    eval 'sub Q_QMAXQ {
        my($a, $b) = @_;
	    eval q(( &Q_GT($a, $b) ? ($a) : ($b)));
    }' unless defined(&Q_QMAXQ);
    eval 'sub Q_QMINQ {
        my($a, $b) = @_;
	    eval q(( &Q_LT($a, $b) ? ($a) : ($b)));
    }' unless defined(&Q_QMINQ);
    eval 'sub Q_QCANREPQ {
        my($a, $b) = @_;
	    eval q((((( &Q_LTZ($a)  &&  &Q_SIGNED($b)) || ! &Q_LTZ($a))  &&  &Q_GIABSVAL($a) <=  &Q_TC($a,  &Q_IMAXVAL($b))  &&  &Q_GFABSVAL($a) <=  &Q_TC($a,  &Q_FMAXVAL($b))) ? 0:  &EOVERFLOW));
    }' unless defined(&Q_QCANREPQ);
    eval 'sub Q_QCANREPI {
        my($q, $i) = @_;
	    eval q((((( &Q_LTZ($i)  &&  &Q_SIGNED($q)) || ! &Q_LTZ($i))  &&  &Q_ABS($i) <=  &Q_TC($i,  &Q_IMAXVAL($q))) ? 0:  &EOVERFLOW));
    }' unless defined(&Q_QCANREPI);
    eval 'sub Q_DEBUGFMT_ {
        my($prefmt, $postfmt, $mod, $hexpad) = @_;
	    eval q($prefmt \\"\\\\\\"%s\\\\\\"@%p\\" \\"\\\\n\\\\ttype=%c%dq_t, \\" \\"Qm.n=Q%d.%d, \\" \\"rpshft=%d, \\" \\"imin=0x%0\\" $mod \\"x, \\" \\"imax=0x%0\\" $mod \\"x\\" \\"\\\\n\\\\tqraw=0x%0\\" $hexpad $mod \\"x\\" \\"\\\\n\\\\timask=0x%0\\" $hexpad $mod \\"x, \\" \\"fmask=0x%0\\" $hexpad $mod \\"x, \\" \\"cmask=0x%0\\" $hexpad $mod \\"x, \\" \\"ifmask=0x%0\\" $hexpad $mod \\"x\\" \\"\\\\n\\\\tiraw=0x%0\\" $hexpad $mod \\"x, \\" \\"iabsval=0x%\\" $mod \\"x, \\" \\"ival=0x%\\" $mod \\"x\\" \\"\\\\n\\\\tfraw=0x%0\\" $hexpad $mod \\"x, \\" \\"fabsval=0x%\\" $mod \\"x, \\" \\"fval=0x%\\" $mod \\"x\\" \\"%s\\" $postfmt);
    }' unless defined(&Q_DEBUGFMT_);
    eval 'sub Q_DEBUGFMT {
        my($q, $prefmt, $postfmt) = @_;
	    eval q($sizeof{$q} == 8?  &Q_DEBUGFMT_($prefmt, $postfmt,  &j, 16) : $sizeof{$q} == 4?  &Q_DEBUGFMT_($prefmt, $postfmt, , 8) : $sizeof{$q} == 2?  &Q_DEBUGFMT_($prefmt, $postfmt,  &h, 4) : $sizeof{$q} == 1?  &Q_DEBUGFMT_($prefmt, $postfmt,  &hh, 2) : $prefmt \\"\\\\\\"%s\\\\\\"@%p: invalid\\" $postfmt);
    }' unless defined(&Q_DEBUGFMT);
    eval 'sub Q_DEBUG {
        my($q, $prefmt, $postfmt, $incfmt) = @_;
	    eval q( &Q_DEBUGFMT($q, $prefmt, $postfmt) , $q , ($q) ,  &Q_SIGNED($q) ? ord(\'s\' : \'u\') ,  &Q_NTBITS($q) ,  &Q_NIBITS($q) ,  &Q_NFBITS($q) ,  &Q_RPSHFT($q) ,  &Q_IMINVAL($q) ,  &Q_IMAXVAL($q) , ($q) ,  &Q_IRAWMASK($q) ,  &Q_FRAWMASK($q) ,  &Q_TC($q,  &Q_CRAWMASK($q)) ,  &Q_IFRAWMASK($q) ,  &Q_GIRAW($q) ,  &Q_GIABSVAL($q) ,  &Q_GIVAL($q) ,  &Q_GFRAW($q) ,  &Q_GFABSVAL($q) ,  &Q_GFVAL($q) , ($incfmt) ?  &Q_DEBUGFMT($q, \\"\\\\nfmt:\\", \\"\\") : \\"\\");
    }' unless defined(&Q_DEBUG);
    eval 'sub Q_NORMPREC {
        my($a, $b) = @_;
	    eval q(({ \'int\'  &_perr = 0,  &_relprec =  &Q_RELPREC(*($a), $b);  &if ( &_relprec != 0)  &_perr =  &ERANGE;  &_perr; }));
    }' unless defined(&Q_NORMPREC);
    eval 'sub Q_QCLONEQ {
        my($l, $r) = @_;
	    eval q(({  &Q_BT(*($l))  &_l =  &Q_GCVAL($r); \'int\'  &_err =  &Q_QCANREPQ($r,  &_l);  &if (! &_err) { *($l) =  &_l;  &Q_SIFVAL(*($l),  &Q_GIFVAL($r)); }  &_err; }));
    }' unless defined(&Q_QCLONEQ);
    eval 'sub Q_QCPYVALQ {
        my($l, $r) = @_;
	    eval q(({ \'int\'  &_err =  &Q_QCANREPQ($r, *($l));  &if (! &_err)  &Q_SIFVALS(*($l),  &Q_GIVAL($r),  &Q_GFVAL($r));  &_err; }));
    }' unless defined(&Q_QCPYVALQ);
    eval 'sub Q_QADDSUBQ {
        my($a, $b, $eop) = @_;
	    eval q(({ \'int\'  &_aserr;  &if (( &_aserr =  &Q_NORMPREC($a, $b)))  &while (0);  &else  &if (($eop) == ord(\'+\')) {  &if ( &Q_IFMAXVAL(*($a)) -  &Q_GIFABSVAL($b) <  &Q_GIFVAL(*($a)))  &_aserr =  &EOVERFLOW;  &else  &Q_SIFVAL(*($a),  &Q_GIFVAL(*($a)) +  &Q_TC(*($a),  &Q_GIFABSVAL($b))); }  &else {  &if ( &Q_IFMINVAL(*($a)) +  &Q_GIFABSVAL($b) >  &Q_GIFVAL(*($a)))  &_aserr =  &EOVERFLOW;  &else  &Q_SIFVAL(*($a),  &Q_GIFVAL(*($a)) -  &Q_TC(*($a),  &Q_GIFABSVAL($b))); }  &_aserr; }));
    }' unless defined(&Q_QADDSUBQ);
    eval 'sub Q_QADDQ {
        my($a, $b) = @_;
	    eval q( &Q_QADDSUBQ($a, $b, ( &Q_LTZ($b) ? ord(\'-\' : \'+\'))));
    }' unless defined(&Q_QADDQ);
    eval 'sub Q_QSUBQ {
        my($a, $b) = @_;
	    eval q( &Q_QADDSUBQ($a, $b, ( &Q_LTZ($b) ? ord(\'+\' : \'-\'))));
    }' unless defined(&Q_QSUBQ);
    eval 'sub Q_QDIVQ {
        my($a, $b) = @_;
	    eval q(({ \'int\'  &_err;  &if (( &_err =  &Q_NORMPREC($a, $b)))  &while (0);  &else  &if ( &Q_GIFABSVAL($b) == 0|| (! &Q_SIGNED(*($a))  &&  &Q_LTZ($b)))  &_err =  &EINVAL;  &else  &if ( &Q_GIFABSVAL(*($a)) != 0) {  &Q_SIFVAL(*($a), (( &Q_GIVAL(*($a)) <<  &Q_NFBITS(*($a))) /  &Q_GIFVAL($b)) + ( &Q_GFVAL($b) == 0? 0: (( &Q_GFVAL(*($a)) <<  &Q_NFBITS(*($a))) /  &Q_GFVAL($b)))); }  &_err; }));
    }' unless defined(&Q_QDIVQ);
    eval 'sub Q_QMULQ {
        my($a, $b) = @_;
	    eval q(({ \'int\'  &_mulerr;  &if (( &_mulerr =  &Q_NORMPREC($a, $b)))  &while (0);  &else  &if (! &Q_SIGNED(*($a))  &&  &Q_LTZ($b))  &_mulerr =  &EINVAL;  &else  &if ( &Q_GIFABSVAL($b) != 0 &&  &Q_IFMAXVAL(*($a)) /  &Q_GIFABSVAL($b) <  &Q_GIFABSVAL(*($a)))  &_mulerr =  &EOVERFLOW;  &else  &Q_SIFVAL(*($a), ( &Q_GIFVAL(*($a)) *  &Q_GIFVAL($b)) >>  &Q_NFBITS(*($a)));  &_mulerr; }));
    }' unless defined(&Q_QMULQ);
    eval 'sub Q_QCPYVALI {
        my($q, $i) = @_;
	    eval q(({ \'int\'  &_err =  &Q_QCANREPI(*($q), $i);  &if (! &_err)  &Q_SIFVAL(*($q),  &Q_SHL(*($q), $i));  &_err; }));
    }' unless defined(&Q_QCPYVALI);
    eval 'sub Q_QADDSUBI {
        my($q, $i, $eop) = @_;
	    eval q(({ \'int\'  &_aserr = 0;  &if ( &Q_NTBITS(*($q)) < ( &uint32_t) &flsll( &Q_ABS($i)))  &_aserr =  &EOVERFLOW;  &else  &if (($eop) == ord(\'+\')) {  &if ( &Q_IMAXVAL(*($q)) -  &Q_TC(*($q),  &Q_ABS($i)) <  &Q_GIVAL(*($q)))  &_aserr =  &EOVERFLOW;  &else  &Q_SIFVAL(*($q),  &Q_GIFVAL(*($q)) +  &Q_SHL(*($q),  &Q_ABS($i))); }  &else {  &if ( &Q_IMINVAL(*($q)) +  &Q_ABS($i) >  &Q_GIVAL(*($q)))  &_aserr =  &EOVERFLOW;  &else  &Q_SIFVAL(*($q),  &Q_GIFVAL(*($q)) -  &Q_SHL(*($q),  &Q_ABS($i))); }  &_aserr; }));
    }' unless defined(&Q_QADDSUBI);
    eval 'sub Q_QADDI {
        my($q, $i) = @_;
	    eval q( &Q_QADDSUBI($q, $i, ( &Q_LTZ($i) ? ord(\'-\' : \'+\'))));
    }' unless defined(&Q_QADDI);
    eval 'sub Q_QSUBI {
        my($q, $i) = @_;
	    eval q( &Q_QADDSUBI($q, $i, ( &Q_LTZ($i) ? ord(\'+\' : \'-\'))));
    }' unless defined(&Q_QSUBI);
    eval 'sub Q_QDIVI {
        my($q, $i) = @_;
	    eval q(({ \'int\'  &_diverr = 0;  &if (($i) == 0|| (! &Q_SIGNED(*($q))  &&  &Q_LTZ($i)))  &_diverr =  &EINVAL;  &else  &if ( &Q_GIFABSVAL(*($q)) != 0) {  &Q_SIFVAL(*($q),  &Q_GIFVAL(*($q)) /  &Q_TC(*($q), $i));  &if ( &Q_GIFABSVAL(*($q)) == 0)  &_diverr =  &ERANGE; }  &_diverr; }));
    }' unless defined(&Q_QDIVI);
    eval 'sub Q_QMULI {
        my($q, $i) = @_;
	    eval q(({ \'int\'  &_mulerr = 0;  &if (! &Q_SIGNED(*($q))  &&  &Q_LTZ($i))  &_mulerr =  &EINVAL;  &else  &if (($i) != 0 &&  &Q_IFMAXVAL(*($q)) /  &Q_TC(*($q),  &Q_ABS($i)) <  &Q_GIFABSVAL(*($q)))  &_mulerr =  &EOVERFLOW;  &else  &Q_SIFVAL(*($q),  &Q_GIFVAL(*($q)) *  &Q_TC(*($q), $i));  &_mulerr; }));
    }' unless defined(&Q_QMULI);
    eval 'sub Q_QFRACI {
        my($q, $in, $id) = @_;
	    eval q(({  &uint64_t  &_tmp; \'int\'  &_err = 0;  &if (($id) == 0)  &_err =  &EINVAL;  &else  &if (($in) == 0)  &Q_SIFVAL(*($q), $in);  &else  &if (( &_tmp =  &Q_ABS($in)) > ( &UINT64_MAX >>  &Q_RPSHFT(*($q))))  &_err =  &EOVERFLOW;  &else {  &_tmp =  &Q_SHL(*($q),  &_tmp) /  &Q_ABS($id);  &if ( &Q_QCANREPI(*($q),  &_tmp &  &Q_IFVALIMASK(*($q))))  &_err =  &EOVERFLOW;  &else {  &Q_SIFVAL(*($q),  &_tmp);  &Q_SSIGN(*($q), ( &Q_LTZ($in)  && ! &Q_LTZ($id)) || (! &Q_LTZ($in)  &&  &Q_LTZ($id)));  &if ( &_tmp == 0)  &_err =  &ERANGE; } }  &_err; }));
    }' unless defined(&Q_QFRACI);
}
1;
