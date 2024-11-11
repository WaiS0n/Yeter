require '_h2ph_pre.ph';

no warnings qw(redefine misc);

eval 'sub AACQ_FREE () {0;}' unless defined(&AACQ_FREE);
eval 'sub AACQ_BIO () {1;}' unless defined(&AACQ_BIO);
eval 'sub AACQ_READY () {2;}' unless defined(&AACQ_READY);
eval 'sub AACQ_BUSY () {3;}' unless defined(&AACQ_BUSY);
eval 'sub AACQ_COUNT () {4;}' unless defined(&AACQ_COUNT);
eval 'sub AACIO_STATS () { &_IOWR(ord(\'T\'), 101, \'union aac_statrequest\');}' unless defined(&AACIO_STATS);
unless(defined(&CTL_CODE)) {
    sub CTL_CODE {
	my($devType, $func, $meth, $acc) = @_;
	eval q(((($devType) << 16) | (($acc) << 14) | (($func) << 2) | ($meth)));
    }
}
eval 'sub METHOD_BUFFERED () {0;}' unless defined(&METHOD_BUFFERED);
eval 'sub METHOD_IN_DIRECT () {1;}' unless defined(&METHOD_IN_DIRECT);
eval 'sub METHOD_OUT_DIRECT () {2;}' unless defined(&METHOD_OUT_DIRECT);
eval 'sub METHOD_NEITHER () {3;}' unless defined(&METHOD_NEITHER);
eval 'sub FILE_ANY_ACCESS () {0;}' unless defined(&FILE_ANY_ACCESS);
eval 'sub FILE_READ_ACCESS () {( 0x1 );}' unless defined(&FILE_READ_ACCESS);
eval 'sub FILE_WRITE_ACCESS () {( 0x2 );}' unless defined(&FILE_WRITE_ACCESS);
eval 'sub FILE_DEVICE_CONTROLLER () {0x4;}' unless defined(&FILE_DEVICE_CONTROLLER);
eval 'sub FSACTL_LNX_SENDFIB () { &CTL_CODE( &FILE_DEVICE_CONTROLLER, 2050,  &METHOD_BUFFERED,  &FILE_ANY_ACCESS);}' unless defined(&FSACTL_LNX_SENDFIB);
eval 'sub FSACTL_LNX_SEND_RAW_SRB () { &CTL_CODE( &FILE_DEVICE_CONTROLLER, 2067,  &METHOD_BUFFERED,  &FILE_ANY_ACCESS);}' unless defined(&FSACTL_LNX_SEND_RAW_SRB);
eval 'sub FSACTL_LNX_GET_COMM_PERF_DATA () { &CTL_CODE( &FILE_DEVICE_CONTROLLER, 2084,  &METHOD_BUFFERED,  &FILE_ANY_ACCESS);}' unless defined(&FSACTL_LNX_GET_COMM_PERF_DATA);
eval 'sub FSACTL_LNX_OPENCLS_COMM_PERF_DATA () { &CTL_CODE( &FILE_DEVICE_CONTROLLER, 2085,  &METHOD_BUFFERED,  &FILE_ANY_ACCESS);}' unless defined(&FSACTL_LNX_OPENCLS_COMM_PERF_DATA);
eval 'sub FSACTL_LNX_OPEN_GET_ADAPTER_FIB () { &CTL_CODE( &FILE_DEVICE_CONTROLLER, 2100,  &METHOD_BUFFERED,  &FILE_ANY_ACCESS);}' unless defined(&FSACTL_LNX_OPEN_GET_ADAPTER_FIB);
eval 'sub FSACTL_LNX_GET_NEXT_ADAPTER_FIB () { &CTL_CODE( &FILE_DEVICE_CONTROLLER, 2101,  &METHOD_BUFFERED,  &FILE_ANY_ACCESS);}' unless defined(&FSACTL_LNX_GET_NEXT_ADAPTER_FIB);
eval 'sub FSACTL_LNX_CLOSE_GET_ADAPTER_FIB () { &CTL_CODE( &FILE_DEVICE_CONTROLLER, 2102,  &METHOD_BUFFERED,  &FILE_ANY_ACCESS);}' unless defined(&FSACTL_LNX_CLOSE_GET_ADAPTER_FIB);
eval 'sub FSACTL_LNX_CLOSE_ADAPTER_CONFIG () { &CTL_CODE( &FILE_DEVICE_CONTROLLER, 2104,  &METHOD_BUFFERED,  &FILE_ANY_ACCESS);}' unless defined(&FSACTL_LNX_CLOSE_ADAPTER_CONFIG);
eval 'sub FSACTL_LNX_OPEN_ADAPTER_CONFIG () { &CTL_CODE( &FILE_DEVICE_CONTROLLER, 2105,  &METHOD_BUFFERED,  &FILE_ANY_ACCESS);}' unless defined(&FSACTL_LNX_OPEN_ADAPTER_CONFIG);
eval 'sub FSACTL_LNX_MINIPORT_REV_CHECK () { &CTL_CODE( &FILE_DEVICE_CONTROLLER, 2107,  &METHOD_BUFFERED,  &FILE_ANY_ACCESS);}' unless defined(&FSACTL_LNX_MINIPORT_REV_CHECK);
eval 'sub FSACTL_LNX_QUERY_ADAPTER_CONFIG () { &CTL_CODE( &FILE_DEVICE_CONTROLLER, 2113,  &METHOD_BUFFERED,  &FILE_ANY_ACCESS);}' unless defined(&FSACTL_LNX_QUERY_ADAPTER_CONFIG);
eval 'sub FSACTL_LNX_GET_PCI_INFO () { &CTL_CODE( &FILE_DEVICE_CONTROLLER, 2119,  &METHOD_BUFFERED,  &FILE_ANY_ACCESS);}' unless defined(&FSACTL_LNX_GET_PCI_INFO);
eval 'sub FSACTL_LNX_FORCE_DELETE_DISK () { &CTL_CODE( &FILE_DEVICE_CONTROLLER, 2120,  &METHOD_NEITHER,  &FILE_ANY_ACCESS);}' unless defined(&FSACTL_LNX_FORCE_DELETE_DISK);
eval 'sub FSACTL_LNX_AIF_THREAD () { &CTL_CODE( &FILE_DEVICE_CONTROLLER, 2127,  &METHOD_NEITHER,  &FILE_ANY_ACCESS);}' unless defined(&FSACTL_LNX_AIF_THREAD);
eval 'sub FSACTL_LNX_SEND_LARGE_FIB () { &CTL_CODE( &FILE_DEVICE_CONTROLLER, 2138,  &METHOD_BUFFERED,  &FILE_ANY_ACCESS);}' unless defined(&FSACTL_LNX_SEND_LARGE_FIB);
eval 'sub FSACTL_LNX_GET_FEATURES () { &CTL_CODE( &FILE_DEVICE_CONTROLLER, 2139,  &METHOD_BUFFERED,  &FILE_ANY_ACCESS);}' unless defined(&FSACTL_LNX_GET_FEATURES);
eval 'sub FSACTL_LNX_NULL_IO_TEST () {0x43;}' unless defined(&FSACTL_LNX_NULL_IO_TEST);
eval 'sub FSACTL_LNX_SIM_IO_TEST () {0x53;}' unless defined(&FSACTL_LNX_SIM_IO_TEST);
eval 'sub FSACTL_LNX_DOWNLOAD () {0x83;}' unless defined(&FSACTL_LNX_DOWNLOAD);
eval 'sub FSACTL_LNX_GET_VAR () {0x93;}' unless defined(&FSACTL_LNX_GET_VAR);
eval 'sub FSACTL_LNX_SET_VAR () {0xa3;}' unless defined(&FSACTL_LNX_SET_VAR);
eval 'sub FSACTL_LNX_GET_FIBTIMES () {0xb3;}' unless defined(&FSACTL_LNX_GET_FIBTIMES);
eval 'sub FSACTL_LNX_ZERO_FIBTIMES () {0xc3;}' unless defined(&FSACTL_LNX_ZERO_FIBTIMES);
eval 'sub FSACTL_LNX_DELETE_DISK () {0x163;}' unless defined(&FSACTL_LNX_DELETE_DISK);
eval 'sub FSACTL_LNX_QUERY_DISK () {0x173;}' unless defined(&FSACTL_LNX_QUERY_DISK);
eval 'sub FSACTL_LNX_PROBE_CONTAINERS () {2131;}' unless defined(&FSACTL_LNX_PROBE_CONTAINERS);
eval 'sub FSACTL_SENDFIB () { &_IO(ord(\'8\'), 2);}' unless defined(&FSACTL_SENDFIB);
eval 'sub FSACTL_SEND_RAW_SRB () { &_IO(ord(\'8\'), 19);}' unless defined(&FSACTL_SEND_RAW_SRB);
eval 'sub FSACTL_GET_COMM_PERF_DATA () { &_IO(ord(\'8\'), 36);}' unless defined(&FSACTL_GET_COMM_PERF_DATA);
eval 'sub FSACTL_OPENCLS_COMM_PERF_DATA () { &_IO(ord(\'8\'), 37);}' unless defined(&FSACTL_OPENCLS_COMM_PERF_DATA);
eval 'sub FSACTL_OPEN_GET_ADAPTER_FIB () { &_IO(ord(\'8\'), 52);}' unless defined(&FSACTL_OPEN_GET_ADAPTER_FIB);
eval 'sub FSACTL_GET_NEXT_ADAPTER_FIB () { &_IO(ord(\'8\'), 53);}' unless defined(&FSACTL_GET_NEXT_ADAPTER_FIB);
eval 'sub FSACTL_CLOSE_GET_ADAPTER_FIB () { &_IO(ord(\'8\'), 54);}' unless defined(&FSACTL_CLOSE_GET_ADAPTER_FIB);
eval 'sub FSACTL_CLOSE_ADAPTER_CONFIG () { &_IO(ord(\'8\'), 56);}' unless defined(&FSACTL_CLOSE_ADAPTER_CONFIG);
eval 'sub FSACTL_OPEN_ADAPTER_CONFIG () { &_IO(ord(\'8\'), 57);}' unless defined(&FSACTL_OPEN_ADAPTER_CONFIG);
eval 'sub FSACTL_MINIPORT_REV_CHECK () { &_IO(ord(\'8\'), 59);}' unless defined(&FSACTL_MINIPORT_REV_CHECK);
eval 'sub FSACTL_QUERY_ADAPTER_CONFIG () { &_IO(ord(\'8\'), 65);}' unless defined(&FSACTL_QUERY_ADAPTER_CONFIG);
eval 'sub FSACTL_GET_PCI_INFO () { &_IO(ord(\'8\'), 71);}' unless defined(&FSACTL_GET_PCI_INFO);
eval 'sub FSACTL_FORCE_DELETE_DISK () { &_IO(ord(\'8\'), 72);}' unless defined(&FSACTL_FORCE_DELETE_DISK);
eval 'sub FSACTL_AIF_THREAD () { &_IO(ord(\'8\'), 79);}' unless defined(&FSACTL_AIF_THREAD);
eval 'sub FSACTL_SEND_LARGE_FIB () { &_IO(ord(\'8\'), 90);}' unless defined(&FSACTL_SEND_LARGE_FIB);
eval 'sub FSACTL_GET_FEATURES () { &_IO(ord(\'8\'), 91);}' unless defined(&FSACTL_GET_FEATURES);
eval 'sub FSACTL_NULL_IO_TEST () { &_IO(ord(\'8\'), 67);}' unless defined(&FSACTL_NULL_IO_TEST);
eval 'sub FSACTL_SIM_IO_TEST () { &_IO(ord(\'8\'), 83);}' unless defined(&FSACTL_SIM_IO_TEST);
eval 'sub FSACTL_DOWNLOAD () { &_IO(ord(\'8\'), 131);}' unless defined(&FSACTL_DOWNLOAD);
eval 'sub FSACTL_GET_VAR () { &_IO(ord(\'8\'), 147);}' unless defined(&FSACTL_GET_VAR);
eval 'sub FSACTL_SET_VAR () { &_IO(ord(\'8\'), 163);}' unless defined(&FSACTL_SET_VAR);
eval 'sub FSACTL_GET_FIBTIMES () { &_IO(ord(\'8\'), 179);}' unless defined(&FSACTL_GET_FIBTIMES);
eval 'sub FSACTL_ZERO_FIBTIMES () { &_IO(ord(\'8\'), 195);}' unless defined(&FSACTL_ZERO_FIBTIMES);
eval 'sub FSACTL_DELETE_DISK () { &_IO(ord(\'8\'), 99);}' unless defined(&FSACTL_DELETE_DISK);
eval 'sub FSACTL_QUERY_DISK () { &_IO(ord(\'9\'), 115);}' unless defined(&FSACTL_QUERY_DISK);
eval 'sub FSACTL_PROBE_CONTAINERS () { &_IO(ord(\'9\'), 83);}' unless defined(&FSACTL_PROBE_CONTAINERS);
if(defined(&_KERNEL)) {
    if(defined(&_KERNEL)) {
    }
}
1;
