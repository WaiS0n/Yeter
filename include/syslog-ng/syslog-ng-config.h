#ifndef _SYSLOG_NG_CONFIG_H
#define _SYSLOG_NG_CONFIG_H 1
 
/* syslog-ng-config.h. Generated automatically at end of configure. */
/* config.h.  Generated from config.h.in by configure.  */
/* config.h.in.  Generated from configure.ac by autoheader.  */

/* pretty version for users depends on the release type */
#ifndef SYSLOG_NG_BROCHURE_VERSION
#define SYSLOG_NG_BROCHURE_VERSION "4"
#endif

/* normal and brochure version combined */
#ifndef SYSLOG_NG_COMBINED_VERSION
#define SYSLOG_NG_COMBINED_VERSION "4 (4.7.1)"
#endif

/* enable SO_MEMINFO based metrics in afsocket */
#ifndef SYSLOG_NG_ENABLE_AFSOCKET_MEMINFO_METRICS
#define SYSLOG_NG_ENABLE_AFSOCKET_MEMINFO_METRICS 0
#endif

/* Enable C++ support */
#ifndef SYSLOG_NG_ENABLE_CPP
#define SYSLOG_NG_ENABLE_CPP 0
#endif

/* Enable debugging */
#ifndef SYSLOG_NG_ENABLE_DEBUG
#define SYSLOG_NG_ENABLE_DEBUG 0
#endif

/* Enable Linux eBPF support */
#ifndef SYSLOG_NG_ENABLE_EBPF
#define SYSLOG_NG_ENABLE_EBPF 0
#endif

/* Enable environment wrapper support */
#ifndef SYSLOG_NG_ENABLE_ENV_WRAPPER
#define SYSLOG_NG_ENABLE_ENV_WRAPPER 0
#endif

/* Enable forced server mode */
#ifndef SYSLOG_NG_ENABLE_FORCED_SERVER_MODE
#define SYSLOG_NG_ENABLE_FORCED_SERVER_MODE 1
#endif

/* Enable gcc profiling */
#ifndef SYSLOG_NG_ENABLE_GPROF
#define SYSLOG_NG_ENABLE_GPROF 0
#endif

/* Enable IPv6 support */
#ifndef SYSLOG_NG_ENABLE_IPV6
#define SYSLOG_NG_ENABLE_IPV6 1
#endif

/* Enable kafka support */
#ifndef SYSLOG_NG_ENABLE_KAFKA
#define SYSLOG_NG_ENABLE_KAFKA 0
#endif

/* Enable Linux capability management support */
#ifndef SYSLOG_NG_ENABLE_LINUX_CAPS
#define SYSLOG_NG_ENABLE_LINUX_CAPS 0
#endif

/* Enable memtrace */
#ifndef SYSLOG_NG_ENABLE_MEMTRACE
#define SYSLOG_NG_ENABLE_MEMTRACE 0
#endif

/* Enable spoof source support */
#ifndef SYSLOG_NG_ENABLE_SPOOF_SOURCE
#define SYSLOG_NG_ENABLE_SPOOF_SOURCE 0
#endif

/* Enable systemd support */
#ifndef SYSLOG_NG_ENABLE_SYSTEMD
#define SYSLOG_NG_ENABLE_SYSTEMD 0
#endif

/* Enable TCP wrapper support */
#ifndef SYSLOG_NG_ENABLE_TCP_WRAPPER
#define SYSLOG_NG_ENABLE_TCP_WRAPPER 0
#endif

/* set LD_LIBRARY_PATH to this value */
/* #undef ENV_LD_LIBRARY_PATH */

/* Define to 1 if you have the external `altzone' variable. */
/* #undef HAVE_ALTZONE */

/* Define to 1 if you have the `amqp_ssl_socket_set_verify_peer' function. */
/* #undef HAVE_AMQP_SSL_SOCKET_SET_VERIFY_PEER */

/* define if your platform has a broken pread/pwrite (e.g. HP-UX) */
/* #undef HAVE_BROKEN_PREAD */

/* Define to 1 if you have the `clock_gettime' function. */
#ifndef SYSLOG_NG_HAVE_CLOCK_GETTIME
#define SYSLOG_NG_HAVE_CLOCK_GETTIME 1
#endif

/* Whether you have msg_control field in msghdr in socket.h */
#ifndef SYSLOG_NG_HAVE_CTRLBUF_IN_MSGHDR
#define SYSLOG_NG_HAVE_CTRLBUF_IN_MSGHDR 1
#endif

/* define if the compiler supports basic C++11 syntax */
/* #undef HAVE_CXX11 */

/* Define to 1 if you have the external `daylight' variable. */
/* #undef HAVE_DAYLIGHT */

/* Define to 1 if you have the declaration of `ASN1_STRING_get0_data', and to
   0 if you don't. */
#ifndef SYSLOG_NG_HAVE_DECL_ASN1_STRING_GET0_DATA
#define SYSLOG_NG_HAVE_DECL_ASN1_STRING_GET0_DATA 1
#endif

/* Define to 1 if you have the declaration of `BN_get_rfc3526_prime_2048', and
   to 0 if you don't. */
#ifndef SYSLOG_NG_HAVE_DECL_BN_GET_RFC3526_PRIME_2048
#define SYSLOG_NG_HAVE_DECL_BN_GET_RFC3526_PRIME_2048 1
#endif

/* Define to 1 if you have the declaration of `CURLOPT_REDIR_PROTOCOLS_STR',
   and to 0 if you don't. */
#ifndef SYSLOG_NG_HAVE_DECL_CURLOPT_REDIR_PROTOCOLS_STR
#define SYSLOG_NG_HAVE_DECL_CURLOPT_REDIR_PROTOCOLS_STR 1
#endif

/* Define to 1 if you have the declaration of `CURLOPT_SSL_VERIFYSTATUS', and
   to 0 if you don't. */
#ifndef SYSLOG_NG_HAVE_DECL_CURLOPT_SSL_VERIFYSTATUS
#define SYSLOG_NG_HAVE_DECL_CURLOPT_SSL_VERIFYSTATUS 1
#endif

/* Define to 1 if you have the declaration of `CURLOPT_TLS13_CIPHERS', and to
   0 if you don't. */
#ifndef SYSLOG_NG_HAVE_DECL_CURLOPT_TLS13_CIPHERS
#define SYSLOG_NG_HAVE_DECL_CURLOPT_TLS13_CIPHERS 1
#endif

/* Define to 1 if you have the declaration of `CURLUE_BAD_HOSTNAME', and to 0
   if you don't. */
#ifndef SYSLOG_NG_HAVE_DECL_CURLUE_BAD_HOSTNAME
#define SYSLOG_NG_HAVE_DECL_CURLUE_BAD_HOSTNAME 1
#endif

/* Define to 1 if you have the declaration of `CURLUE_BAD_PASSWORD', and to 0
   if you don't. */
#ifndef SYSLOG_NG_HAVE_DECL_CURLUE_BAD_PASSWORD
#define SYSLOG_NG_HAVE_DECL_CURLUE_BAD_PASSWORD 1
#endif

/* Define to 1 if you have the declaration of `CURLUE_BAD_PORT_NUMBER', and to
   0 if you don't. */
#ifndef SYSLOG_NG_HAVE_DECL_CURLUE_BAD_PORT_NUMBER
#define SYSLOG_NG_HAVE_DECL_CURLUE_BAD_PORT_NUMBER 1
#endif

/* Define to 1 if you have the declaration of `CURLUE_BAD_SCHEME', and to 0 if
   you don't. */
#ifndef SYSLOG_NG_HAVE_DECL_CURLUE_BAD_SCHEME
#define SYSLOG_NG_HAVE_DECL_CURLUE_BAD_SCHEME 1
#endif

/* Define to 1 if you have the declaration of `CURLUE_BAD_USER', and to 0 if
   you don't. */
#ifndef SYSLOG_NG_HAVE_DECL_CURLUE_BAD_USER
#define SYSLOG_NG_HAVE_DECL_CURLUE_BAD_USER 1
#endif

/* Define to 1 if you have the declaration of `CURLUE_LAST', and to 0 if you
   don't. */
#ifndef SYSLOG_NG_HAVE_DECL_CURLUE_LAST
#define SYSLOG_NG_HAVE_DECL_CURLUE_LAST 1
#endif

/* Define to 1 if you have the declaration of `CURLUE_MALFORMED_INPUT', and to
   0 if you don't. */
#ifndef SYSLOG_NG_HAVE_DECL_CURLUE_MALFORMED_INPUT
#define SYSLOG_NG_HAVE_DECL_CURLUE_MALFORMED_INPUT 1
#endif

/* Define to 1 if you have the declaration of `CURLUPART_HOST', and to 0 if
   you don't. */
#ifndef SYSLOG_NG_HAVE_DECL_CURLUPART_HOST
#define SYSLOG_NG_HAVE_DECL_CURLUPART_HOST 1
#endif

/* Define to 1 if you have the declaration of `CURLUPART_PASSWORD', and to 0
   if you don't. */
#ifndef SYSLOG_NG_HAVE_DECL_CURLUPART_PASSWORD
#define SYSLOG_NG_HAVE_DECL_CURLUPART_PASSWORD 1
#endif

/* Define to 1 if you have the declaration of `CURLUPART_PORT', and to 0 if
   you don't. */
#ifndef SYSLOG_NG_HAVE_DECL_CURLUPART_PORT
#define SYSLOG_NG_HAVE_DECL_CURLUPART_PORT 1
#endif

/* Define to 1 if you have the declaration of `CURLUPART_SCHEME', and to 0 if
   you don't. */
#ifndef SYSLOG_NG_HAVE_DECL_CURLUPART_SCHEME
#define SYSLOG_NG_HAVE_DECL_CURLUPART_SCHEME 1
#endif

/* Define to 1 if you have the declaration of `CURLUPART_URL', and to 0 if you
   don't. */
#ifndef SYSLOG_NG_HAVE_DECL_CURLUPART_URL
#define SYSLOG_NG_HAVE_DECL_CURLUPART_URL 1
#endif

/* Define to 1 if you have the declaration of `CURLUPART_USER', and to 0 if
   you don't. */
#ifndef SYSLOG_NG_HAVE_DECL_CURLUPART_USER
#define SYSLOG_NG_HAVE_DECL_CURLUPART_USER 1
#endif

/* Define to 1 if you have the declaration of `CURLU_ALLOW_SPACE', and to 0 if
   you don't. */
#ifndef SYSLOG_NG_HAVE_DECL_CURLU_ALLOW_SPACE
#define SYSLOG_NG_HAVE_DECL_CURLU_ALLOW_SPACE 1
#endif

/* Define to 1 if you have the declaration of `CURL_SSLVERSION_TLSv1_0', and
   to 0 if you don't. */
#ifndef SYSLOG_NG_HAVE_DECL_CURL_SSLVERSION_TLSV1_0
#define SYSLOG_NG_HAVE_DECL_CURL_SSLVERSION_TLSV1_0 1
#endif

/* Define to 1 if you have the declaration of `CURL_SSLVERSION_TLSv1_1', and
   to 0 if you don't. */
#ifndef SYSLOG_NG_HAVE_DECL_CURL_SSLVERSION_TLSV1_1
#define SYSLOG_NG_HAVE_DECL_CURL_SSLVERSION_TLSV1_1 1
#endif

/* Define to 1 if you have the declaration of `CURL_SSLVERSION_TLSv1_2', and
   to 0 if you don't. */
#ifndef SYSLOG_NG_HAVE_DECL_CURL_SSLVERSION_TLSV1_2
#define SYSLOG_NG_HAVE_DECL_CURL_SSLVERSION_TLSV1_2 1
#endif

/* Define to 1 if you have the declaration of `CURL_SSLVERSION_TLSv1_3', and
   to 0 if you don't. */
#ifndef SYSLOG_NG_HAVE_DECL_CURL_SSLVERSION_TLSV1_3
#define SYSLOG_NG_HAVE_DECL_CURL_SSLVERSION_TLSV1_3 1
#endif

/* Define to 1 if you have the declaration of `curl_url', and to 0 if you
   don't. */
#ifndef SYSLOG_NG_HAVE_DECL_CURL_URL
#define SYSLOG_NG_HAVE_DECL_CURL_URL 1
#endif

/* Define to 1 if you have the declaration of `DH_set0_pqg', and to 0 if you
   don't. */
#ifndef SYSLOG_NG_HAVE_DECL_DH_SET0_PQG
#define SYSLOG_NG_HAVE_DECL_DH_SET0_PQG 1
#endif

/* Define to 1 if you have the declaration of `EVP_MD_CTX_reset', and to 0 if
   you don't. */
#ifndef SYSLOG_NG_HAVE_DECL_EVP_MD_CTX_RESET
#define SYSLOG_NG_HAVE_DECL_EVP_MD_CTX_RESET 1
#endif

/* Define to 1 if you have the declaration of
   `MONGOC_URI_SERVERSELECTIONTIMEOUTMS', and to 0 if you don't. */
/* #undef HAVE_DECL_MONGOC_URI_SERVERSELECTIONTIMEOUTMS */

/* Define to 1 if you have the declaration of
   `mongoc_uri_set_option_as_int32', and to 0 if you don't. */
/* #undef HAVE_DECL_MONGOC_URI_SET_OPTION_AS_INT32 */

/* Define to 1 if you have the declaration of
   `RIEMANN_EVENT_FIELD_TIME_MICROS', and to 0 if you don't. */
/* #undef HAVE_DECL_RIEMANN_EVENT_FIELD_TIME_MICROS */

/* Define to 1 if you have the declaration of `SO_MEMINFO', and to 0 if you
   don't. */
#ifndef SYSLOG_NG_HAVE_DECL_SO_MEMINFO
#define SYSLOG_NG_HAVE_DECL_SO_MEMINFO 0
#endif

/* Define to 1 if you have the declaration of
   `SSL_add_dir_cert_subjects_to_stack', and to 0 if you don't. */
#ifndef SYSLOG_NG_HAVE_DECL_SSL_ADD_DIR_CERT_SUBJECTS_TO_STACK
#define SYSLOG_NG_HAVE_DECL_SSL_ADD_DIR_CERT_SUBJECTS_TO_STACK 1
#endif

/* Define to 1 if you have the declaration of
   `SSL_add_file_cert_subjects_to_stack', and to 0 if you don't. */
#ifndef SYSLOG_NG_HAVE_DECL_SSL_ADD_FILE_CERT_SUBJECTS_TO_STACK
#define SYSLOG_NG_HAVE_DECL_SSL_ADD_FILE_CERT_SUBJECTS_TO_STACK 1
#endif

/* Define to 1 if you have the declaration of `SSL_CONF_CTX_new', and to 0 if
   you don't. */
#ifndef SYSLOG_NG_HAVE_DECL_SSL_CONF_CTX_NEW
#define SYSLOG_NG_HAVE_DECL_SSL_CONF_CTX_NEW 1
#endif

/* Define to 1 if you have the declaration of `SSL_CTX_get0_param', and to 0
   if you don't. */
#ifndef SYSLOG_NG_HAVE_DECL_SSL_CTX_GET0_PARAM
#define SYSLOG_NG_HAVE_DECL_SSL_CTX_GET0_PARAM 1
#endif

/* Define to 1 if you have the declaration of
   `SSL_CTX_set1_client_sigalgs_list', and to 0 if you don't. */
#ifndef SYSLOG_NG_HAVE_DECL_SSL_CTX_SET1_CLIENT_SIGALGS_LIST
#define SYSLOG_NG_HAVE_DECL_SSL_CTX_SET1_CLIENT_SIGALGS_LIST 1
#endif

/* Define to 1 if you have the declaration of `SSL_CTX_set1_sigalgs_list', and
   to 0 if you don't. */
#ifndef SYSLOG_NG_HAVE_DECL_SSL_CTX_SET1_SIGALGS_LIST
#define SYSLOG_NG_HAVE_DECL_SSL_CTX_SET1_SIGALGS_LIST 1
#endif

/* Define to 1 if you have the declaration of `SSL_CTX_set_ciphersuites', and
   to 0 if you don't. */
#ifndef SYSLOG_NG_HAVE_DECL_SSL_CTX_SET_CIPHERSUITES
#define SYSLOG_NG_HAVE_DECL_SSL_CTX_SET_CIPHERSUITES 1
#endif

/* Define to 1 if you have the declaration of `SSL_CTX_set_min_proto_version',
   and to 0 if you don't. */
#ifndef SYSLOG_NG_HAVE_DECL_SSL_CTX_SET_MIN_PROTO_VERSION
#define SYSLOG_NG_HAVE_DECL_SSL_CTX_SET_MIN_PROTO_VERSION 1
#endif

/* Define to 1 if you have the declaration of `SSL_CTX_set_num_tickets', and
   to 0 if you don't. */
#ifndef SYSLOG_NG_HAVE_DECL_SSL_CTX_SET_NUM_TICKETS
#define SYSLOG_NG_HAVE_DECL_SSL_CTX_SET_NUM_TICKETS 1
#endif

/* Define to 1 if you have the declaration of `TCP_KEEPCNT', and to 0 if you
   don't. */
#ifndef SYSLOG_NG_HAVE_DECL_TCP_KEEPCNT
#define SYSLOG_NG_HAVE_DECL_TCP_KEEPCNT 1
#endif

/* Define to 1 if you have the declaration of `TCP_KEEPIDLE', and to 0 if you
   don't. */
#ifndef SYSLOG_NG_HAVE_DECL_TCP_KEEPIDLE
#define SYSLOG_NG_HAVE_DECL_TCP_KEEPIDLE 1
#endif

/* Define to 1 if you have the declaration of `TCP_KEEPINTVL', and to 0 if you
   don't. */
#ifndef SYSLOG_NG_HAVE_DECL_TCP_KEEPINTVL
#define SYSLOG_NG_HAVE_DECL_TCP_KEEPINTVL 1
#endif

/* Define to 1 if you have the declaration of `tzname', and to 0 if you don't.
   */
/* #undef HAVE_DECL_TZNAME */

/* Define to 1 if you have the declaration of `X509_get_extension_flags', and
   to 0 if you don't. */
#ifndef SYSLOG_NG_HAVE_DECL_X509_GET_EXTENSION_FLAGS
#define SYSLOG_NG_HAVE_DECL_X509_GET_EXTENSION_FLAGS 1
#endif

/* Define to 1 if you have the declaration of `X509_STORE_CTX_get0_cert', and
   to 0 if you don't. */
#ifndef SYSLOG_NG_HAVE_DECL_X509_STORE_CTX_GET0_CERT
#define SYSLOG_NG_HAVE_DECL_X509_STORE_CTX_GET0_CERT 1
#endif

/* Define to 1 if you have the <dlfcn.h> header file. */
#ifndef SYSLOG_NG_HAVE_DLFCN_H
#define SYSLOG_NG_HAVE_DLFCN_H 1
#endif

/* Define to 1 if you have the <door.h> header file. */
/* #undef HAVE_DOOR_H */

/* Specifies whether the environ global variable exists */
#ifndef SYSLOG_NG_HAVE_ENVIRON
#define SYSLOG_NG_HAVE_ENVIRON 1
#endif

/* Define to 1 if you have the `fmemopen' function. */
#ifndef SYSLOG_NG_HAVE_FMEMOPEN
#define SYSLOG_NG_HAVE_FMEMOPEN 1
#endif

/* Define to 1 if you have the `getaddrinfo' function. */
#ifndef SYSLOG_NG_HAVE_GETADDRINFO
#define SYSLOG_NG_HAVE_GETADDRINFO 1
#endif

/* Define to 1 if you have the `getline' function. */
#ifndef SYSLOG_NG_HAVE_GETLINE
#define SYSLOG_NG_HAVE_GETLINE 1
#endif

/* Define to 1 if you have the `getnameinfo' function. */
#ifndef SYSLOG_NG_HAVE_GETNAMEINFO
#define SYSLOG_NG_HAVE_GETNAMEINFO 1
#endif

/* Define to 1 if you have the <getopt.h> header file. */
#ifndef SYSLOG_NG_HAVE_GETOPT_H
#define SYSLOG_NG_HAVE_GETOPT_H 1
#endif

/* Define to 1 if you have the `getprotobynumber_r' function. */
#ifndef SYSLOG_NG_HAVE_GETPROTOBYNUMBER_R
#define SYSLOG_NG_HAVE_GETPROTOBYNUMBER_R 1
#endif

/* Define to 1 if you have the `getrandom' function. */
#ifndef SYSLOG_NG_HAVE_GETRANDOM
#define SYSLOG_NG_HAVE_GETRANDOM 1
#endif

/* Define to 1 if you have the `getutent' function. */
/* #undef HAVE_GETUTENT */

/* Define to 1 if you have the `getutxent' function. */
#ifndef SYSLOG_NG_HAVE_GETUTXENT
#define SYSLOG_NG_HAVE_GETUTXENT 1
#endif

/* Define to 1 if you have the `gmtime_r' function. */
#ifndef SYSLOG_NG_HAVE_GMTIME_R
#define SYSLOG_NG_HAVE_GMTIME_R 1
#endif

/* Define to 1 if you have the `g_canonicalize_filename' function. */
#ifndef SYSLOG_NG_HAVE_G_CANONICALIZE_FILENAME
#define SYSLOG_NG_HAVE_G_CANONICALIZE_FILENAME 1
#endif

/* Define to 1 if you have the `g_list_copy_deep' function. */
#ifndef SYSLOG_NG_HAVE_G_LIST_COPY_DEEP
#define SYSLOG_NG_HAVE_G_LIST_COPY_DEEP 1
#endif

/* Define to 1 if you have the `g_memdup2' function. */
#ifndef SYSLOG_NG_HAVE_G_MEMDUP2
#define SYSLOG_NG_HAVE_G_MEMDUP2 1
#endif

/* Define to 1 if you have the `g_ptr_array_find_with_equal_func' function. */
#ifndef SYSLOG_NG_HAVE_G_PTR_ARRAY_FIND_WITH_EQUAL_FUNC
#define SYSLOG_NG_HAVE_G_PTR_ARRAY_FIND_WITH_EQUAL_FUNC 1
#endif

/* Define to 1 if you have the `inet_aton' function. */
#ifndef SYSLOG_NG_HAVE_INET_ATON
#define SYSLOG_NG_HAVE_INET_ATON 1
#endif

/* Define to 1 if you have the `inet_ntoa' function. */
#ifndef SYSLOG_NG_HAVE_INET_NTOA
#define SYSLOG_NG_HAVE_INET_NTOA 1
#endif

/* Have inotify */
#ifndef SYSLOG_NG_HAVE_INOTIFY
#define SYSLOG_NG_HAVE_INOTIFY 0
#endif

/* Define to 1 if you have the `inotify_init' function. */
/* #undef HAVE_INOTIFY_INIT */

/* Define to 1 if you have the <inttypes.h> header file. */
#ifndef SYSLOG_NG_HAVE_INTTYPES_H
#define SYSLOG_NG_HAVE_INTTYPES_H 1
#endif

/* Define to 1 if you have the `iv_work_pool_submit_continuation' function. */
#ifndef SYSLOG_NG_HAVE_IV_WORK_POOL_SUBMIT_CONTINUATION
#define SYSLOG_NG_HAVE_IV_WORK_POOL_SUBMIT_CONTINUATION 1
#endif

/* have journal namespaces */
#ifndef SYSLOG_NG_HAVE_JOURNAL_NAMESPACES
#define SYSLOG_NG_HAVE_JOURNAL_NAMESPACES 0
#endif

/* Define to 1 if you have the `pthread' library (-lpthread). */
/* #undef HAVE_LIBPTHREAD */

/* Define to 1 if you have the <linux/sock_diag.h> header file. */
/* #undef HAVE_LINUX_SOCK_DIAG_H */

/* Define to 1 if you have the `localtime_r' function. */
#ifndef SYSLOG_NG_HAVE_LOCALTIME_R
#define SYSLOG_NG_HAVE_LOCALTIME_R 1
#endif

/* Define to 1 if you have the `memrchr' function. */
#ifndef SYSLOG_NG_HAVE_MEMRCHR
#define SYSLOG_NG_HAVE_MEMRCHR 1
#endif

/* have modern utmp/utmpx format */
#ifndef SYSLOG_NG_HAVE_MODERN_UTMP
#define SYSLOG_NG_HAVE_MODERN_UTMP 1
#endif

/* Define to 1 if you have the <OSLog/OSLog.h> header file. */
/* #undef HAVE_OSLOG_OSLOG_H */

/* O_LARGEFILE is present */
/* #undef HAVE_O_LARGEFILE */

/* libpaho-mqtt supports MQTTClient_connectOptions::httpProxy */
/* #undef HAVE_PAHO_HTTP_PROXY */

/* Define to 1 if you have the `posix_fallocate' function. */
#ifndef SYSLOG_NG_HAVE_POSIX_FALLOCATE
#define SYSLOG_NG_HAVE_POSIX_FALLOCATE 1
#endif

/* Define to 1 if you have the `pread' function. */
#ifndef SYSLOG_NG_HAVE_PREAD
#define SYSLOG_NG_HAVE_PREAD 1
#endif

/* have PR_SET_KEEPCAPS */
/* #undef HAVE_PR_SET_KEEPCAPS */

/* Define to 1 if you have the <pthread.h> header file. */
/* #undef HAVE_PTHREAD_H */

/* Define to 1 if you have the `pwrite' function. */
#ifndef SYSLOG_NG_HAVE_PWRITE
#define SYSLOG_NG_HAVE_PWRITE 1
#endif

/* Define to 1 if you have the `rd_kafka_init_transactions' function. */
/* #undef HAVE_RD_KAFKA_INIT_TRANSACTIONS */

/* Riemann microseconds support */
/* #undef HAVE_RIEMANN_MICROSECONDS */

/* Define to 1 if you have the <stdint.h> header file. */
#ifndef SYSLOG_NG_HAVE_STDINT_H
#define SYSLOG_NG_HAVE_STDINT_H 1
#endif

/* Define to 1 if you have the <stdio.h> header file. */
#ifndef SYSLOG_NG_HAVE_STDIO_H
#define SYSLOG_NG_HAVE_STDIO_H 1
#endif

/* Define to 1 if you have the <stdlib.h> header file. */
#ifndef SYSLOG_NG_HAVE_STDLIB_H
#define SYSLOG_NG_HAVE_STDLIB_H 1
#endif

/* Define to 1 if you have the `strcasestr' function. */
#ifndef SYSLOG_NG_HAVE_STRCASESTR
#define SYSLOG_NG_HAVE_STRCASESTR 1
#endif

/* Define to 1 if you have the `strdup' function. */
#ifndef SYSLOG_NG_HAVE_STRDUP
#define SYSLOG_NG_HAVE_STRDUP 1
#endif

/* Define to 1 if you have the <strings.h> header file. */
#ifndef SYSLOG_NG_HAVE_STRINGS_H
#define SYSLOG_NG_HAVE_STRINGS_H 1
#endif

/* Define to 1 if you have the <string.h> header file. */
#ifndef SYSLOG_NG_HAVE_STRING_H
#define SYSLOG_NG_HAVE_STRING_H 1
#endif

/* Define to 1 if you have the `strnlen' function. */
#ifndef SYSLOG_NG_HAVE_STRNLEN
#define SYSLOG_NG_HAVE_STRNLEN 1
#endif

/* Define to 1 if you have the <stropts.h> header file. */
/* #undef HAVE_STROPTS_H */

/* Define to 1 if you have the `strtoimax' function. */
#ifndef SYSLOG_NG_HAVE_STRTOIMAX
#define SYSLOG_NG_HAVE_STRTOIMAX 1
#endif

/* Define to 1 if you have the `strtok_r' function. */
#ifndef SYSLOG_NG_HAVE_STRTOK_R
#define SYSLOG_NG_HAVE_STRTOK_R 1
#endif

/* Define to 1 if you have the `strtol' function. */
#ifndef SYSLOG_NG_HAVE_STRTOL
#define SYSLOG_NG_HAVE_STRTOL 1
#endif

/* Define to 1 if you have the `strtoll' function. */
#ifndef SYSLOG_NG_HAVE_STRTOLL
#define SYSLOG_NG_HAVE_STRTOLL 1
#endif

/* Define to 1 if the system has the type `struct cmsgcred'. */
#ifndef SYSLOG_NG_HAVE_STRUCT_CMSGCRED
#define SYSLOG_NG_HAVE_STRUCT_CMSGCRED 1
#endif

/* struct sockaddr_storage is present on your system */
#ifndef SYSLOG_NG_HAVE_STRUCT_SOCKADDR_STORAGE
#define SYSLOG_NG_HAVE_STRUCT_SOCKADDR_STORAGE 1
#endif

/* Whether you have tm_gmtoff field in struct tm */
#ifndef SYSLOG_NG_HAVE_STRUCT_TM_TM_GMTOFF
#define SYSLOG_NG_HAVE_STRUCT_TM_TM_GMTOFF 1
#endif

/* Define to 1 if `tm_zone' is a member of `struct tm'. */
#ifndef SYSLOG_NG_HAVE_STRUCT_TM_TM_ZONE
#define SYSLOG_NG_HAVE_STRUCT_TM_TM_ZONE 1
#endif

/* Define to 1 if the system has the type `struct ucred'. */
/* #undef HAVE_STRUCT_UCRED */

/* Define to 1 if you have the <sys/capability.h> header file. */
/* #undef HAVE_SYS_CAPABILITY_H */

/* Define to 1 if you have the <sys/prctl.h> header file. */
/* #undef HAVE_SYS_PRCTL_H */

/* Define to 1 if you have the <sys/stat.h> header file. */
#ifndef SYSLOG_NG_HAVE_SYS_STAT_H
#define SYSLOG_NG_HAVE_SYS_STAT_H 1
#endif

/* Define to 1 if you have the <sys/strlog.h> header file. */
/* #undef HAVE_SYS_STRLOG_H */

/* Define to 1 if you have the <sys/types.h> header file. */
#ifndef SYSLOG_NG_HAVE_SYS_TYPES_H
#define SYSLOG_NG_HAVE_SYS_TYPES_H 1
#endif

/* Define to 1 if you have the <tcpd.h> header file. */
#ifndef SYSLOG_NG_HAVE_TCPD_H
#define SYSLOG_NG_HAVE_TCPD_H 1
#endif

/* TCP keepalive timers */
#ifndef SYSLOG_NG_HAVE_TCP_KEEPALIVE_TIMERS
#define SYSLOG_NG_HAVE_TCP_KEEPALIVE_TIMERS 1
#endif

/* "Whether Thread Local Storage is supported by the system" */
#ifndef SYSLOG_NG_HAVE_THREAD_KEYWORD
#define SYSLOG_NG_HAVE_THREAD_KEYWORD 1
#endif

/* Define to 1 if you have the external `timezone' variable. */
/* #undef HAVE_TIMEZONE */

/* Define to 1 if your `struct tm' has `tm_zone'. Deprecated, use
   `HAVE_STRUCT_TM_TM_ZONE' instead. */
#ifndef SYSLOG_NG_HAVE_TM_ZONE
#define SYSLOG_NG_HAVE_TM_ZONE 1
#endif

/* Define to 1 if you don't have `tm_zone' but do have the external array
   `tzname'. */
/* #undef HAVE_TZNAME */

/* Define to 1 if you have the <unistd.h> header file. */
#ifndef SYSLOG_NG_HAVE_UNISTD_H
#define SYSLOG_NG_HAVE_UNISTD_H 1
#endif

/* Define to 1 if you have the <utmpx.h> header file. */
#ifndef SYSLOG_NG_HAVE_UTMPX_H
#define SYSLOG_NG_HAVE_UTMPX_H 1
#endif

/* Define to 1 if you have the <utmp.h> header file. */
/* #undef HAVE_UTMP_H */

/* Define if zlib is available */
#ifndef SYSLOG_NG_HAVE_ZLIB
#define SYSLOG_NG_HAVE_ZLIB /**/
#endif

/* java module search path */
#ifndef SYSLOG_NG_JAVA_MODULE_PATH
#define SYSLOG_NG_JAVA_MODULE_PATH "${exec_prefix}/lib/syslog-ng/java-modules"
#endif

/* "Disable systemd-journal source" */
#ifndef SYSLOG_NG_JOURNALD_OFF
#define SYSLOG_NG_JOURNALD_OFF 0
#endif

/* "Enable systemd-journal source if journald is available" */
#ifndef SYSLOG_NG_JOURNALD_OPTIONAL
#define SYSLOG_NG_JOURNALD_OPTIONAL 1
#endif

/* "Force systemd-journal source to use system's journald" */
#ifndef SYSLOG_NG_JOURNALD_SYSTEM
#define SYSLOG_NG_JOURNALD_SYSTEM 2
#endif

/* Required license version */
#ifndef SYSLOG_NG_LICENSE_VERSION
#define SYSLOG_NG_LICENSE_VERSION ""
#endif

/* Define to the sub-directory where libtool stores uninstalled libraries. */
#ifndef SYSLOG_NG_LT_OBJDIR
#define SYSLOG_NG_LT_OBJDIR ".libs/"
#endif

/* module search path */
#ifndef SYSLOG_NG_MODULE_PATH
#define SYSLOG_NG_MODULE_PATH "${exec_prefix}/lib/syslog-ng"
#endif

/* Define to the address where bug reports for this package should be sent. */
#ifndef SYSLOG_NG_PACKAGE_BUGREPORT
#define SYSLOG_NG_PACKAGE_BUGREPORT ""
#endif

/* package name */
#ifndef SYSLOG_NG_PACKAGE_NAME
#define SYSLOG_NG_PACKAGE_NAME "syslog-ng"
#endif

/* Define to the full name and version of this package. */
#ifndef SYSLOG_NG_PACKAGE_STRING
#define SYSLOG_NG_PACKAGE_STRING "syslog-ng 4.7.1"
#endif

/* Define to the one symbol short name of this package. */
#ifndef SYSLOG_NG_PACKAGE_TARNAME
#define SYSLOG_NG_PACKAGE_TARNAME "syslog-ng"
#endif

/* Define to the home page for this package. */
#ifndef SYSLOG_NG_PACKAGE_URL
#define SYSLOG_NG_PACKAGE_URL ""
#endif

/* Define to the version of this package. */
#ifndef SYSLOG_NG_PACKAGE_VERSION
#define SYSLOG_NG_PACKAGE_VERSION "4.7.1"
#endif

/* include directory */
#ifndef SYSLOG_NG_PATH_CONFIG_INCLUDEDIR
#define SYSLOG_NG_PATH_CONFIG_INCLUDEDIR "${datadir}/syslog-ng/include"
#endif

/* data directory */
#ifndef SYSLOG_NG_PATH_DATADIR
#define SYSLOG_NG_PATH_DATADIR "/usr/local/share"
#endif

/* data root directory */
#ifndef SYSLOG_NG_PATH_DATAROOTDIR
#define SYSLOG_NG_PATH_DATAROOTDIR "${prefix}/share"
#endif

/* execprefix directory */
#ifndef SYSLOG_NG_PATH_EXECPREFIX
#define SYSLOG_NG_PATH_EXECPREFIX "${prefix}"
#endif

/* libexec directory */
#ifndef SYSLOG_NG_PATH_LIBEXECDIR
#define SYSLOG_NG_PATH_LIBEXECDIR "${exec_prefix}/libexec"
#endif

/* local state directory */
#ifndef SYSLOG_NG_PATH_LOCALSTATEDIR
#define SYSLOG_NG_PATH_LOCALSTATEDIR "/var/db"
#endif

/* loggenplugin installation directory */
#ifndef SYSLOG_NG_PATH_LOGGENPLUGINDIR
#define SYSLOG_NG_PATH_LOGGENPLUGINDIR "${moduledir}/loggen"
#endif

/* module installation directory */
#ifndef SYSLOG_NG_PATH_MODULEDIR
#define SYSLOG_NG_PATH_MODULEDIR "${exec_prefix}/lib/syslog-ng"
#endif

/* local state directory */
#ifndef SYSLOG_NG_PATH_PIDFILEDIR
#define SYSLOG_NG_PATH_PIDFILEDIR "${localstatedir}"
#endif

/* pkgdata directory */
#ifndef SYSLOG_NG_PATH_PKGDATADIR
#define SYSLOG_NG_PATH_PKGDATADIR "/usr/local/share/syslog-ng"
#endif

/* prefix directory */
#ifndef SYSLOG_NG_PATH_PREFIX
#define SYSLOG_NG_PATH_PREFIX "/usr/local"
#endif

/* SCL directory */
#ifndef SYSLOG_NG_PATH_SCLDIR
#define SYSLOG_NG_PATH_SCLDIR "${datadir}/syslog-ng/include/scl"
#endif

/* sysconfdir */
#ifndef SYSLOG_NG_PATH_SYSCONFDIR
#define SYSLOG_NG_PATH_SYSCONFDIR "/usr/local/etc"
#endif

/* timezone base directory */
/* #undef PATH_TIMEZONEDIR */

/* self-defined top_srcdir path */
#ifndef SYSLOG_NG_PATH_TOPSRC_DIR
#define SYSLOG_NG_PATH_TOPSRC_DIR "/usr/obj/usr/ports/sysutils/syslog-ng/work/syslog-ng-4.7.1"
#endif

/* XSD directory */
#ifndef SYSLOG_NG_PATH_XSDDIR
#define SYSLOG_NG_PATH_XSDDIR "${datadir}/syslog-ng/xsd"
#endif

/* Hard-coded Python 3 home directory */
#ifndef SYSLOG_NG_PYTHON3_HOME_DIR
#define SYSLOG_NG_PYTHON3_HOME_DIR ""
#endif

/* Python module installation directory */
#ifndef SYSLOG_NG_PYTHON_MODULE_DIR
#define SYSLOG_NG_PYTHON_MODULE_DIR "${exec_prefix}/lib/syslog-ng/python"
#endif

/* Python module installation directory */
#ifndef SYSLOG_NG_PYTHON_SYSCONF_MODULE_DIR
#define SYSLOG_NG_PYTHON_SYSCONF_MODULE_DIR "/usr/local/etc/python"
#endif

/* Python virtualenv for hosting Python dependencies */
#ifndef SYSLOG_NG_PYTHON_VENV_DIR
#define SYSLOG_NG_PYTHON_VENV_DIR "${localstatedir}/python-venv"
#endif

/* type of syslog-ng release. stable or feature */
#ifndef SYSLOG_NG_RELEASE_TYPE
#define SYSLOG_NG_RELEASE_TYPE "stable"
#endif

/* source revision */
#ifndef SYSLOG_NG_SOURCE_REVISION
#define SYSLOG_NG_SOURCE_REVISION ""
#endif

/* Define to 1 if all of the C90 standard headers exist (not just the ones
   required in a freestanding environment). This macro is provided for
   backward compatibility; new code need not use it. */
#ifndef SYSLOG_NG_STDC_HEADERS
#define SYSLOG_NG_STDC_HEADERS 1
#endif

/* Systemd-journal support mode */
#ifndef SYSLOG_NG_SYSTEMD_JOURNAL_MODE
#define SYSLOG_NG_SYSTEMD_JOURNAL_MODE SYSLOG_NG_JOURNALD_OFF
#endif

/* Define to 1 if your <sys/time.h> declares `struct tm'. */
/* #undef TM_IN_SYS_TIME */

/* ivykis version is greater than $IVYKIS_UPDATED_VERSION */
#ifndef SYSLOG_NG_USE_CONST_IVYKIS_MOCK
#define SYSLOG_NG_USE_CONST_IVYKIS_MOCK 1
#endif

/* version number */
#ifndef SYSLOG_NG_VERSION
#define SYSLOG_NG_VERSION "4.7.1"
#endif

/* Include the compile date in the binary */
#ifndef SYSLOG_NG_WITH_COMPILE_DATE
#define SYSLOG_NG_WITH_COMPILE_DATE 1
#endif

/* Define to 1 if `lex' declares `yytext' as a `char *' by default, not a
   `char[]'. */
#ifndef SYSLOG_NG_YYTEXT_POINTER
#define SYSLOG_NG_YYTEXT_POINTER 1
#endif

/* Number of bits in a file offset, on hosts where this is settable. */
/* #undef _FILE_OFFSET_BITS */

/* Define for large files, on AIX-style hosts. */
/* #undef _LARGE_FILES */
 
/* once: _SYSLOG_NG_CONFIG_H */
#endif
