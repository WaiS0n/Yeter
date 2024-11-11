require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_TTYENT_H_)) {
    eval 'sub _TTYENT_H_ () {1;}' unless defined(&_TTYENT_H_);
    eval 'sub _PATH_TTYS () {"/etc/ttys";}' unless defined(&_PATH_TTYS);
    eval 'sub _TTYS_OFF () {"off";}' unless defined(&_TTYS_OFF);
    eval 'sub _TTYS_ON () {"on";}' unless defined(&_TTYS_ON);
    eval 'sub _TTYS_ONIFCONSOLE () {"onifconsole";}' unless defined(&_TTYS_ONIFCONSOLE);
    eval 'sub _TTYS_ONIFEXISTS () {"onifexists";}' unless defined(&_TTYS_ONIFEXISTS);
    eval 'sub _TTYS_SECURE () {"secure";}' unless defined(&_TTYS_SECURE);
    eval 'sub _TTYS_INSECURE () {"insecure";}' unless defined(&_TTYS_INSECURE);
    eval 'sub _TTYS_WINDOW () {"window";}' unless defined(&_TTYS_WINDOW);
    eval 'sub _TTYS_GROUP () {"group";}' unless defined(&_TTYS_GROUP);
    eval 'sub _TTYS_NOGROUP () {"none";}' unless defined(&_TTYS_NOGROUP);
    eval 'sub _TTYS_DIALUP () {"dialup";}' unless defined(&_TTYS_DIALUP);
    eval 'sub _TTYS_NETWORK () {"network";}' unless defined(&_TTYS_NETWORK);
    eval 'sub TTY_ON () {0x1;}' unless defined(&TTY_ON);
    eval 'sub TTY_SECURE () {0x2;}' unless defined(&TTY_SECURE);
    eval 'sub TTY_DIALUP () {0x4;}' unless defined(&TTY_DIALUP);
    eval 'sub TTY_NETWORK () {0x8;}' unless defined(&TTY_NETWORK);
    eval 'sub TTY_IFEXISTS () {0x10;}' unless defined(&TTY_IFEXISTS);
    eval 'sub TTY_IFCONSOLE () {0x20;}' unless defined(&TTY_IFCONSOLE);
    require 'sys/cdefs.ph';
}
1;
