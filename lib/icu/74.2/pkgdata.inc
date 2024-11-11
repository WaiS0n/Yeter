GENCCODE_ASSEMBLY_TYPE=
SO=so
SOBJ=so
A=a
LIBPREFIX=lib
LIB_EXT_ORDER=.74.2
COMPILE=cc -DICU_NO_USER_DATA_OVERRIDE -D_REENTRANT  -DU_HAVE_ELF_H=1 -DU_HAVE_TIMEZONE=0 -DU_HAVE_STRTOD_L=1 -DU_HAVE_XLOCALE_H=1 -DU_HAVE_STRING_VIEW=1  -DU_DISABLE_RENAMING=1 -DU_ATTRIBUTE_DEPRECATED= -O2 -pipe  -fstack-protector-strong -fno-strict-aliasing  -std=c11 -Wall -pedantic -Wshadow -Wpointer-arith -Wmissing-prototypes -Wwrite-strings   -c
LIBFLAGS=-I/usr/local/include -DPIC -fPIC
GENLIB=cc -O2 -pipe  -fstack-protector-strong -fno-strict-aliasing  -std=c11 -Wall -pedantic -Wshadow -Wpointer-arith -Wmissing-prototypes -Wwrite-strings   -fstack-protector-strong   -shared -Wl,-Bsymbolic
LDICUDTFLAGS=-nodefaultlibs -nostdlib
LD_SONAME=-Wl,-soname -Wl,
RPATH_FLAGS=
BIR_LDFLAGS=-Wl,-Bsymbolic
AR=ar
ARFLAGS=r
RANLIB=ranlib
INSTALL_CMD=install -s -m 555
