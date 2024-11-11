require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_HISTEDIT_H_)) {
    eval 'sub _HISTEDIT_H_ () {1;}' unless defined(&_HISTEDIT_H_);
    eval 'sub LIBEDIT_MAJOR () {2;}' unless defined(&LIBEDIT_MAJOR);
    eval 'sub LIBEDIT_MINOR () {11;}' unless defined(&LIBEDIT_MINOR);
    require 'sys/types.ph';
    require 'stdio.ph';
    if(defined(&__cplusplus)) {
    }
    eval 'sub CC_NORM () {0;}' unless defined(&CC_NORM);
    eval 'sub CC_NEWLINE () {1;}' unless defined(&CC_NEWLINE);
    eval 'sub CC_EOF () {2;}' unless defined(&CC_EOF);
    eval 'sub CC_ARGHACK () {3;}' unless defined(&CC_ARGHACK);
    eval 'sub CC_REFRESH () {4;}' unless defined(&CC_REFRESH);
    eval 'sub CC_CURSOR () {5;}' unless defined(&CC_CURSOR);
    eval 'sub CC_ERROR () {6;}' unless defined(&CC_ERROR);
    eval 'sub CC_FATAL () {7;}' unless defined(&CC_FATAL);
    eval 'sub CC_REDISPLAY () {8;}' unless defined(&CC_REDISPLAY);
    eval 'sub CC_REFRESH_BEEP () {9;}' unless defined(&CC_REFRESH_BEEP);
    eval 'sub EL_PROMPT () {0;}' unless defined(&EL_PROMPT);
    eval 'sub EL_TERMINAL () {1;}' unless defined(&EL_TERMINAL);
    eval 'sub EL_EDITOR () {2;}' unless defined(&EL_EDITOR);
    eval 'sub EL_SIGNAL () {3;}' unless defined(&EL_SIGNAL);
    eval 'sub EL_BIND () {4;}' unless defined(&EL_BIND);
    eval 'sub EL_TELLTC () {5;}' unless defined(&EL_TELLTC);
    eval 'sub EL_SETTC () {6;}' unless defined(&EL_SETTC);
    eval 'sub EL_ECHOTC () {7;}' unless defined(&EL_ECHOTC);
    eval 'sub EL_SETTY () {8;}' unless defined(&EL_SETTY);
    eval 'sub EL_ADDFN () {9;}' unless defined(&EL_ADDFN);
    eval 'sub EL_HIST () {10;}' unless defined(&EL_HIST);
    eval 'sub EL_EDITMODE () {11;}' unless defined(&EL_EDITMODE);
    eval 'sub EL_RPROMPT () {12;}' unless defined(&EL_RPROMPT);
    eval 'sub EL_GETCFN () {13;}' unless defined(&EL_GETCFN);
    eval 'sub EL_CLIENTDATA () {14;}' unless defined(&EL_CLIENTDATA);
    eval 'sub EL_UNBUFFERED () {15;}' unless defined(&EL_UNBUFFERED);
    eval 'sub EL_PREP_TERM () {16;}' unless defined(&EL_PREP_TERM);
    eval 'sub EL_GETTC () {17;}' unless defined(&EL_GETTC);
    eval 'sub EL_GETFP () {18;}' unless defined(&EL_GETFP);
    eval 'sub EL_SETFP () {19;}' unless defined(&EL_SETFP);
    eval 'sub EL_REFRESH () {20;}' unless defined(&EL_REFRESH);
    eval 'sub EL_PROMPT_ESC () {21;}' unless defined(&EL_PROMPT_ESC);
    eval 'sub EL_RPROMPT_ESC () {22;}' unless defined(&EL_RPROMPT_ESC);
    eval 'sub EL_RESIZE () {23;}' unless defined(&EL_RESIZE);
    eval 'sub EL_ALIAS_TEXT () {24;}' unless defined(&EL_ALIAS_TEXT);
    eval 'sub EL_SAFEREAD () {25;}' unless defined(&EL_SAFEREAD);
    eval 'sub EL_BUILTIN_GETCFN () {( &NULL);}' unless defined(&EL_BUILTIN_GETCFN);
    eval 'sub H_FUNC () {0;}' unless defined(&H_FUNC);
    eval 'sub H_SETSIZE () {1;}' unless defined(&H_SETSIZE);
    eval 'sub H_GETSIZE () {2;}' unless defined(&H_GETSIZE);
    eval 'sub H_FIRST () {3;}' unless defined(&H_FIRST);
    eval 'sub H_LAST () {4;}' unless defined(&H_LAST);
    eval 'sub H_PREV () {5;}' unless defined(&H_PREV);
    eval 'sub H_NEXT () {6;}' unless defined(&H_NEXT);
    eval 'sub H_CURR () {8;}' unless defined(&H_CURR);
    eval 'sub H_SET () {7;}' unless defined(&H_SET);
    eval 'sub H_ADD () {9;}' unless defined(&H_ADD);
    eval 'sub H_ENTER () {10;}' unless defined(&H_ENTER);
    eval 'sub H_APPEND () {11;}' unless defined(&H_APPEND);
    eval 'sub H_END () {12;}' unless defined(&H_END);
    eval 'sub H_NEXT_STR () {13;}' unless defined(&H_NEXT_STR);
    eval 'sub H_PREV_STR () {14;}' unless defined(&H_PREV_STR);
    eval 'sub H_NEXT_EVENT () {15;}' unless defined(&H_NEXT_EVENT);
    eval 'sub H_PREV_EVENT () {16;}' unless defined(&H_PREV_EVENT);
    eval 'sub H_LOAD () {17;}' unless defined(&H_LOAD);
    eval 'sub H_SAVE () {18;}' unless defined(&H_SAVE);
    eval 'sub H_CLEAR () {19;}' unless defined(&H_CLEAR);
    eval 'sub H_SETUNIQUE () {20;}' unless defined(&H_SETUNIQUE);
    eval 'sub H_GETUNIQUE () {21;}' unless defined(&H_GETUNIQUE);
    eval 'sub H_DEL () {22;}' unless defined(&H_DEL);
    eval 'sub H_NEXT_EVDATA () {23;}' unless defined(&H_NEXT_EVDATA);
    eval 'sub H_DELDATA () {24;}' unless defined(&H_DELDATA);
    eval 'sub H_REPLACE () {25;}' unless defined(&H_REPLACE);
    eval 'sub H_SAVE_FP () {26;}' unless defined(&H_SAVE_FP);
    eval 'sub H_NSAVE_FP () {27;}' unless defined(&H_NSAVE_FP);
    require 'wchar.ph';
    require 'wctype.ph';
    eval 'sub el_wdeletestr () { &el_deletestr;}' unless defined(&el_wdeletestr);
    if(defined(&__cplusplus)) {
    }
}
1;
