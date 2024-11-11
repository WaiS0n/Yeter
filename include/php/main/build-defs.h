/*
   +----------------------------------------------------------------------+
   | Copyright (c) The PHP Group                                          |
   +----------------------------------------------------------------------+
   | This source file is subject to version 3.01 of the PHP license,      |
   | that is bundled with this package in the file LICENSE, and is        |
   | available through the world-wide-web at the following url:           |
   | https://www.php.net/license/3_01.txt                                 |
   | If you did not receive a copy of the PHP license and are unable to   |
   | obtain it through the world-wide-web, please send a note to          |
   | license@php.net so we can mail you a copy immediately.               |
   +----------------------------------------------------------------------+
   | Author: Stig Sæther Bakken <ssb@php.net>                             |
   +----------------------------------------------------------------------+
*/

#define CONFIGURE_COMMAND " './configure'  '--disable-all' '--program-prefix=' '--with-config-file-scan-dir=/usr/local/etc/php' '--with-layout=GNU' '--with-libxml' '--with-openssl' '--with-password-argon2=/usr/local' '--enable-dtrace' '--enable-embed' '--enable-fpm' '--with-fpm-group=www' '--with-fpm-user=www' '--enable-mysqlnd' '--with-external-pcre=/usr/local' '--prefix=/usr/local' '--localstatedir=/var' '--mandir=/usr/local/share/man' '--infodir=/usr/local/share/info/' '--build=amd64-portbld-freebsd14.1' 'build_alias=amd64-portbld-freebsd14.1' 'PKG_CONFIG=pkgconf' 'PKG_CONFIG_LIBDIR=/usr/obj/usr/ports/lang/php82/work/.pkgconfig:/usr/local/libdata/pkgconfig:/usr/local/share/pkgconfig:/usr/libdata/pkgconfig' 'CFLAGS=-O2 -pipe -fstack-protector-strong -isystem /usr/local/include -fno-strict-aliasing ' 'CPP=cpp' 'CXXFLAGS=-O2 -pipe -fstack-protector-strong -isystem /usr/local/include -fno-strict-aliasing -isystem /usr/local/include ' 'OPENSSL_CFLAGS=-I/usr/local/include' 'OPENSSL_LIBS=-L/usr/local/lib -lssl -lcrypto'"
#define PHP_ODBC_CFLAGS	""
#define PHP_ODBC_LFLAGS		""
#define PHP_ODBC_LIBS		""
#define PHP_ODBC_TYPE		""
#define PHP_OCI8_DIR			""
#define PHP_OCI8_ORACLE_VERSION		""
#define PHP_PROG_SENDMAIL	"/usr/sbin/sendmail"
#define PEAR_INSTALLDIR         ""
#define PHP_INCLUDE_PATH	".:/usr/local/share/pear"
#define PHP_EXTENSION_DIR       "/usr/local/lib/php/20220829"
#define PHP_PREFIX              "/usr/local"
#define PHP_BINDIR              "/usr/local/bin"
#define PHP_SBINDIR             "/usr/local/sbin"
#define PHP_MANDIR              "/usr/local/share/man"
#define PHP_LIBDIR              "/usr/local/lib/php"
#define PHP_DATADIR             "/usr/local/share/php"
#define PHP_SYSCONFDIR          "/usr/local/etc"
#define PHP_LOCALSTATEDIR       "/var"
#define PHP_CONFIG_FILE_PATH    "/usr/local/etc"
#define PHP_CONFIG_FILE_SCAN_DIR    "/usr/local/etc/php"
#define PHP_SHLIB_SUFFIX        "so"
#define PHP_SHLIB_EXT_PREFIX    ""
