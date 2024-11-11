require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SKEIN_H_)) {
    eval 'sub _SKEIN_H_ () {1;}' unless defined(&_SKEIN_H_);
    if(defined(&__cplusplus)) {
    }
    unless(defined(&_KERNEL)) {
	require 'stddef.ph';
    }
    require 'skein_port.ph';
    eval("sub SKEIN_SUCCESS () { 0; }") unless defined(&SKEIN_SUCCESS);
    eval("sub SKEIN_FAIL () { 1; }") unless defined(&SKEIN_FAIL);
    eval("sub SKEIN_BAD_HASHLEN () { 2; }") unless defined(&SKEIN_BAD_HASHLEN);
    eval 'sub SKEIN_MODIFIER_WORDS () {( 2);}' unless defined(&SKEIN_MODIFIER_WORDS);
    eval 'sub SKEIN_256_STATE_WORDS () {( 4);}' unless defined(&SKEIN_256_STATE_WORDS);
    eval 'sub SKEIN_512_STATE_WORDS () {( 8);}' unless defined(&SKEIN_512_STATE_WORDS);
    eval 'sub SKEIN1024_STATE_WORDS () {(16);}' unless defined(&SKEIN1024_STATE_WORDS);
    eval 'sub SKEIN_MAX_STATE_WORDS () {(16);}' unless defined(&SKEIN_MAX_STATE_WORDS);
    eval 'sub SKEIN_256_STATE_BYTES () {( 8* &SKEIN_256_STATE_WORDS);}' unless defined(&SKEIN_256_STATE_BYTES);
    eval 'sub SKEIN_512_STATE_BYTES () {( 8* &SKEIN_512_STATE_WORDS);}' unless defined(&SKEIN_512_STATE_BYTES);
    eval 'sub SKEIN1024_STATE_BYTES () {( 8* &SKEIN1024_STATE_WORDS);}' unless defined(&SKEIN1024_STATE_BYTES);
    eval 'sub SKEIN_256_STATE_BITS () {(64* &SKEIN_256_STATE_WORDS);}' unless defined(&SKEIN_256_STATE_BITS);
    eval 'sub SKEIN_512_STATE_BITS () {(64* &SKEIN_512_STATE_WORDS);}' unless defined(&SKEIN_512_STATE_BITS);
    eval 'sub SKEIN1024_STATE_BITS () {(64* &SKEIN1024_STATE_WORDS);}' unless defined(&SKEIN1024_STATE_BITS);
    eval 'sub SKEIN_256_BLOCK_BYTES () {( 8* &SKEIN_256_STATE_WORDS);}' unless defined(&SKEIN_256_BLOCK_BYTES);
    eval 'sub SKEIN_512_BLOCK_BYTES () {( 8* &SKEIN_512_STATE_WORDS);}' unless defined(&SKEIN_512_BLOCK_BYTES);
    eval 'sub SKEIN1024_BLOCK_BYTES () {( 8* &SKEIN1024_STATE_WORDS);}' unless defined(&SKEIN1024_BLOCK_BYTES);
    unless(defined(&SKEIN_TREE_HASH)) {
	eval 'sub SKEIN_TREE_HASH () {(1);}' unless defined(&SKEIN_TREE_HASH);
    }
    if((defined(&SKEIN_TREE_HASH) ? &SKEIN_TREE_HASH : undef)) {
    }
    eval 'sub SKEIN_T1_BIT {
        my($BIT) = @_;
	    eval q((($BIT) - 64));
    }' unless defined(&SKEIN_T1_BIT);
    eval 'sub SKEIN_T1_POS_TREE_LVL () { &SKEIN_T1_BIT(112);}' unless defined(&SKEIN_T1_POS_TREE_LVL);
    eval 'sub SKEIN_T1_POS_BIT_PAD () { &SKEIN_T1_BIT(119);}' unless defined(&SKEIN_T1_POS_BIT_PAD);
    eval 'sub SKEIN_T1_POS_BLK_TYPE () { &SKEIN_T1_BIT(120);}' unless defined(&SKEIN_T1_POS_BLK_TYPE);
    eval 'sub SKEIN_T1_POS_FIRST () { &SKEIN_T1_BIT(126);}' unless defined(&SKEIN_T1_POS_FIRST);
    eval 'sub SKEIN_T1_POS_FINAL () { &SKEIN_T1_BIT(127);}' unless defined(&SKEIN_T1_POS_FINAL);
    eval 'sub SKEIN_T1_FLAG_FIRST () {((( &u64b_t) 1) <<  &SKEIN_T1_POS_FIRST);}' unless defined(&SKEIN_T1_FLAG_FIRST);
    eval 'sub SKEIN_T1_FLAG_FINAL () {((( &u64b_t) 1) <<  &SKEIN_T1_POS_FINAL);}' unless defined(&SKEIN_T1_FLAG_FINAL);
    eval 'sub SKEIN_T1_FLAG_BIT_PAD () {((( &u64b_t) 1) <<  &SKEIN_T1_POS_BIT_PAD);}' unless defined(&SKEIN_T1_FLAG_BIT_PAD);
    eval 'sub SKEIN_T1_TREE_LVL_MASK () {((( &u64b_t)0x7f) <<  &SKEIN_T1_POS_TREE_LVL);}' unless defined(&SKEIN_T1_TREE_LVL_MASK);
    eval 'sub SKEIN_T1_TREE_LEVEL {
        my($n) = @_;
	    eval q(((( &u64b_t) ($n)) <<  &SKEIN_T1_POS_TREE_LVL));
    }' unless defined(&SKEIN_T1_TREE_LEVEL);
    eval 'sub SKEIN_BLK_TYPE_KEY () {( 0);}' unless defined(&SKEIN_BLK_TYPE_KEY);
    eval 'sub SKEIN_BLK_TYPE_CFG () {( 4);}' unless defined(&SKEIN_BLK_TYPE_CFG);
    eval 'sub SKEIN_BLK_TYPE_PERS () {( 8);}' unless defined(&SKEIN_BLK_TYPE_PERS);
    eval 'sub SKEIN_BLK_TYPE_PK () {(12);}' unless defined(&SKEIN_BLK_TYPE_PK);
    eval 'sub SKEIN_BLK_TYPE_KDF () {(16);}' unless defined(&SKEIN_BLK_TYPE_KDF);
    eval 'sub SKEIN_BLK_TYPE_NONCE () {(20);}' unless defined(&SKEIN_BLK_TYPE_NONCE);
    eval 'sub SKEIN_BLK_TYPE_MSG () {(48);}' unless defined(&SKEIN_BLK_TYPE_MSG);
    eval 'sub SKEIN_BLK_TYPE_OUT () {(63);}' unless defined(&SKEIN_BLK_TYPE_OUT);
    eval 'sub SKEIN_BLK_TYPE_MASK () {(63);}' unless defined(&SKEIN_BLK_TYPE_MASK);
    eval 'sub SKEIN_T1_BLK_TYPE {
        my($T) = @_;
	    eval q(((( &u64b_t) ( &SKEIN_BLK_TYPE_$T)) <<  &SKEIN_T1_POS_BLK_TYPE));
    }' unless defined(&SKEIN_T1_BLK_TYPE);
    eval 'sub SKEIN_T1_BLK_TYPE_KEY () { &SKEIN_T1_BLK_TYPE( &KEY);}' unless defined(&SKEIN_T1_BLK_TYPE_KEY);
    eval 'sub SKEIN_T1_BLK_TYPE_CFG () { &SKEIN_T1_BLK_TYPE( &CFG);}' unless defined(&SKEIN_T1_BLK_TYPE_CFG);
    eval 'sub SKEIN_T1_BLK_TYPE_PERS () { &SKEIN_T1_BLK_TYPE( &PERS);}' unless defined(&SKEIN_T1_BLK_TYPE_PERS);
    eval 'sub SKEIN_T1_BLK_TYPE_PK () { &SKEIN_T1_BLK_TYPE( &PK);}' unless defined(&SKEIN_T1_BLK_TYPE_PK);
    eval 'sub SKEIN_T1_BLK_TYPE_KDF () { &SKEIN_T1_BLK_TYPE( &KDF);}' unless defined(&SKEIN_T1_BLK_TYPE_KDF);
    eval 'sub SKEIN_T1_BLK_TYPE_NONCE () { &SKEIN_T1_BLK_TYPE( &NONCE);}' unless defined(&SKEIN_T1_BLK_TYPE_NONCE);
    eval 'sub SKEIN_T1_BLK_TYPE_MSG () { &SKEIN_T1_BLK_TYPE( &MSG);}' unless defined(&SKEIN_T1_BLK_TYPE_MSG);
    eval 'sub SKEIN_T1_BLK_TYPE_OUT () { &SKEIN_T1_BLK_TYPE( &OUT);}' unless defined(&SKEIN_T1_BLK_TYPE_OUT);
    eval 'sub SKEIN_T1_BLK_TYPE_MASK () { &SKEIN_T1_BLK_TYPE( &MASK);}' unless defined(&SKEIN_T1_BLK_TYPE_MASK);
    eval 'sub SKEIN_T1_BLK_TYPE_CFG_FINAL () {( &SKEIN_T1_BLK_TYPE_CFG |  &SKEIN_T1_FLAG_FINAL);}' unless defined(&SKEIN_T1_BLK_TYPE_CFG_FINAL);
    eval 'sub SKEIN_T1_BLK_TYPE_OUT_FINAL () {( &SKEIN_T1_BLK_TYPE_OUT |  &SKEIN_T1_FLAG_FINAL);}' unless defined(&SKEIN_T1_BLK_TYPE_OUT_FINAL);
    eval 'sub SKEIN_VERSION () {(1);}' unless defined(&SKEIN_VERSION);
    unless(defined(&SKEIN_ID_STRING_LE)) {
	eval 'sub SKEIN_ID_STRING_LE () {(0x33414853);}' unless defined(&SKEIN_ID_STRING_LE);
    }
    eval 'sub SKEIN_MK_64 {
        my($hi32,$lo32) = @_;
	    eval q((($lo32) + ((( &u64b_t) ($hi32)) << 32)));
    }' unless defined(&SKEIN_MK_64);
    eval 'sub SKEIN_SCHEMA_VER () { &SKEIN_MK_64( &SKEIN_VERSION, &SKEIN_ID_STRING_LE);}' unless defined(&SKEIN_SCHEMA_VER);
    eval 'sub SKEIN_KS_PARITY () { &SKEIN_MK_64(0x1bd11bda,0xa9fc1a22);}' unless defined(&SKEIN_KS_PARITY);
    eval 'sub SKEIN_CFG_STR_LEN () {(4*8);}' unless defined(&SKEIN_CFG_STR_LEN);
    eval 'sub SKEIN_CFG_TREE_LEAF_SIZE_POS () {( 0);}' unless defined(&SKEIN_CFG_TREE_LEAF_SIZE_POS);
    eval 'sub SKEIN_CFG_TREE_NODE_SIZE_POS () {( 8);}' unless defined(&SKEIN_CFG_TREE_NODE_SIZE_POS);
    eval 'sub SKEIN_CFG_TREE_MAX_LEVEL_POS () {(16);}' unless defined(&SKEIN_CFG_TREE_MAX_LEVEL_POS);
    eval 'sub SKEIN_CFG_TREE_LEAF_SIZE_MSK () {((( &u64b_t) 0xff) <<  &SKEIN_CFG_TREE_LEAF_SIZE_POS);}' unless defined(&SKEIN_CFG_TREE_LEAF_SIZE_MSK);
    eval 'sub SKEIN_CFG_TREE_NODE_SIZE_MSK () {((( &u64b_t) 0xff) <<  &SKEIN_CFG_TREE_NODE_SIZE_POS);}' unless defined(&SKEIN_CFG_TREE_NODE_SIZE_MSK);
    eval 'sub SKEIN_CFG_TREE_MAX_LEVEL_MSK () {((( &u64b_t) 0xff) <<  &SKEIN_CFG_TREE_MAX_LEVEL_POS);}' unless defined(&SKEIN_CFG_TREE_MAX_LEVEL_MSK);
    eval 'sub SKEIN_CFG_TREE_INFO {
        my($leaf,$node,$maxLvl) = @_;
	    eval q(( ((( &u64b_t)($leaf )) <<  &SKEIN_CFG_TREE_LEAF_SIZE_POS) | ((( &u64b_t)($node )) <<  &SKEIN_CFG_TREE_NODE_SIZE_POS) | ((( &u64b_t)($maxLvl)) <<  &SKEIN_CFG_TREE_MAX_LEVEL_POS) ));
    }' unless defined(&SKEIN_CFG_TREE_INFO);
    eval 'sub SKEIN_CFG_TREE_INFO_SEQUENTIAL () { &SKEIN_CFG_TREE_INFO(0,0,0);}' unless defined(&SKEIN_CFG_TREE_INFO_SEQUENTIAL);
    eval 'sub Skein_Get_Tweak {
        my($ctxPtr,$TWK_NUM) = @_;
	    eval q((($ctxPtr)-> ($h->{T[$TWK_NUM]})));
    }' unless defined(&Skein_Get_Tweak);
    eval 'sub Skein_Set_Tweak {
        my($ctxPtr,$TWK_NUM,$tVal) = @_;
	    eval q({($ctxPtr)-> ($h->{T[$TWK_NUM]}) = ($tVal);});
    }' unless defined(&Skein_Set_Tweak);
    eval 'sub Skein_Get_T0 {
        my($ctxPtr) = @_;
	    eval q( &Skein_Get_Tweak($ctxPtr,0));
    }' unless defined(&Skein_Get_T0);
    eval 'sub Skein_Get_T1 {
        my($ctxPtr) = @_;
	    eval q( &Skein_Get_Tweak($ctxPtr,1));
    }' unless defined(&Skein_Get_T1);
    eval 'sub Skein_Set_T0 {
        my($ctxPtr,$T0) = @_;
	    eval q( &Skein_Set_Tweak($ctxPtr,0,$T0));
    }' unless defined(&Skein_Set_T0);
    eval 'sub Skein_Set_T1 {
        my($ctxPtr,$T1) = @_;
	    eval q( &Skein_Set_Tweak($ctxPtr,1,$T1));
    }' unless defined(&Skein_Set_T1);
    eval 'sub Skein_Set_T0_T1 {
        my($ctxPtr,$T0,$T1) = @_;
	    eval q({  &Skein_Set_T0($ctxPtr,($T0));  &Skein_Set_T1($ctxPtr,($T1)); });
    }' unless defined(&Skein_Set_T0_T1);
    eval 'sub Skein_Set_Type {
        my($ctxPtr,$BLK_TYPE) = @_;
	    eval q( &Skein_Set_T1($ctxPtr, &SKEIN_T1_BLK_TYPE_$BLK_TYPE));
    }' unless defined(&Skein_Set_Type);
    eval 'sub Skein_Start_New_Type {
        my($ctxPtr,$BLK_TYPE) = @_;
	    eval q({  &Skein_Set_T0_T1($ctxPtr,0, &SKEIN_T1_FLAG_FIRST |  &SKEIN_T1_BLK_TYPE_$BLK_TYPE); ($ctxPtr)-> ($h->{bCnt})=0; });
    }' unless defined(&Skein_Start_New_Type);
    eval 'sub Skein_Clear_First_Flag {
        my($hdr) = @_;
	    eval q({ ($hdr). $T[1] &= ~ &SKEIN_T1_FLAG_FIRST; });
    }' unless defined(&Skein_Clear_First_Flag);
    eval 'sub Skein_Set_Bit_Pad_Flag {
        my($hdr) = @_;
	    eval q({ ($hdr). $T[1] |=  &SKEIN_T1_FLAG_BIT_PAD; });
    }' unless defined(&Skein_Set_Bit_Pad_Flag);
    eval 'sub Skein_Set_Tree_Level {
        my($hdr,$height) = @_;
	    eval q({ ($hdr). $T[1] |=  &SKEIN_T1_TREE_LEVEL($height);});
    }' unless defined(&Skein_Set_Tree_Level);
    if(defined(&SKEIN_DEBUG)) {
	require 'skein_debug.ph';
    } else {
	eval 'sub Skein_Show_Block {
	    my($bits,$ctx,$X,$blkPtr,$wPtr,$ksEvenPtr,$ksOddPtr) = @_;
    	    eval q();
	}' unless defined(&Skein_Show_Block);
	eval 'sub Skein_Show_Round {
	    my($bits,$ctx,$r,$X) = @_;
    	    eval q();
	}' unless defined(&Skein_Show_Round);
	eval 'sub Skein_Show_R_Ptr {
	    my($bits,$ctx,$r,$X_ptr) = @_;
    	    eval q();
	}' unless defined(&Skein_Show_R_Ptr);
	eval 'sub Skein_Show_Final {
	    my($bits,$ctx,$cnt,$outPtr) = @_;
    	    eval q();
	}' unless defined(&Skein_Show_Final);
	eval 'sub Skein_Show_Key {
	    my($bits,$ctx,$key,$keyBytes) = @_;
    	    eval q();
	}' unless defined(&Skein_Show_Key);
    }
    unless(defined(&SKEIN_ERR_CHECK)) {
	eval 'sub Skein_Assert {
	    my($x,$retCode) = @_;
    	    eval q();
	}' unless defined(&Skein_Assert);
	eval 'sub Skein_assert {
	    my($x) = @_;
    	    eval q();
	}' unless defined(&Skein_assert);
    }
 elsif(defined(&SKEIN_ASSERT)) {
	require 'assert.ph';
	eval 'sub Skein_Assert {
	    my($x,$retCode) = @_;
    	    eval q( &assert($x));
	}' unless defined(&Skein_Assert);
	eval 'sub Skein_assert {
	    my($x) = @_;
    	    eval q( &assert($x));
	}' unless defined(&Skein_assert);
    } else {
	require 'assert.ph';
	eval 'sub Skein_Assert {
	    my($x,$retCode) = @_;
    	    eval q({  &if (!($x))  &return $retCode; });
	}' unless defined(&Skein_Assert);
	eval 'sub Skein_assert {
	    my($x) = @_;
    	    eval q( &assert($x));
	}' unless defined(&Skein_assert);
    }
    eval("sub R_256_0_0 () { 14; }") unless defined(&R_256_0_0);
    eval("sub R_256_0_1 () { 16; }") unless defined(&R_256_0_1);
    eval("sub R_256_1_0 () { 52; }") unless defined(&R_256_1_0);
    eval("sub R_256_1_1 () { 57; }") unless defined(&R_256_1_1);
    eval("sub R_256_2_0 () { 23; }") unless defined(&R_256_2_0);
    eval("sub R_256_2_1 () { 40; }") unless defined(&R_256_2_1);
    eval("sub R_256_3_0 () { 5; }") unless defined(&R_256_3_0);
    eval("sub R_256_3_1 () { 37; }") unless defined(&R_256_3_1);
    eval("sub R_256_4_0 () { 25; }") unless defined(&R_256_4_0);
    eval("sub R_256_4_1 () { 33; }") unless defined(&R_256_4_1);
    eval("sub R_256_5_0 () { 46; }") unless defined(&R_256_5_0);
    eval("sub R_256_5_1 () { 12; }") unless defined(&R_256_5_1);
    eval("sub R_256_6_0 () { 58; }") unless defined(&R_256_6_0);
    eval("sub R_256_6_1 () { 22; }") unless defined(&R_256_6_1);
    eval("sub R_256_7_0 () { 32; }") unless defined(&R_256_7_0);
    eval("sub R_256_7_1 () { 32; }") unless defined(&R_256_7_1);
    eval("sub R_512_0_0 () { 46; }") unless defined(&R_512_0_0);
    eval("sub R_512_0_1 () { 36; }") unless defined(&R_512_0_1);
    eval("sub R_512_0_2 () { 19; }") unless defined(&R_512_0_2);
    eval("sub R_512_0_3 () { 37; }") unless defined(&R_512_0_3);
    eval("sub R_512_1_0 () { 33; }") unless defined(&R_512_1_0);
    eval("sub R_512_1_1 () { 27; }") unless defined(&R_512_1_1);
    eval("sub R_512_1_2 () { 14; }") unless defined(&R_512_1_2);
    eval("sub R_512_1_3 () { 42; }") unless defined(&R_512_1_3);
    eval("sub R_512_2_0 () { 17; }") unless defined(&R_512_2_0);
    eval("sub R_512_2_1 () { 49; }") unless defined(&R_512_2_1);
    eval("sub R_512_2_2 () { 36; }") unless defined(&R_512_2_2);
    eval("sub R_512_2_3 () { 39; }") unless defined(&R_512_2_3);
    eval("sub R_512_3_0 () { 44; }") unless defined(&R_512_3_0);
    eval("sub R_512_3_1 () { 9; }") unless defined(&R_512_3_1);
    eval("sub R_512_3_2 () { 54; }") unless defined(&R_512_3_2);
    eval("sub R_512_3_3 () { 56; }") unless defined(&R_512_3_3);
    eval("sub R_512_4_0 () { 39; }") unless defined(&R_512_4_0);
    eval("sub R_512_4_1 () { 30; }") unless defined(&R_512_4_1);
    eval("sub R_512_4_2 () { 34; }") unless defined(&R_512_4_2);
    eval("sub R_512_4_3 () { 24; }") unless defined(&R_512_4_3);
    eval("sub R_512_5_0 () { 13; }") unless defined(&R_512_5_0);
    eval("sub R_512_5_1 () { 50; }") unless defined(&R_512_5_1);
    eval("sub R_512_5_2 () { 10; }") unless defined(&R_512_5_2);
    eval("sub R_512_5_3 () { 17; }") unless defined(&R_512_5_3);
    eval("sub R_512_6_0 () { 25; }") unless defined(&R_512_6_0);
    eval("sub R_512_6_1 () { 29; }") unless defined(&R_512_6_1);
    eval("sub R_512_6_2 () { 39; }") unless defined(&R_512_6_2);
    eval("sub R_512_6_3 () { 43; }") unless defined(&R_512_6_3);
    eval("sub R_512_7_0 () { 8; }") unless defined(&R_512_7_0);
    eval("sub R_512_7_1 () { 35; }") unless defined(&R_512_7_1);
    eval("sub R_512_7_2 () { 56; }") unless defined(&R_512_7_2);
    eval("sub R_512_7_3 () { 22; }") unless defined(&R_512_7_3);
    eval("sub R1024_0_0 () { 24; }") unless defined(&R1024_0_0);
    eval("sub R1024_0_1 () { 13; }") unless defined(&R1024_0_1);
    eval("sub R1024_0_2 () { 8; }") unless defined(&R1024_0_2);
    eval("sub R1024_0_3 () { 47; }") unless defined(&R1024_0_3);
    eval("sub R1024_0_4 () { 8; }") unless defined(&R1024_0_4);
    eval("sub R1024_0_5 () { 17; }") unless defined(&R1024_0_5);
    eval("sub R1024_0_6 () { 22; }") unless defined(&R1024_0_6);
    eval("sub R1024_0_7 () { 37; }") unless defined(&R1024_0_7);
    eval("sub R1024_1_0 () { 38; }") unless defined(&R1024_1_0);
    eval("sub R1024_1_1 () { 19; }") unless defined(&R1024_1_1);
    eval("sub R1024_1_2 () { 10; }") unless defined(&R1024_1_2);
    eval("sub R1024_1_3 () { 55; }") unless defined(&R1024_1_3);
    eval("sub R1024_1_4 () { 49; }") unless defined(&R1024_1_4);
    eval("sub R1024_1_5 () { 18; }") unless defined(&R1024_1_5);
    eval("sub R1024_1_6 () { 23; }") unless defined(&R1024_1_6);
    eval("sub R1024_1_7 () { 52; }") unless defined(&R1024_1_7);
    eval("sub R1024_2_0 () { 33; }") unless defined(&R1024_2_0);
    eval("sub R1024_2_1 () { 4; }") unless defined(&R1024_2_1);
    eval("sub R1024_2_2 () { 51; }") unless defined(&R1024_2_2);
    eval("sub R1024_2_3 () { 13; }") unless defined(&R1024_2_3);
    eval("sub R1024_2_4 () { 34; }") unless defined(&R1024_2_4);
    eval("sub R1024_2_5 () { 41; }") unless defined(&R1024_2_5);
    eval("sub R1024_2_6 () { 59; }") unless defined(&R1024_2_6);
    eval("sub R1024_2_7 () { 17; }") unless defined(&R1024_2_7);
    eval("sub R1024_3_0 () { 5; }") unless defined(&R1024_3_0);
    eval("sub R1024_3_1 () { 20; }") unless defined(&R1024_3_1);
    eval("sub R1024_3_2 () { 48; }") unless defined(&R1024_3_2);
    eval("sub R1024_3_3 () { 41; }") unless defined(&R1024_3_3);
    eval("sub R1024_3_4 () { 47; }") unless defined(&R1024_3_4);
    eval("sub R1024_3_5 () { 28; }") unless defined(&R1024_3_5);
    eval("sub R1024_3_6 () { 16; }") unless defined(&R1024_3_6);
    eval("sub R1024_3_7 () { 25; }") unless defined(&R1024_3_7);
    eval("sub R1024_4_0 () { 41; }") unless defined(&R1024_4_0);
    eval("sub R1024_4_1 () { 9; }") unless defined(&R1024_4_1);
    eval("sub R1024_4_2 () { 37; }") unless defined(&R1024_4_2);
    eval("sub R1024_4_3 () { 31; }") unless defined(&R1024_4_3);
    eval("sub R1024_4_4 () { 12; }") unless defined(&R1024_4_4);
    eval("sub R1024_4_5 () { 47; }") unless defined(&R1024_4_5);
    eval("sub R1024_4_6 () { 44; }") unless defined(&R1024_4_6);
    eval("sub R1024_4_7 () { 30; }") unless defined(&R1024_4_7);
    eval("sub R1024_5_0 () { 16; }") unless defined(&R1024_5_0);
    eval("sub R1024_5_1 () { 34; }") unless defined(&R1024_5_1);
    eval("sub R1024_5_2 () { 56; }") unless defined(&R1024_5_2);
    eval("sub R1024_5_3 () { 51; }") unless defined(&R1024_5_3);
    eval("sub R1024_5_4 () { 4; }") unless defined(&R1024_5_4);
    eval("sub R1024_5_5 () { 53; }") unless defined(&R1024_5_5);
    eval("sub R1024_5_6 () { 42; }") unless defined(&R1024_5_6);
    eval("sub R1024_5_7 () { 41; }") unless defined(&R1024_5_7);
    eval("sub R1024_6_0 () { 31; }") unless defined(&R1024_6_0);
    eval("sub R1024_6_1 () { 44; }") unless defined(&R1024_6_1);
    eval("sub R1024_6_2 () { 47; }") unless defined(&R1024_6_2);
    eval("sub R1024_6_3 () { 46; }") unless defined(&R1024_6_3);
    eval("sub R1024_6_4 () { 19; }") unless defined(&R1024_6_4);
    eval("sub R1024_6_5 () { 42; }") unless defined(&R1024_6_5);
    eval("sub R1024_6_6 () { 44; }") unless defined(&R1024_6_6);
    eval("sub R1024_6_7 () { 25; }") unless defined(&R1024_6_7);
    eval("sub R1024_7_0 () { 9; }") unless defined(&R1024_7_0);
    eval("sub R1024_7_1 () { 48; }") unless defined(&R1024_7_1);
    eval("sub R1024_7_2 () { 35; }") unless defined(&R1024_7_2);
    eval("sub R1024_7_3 () { 52; }") unless defined(&R1024_7_3);
    eval("sub R1024_7_4 () { 23; }") unless defined(&R1024_7_4);
    eval("sub R1024_7_5 () { 31; }") unless defined(&R1024_7_5);
    eval("sub R1024_7_6 () { 37; }") unless defined(&R1024_7_6);
    eval("sub R1024_7_7 () { 20; }") unless defined(&R1024_7_7);
    unless(defined(&SKEIN_ROUNDS)) {
	eval 'sub SKEIN_256_ROUNDS_TOTAL () {(72);}' unless defined(&SKEIN_256_ROUNDS_TOTAL);
	eval 'sub SKEIN_512_ROUNDS_TOTAL () {(72);}' unless defined(&SKEIN_512_ROUNDS_TOTAL);
	eval 'sub SKEIN1024_ROUNDS_TOTAL () {(80);}' unless defined(&SKEIN1024_ROUNDS_TOTAL);
    } else {
	eval 'sub SKEIN_256_ROUNDS_TOTAL () {(8*(((( &SKEIN_ROUNDS/100) + 5) % 10) + 5));}' unless defined(&SKEIN_256_ROUNDS_TOTAL);
	eval 'sub SKEIN_512_ROUNDS_TOTAL () {(8*(((( &SKEIN_ROUNDS/ 10) + 5) % 10) + 5));}' unless defined(&SKEIN_512_ROUNDS_TOTAL);
	eval 'sub SKEIN1024_ROUNDS_TOTAL () {(8*(((( &SKEIN_ROUNDS ) + 5) % 10) + 5));}' unless defined(&SKEIN1024_ROUNDS_TOTAL);
    }
    if(defined(&__cplusplus)) {
    }
    require 'skein_freebsd.ph';
}
1;
