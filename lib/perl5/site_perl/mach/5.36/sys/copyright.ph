require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&COPYRIGHT_Vendor)) {
    eval 'sub COPYRIGHT_Vendor () {"";}' unless defined(&COPYRIGHT_Vendor);
}
eval 'sub COPYRIGHT_FreeBSD () {"Copyright (c) 1992-2023 The FreeBSD Project.\\n";}' unless defined(&COPYRIGHT_FreeBSD);
eval 'sub TRADEMARK_Foundation () {"FreeBSD is a registered trademark of The FreeBSD Foundation.\\n";}' unless defined(&TRADEMARK_Foundation);
eval 'sub COPYRIGHT_UCB () {"Copyright (c) 1979, 1980, 1983, 1986, 1988, 1989, 1991, 1992, 1993, 1994\\n\\tThe Regents of the University of California. All rights reserved.\\n";}' unless defined(&COPYRIGHT_UCB);
1;
