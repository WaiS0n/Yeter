require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_VGL_H_)) {
    eval 'sub _VGL_H_ () {1;}' unless defined(&_VGL_H_);
    require 'stdlib.ph';
    require 'unistd.ph';
    require 'string.ph';
    require 'machine/cpufunc.ph';
    eval 'sub VGLBITMAP_INITIALIZER {
        my($t, $x, $y, $bits) = @_;
	    eval q({ ($t), ($x), ($y), ($x), ($y), 0, 0, ($bits), -1});
    }' unless defined(&VGLBITMAP_INITIALIZER);
    eval 'sub MEMBUF () {0;}' unless defined(&MEMBUF);
    eval 'sub VIDBUF4 () {1;}' unless defined(&VIDBUF4);
    eval 'sub VIDBUF8 () {2;}' unless defined(&VIDBUF8);
    eval 'sub VIDBUF8X () {3;}' unless defined(&VIDBUF8X);
    eval 'sub VIDBUF8S () {4;}' unless defined(&VIDBUF8S);
    eval 'sub VIDBUF4S () {5;}' unless defined(&VIDBUF4S);
    eval 'sub VIDBUF16 () {6;}' unless defined(&VIDBUF16);
    eval 'sub VIDBUF24 () {7;}' unless defined(&VIDBUF24);
    eval 'sub VIDBUF32 () {8;}' unless defined(&VIDBUF32);
    eval 'sub VIDBUF16S () {9;}' unless defined(&VIDBUF16S);
    eval 'sub VIDBUF24S () {10;}' unless defined(&VIDBUF24S);
    eval 'sub VIDBUF32S () {11;}' unless defined(&VIDBUF32S);
    eval 'sub NOBUF () {255;}' unless defined(&NOBUF);
    eval 'sub MOUSE_IMG_SIZE () {16;}' unless defined(&MOUSE_IMG_SIZE);
    eval 'sub VGL_MOUSEHIDE () {0;}' unless defined(&VGL_MOUSEHIDE);
    eval 'sub VGL_MOUSESHOW () {1;}' unless defined(&VGL_MOUSESHOW);
    eval 'sub VGL_MOUSEFREEZE () {0;}' unless defined(&VGL_MOUSEFREEZE);
    eval 'sub VGL_MOUSEUNFREEZE () {1;}' unless defined(&VGL_MOUSEUNFREEZE);
    eval 'sub VGL_DIR_RIGHT () {0;}' unless defined(&VGL_DIR_RIGHT);
    eval 'sub VGL_DIR_UP () {1;}' unless defined(&VGL_DIR_UP);
    eval 'sub VGL_DIR_LEFT () {2;}' unless defined(&VGL_DIR_LEFT);
    eval 'sub VGL_DIR_DOWN () {3;}' unless defined(&VGL_DIR_DOWN);
    eval 'sub VGL_RAWKEYS () {1;}' unless defined(&VGL_RAWKEYS);
    eval 'sub VGL_CODEKEYS () {2;}' unless defined(&VGL_CODEKEYS);
    eval 'sub VGL_XLATEKEYS () {3;}' unless defined(&VGL_XLATEKEYS);
}
1;
