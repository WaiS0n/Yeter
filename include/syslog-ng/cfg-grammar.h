/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_MAIN_LIB_CFG_GRAMMAR_H_INCLUDED
# define YY_MAIN_LIB_CFG_GRAMMAR_H_INCLUDED
/* Debug traces.  */
#ifndef MAIN_DEBUG
# if defined YYDEBUG
#if YYDEBUG
#   define MAIN_DEBUG 1
#  else
#   define MAIN_DEBUG 0
#  endif
# else /* ! defined YYDEBUG */
#  define MAIN_DEBUG 0
# endif /* ! defined YYDEBUG */
#endif  /* ! defined MAIN_DEBUG */
#if MAIN_DEBUG
extern int main_debug;
#endif
/* "%code requires" blocks.  */
#line 25 "/source/lib/cfg-grammar.y"


/* this block is inserted into cfg-grammar.h, so it is included
   practically all of the syslog-ng code. Please add headers here
   with care. If you need additional headers, please look for a
   massive list of includes further below. */

/* YYSTYPE and YYLTYPE is defined by the lexer */
#include "cfg-lexer.h"
#include "cfg-grammar-internal.h"
#include "syslog-names.h"

/* uses struct declarations instead of the typedefs to avoid having to
 * include logreader/logwriter/driver.h, which defines the typedefs.  This
 * is to avoid including unnecessary dependencies into grammars that are not
 * themselves reader/writer based */


#line 76 "lib/cfg-grammar.h"

/* Token kinds.  */
#ifndef MAIN_TOKENTYPE
# define MAIN_TOKENTYPE
  enum main_tokentype
  {
    MAIN_EMPTY = -2,
    MAIN_EOF = 0,                  /* "end of file"  */
    MAIN_error = 256,              /* error  */
    MAIN_UNDEF = 10531,            /* "invalid token"  */
    LL_CONTEXT_ROOT = 1,           /* LL_CONTEXT_ROOT  */
    LL_CONTEXT_DESTINATION = 2,    /* LL_CONTEXT_DESTINATION  */
    LL_CONTEXT_SOURCE = 3,         /* LL_CONTEXT_SOURCE  */
    LL_CONTEXT_PARSER = 4,         /* LL_CONTEXT_PARSER  */
    LL_CONTEXT_REWRITE = 5,        /* LL_CONTEXT_REWRITE  */
    LL_CONTEXT_FILTER = 6,         /* LL_CONTEXT_FILTER  */
    LL_CONTEXT_LOG = 7,            /* LL_CONTEXT_LOG  */
    LL_CONTEXT_BLOCK_DEF = 8,      /* LL_CONTEXT_BLOCK_DEF  */
    LL_CONTEXT_BLOCK_REF = 9,      /* LL_CONTEXT_BLOCK_REF  */
    LL_CONTEXT_BLOCK_CONTENT = 10, /* LL_CONTEXT_BLOCK_CONTENT  */
    LL_CONTEXT_BLOCK_ARG = 11,     /* LL_CONTEXT_BLOCK_ARG  */
    LL_CONTEXT_PRAGMA = 12,        /* LL_CONTEXT_PRAGMA  */
    LL_CONTEXT_FORMAT = 13,        /* LL_CONTEXT_FORMAT  */
    LL_CONTEXT_TEMPLATE_FUNC = 14, /* LL_CONTEXT_TEMPLATE_FUNC  */
    LL_CONTEXT_INNER_DEST = 15,    /* LL_CONTEXT_INNER_DEST  */
    LL_CONTEXT_INNER_SRC = 16,     /* LL_CONTEXT_INNER_SRC  */
    LL_CONTEXT_CLIENT_PROTO = 17,  /* LL_CONTEXT_CLIENT_PROTO  */
    LL_CONTEXT_SERVER_PROTO = 18,  /* LL_CONTEXT_SERVER_PROTO  */
    LL_CONTEXT_OPTIONS = 19,       /* LL_CONTEXT_OPTIONS  */
    LL_CONTEXT_CONFIG = 20,        /* LL_CONTEXT_CONFIG  */
    LL_CONTEXT_TEMPLATE_REF = 21,  /* LL_CONTEXT_TEMPLATE_REF  */
    LL_CONTEXT_FILTERX = 22,       /* LL_CONTEXT_FILTERX  */
    LL_CONTEXT_FILTERX_FUNC = 23,  /* LL_CONTEXT_FILTERX_FUNC  */
    LL_CONTEXT_FILTERX_ENUM = 24,  /* LL_CONTEXT_FILTERX_ENUM  */
    LL_CONTEXT_MAX = 25,           /* LL_CONTEXT_MAX  */
    KW_ASSIGN = 9000,              /* KW_ASSIGN  */
    KW_OR = 9001,                  /* KW_OR  */
    KW_AND = 9002,                 /* KW_AND  */
    KW_STR_EQ = 9003,              /* KW_STR_EQ  */
    KW_STR_NE = 9004,              /* KW_STR_NE  */
    KW_TA_EQ = 9005,               /* KW_TA_EQ  */
    KW_TA_NE = 9006,               /* KW_TA_NE  */
    KW_TAV_EQ = 9007,              /* KW_TAV_EQ  */
    KW_TAV_NE = 9008,              /* KW_TAV_NE  */
    KW_STR_LT = 9009,              /* KW_STR_LT  */
    KW_STR_LE = 9010,              /* KW_STR_LE  */
    KW_STR_GE = 9011,              /* KW_STR_GE  */
    KW_STR_GT = 9012,              /* KW_STR_GT  */
    KW_TA_LT = 9013,               /* KW_TA_LT  */
    KW_TA_LE = 9014,               /* KW_TA_LE  */
    KW_TA_GE = 9015,               /* KW_TA_GE  */
    KW_TA_GT = 9016,               /* KW_TA_GT  */
    KW_PLUS_ASSIGN = 9018,         /* KW_PLUS_ASSIGN  */
    KW_NOT = 9017,                 /* KW_NOT  */
    KW_SOURCE = 10000,             /* KW_SOURCE  */
    KW_FILTER = 10001,             /* KW_FILTER  */
    KW_PARSER = 10002,             /* KW_PARSER  */
    KW_DESTINATION = 10003,        /* KW_DESTINATION  */
    KW_LOG = 10004,                /* KW_LOG  */
    KW_OPTIONS = 10005,            /* KW_OPTIONS  */
    KW_INCLUDE = 10006,            /* KW_INCLUDE  */
    KW_BLOCK = 10007,              /* KW_BLOCK  */
    KW_JUNCTION = 10008,           /* KW_JUNCTION  */
    KW_CHANNEL = 10009,            /* KW_CHANNEL  */
    KW_IF = 10010,                 /* KW_IF  */
    KW_ELSE = 10011,               /* KW_ELSE  */
    KW_ELIF = 10012,               /* KW_ELIF  */
    KW_FILTERX = 10013,            /* KW_FILTERX  */
    KW_INTERNAL = 10020,           /* KW_INTERNAL  */
    KW_SYSLOG = 10060,             /* KW_SYSLOG  */
    KW_MARK_FREQ = 10071,          /* KW_MARK_FREQ  */
    KW_STATS_FREQ = 10072,         /* KW_STATS_FREQ  */
    KW_STATS_LEVEL = 10073,        /* KW_STATS_LEVEL  */
    KW_STATS_LIFETIME = 10074,     /* KW_STATS_LIFETIME  */
    KW_FLUSH_LINES = 10075,        /* KW_FLUSH_LINES  */
    KW_SUPPRESS = 10076,           /* KW_SUPPRESS  */
    KW_FLUSH_TIMEOUT = 10077,      /* KW_FLUSH_TIMEOUT  */
    KW_LOG_MSG_SIZE = 10078,       /* KW_LOG_MSG_SIZE  */
    KW_FILE_TEMPLATE = 10079,      /* KW_FILE_TEMPLATE  */
    KW_PROTO_TEMPLATE = 10080,     /* KW_PROTO_TEMPLATE  */
    KW_MARK_MODE = 10081,          /* KW_MARK_MODE  */
    KW_ENCODING = 10082,           /* KW_ENCODING  */
    KW_TYPE = 10083,               /* KW_TYPE  */
    KW_STATS_MAX_DYNAMIC = 10084,  /* KW_STATS_MAX_DYNAMIC  */
    KW_MIN_IW_SIZE_PER_READER = 10085, /* KW_MIN_IW_SIZE_PER_READER  */
    KW_WORKERS = 10086,            /* KW_WORKERS  */
    KW_BATCH_LINES = 10087,        /* KW_BATCH_LINES  */
    KW_BATCH_TIMEOUT = 10088,      /* KW_BATCH_TIMEOUT  */
    KW_TRIM_LARGE_MESSAGES = 10089, /* KW_TRIM_LARGE_MESSAGES  */
    KW_STATS = 10400,              /* KW_STATS  */
    KW_FREQ = 10401,               /* KW_FREQ  */
    KW_LEVEL = 10402,              /* KW_LEVEL  */
    KW_LIFETIME = 10403,           /* KW_LIFETIME  */
    KW_MAX_DYNAMIC = 10404,        /* KW_MAX_DYNAMIC  */
    KW_SYSLOG_STATS = 10405,       /* KW_SYSLOG_STATS  */
    KW_HEALTHCHECK_FREQ = 10406,   /* KW_HEALTHCHECK_FREQ  */
    KW_WORKER_PARTITION_KEY = 10407, /* KW_WORKER_PARTITION_KEY  */
    KW_CHAIN_HOSTNAMES = 10090,    /* KW_CHAIN_HOSTNAMES  */
    KW_NORMALIZE_HOSTNAMES = 10091, /* KW_NORMALIZE_HOSTNAMES  */
    KW_KEEP_HOSTNAME = 10092,      /* KW_KEEP_HOSTNAME  */
    KW_CHECK_HOSTNAME = 10093,     /* KW_CHECK_HOSTNAME  */
    KW_BAD_HOSTNAME = 10094,       /* KW_BAD_HOSTNAME  */
    KW_LOG_LEVEL = 10095,          /* KW_LOG_LEVEL  */
    KW_KEEP_TIMESTAMP = 10100,     /* KW_KEEP_TIMESTAMP  */
    KW_USE_DNS = 10110,            /* KW_USE_DNS  */
    KW_USE_FQDN = 10111,           /* KW_USE_FQDN  */
    KW_CUSTOM_DOMAIN = 10112,      /* KW_CUSTOM_DOMAIN  */
    KW_DNS_CACHE = 10120,          /* KW_DNS_CACHE  */
    KW_DNS_CACHE_SIZE = 10121,     /* KW_DNS_CACHE_SIZE  */
    KW_DNS_CACHE_EXPIRE = 10130,   /* KW_DNS_CACHE_EXPIRE  */
    KW_DNS_CACHE_EXPIRE_FAILED = 10131, /* KW_DNS_CACHE_EXPIRE_FAILED  */
    KW_DNS_CACHE_HOSTS = 10132,    /* KW_DNS_CACHE_HOSTS  */
    KW_PERSIST_ONLY = 10140,       /* KW_PERSIST_ONLY  */
    KW_USE_RCPTID = 10141,         /* KW_USE_RCPTID  */
    KW_USE_UNIQID = 10142,         /* KW_USE_UNIQID  */
    KW_TZ_CONVERT = 10150,         /* KW_TZ_CONVERT  */
    KW_TS_FORMAT = 10151,          /* KW_TS_FORMAT  */
    KW_FRAC_DIGITS = 10152,        /* KW_FRAC_DIGITS  */
    KW_LOG_FIFO_SIZE = 10160,      /* KW_LOG_FIFO_SIZE  */
    KW_LOG_FETCH_LIMIT = 10162,    /* KW_LOG_FETCH_LIMIT  */
    KW_LOG_IW_SIZE = 10163,        /* KW_LOG_IW_SIZE  */
    KW_LOG_PREFIX = 10164,         /* KW_LOG_PREFIX  */
    KW_PROGRAM_OVERRIDE = 10165,   /* KW_PROGRAM_OVERRIDE  */
    KW_HOST_OVERRIDE = 10166,      /* KW_HOST_OVERRIDE  */
    KW_THROTTLE = 10170,           /* KW_THROTTLE  */
    KW_THREADED = 10171,           /* KW_THREADED  */
    KW_PASS_UNIX_CREDENTIALS = 10180, /* KW_PASS_UNIX_CREDENTIALS  */
    KW_PERSIST_NAME = 10181,       /* KW_PERSIST_NAME  */
    KW_READ_OLD_RECORDS = 10182,   /* KW_READ_OLD_RECORDS  */
    KW_USE_SYSLOGNG_PID = 10183,   /* KW_USE_SYSLOGNG_PID  */
    KW_FLAGS = 10190,              /* KW_FLAGS  */
    KW_PAD_SIZE = 10200,           /* KW_PAD_SIZE  */
    KW_TIME_ZONE = 10201,          /* KW_TIME_ZONE  */
    KW_RECV_TIME_ZONE = 10202,     /* KW_RECV_TIME_ZONE  */
    KW_SEND_TIME_ZONE = 10203,     /* KW_SEND_TIME_ZONE  */
    KW_LOCAL_TIME_ZONE = 10204,    /* KW_LOCAL_TIME_ZONE  */
    KW_FORMAT = 10205,             /* KW_FORMAT  */
    KW_MULTI_LINE_MODE = 10206,    /* KW_MULTI_LINE_MODE  */
    KW_MULTI_LINE_PREFIX = 10207,  /* KW_MULTI_LINE_PREFIX  */
    KW_MULTI_LINE_GARBAGE = 10208, /* KW_MULTI_LINE_GARBAGE  */
    KW_TRUNCATE_SIZE = 10209,      /* KW_TRUNCATE_SIZE  */
    KW_TIME_REOPEN = 10210,        /* KW_TIME_REOPEN  */
    KW_TIME_REAP = 10211,          /* KW_TIME_REAP  */
    KW_TIME_SLEEP = 10212,         /* KW_TIME_SLEEP  */
    KW_PARTITIONS = 10213,         /* KW_PARTITIONS  */
    KW_PARTITION_KEY = 10214,      /* KW_PARTITION_KEY  */
    KW_PARALLELIZE = 10215,        /* KW_PARALLELIZE  */
    KW_TMPL_ESCAPE = 10220,        /* KW_TMPL_ESCAPE  */
    KW_OPTIONAL = 10230,           /* KW_OPTIONAL  */
    KW_CREATE_DIRS = 10240,        /* KW_CREATE_DIRS  */
    KW_OWNER = 10250,              /* KW_OWNER  */
    KW_GROUP = 10251,              /* KW_GROUP  */
    KW_PERM = 10252,               /* KW_PERM  */
    KW_DIR_OWNER = 10260,          /* KW_DIR_OWNER  */
    KW_DIR_GROUP = 10261,          /* KW_DIR_GROUP  */
    KW_DIR_PERM = 10262,           /* KW_DIR_PERM  */
    KW_TEMPLATE = 10270,           /* KW_TEMPLATE  */
    KW_TEMPLATE_ESCAPE = 10271,    /* KW_TEMPLATE_ESCAPE  */
    KW_TEMPLATE_FUNCTION = 10272,  /* KW_TEMPLATE_FUNCTION  */
    KW_DEFAULT_FACILITY = 10300,   /* KW_DEFAULT_FACILITY  */
    KW_DEFAULT_SEVERITY = 10301,   /* KW_DEFAULT_SEVERITY  */
    KW_SDATA_PREFIX = 10302,       /* KW_SDATA_PREFIX  */
    KW_PORT = 10323,               /* KW_PORT  */
    KW_USE_TIME_RECVD = 10340,     /* KW_USE_TIME_RECVD  */
    KW_FACILITY = 10350,           /* KW_FACILITY  */
    KW_SEVERITY = 10351,           /* KW_SEVERITY  */
    KW_HOST = 10352,               /* KW_HOST  */
    KW_MATCH = 10353,              /* KW_MATCH  */
    KW_MESSAGE = 10354,            /* KW_MESSAGE  */
    KW_NETMASK = 10355,            /* KW_NETMASK  */
    KW_TAGS = 10356,               /* KW_TAGS  */
    KW_NETMASK6 = 10357,           /* KW_NETMASK6  */
    KW_REWRITE = 10370,            /* KW_REWRITE  */
    KW_CONDITION = 10371,          /* KW_CONDITION  */
    KW_VALUE = 10372,              /* KW_VALUE  */
    KW_YES = 10380,                /* KW_YES  */
    KW_NO = 10381,                 /* KW_NO  */
    KW_AUTO = 10382,               /* KW_AUTO  */
    KW_IFDEF = 10410,              /* KW_IFDEF  */
    KW_ENDIF = 10411,              /* KW_ENDIF  */
    LL_DOTDOT = 10420,             /* LL_DOTDOT  */
    LL_DOTDOTDOT = 10421,          /* LL_DOTDOTDOT  */
    LL_PRAGMA = 10422,             /* LL_PRAGMA  */
    LL_EOL = 10423,                /* LL_EOL  */
    LL_ERROR = 10424,              /* LL_ERROR  */
    LL_ARROW = 10425,              /* LL_ARROW  */
    LL_IDENTIFIER = 10430,         /* LL_IDENTIFIER  */
    LL_NUMBER = 10431,             /* LL_NUMBER  */
    LL_FLOAT = 10432,              /* LL_FLOAT  */
    LL_STRING = 10433,             /* LL_STRING  */
    LL_TOKEN = 10434,              /* LL_TOKEN  */
    LL_BLOCK = 10435,              /* LL_BLOCK  */
    LL_PLUGIN = 10436,             /* LL_PLUGIN  */
    LL_TEMPLATE_REF = 10437,       /* LL_TEMPLATE_REF  */
    LL_MESSAGE_REF = 10438,        /* LL_MESSAGE_REF  */
    KW_VALUE_PAIRS = 10500,        /* KW_VALUE_PAIRS  */
    KW_EXCLUDE = 10502,            /* KW_EXCLUDE  */
    KW_PAIR = 10503,               /* KW_PAIR  */
    KW_KEY = 10504,                /* KW_KEY  */
    KW_SCOPE = 10505,              /* KW_SCOPE  */
    KW_SHIFT = 10506,              /* KW_SHIFT  */
    KW_SHIFT_LEVELS = 10507,       /* KW_SHIFT_LEVELS  */
    KW_REKEY = 10508,              /* KW_REKEY  */
    KW_ADD_PREFIX = 10509,         /* KW_ADD_PREFIX  */
    KW_REPLACE_PREFIX = 10510,     /* KW_REPLACE_PREFIX  */
    KW_CAST = 10511,               /* KW_CAST  */
    KW_UPPER = 10512,              /* KW_UPPER  */
    KW_LOWER = 10513,              /* KW_LOWER  */
    KW_INCLUDE_BYTES = 10514,      /* KW_INCLUDE_BYTES  */
    KW_ON_ERROR = 10520,           /* KW_ON_ERROR  */
    KW_RETRIES = 10521,            /* KW_RETRIES  */
    KW_FETCH_NO_DATA_DELAY = 10522, /* KW_FETCH_NO_DATA_DELAY  */
    KW_LABELS = 10530              /* KW_LABELS  */
  };
  typedef enum main_tokentype main_token_kind_t;
#endif
/* Token kinds.  */
#define MAIN_EMPTY -2
#define MAIN_EOF 0
#define MAIN_error 256
#define MAIN_UNDEF 10531
#define LL_CONTEXT_ROOT 1
#define LL_CONTEXT_DESTINATION 2
#define LL_CONTEXT_SOURCE 3
#define LL_CONTEXT_PARSER 4
#define LL_CONTEXT_REWRITE 5
#define LL_CONTEXT_FILTER 6
#define LL_CONTEXT_LOG 7
#define LL_CONTEXT_BLOCK_DEF 8
#define LL_CONTEXT_BLOCK_REF 9
#define LL_CONTEXT_BLOCK_CONTENT 10
#define LL_CONTEXT_BLOCK_ARG 11
#define LL_CONTEXT_PRAGMA 12
#define LL_CONTEXT_FORMAT 13
#define LL_CONTEXT_TEMPLATE_FUNC 14
#define LL_CONTEXT_INNER_DEST 15
#define LL_CONTEXT_INNER_SRC 16
#define LL_CONTEXT_CLIENT_PROTO 17
#define LL_CONTEXT_SERVER_PROTO 18
#define LL_CONTEXT_OPTIONS 19
#define LL_CONTEXT_CONFIG 20
#define LL_CONTEXT_TEMPLATE_REF 21
#define LL_CONTEXT_FILTERX 22
#define LL_CONTEXT_FILTERX_FUNC 23
#define LL_CONTEXT_FILTERX_ENUM 24
#define LL_CONTEXT_MAX 25
#define KW_ASSIGN 9000
#define KW_OR 9001
#define KW_AND 9002
#define KW_STR_EQ 9003
#define KW_STR_NE 9004
#define KW_TA_EQ 9005
#define KW_TA_NE 9006
#define KW_TAV_EQ 9007
#define KW_TAV_NE 9008
#define KW_STR_LT 9009
#define KW_STR_LE 9010
#define KW_STR_GE 9011
#define KW_STR_GT 9012
#define KW_TA_LT 9013
#define KW_TA_LE 9014
#define KW_TA_GE 9015
#define KW_TA_GT 9016
#define KW_PLUS_ASSIGN 9018
#define KW_NOT 9017
#define KW_SOURCE 10000
#define KW_FILTER 10001
#define KW_PARSER 10002
#define KW_DESTINATION 10003
#define KW_LOG 10004
#define KW_OPTIONS 10005
#define KW_INCLUDE 10006
#define KW_BLOCK 10007
#define KW_JUNCTION 10008
#define KW_CHANNEL 10009
#define KW_IF 10010
#define KW_ELSE 10011
#define KW_ELIF 10012
#define KW_FILTERX 10013
#define KW_INTERNAL 10020
#define KW_SYSLOG 10060
#define KW_MARK_FREQ 10071
#define KW_STATS_FREQ 10072
#define KW_STATS_LEVEL 10073
#define KW_STATS_LIFETIME 10074
#define KW_FLUSH_LINES 10075
#define KW_SUPPRESS 10076
#define KW_FLUSH_TIMEOUT 10077
#define KW_LOG_MSG_SIZE 10078
#define KW_FILE_TEMPLATE 10079
#define KW_PROTO_TEMPLATE 10080
#define KW_MARK_MODE 10081
#define KW_ENCODING 10082
#define KW_TYPE 10083
#define KW_STATS_MAX_DYNAMIC 10084
#define KW_MIN_IW_SIZE_PER_READER 10085
#define KW_WORKERS 10086
#define KW_BATCH_LINES 10087
#define KW_BATCH_TIMEOUT 10088
#define KW_TRIM_LARGE_MESSAGES 10089
#define KW_STATS 10400
#define KW_FREQ 10401
#define KW_LEVEL 10402
#define KW_LIFETIME 10403
#define KW_MAX_DYNAMIC 10404
#define KW_SYSLOG_STATS 10405
#define KW_HEALTHCHECK_FREQ 10406
#define KW_WORKER_PARTITION_KEY 10407
#define KW_CHAIN_HOSTNAMES 10090
#define KW_NORMALIZE_HOSTNAMES 10091
#define KW_KEEP_HOSTNAME 10092
#define KW_CHECK_HOSTNAME 10093
#define KW_BAD_HOSTNAME 10094
#define KW_LOG_LEVEL 10095
#define KW_KEEP_TIMESTAMP 10100
#define KW_USE_DNS 10110
#define KW_USE_FQDN 10111
#define KW_CUSTOM_DOMAIN 10112
#define KW_DNS_CACHE 10120
#define KW_DNS_CACHE_SIZE 10121
#define KW_DNS_CACHE_EXPIRE 10130
#define KW_DNS_CACHE_EXPIRE_FAILED 10131
#define KW_DNS_CACHE_HOSTS 10132
#define KW_PERSIST_ONLY 10140
#define KW_USE_RCPTID 10141
#define KW_USE_UNIQID 10142
#define KW_TZ_CONVERT 10150
#define KW_TS_FORMAT 10151
#define KW_FRAC_DIGITS 10152
#define KW_LOG_FIFO_SIZE 10160
#define KW_LOG_FETCH_LIMIT 10162
#define KW_LOG_IW_SIZE 10163
#define KW_LOG_PREFIX 10164
#define KW_PROGRAM_OVERRIDE 10165
#define KW_HOST_OVERRIDE 10166
#define KW_THROTTLE 10170
#define KW_THREADED 10171
#define KW_PASS_UNIX_CREDENTIALS 10180
#define KW_PERSIST_NAME 10181
#define KW_READ_OLD_RECORDS 10182
#define KW_USE_SYSLOGNG_PID 10183
#define KW_FLAGS 10190
#define KW_PAD_SIZE 10200
#define KW_TIME_ZONE 10201
#define KW_RECV_TIME_ZONE 10202
#define KW_SEND_TIME_ZONE 10203
#define KW_LOCAL_TIME_ZONE 10204
#define KW_FORMAT 10205
#define KW_MULTI_LINE_MODE 10206
#define KW_MULTI_LINE_PREFIX 10207
#define KW_MULTI_LINE_GARBAGE 10208
#define KW_TRUNCATE_SIZE 10209
#define KW_TIME_REOPEN 10210
#define KW_TIME_REAP 10211
#define KW_TIME_SLEEP 10212
#define KW_PARTITIONS 10213
#define KW_PARTITION_KEY 10214
#define KW_PARALLELIZE 10215
#define KW_TMPL_ESCAPE 10220
#define KW_OPTIONAL 10230
#define KW_CREATE_DIRS 10240
#define KW_OWNER 10250
#define KW_GROUP 10251
#define KW_PERM 10252
#define KW_DIR_OWNER 10260
#define KW_DIR_GROUP 10261
#define KW_DIR_PERM 10262
#define KW_TEMPLATE 10270
#define KW_TEMPLATE_ESCAPE 10271
#define KW_TEMPLATE_FUNCTION 10272
#define KW_DEFAULT_FACILITY 10300
#define KW_DEFAULT_SEVERITY 10301
#define KW_SDATA_PREFIX 10302
#define KW_PORT 10323
#define KW_USE_TIME_RECVD 10340
#define KW_FACILITY 10350
#define KW_SEVERITY 10351
#define KW_HOST 10352
#define KW_MATCH 10353
#define KW_MESSAGE 10354
#define KW_NETMASK 10355
#define KW_TAGS 10356
#define KW_NETMASK6 10357
#define KW_REWRITE 10370
#define KW_CONDITION 10371
#define KW_VALUE 10372
#define KW_YES 10380
#define KW_NO 10381
#define KW_AUTO 10382
#define KW_IFDEF 10410
#define KW_ENDIF 10411
#define LL_DOTDOT 10420
#define LL_DOTDOTDOT 10421
#define LL_PRAGMA 10422
#define LL_EOL 10423
#define LL_ERROR 10424
#define LL_ARROW 10425
#define LL_IDENTIFIER 10430
#define LL_NUMBER 10431
#define LL_FLOAT 10432
#define LL_STRING 10433
#define LL_TOKEN 10434
#define LL_BLOCK 10435
#define LL_PLUGIN 10436
#define LL_TEMPLATE_REF 10437
#define LL_MESSAGE_REF 10438
#define KW_VALUE_PAIRS 10500
#define KW_EXCLUDE 10502
#define KW_PAIR 10503
#define KW_KEY 10504
#define KW_SCOPE 10505
#define KW_SHIFT 10506
#define KW_SHIFT_LEVELS 10507
#define KW_REKEY 10508
#define KW_ADD_PREFIX 10509
#define KW_REPLACE_PREFIX 10510
#define KW_CAST 10511
#define KW_UPPER 10512
#define KW_LOWER 10513
#define KW_INCLUDE_BYTES 10514
#define KW_ON_ERROR 10520
#define KW_RETRIES 10521
#define KW_FETCH_NO_DATA_DELAY 10522
#define KW_LABELS 10530

/* Value type.  */
#if ! defined MAIN_STYPE && ! defined MAIN_STYPE_IS_DECLARED
typedef CFG_STYPE MAIN_STYPE;
# define MAIN_STYPE_IS_TRIVIAL 1
# define MAIN_STYPE_IS_DECLARED 1
#endif

/* Location type.  */
typedef CFG_LTYPE MAIN_LTYPE;




int main_parse (CfgLexer *lexer, gpointer *dummy, gpointer arg);


#endif /* !YY_MAIN_LIB_CFG_GRAMMAR_H_INCLUDED  */
