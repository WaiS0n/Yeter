require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&Expat_INCLUDED)) {
    eval 'sub Expat_INCLUDED () {1;}' unless defined(&Expat_INCLUDED);
    require 'stdlib.ph';
    require 'bsdxml_external.ph';
    if(defined(&__cplusplus)) {
    }
    eval 'sub XML_TRUE () {(( &XML_Bool)1);}' unless defined(&XML_TRUE);
    eval 'sub XML_FALSE () {(( &XML_Bool)0);}' unless defined(&XML_FALSE);
    eval("sub XML_STATUS_ERROR () { 0; }") unless defined(&XML_STATUS_ERROR);
    eval("sub XML_STATUS_OK () { 1; }") unless defined(&XML_STATUS_OK);
    eval("sub XML_STATUS_SUSPENDED () { 2; }") unless defined(&XML_STATUS_SUSPENDED);
    eval("sub XML_ERROR_NONE () { 0; }") unless defined(&XML_ERROR_NONE);
    eval("sub XML_ERROR_NO_MEMORY () { 1; }") unless defined(&XML_ERROR_NO_MEMORY);
    eval("sub XML_ERROR_SYNTAX () { 2; }") unless defined(&XML_ERROR_SYNTAX);
    eval("sub XML_ERROR_NO_ELEMENTS () { 3; }") unless defined(&XML_ERROR_NO_ELEMENTS);
    eval("sub XML_ERROR_INVALID_TOKEN () { 4; }") unless defined(&XML_ERROR_INVALID_TOKEN);
    eval("sub XML_ERROR_UNCLOSED_TOKEN () { 5; }") unless defined(&XML_ERROR_UNCLOSED_TOKEN);
    eval("sub XML_ERROR_PARTIAL_CHAR () { 6; }") unless defined(&XML_ERROR_PARTIAL_CHAR);
    eval("sub XML_ERROR_TAG_MISMATCH () { 7; }") unless defined(&XML_ERROR_TAG_MISMATCH);
    eval("sub XML_ERROR_DUPLICATE_ATTRIBUTE () { 8; }") unless defined(&XML_ERROR_DUPLICATE_ATTRIBUTE);
    eval("sub XML_ERROR_JUNK_AFTER_DOC_ELEMENT () { 9; }") unless defined(&XML_ERROR_JUNK_AFTER_DOC_ELEMENT);
    eval("sub XML_ERROR_PARAM_ENTITY_REF () { 10; }") unless defined(&XML_ERROR_PARAM_ENTITY_REF);
    eval("sub XML_ERROR_UNDEFINED_ENTITY () { 11; }") unless defined(&XML_ERROR_UNDEFINED_ENTITY);
    eval("sub XML_ERROR_RECURSIVE_ENTITY_REF () { 12; }") unless defined(&XML_ERROR_RECURSIVE_ENTITY_REF);
    eval("sub XML_ERROR_ASYNC_ENTITY () { 13; }") unless defined(&XML_ERROR_ASYNC_ENTITY);
    eval("sub XML_ERROR_BAD_CHAR_REF () { 14; }") unless defined(&XML_ERROR_BAD_CHAR_REF);
    eval("sub XML_ERROR_BINARY_ENTITY_REF () { 15; }") unless defined(&XML_ERROR_BINARY_ENTITY_REF);
    eval("sub XML_ERROR_ATTRIBUTE_EXTERNAL_ENTITY_REF () { 16; }") unless defined(&XML_ERROR_ATTRIBUTE_EXTERNAL_ENTITY_REF);
    eval("sub XML_ERROR_MISPLACED_XML_PI () { 17; }") unless defined(&XML_ERROR_MISPLACED_XML_PI);
    eval("sub XML_ERROR_UNKNOWN_ENCODING () { 18; }") unless defined(&XML_ERROR_UNKNOWN_ENCODING);
    eval("sub XML_ERROR_INCORRECT_ENCODING () { 19; }") unless defined(&XML_ERROR_INCORRECT_ENCODING);
    eval("sub XML_ERROR_UNCLOSED_CDATA_SECTION () { 20; }") unless defined(&XML_ERROR_UNCLOSED_CDATA_SECTION);
    eval("sub XML_ERROR_EXTERNAL_ENTITY_HANDLING () { 21; }") unless defined(&XML_ERROR_EXTERNAL_ENTITY_HANDLING);
    eval("sub XML_ERROR_NOT_STANDALONE () { 22; }") unless defined(&XML_ERROR_NOT_STANDALONE);
    eval("sub XML_ERROR_UNEXPECTED_STATE () { 23; }") unless defined(&XML_ERROR_UNEXPECTED_STATE);
    eval("sub XML_ERROR_ENTITY_DECLARED_IN_PE () { 24; }") unless defined(&XML_ERROR_ENTITY_DECLARED_IN_PE);
    eval("sub XML_ERROR_FEATURE_REQUIRES_XML_DTD () { 25; }") unless defined(&XML_ERROR_FEATURE_REQUIRES_XML_DTD);
    eval("sub XML_ERROR_CANT_CHANGE_FEATURE_ONCE_PARSING () { 26; }") unless defined(&XML_ERROR_CANT_CHANGE_FEATURE_ONCE_PARSING);
    eval("sub XML_ERROR_UNBOUND_PREFIX () { 27; }") unless defined(&XML_ERROR_UNBOUND_PREFIX);
    eval("sub XML_ERROR_UNDECLARING_PREFIX () { 28; }") unless defined(&XML_ERROR_UNDECLARING_PREFIX);
    eval("sub XML_ERROR_INCOMPLETE_PE () { 29; }") unless defined(&XML_ERROR_INCOMPLETE_PE);
    eval("sub XML_ERROR_XML_DECL () { 30; }") unless defined(&XML_ERROR_XML_DECL);
    eval("sub XML_ERROR_TEXT_DECL () { 31; }") unless defined(&XML_ERROR_TEXT_DECL);
    eval("sub XML_ERROR_PUBLICID () { 32; }") unless defined(&XML_ERROR_PUBLICID);
    eval("sub XML_ERROR_SUSPENDED () { 33; }") unless defined(&XML_ERROR_SUSPENDED);
    eval("sub XML_ERROR_NOT_SUSPENDED () { 34; }") unless defined(&XML_ERROR_NOT_SUSPENDED);
    eval("sub XML_ERROR_ABORTED () { 35; }") unless defined(&XML_ERROR_ABORTED);
    eval("sub XML_ERROR_FINISHED () { 36; }") unless defined(&XML_ERROR_FINISHED);
    eval("sub XML_ERROR_SUSPEND_PE () { 37; }") unless defined(&XML_ERROR_SUSPEND_PE);
    eval("sub XML_ERROR_RESERVED_PREFIX_XML () { 38; }") unless defined(&XML_ERROR_RESERVED_PREFIX_XML);
    eval("sub XML_ERROR_RESERVED_PREFIX_XMLNS () { 39; }") unless defined(&XML_ERROR_RESERVED_PREFIX_XMLNS);
    eval("sub XML_ERROR_RESERVED_NAMESPACE_URI () { 40; }") unless defined(&XML_ERROR_RESERVED_NAMESPACE_URI);
    eval("sub XML_ERROR_INVALID_ARGUMENT () { 41; }") unless defined(&XML_ERROR_INVALID_ARGUMENT);
    eval("sub XML_ERROR_NO_BUFFER () { 42; }") unless defined(&XML_ERROR_NO_BUFFER);
    eval("sub XML_ERROR_AMPLIFICATION_LIMIT_BREACH () { 43; }") unless defined(&XML_ERROR_AMPLIFICATION_LIMIT_BREACH);
    eval("sub XML_CTYPE_EMPTY () { 1; }") unless defined(&XML_CTYPE_EMPTY);
    eval("sub XML_CTYPE_ANY () { 2; }") unless defined(&XML_CTYPE_ANY);
    eval("sub XML_CTYPE_MIXED () { 3; }") unless defined(&XML_CTYPE_MIXED);
    eval("sub XML_CTYPE_NAME () { 4; }") unless defined(&XML_CTYPE_NAME);
    eval("sub XML_CTYPE_CHOICE () { 5; }") unless defined(&XML_CTYPE_CHOICE);
    eval("sub XML_CTYPE_SEQ () { 6; }") unless defined(&XML_CTYPE_SEQ);
    eval("sub XML_CQUANT_NONE () { 0; }") unless defined(&XML_CQUANT_NONE);
    eval("sub XML_CQUANT_OPT () { 1; }") unless defined(&XML_CQUANT_OPT);
    eval("sub XML_CQUANT_REP () { 2; }") unless defined(&XML_CQUANT_REP);
    eval("sub XML_CQUANT_PLUS () { 3; }") unless defined(&XML_CQUANT_PLUS);
    eval 'sub XML_GetUserData {
        my($parser) = @_;
	    eval q((*( &void **)($parser)));
    }' unless defined(&XML_GetUserData);
    if(defined(&XML_ATTR_INFO)) {
    }
    eval("sub XML_INITIALIZED () { 0; }") unless defined(&XML_INITIALIZED);
    eval("sub XML_PARSING () { 1; }") unless defined(&XML_PARSING);
    eval("sub XML_FINISHED () { 2; }") unless defined(&XML_FINISHED);
    eval("sub XML_SUSPENDED () { 3; }") unless defined(&XML_SUSPENDED);
    eval("sub XML_PARAM_ENTITY_PARSING_NEVER () { 0; }") unless defined(&XML_PARAM_ENTITY_PARSING_NEVER);
    eval("sub XML_PARAM_ENTITY_PARSING_UNLESS_STANDALONE () { 1; }") unless defined(&XML_PARAM_ENTITY_PARSING_UNLESS_STANDALONE);
    eval("sub XML_PARAM_ENTITY_PARSING_ALWAYS () { 2; }") unless defined(&XML_PARAM_ENTITY_PARSING_ALWAYS);
    eval 'sub XML_GetErrorLineNumber () { &XML_GetCurrentLineNumber;}' unless defined(&XML_GetErrorLineNumber);
    eval 'sub XML_GetErrorColumnNumber () { &XML_GetCurrentColumnNumber;}' unless defined(&XML_GetErrorColumnNumber);
    eval 'sub XML_GetErrorByteIndex () { &XML_GetCurrentByteIndex;}' unless defined(&XML_GetErrorByteIndex);
    eval("sub XML_FEATURE_END () { 0; }") unless defined(&XML_FEATURE_END);
    eval("sub XML_FEATURE_UNICODE () { 1; }") unless defined(&XML_FEATURE_UNICODE);
    eval("sub XML_FEATURE_UNICODE_WCHAR_T () { 2; }") unless defined(&XML_FEATURE_UNICODE_WCHAR_T);
    eval("sub XML_FEATURE_DTD () { 3; }") unless defined(&XML_FEATURE_DTD);
    eval("sub XML_FEATURE_CONTEXT_BYTES () { 4; }") unless defined(&XML_FEATURE_CONTEXT_BYTES);
    eval("sub XML_FEATURE_MIN_SIZE () { 5; }") unless defined(&XML_FEATURE_MIN_SIZE);
    eval("sub XML_FEATURE_SIZEOF_XML_CHAR () { 6; }") unless defined(&XML_FEATURE_SIZEOF_XML_CHAR);
    eval("sub XML_FEATURE_SIZEOF_XML_LCHAR () { 7; }") unless defined(&XML_FEATURE_SIZEOF_XML_LCHAR);
    eval("sub XML_FEATURE_NS () { 8; }") unless defined(&XML_FEATURE_NS);
    eval("sub XML_FEATURE_LARGE_SIZE () { 9; }") unless defined(&XML_FEATURE_LARGE_SIZE);
    eval("sub XML_FEATURE_ATTR_INFO () { 10; }") unless defined(&XML_FEATURE_ATTR_INFO);
    eval("sub XML_FEATURE_BILLION_LAUGHS_ATTACK_PROTECTION_MAXIMUM_AMPLIFICATION_DEFAULT () { 11; }") unless defined(&XML_FEATURE_BILLION_LAUGHS_ATTACK_PROTECTION_MAXIMUM_AMPLIFICATION_DEFAULT);
    eval("sub XML_FEATURE_BILLION_LAUGHS_ATTACK_PROTECTION_ACTIVATION_THRESHOLD_DEFAULT () { 12; }") unless defined(&XML_FEATURE_BILLION_LAUGHS_ATTACK_PROTECTION_ACTIVATION_THRESHOLD_DEFAULT);
    eval("sub XML_FEATURE_GE () { 13; }") unless defined(&XML_FEATURE_GE);
    if((defined(&XML_GE) ? &XML_GE : undef) == 1) {
    }
    eval 'sub XML_MAJOR_VERSION () {2;}' unless defined(&XML_MAJOR_VERSION);
    eval 'sub XML_MINOR_VERSION () {6;}' unless defined(&XML_MINOR_VERSION);
    eval 'sub XML_MICRO_VERSION () {0;}' unless defined(&XML_MICRO_VERSION);
    if(defined(&__cplusplus)) {
    }
}
1;
