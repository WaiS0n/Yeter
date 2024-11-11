require '_h2ph_pre.ph';

no warnings qw(redefine misc);

if(defined(&__GNUC__)) {
    warn("\"this\ file\ includes\ \<sys\/termios\.h\>\ which\ is\ deprecated\,\ use\ \<termios\.h\>\ instead\"");
}
require 'termios.ph';
1;
