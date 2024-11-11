require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_BLUETOOTH_H_)) {
    eval 'sub _BLUETOOTH_H_ () {1;}' unless defined(&_BLUETOOTH_H_);
    require 'sys/types.ph';
    require 'sys/endian.ph';
    require 'sys/ioctl.ph';
    require 'sys/socket.ph';
    require 'sys/uio.ph';
    require 'sys/un.ph';
    require 'errno.ph';
    require 'netdb.ph';
    require 'bitstring.ph';
    require 'netgraph/ng_message.ph';
    require 'netgraph/bluetooth/include/ng_bluetooth.ph';
    require 'netgraph/bluetooth/include/ng_hci.ph';
    require 'netgraph/bluetooth/include/ng_l2cap.ph';
    require 'netgraph/bluetooth/include/ng_btsocket.ph';
    require 'time.ph';
    eval 'sub bacmp {
        my($ba1, $ba2) = @_;
	    eval q( &memcmp(($ba1), ($ba2), $sizeof{ &bdaddr_t}));
    }' unless defined(&bacmp);
    eval 'sub bacpy {
        my($dst, $src) = @_;
	    eval q( &memcpy(($dst), ($src), $sizeof{ &bdaddr_t}));
    }' unless defined(&bacpy);
    eval 'sub ba2str {
        my($ba, $str) = @_;
	    eval q( &bt_ntoa(($ba), ($str)));
    }' unless defined(&ba2str);
    eval 'sub str2ba {
        my($str, $ba) = @_;
	    eval q(( &bt_aton(($str), ($ba)) == 1? 0: -1));
    }' unless defined(&str2ba);
    eval 'sub htobs {
        my($d) = @_;
	    eval q( &htole16($d));
    }' unless defined(&htobs);
    eval 'sub htobl {
        my($d) = @_;
	    eval q( &htole32($d));
    }' unless defined(&htobl);
    eval 'sub btohs {
        my($d) = @_;
	    eval q( &le16toh($d));
    }' unless defined(&btohs);
    eval 'sub btohl {
        my($d) = @_;
	    eval q( &le32toh($d));
    }' unless defined(&btohl);
    eval 'sub HCI_DEVMAX () {32;}' unless defined(&HCI_DEVMAX);
    eval 'sub HCI_DEVNAME_SIZE () { &NG_NODESIZ;}' unless defined(&HCI_DEVNAME_SIZE);
    eval 'sub HCI_DEVFEATURES_SIZE () { &NG_HCI_FEATURES_SIZE;}' unless defined(&HCI_DEVFEATURES_SIZE);
    eval 'sub bt_devremote_name_gen {
        my($btooth_devname,$remote) = @_;
	    eval q({ ( &bt_devremote_name($btooth_devname, $remote, 0, 0x,  &NG_HCI_SCAN_REP_MODE0,  &NG_HCI_MANDATORY_PAGE_SCAN_MODE)); });
    }' unless defined(&bt_devremote_name_gen);
    eval 'sub bdaddr_any {
        my($a) = @_;
	    eval q({ ( ($a->{b[0]}) == 0 &&  ($a->{b[1]}) == 0 &&  ($a->{b[2]}) == 0 &&  ($a->{b[3]}) == 0 &&  ($a->{b[4]}) == 0 &&  ($a->{b[5]}) == 0); });
    }' unless defined(&bdaddr_any);
    eval 'sub bdaddr_copy {
        my($d,$s) = @_;
	    eval q({  ($d->{b[0]}) =  ($s->{b[0]});  ($d->{b[1]}) =  ($s->{b[1]});  ($d->{b[2]}) =  ($s->{b[2]});  ($d->{b[3]}) =  ($s->{b[3]});  ($d->{b[4]}) =  ($s->{b[4]});  ($d->{b[5]}) =  ($s->{b[5]}); });
    }' unless defined(&bdaddr_copy);
}
1;
