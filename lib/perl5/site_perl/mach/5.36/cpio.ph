require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_CPIO_H_)) {
    eval 'sub _CPIO_H_ () {1;}' unless defined(&_CPIO_H_);
    eval 'sub C_ISSOCK () {0140000;}' unless defined(&C_ISSOCK);
    eval 'sub C_ISLNK () {0120000;}' unless defined(&C_ISLNK);
    eval 'sub C_ISCTG () {0110000;}' unless defined(&C_ISCTG);
    eval 'sub C_ISREG () {0100000;}' unless defined(&C_ISREG);
    eval 'sub C_ISBLK () {0060000;}' unless defined(&C_ISBLK);
    eval 'sub C_ISDIR () {0040000;}' unless defined(&C_ISDIR);
    eval 'sub C_ISCHR () {0020000;}' unless defined(&C_ISCHR);
    eval 'sub C_ISFIFO () {0010000;}' unless defined(&C_ISFIFO);
    eval 'sub C_ISUID () {0004000;}' unless defined(&C_ISUID);
    eval 'sub C_ISGID () {0002000;}' unless defined(&C_ISGID);
    eval 'sub C_ISVTX () {0001000;}' unless defined(&C_ISVTX);
    eval 'sub C_IRUSR () {0000400;}' unless defined(&C_IRUSR);
    eval 'sub C_IWUSR () {0000200;}' unless defined(&C_IWUSR);
    eval 'sub C_IXUSR () {0000100;}' unless defined(&C_IXUSR);
    eval 'sub C_IRGRP () {0000040;}' unless defined(&C_IRGRP);
    eval 'sub C_IWGRP () {0000020;}' unless defined(&C_IWGRP);
    eval 'sub C_IXGRP () {0000010;}' unless defined(&C_IXGRP);
    eval 'sub C_IROTH () {0000004;}' unless defined(&C_IROTH);
    eval 'sub C_IWOTH () {0000002;}' unless defined(&C_IWOTH);
    eval 'sub C_IXOTH () {0000001;}' unless defined(&C_IXOTH);
    eval 'sub MAGIC () {"070707";}' unless defined(&MAGIC);
}
1;
