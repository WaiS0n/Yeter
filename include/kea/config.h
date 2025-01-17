/* config.h.  Generated from config.h.in by configure.  */
/* config.h.in.  Generated from configure.ac by autoheader.  */

/* Define to 1 if system and steady clocks use the same duration type */
/* #undef CHRONO_SAME_DURATION */

/* config.h inclusion marker */
#define CONFIG_H_WAS_INCLUDED 1

/* AFL fuzzing was enabled. */
/* #undef ENABLE_AFL */

/* Enable low-performing debugging facilities? */
/* #undef ENABLE_DEBUG */

/* Check logger messages? */
/* #undef ENABLE_LOGGER_CHECKS */

/* Does this platform have some undefined pthreads behavior? */
#define HAS_UNDEFINED_PTHREAD_BEHAVIOR 1

/* Define to 1 if you have the <boost/asio/coroutine.hpp> header file. */
#define HAVE_BOOST_ASIO_COROUTINE_HPP 1

/* Define to 1 if you have the <boost/asio.hpp> header file. */
#define HAVE_BOOST_ASIO_HPP 1

/* Define to 1 if you have the <boost/asio/ip/address.hpp> header file. */
#define HAVE_BOOST_ASIO_IP_ADDRESS_HPP 1

/* Define to 1 if you have the <boost/asio/signal_set.hpp> header file. */
#define HAVE_BOOST_ASIO_SIGNAL_SET_HPP 1

/* Define to 1 if you have the <boost/asio/ssl.hpp> header file. */
#define HAVE_BOOST_ASIO_SSL_HPP 1

/* Define to 1 if you have the <boost/atomic.hpp> header file. */
#define HAVE_BOOST_ATOMIC_HPP 1

/* Define to 1 if you have the <boost/circular_buffer.hpp> header file. */
#define HAVE_BOOST_CIRCULAR_BUFFER_HPP 1

/* Define to 1 if you have the
   <boost/date_time/posix_time/posix_time_types.hpp> header file. */
#define HAVE_BOOST_DATE_TIME_POSIX_TIME_POSIX_TIME_TYPES_HPP 1

/* Define to 1 if you have the <boost/foreach.hpp> header file. */
#define HAVE_BOOST_FOREACH_HPP 1

/* Define to 1 if you have the <boost/functional/hash.hpp> header file. */
#define HAVE_BOOST_FUNCTIONAL_HASH_HPP 1

/* Define to 1 if you have the <boost/integer/common_factor.hpp> header file.
   */
#define HAVE_BOOST_INTEGER_COMMON_FACTOR_HPP 1

/* Define to 1 if you have the
   <boost/interprocess/sync/interprocess_upgradable_mutex.hpp> header file. */
#define HAVE_BOOST_INTERPROCESS_SYNC_INTERPROCESS_UPGRADABLE_MUTEX_HPP 1

/* Define to 1 if you have the <boost/shared_ptr.hpp> header file. */
#define HAVE_BOOST_SHARED_PTR_HPP 1

/* Define to 1 if you have the <boost/system/error_code.hpp> header file. */
#define HAVE_BOOST_SYSTEM_ERROR_CODE_HPP 1

/* Define to 1 if you have the <botan/asio_stream.h> header file. */
/* #undef HAVE_BOTAN_ASIO_STREAM_H */

/* Define to 1 if you have the <botan/botan.h> header file. */
/* #undef HAVE_BOTAN_BOTAN_H */

/* Define to 1 if getsockopt(IPV6_USE_MIN_MTU) does not work */
/* #undef HAVE_BROKEN_GET_IPV6_USE_MIN_MTU */

/* Define to 1 if gtest defines edit_distance::CreateUnifiedDiff */
/* #undef HAVE_CREATE_UNIFIED_DIFF */

/* Define to 1 if you have the <dlfcn.h> header file. */
#define HAVE_DLFCN_H 1

/* Define to 1 if you have the 'EVP_MD_CTX_create' function. */
/* #undef HAVE_EVP_MD_CTX_CREATE */

/* Define to 1 if you have the 'EVP_MD_CTX_destroy' function. */
/* #undef HAVE_EVP_MD_CTX_DESTROY */

/* Define to 1 if you have the 'EVP_MD_CTX_free' function. */
#define HAVE_EVP_MD_CTX_FREE 1

/* Define to 1 if you have the 'EVP_MD_CTX_new' function. */
#define HAVE_EVP_MD_CTX_NEW 1

/* Define to 1 if you have the 'EVP_PKEY_new_mac_key' function. */
/* #undef HAVE_EVP_PKEY_NEW_MAC_KEY */

/* Define to 1 if you have the 'EVP_PKEY_new_raw_private_key' function. */
#define HAVE_EVP_PKEY_NEW_RAW_PRIVATE_KEY 1

/* Define to 1 if boost::asio::ssl::context::tls is available */
#define HAVE_GENERIC_TLS_METHOD 1

/* Define to 1 if you have the <gssapi/gssapi.h> header file. */
/* #undef HAVE_GSSAPI_GSSAPI_H */

/* Define to 1 if you have the <gssapi/gssapi_krb5.h> header file. */
/* #undef HAVE_GSSAPI_GSSAPI_KRB5_H */

/* gss_str_to_oid is available */
/* #undef HAVE_GSS_STR_TO_OID */

/* Define to 1 if you have the <inttypes.h> header file. */
#define HAVE_INTTYPES_H 1

/* Define to 1 if std::is_base_of is available */
#define HAVE_IS_BASE_OF 1

/* Define to 1 if you have the <krb5.h> header file. */
/* #undef HAVE_KRB5_H */

/* Define to 1 if you have the <krb5/krb5.h> header file. */
/* #undef HAVE_KRB5_KRB5_H */

/* Define to 1 if you have the <log4cplus/logger.h> header file. */
#define HAVE_LOG4CPLUS_LOGGER_H 1

/* MySQL is present */
/* #undef HAVE_MYSQL */

/* MySQL has mysql_get_option defined. */
/* #undef HAVE_MYSQL_GET_OPTION */

/* MySQL uses my_bool */
/* #undef HAVE_MYSQL_MY_BOOL */

/* NETCONF capabilities enabled */
/* #undef HAVE_NETCONF */

/* Check for optreset? */
#define HAVE_OPTRESET 1

/* PostgreSQL is present */
/* #undef HAVE_PGSQL */

/* PostgreSQL was built with OpenSSL support */
/* #undef HAVE_PGSQL_SSL */

/* PostgreSQL connection parameter tcp_user_timeout supported */
/* #undef HAVE_PGSQL_TCP_USER_TIMEOUT */

/* Define to 1 if you have the 'pselect' function. */
#define HAVE_PSELECT 1

/* Define to 1 if sockaddr has a sa_len member, and corresponding sin_len and
   sun_len */
#define HAVE_SA_LEN 1

/* Define to 1 if stdbool.h conforms to C99. */
#define HAVE_STDBOOL_H 1

/* Define to 1 if you have the <stdint.h> header file. */
#define HAVE_STDINT_H 1

/* Define to 1 if you have the <stdio.h> header file. */
#define HAVE_STDIO_H 1

/* Define to 1 if you have the <stdlib.h> header file. */
#define HAVE_STDLIB_H 1

/* Define to 1 if boost::asio::ssl::error::stream_truncated is available */
#define HAVE_STREAM_TRUNCATED_ERROR 1

/* Define to 1 if you have the <strings.h> header file. */
#define HAVE_STRINGS_H 1

/* Define to 1 if you have the <string.h> header file. */
#define HAVE_STRING_H 1

/* Define to 1 if you have the <sys/devpoll.h> header file. */
/* #undef HAVE_SYS_DEVPOLL_H */

/* Define to 1 if you have the <sys/filio.h> header file. */
#define HAVE_SYS_FILIO_H 1

/* Define to 1 if you have the <sys/stat.h> header file. */
#define HAVE_SYS_STAT_H 1

/* Define to 1 if you have the <sys/types.h> header file. */
#define HAVE_SYS_TYPES_H 1

/* Define to 1 if boost::asio::ssl::context::tlsv12 is available */
/* #undef HAVE_TLS_1_2_METHOD */

/* Define to 1 if you have the <unistd.h> header file. */
#define HAVE_UNISTD_H 1

/* Define to 1 if you have the <utils/errcodes.h> header file. */
/* #undef HAVE_UTILS_ERRCODES_H */

/* Check valgrind headers */
/* #undef HAVE_VALGRIND_HEADERS */

/* Define to 1 if you have the <valgrind/valgrind.h> header file. */
/* #undef HAVE_VALGRIND_VALGRIND_H */

/* Define to 1 if the system has the type '_Bool'. */
#define HAVE__BOOL 1

/* Define to 1 if libc is musl */
/* #undef LIBC_MUSL */

/* Explicit initialization of log4cplus possible */
#define LOG4CPLUS_INITIALIZER_H 1

/* Define to the sub-directory where libtool stores uninstalled libraries. */
#define LT_OBJDIR ".libs/"

/* Running on BSD? */
#define OS_BSD 1

/* Running on FreeBSD? */
#define OS_FREEBSD 1

/* Running on Linux? */
/* #undef OS_LINUX */

/* Running on NetBSD? */
/* #undef OS_NETBSD */

/* Running on OpenBSD? */
/* #undef OS_OPENBSD */

/* Running on OSX? */
/* #undef OS_OSX */

/* Running on Solaris? */
/* #undef OS_SOLARIS */

/* Name of package */
#define PACKAGE "kea"

/* Define to the address where bug reports for this package should be sent. */
#define PACKAGE_BUGREPORT "kea-dev@lists.isc.org"

/* Define to the full name of this package. */
#define PACKAGE_NAME "kea"

/* Define to the full name and version of this package. */
#define PACKAGE_STRING "kea 2.4.1"

/* Define to the one symbol short name of this package. */
#define PACKAGE_TARNAME "kea"

/* Define to the home page for this package. */
#define PACKAGE_URL ""

/* Define to the version of this package. */
#define PACKAGE_VERSION "2.4.1"

/* Define to 1 if all of the C89 standard headers exist (not just the ones
   required in a freestanding environment). This macro is provided for
   backward compatibility; new code need not use it. */
#define STDC_HEADERS 1

/* Define to 1 if C++11 regex is usable */
#define USE_REGEX 1

/* Was Kea statically linked? */
/* #undef USE_STATIC_LINK */

/* Version number of package */
#define VERSION "2.4.1"

/* Compile with Botan crypto */
/* #undef WITH_BOTAN */

/* Define to 1 if Botan boost TLS is available */
/* #undef WITH_BOTAN_BOOST */

/* Heimdal GSS-API implementation */
/* #undef WITH_HEIMDAL */

/* Compile with OpenSSL crypto */
#define WITH_OPENSSL /**/

/* Define to 1 if 'lex' declares 'yytext' as a 'char *' by default, not a
   'char[]'. */
#define YYTEXT_POINTER 1

/* Define as 'unsigned int' if <stddef.h> doesn't define. */
/* #undef size_t */

/* Define as 'int' if <sys/types.h> doesn't define. */
/* #undef ssize_t */
