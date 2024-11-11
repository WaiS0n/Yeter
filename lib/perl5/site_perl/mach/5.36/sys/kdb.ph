require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_KDB_H_)) {
    eval 'sub _SYS_KDB_H_ () {1;}' unless defined(&_SYS_KDB_H_);
    require 'sys/linker_set.ph';
    require 'machine/setjmp.ph';
    eval 'sub KDB_BACKEND {
        my($name, $init, $trace, $trace_thread, $trap) = @_;
	    eval q( &static \'struct kdb_dbbe\' $name &_dbbe = { . &dbbe_name = $name, . &dbbe_init = $init, . &dbbe_trace = $trace, . &dbbe_trace_thread = $trace_thread, . &dbbe_trap = $trap };  &DATA_SET( &kdb_dbbe_set, $name &_dbbe));
    }' unless defined(&KDB_BACKEND);
    eval 'sub KDB_WHY_UNSET () { &NULL;}' unless defined(&KDB_WHY_UNSET);
    eval 'sub KDB_WHY_PANIC () {"panic";}' unless defined(&KDB_WHY_PANIC);
    eval 'sub KDB_WHY_KASSERT () {"kassert";}' unless defined(&KDB_WHY_KASSERT);
    eval 'sub KDB_WHY_TRAP () {"trap";}' unless defined(&KDB_WHY_TRAP);
    eval 'sub KDB_WHY_SYSCTL () {"sysctl";}' unless defined(&KDB_WHY_SYSCTL);
    eval 'sub KDB_WHY_BOOTFLAGS () {"bootflags";}' unless defined(&KDB_WHY_BOOTFLAGS);
    eval 'sub KDB_WHY_WITNESS () {"witness";}' unless defined(&KDB_WHY_WITNESS);
    eval 'sub KDB_WHY_VFSLOCK () {"vfslock";}' unless defined(&KDB_WHY_VFSLOCK);
    eval 'sub KDB_WHY_NETGRAPH () {"netgraph";}' unless defined(&KDB_WHY_NETGRAPH);
    eval 'sub KDB_WHY_BREAK () {"break";}' unless defined(&KDB_WHY_BREAK);
    eval 'sub KDB_WHY_WATCHDOG () {"watchdog";}' unless defined(&KDB_WHY_WATCHDOG);
    eval 'sub KDB_WHY_CAM () {"cam";}' unless defined(&KDB_WHY_CAM);
    eval 'sub KDB_WHY_ACPI () {"acpi";}' unless defined(&KDB_WHY_ACPI);
    eval 'sub KDB_WHY_TRAPSIG () {"trapsig";}' unless defined(&KDB_WHY_TRAPSIG);
    eval 'sub KDB_WHY_POWERFAIL () {"powerfail";}' unless defined(&KDB_WHY_POWERFAIL);
    eval 'sub KDB_WHY_MAC () {"mac";}' unless defined(&KDB_WHY_MAC);
    eval 'sub KDB_WHY_POWERPC () {"powerpc";}' unless defined(&KDB_WHY_POWERPC);
    eval 'sub KDB_WHY_UNIONFS () {"unionfs";}' unless defined(&KDB_WHY_UNIONFS);
    eval 'sub KDB_WHY_DTRACE () {"dtrace";}' unless defined(&KDB_WHY_DTRACE);
    eval 'sub KDB_WHY_REBOOT () {"reboot";}' unless defined(&KDB_WHY_REBOOT);
    eval 'sub KDB_REQ_DEBUGGER () {1;}' unless defined(&KDB_REQ_DEBUGGER);
    eval 'sub KDB_REQ_PANIC () {2;}' unless defined(&KDB_REQ_PANIC);
    eval 'sub KDB_REQ_REBOOT () {3;}' unless defined(&KDB_REQ_REBOOT);
    eval 'sub KDB_DBG_ACCESS_EXEC () {0;}' unless defined(&KDB_DBG_ACCESS_EXEC);
    eval 'sub KDB_DBG_ACCESS_R () {1;}' unless defined(&KDB_DBG_ACCESS_R);
    eval 'sub KDB_DBG_ACCESS_W () {2;}' unless defined(&KDB_DBG_ACCESS_W);
    eval 'sub KDB_DBG_ACCESS_RW () {3;}' unless defined(&KDB_DBG_ACCESS_RW);
}
1;
