require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SDP_H_)) {
    eval 'sub _SDP_H_ () {1;}' unless defined(&_SDP_H_);
    eval 'sub SDP_DATA_NIL () {0x;}' unless defined(&SDP_DATA_NIL);
    eval 'sub SDP_DATA_UINT8 () {0x8;}' unless defined(&SDP_DATA_UINT8);
    eval 'sub SDP_DATA_UINT16 () {0x9;}' unless defined(&SDP_DATA_UINT16);
    eval 'sub SDP_DATA_UINT32 () {0xa;}' unless defined(&SDP_DATA_UINT32);
    eval 'sub SDP_DATA_UINT64 () {0xb;}' unless defined(&SDP_DATA_UINT64);
    eval 'sub SDP_DATA_UINT128 () {0xc;}' unless defined(&SDP_DATA_UINT128);
    eval 'sub SDP_DATA_INT8 () {0x10;}' unless defined(&SDP_DATA_INT8);
    eval 'sub SDP_DATA_INT16 () {0x11;}' unless defined(&SDP_DATA_INT16);
    eval 'sub SDP_DATA_INT32 () {0x12;}' unless defined(&SDP_DATA_INT32);
    eval 'sub SDP_DATA_INT64 () {0x13;}' unless defined(&SDP_DATA_INT64);
    eval 'sub SDP_DATA_INT128 () {0x14;}' unless defined(&SDP_DATA_INT128);
    eval 'sub SDP_DATA_UUID16 () {0x19;}' unless defined(&SDP_DATA_UUID16);
    eval 'sub SDP_DATA_UUID32 () {0x1a;}' unless defined(&SDP_DATA_UUID32);
    eval 'sub SDP_DATA_UUID128 () {0x1c;}' unless defined(&SDP_DATA_UUID128);
    eval 'sub SDP_DATA_STR8 () {0x25;}' unless defined(&SDP_DATA_STR8);
    eval 'sub SDP_DATA_STR16 () {0x26;}' unless defined(&SDP_DATA_STR16);
    eval 'sub SDP_DATA_STR32 () {0x27;}' unless defined(&SDP_DATA_STR32);
    eval 'sub SDP_DATA_BOOL () {0x28;}' unless defined(&SDP_DATA_BOOL);
    eval 'sub SDP_DATA_SEQ8 () {0x35;}' unless defined(&SDP_DATA_SEQ8);
    eval 'sub SDP_DATA_SEQ16 () {0x36;}' unless defined(&SDP_DATA_SEQ16);
    eval 'sub SDP_DATA_SEQ32 () {0x37;}' unless defined(&SDP_DATA_SEQ32);
    eval 'sub SDP_DATA_ALT8 () {0x3d;}' unless defined(&SDP_DATA_ALT8);
    eval 'sub SDP_DATA_ALT16 () {0x3e;}' unless defined(&SDP_DATA_ALT16);
    eval 'sub SDP_DATA_ALT32 () {0x3f;}' unless defined(&SDP_DATA_ALT32);
    eval 'sub SDP_DATA_URL8 () {0x45;}' unless defined(&SDP_DATA_URL8);
    eval 'sub SDP_DATA_URL16 () {0x46;}' unless defined(&SDP_DATA_URL16);
    eval 'sub SDP_DATA_URL32 () {0x47;}' unless defined(&SDP_DATA_URL32);
    eval 'sub SDP_UUID_PROTOCOL_SDP () {0x1;}' unless defined(&SDP_UUID_PROTOCOL_SDP);
    eval 'sub SDP_UUID_PROTOCOL_UDP () {0x2;}' unless defined(&SDP_UUID_PROTOCOL_UDP);
    eval 'sub SDP_UUID_PROTOCOL_RFCOMM () {0x3;}' unless defined(&SDP_UUID_PROTOCOL_RFCOMM);
    eval 'sub SDP_UUID_PROTOCOL_TCP () {0x4;}' unless defined(&SDP_UUID_PROTOCOL_TCP);
    eval 'sub SDP_UUID_PROTOCOL_TCS_BIN () {0x5;}' unless defined(&SDP_UUID_PROTOCOL_TCS_BIN);
    eval 'sub SDP_UUID_PROTOCOL_TCS_AT () {0x6;}' unless defined(&SDP_UUID_PROTOCOL_TCS_AT);
    eval 'sub SDP_UUID_PROTOCOL_OBEX () {0x8;}' unless defined(&SDP_UUID_PROTOCOL_OBEX);
    eval 'sub SDP_UUID_PROTOCOL_IP () {0x9;}' unless defined(&SDP_UUID_PROTOCOL_IP);
    eval 'sub SDP_UUID_PROTOCOL_FTP () {0xa;}' unless defined(&SDP_UUID_PROTOCOL_FTP);
    eval 'sub SDP_UUID_PROTOCOL_HTTP () {0xc;}' unless defined(&SDP_UUID_PROTOCOL_HTTP);
    eval 'sub SDP_UUID_PROTOCOL_WSP () {0xe;}' unless defined(&SDP_UUID_PROTOCOL_WSP);
    eval 'sub SDP_UUID_PROTOCOL_BNEP () {0xf;}' unless defined(&SDP_UUID_PROTOCOL_BNEP);
    eval 'sub SDP_UUID_PROTOCOL_UPNP () {0x10;}' unless defined(&SDP_UUID_PROTOCOL_UPNP);
    eval 'sub SDP_UUID_PROTOCOL_HIDP () {0x11;}' unless defined(&SDP_UUID_PROTOCOL_HIDP);
    eval 'sub SDP_UUID_PROTOCOL_HARDCOPY_CONTROL_CHANNEL () {0x12;}' unless defined(&SDP_UUID_PROTOCOL_HARDCOPY_CONTROL_CHANNEL);
    eval 'sub SDP_UUID_PROTOCOL_HARDCOPY_DATA_CHANNEL () {0x14;}' unless defined(&SDP_UUID_PROTOCOL_HARDCOPY_DATA_CHANNEL);
    eval 'sub SDP_UUID_PROTOCOL_HARDCOPY_NOTIFICATION () {0x16;}' unless defined(&SDP_UUID_PROTOCOL_HARDCOPY_NOTIFICATION);
    eval 'sub SDP_UUID_PROTOCOL_AVCTP () {0x17;}' unless defined(&SDP_UUID_PROTOCOL_AVCTP);
    eval 'sub SDP_UUID_PROTOCOL_AVDTP () {0x19;}' unless defined(&SDP_UUID_PROTOCOL_AVDTP);
    eval 'sub SDP_UUID_PROTOCOL_CMPT () {0x1b;}' unless defined(&SDP_UUID_PROTOCOL_CMPT);
    eval 'sub SDP_UUID_PROTOCOL_UDI_C_PLANE () {0x1d;}' unless defined(&SDP_UUID_PROTOCOL_UDI_C_PLANE);
    eval 'sub SDP_UUID_PROTOCOL_L2CAP () {0x100;}' unless defined(&SDP_UUID_PROTOCOL_L2CAP);
    eval 'sub SDP_SERVICE_CLASS_SERVICE_DISCOVERY_SERVER () {0x1000;}' unless defined(&SDP_SERVICE_CLASS_SERVICE_DISCOVERY_SERVER);
    eval 'sub SDP_SERVICE_CLASS_BROWSE_GROUP_DESCRIPTOR () {0x1001;}' unless defined(&SDP_SERVICE_CLASS_BROWSE_GROUP_DESCRIPTOR);
    eval 'sub SDP_SERVICE_CLASS_PUBLIC_BROWSE_GROUP () {0x1002;}' unless defined(&SDP_SERVICE_CLASS_PUBLIC_BROWSE_GROUP);
    eval 'sub SDP_SERVICE_CLASS_SERIAL_PORT () {0x1101;}' unless defined(&SDP_SERVICE_CLASS_SERIAL_PORT);
    eval 'sub SDP_SERVICE_CLASS_LAN_ACCESS_USING_PPP () {0x1102;}' unless defined(&SDP_SERVICE_CLASS_LAN_ACCESS_USING_PPP);
    eval 'sub SDP_SERVICE_CLASS_DIALUP_NETWORKING () {0x1103;}' unless defined(&SDP_SERVICE_CLASS_DIALUP_NETWORKING);
    eval 'sub SDP_SERVICE_CLASS_IR_MC_SYNC () {0x1104;}' unless defined(&SDP_SERVICE_CLASS_IR_MC_SYNC);
    eval 'sub SDP_SERVICE_CLASS_OBEX_OBJECT_PUSH () {0x1105;}' unless defined(&SDP_SERVICE_CLASS_OBEX_OBJECT_PUSH);
    eval 'sub SDP_SERVICE_CLASS_OBEX_FILE_TRANSFER () {0x1106;}' unless defined(&SDP_SERVICE_CLASS_OBEX_FILE_TRANSFER);
    eval 'sub SDP_SERVICE_CLASS_IR_MC_SYNC_COMMAND () {0x1107;}' unless defined(&SDP_SERVICE_CLASS_IR_MC_SYNC_COMMAND);
    eval 'sub SDP_SERVICE_CLASS_HEADSET () {0x1108;}' unless defined(&SDP_SERVICE_CLASS_HEADSET);
    eval 'sub SDP_SERVICE_CLASS_CORDLESS_TELEPHONY () {0x1109;}' unless defined(&SDP_SERVICE_CLASS_CORDLESS_TELEPHONY);
    eval 'sub SDP_SERVICE_CLASS_AUDIO_SOURCE () {0x110a;}' unless defined(&SDP_SERVICE_CLASS_AUDIO_SOURCE);
    eval 'sub SDP_SERVICE_CLASS_AUDIO_SINK () {0x110b;}' unless defined(&SDP_SERVICE_CLASS_AUDIO_SINK);
    eval 'sub SDP_SERVICE_CLASS_AV_REMOTE_CONTROL_TARGET () {0x110c;}' unless defined(&SDP_SERVICE_CLASS_AV_REMOTE_CONTROL_TARGET);
    eval 'sub SDP_SERVICE_CLASS_ADVANCED_AUDIO_DISTRIBUTION () {0x110d;}' unless defined(&SDP_SERVICE_CLASS_ADVANCED_AUDIO_DISTRIBUTION);
    eval 'sub SDP_SERVICE_CLASS_AV_REMOTE_CONTROL () {0x110e;}' unless defined(&SDP_SERVICE_CLASS_AV_REMOTE_CONTROL);
    eval 'sub SDP_SERVICE_CLASS_VIDEO_CONFERENCING () {0x110f;}' unless defined(&SDP_SERVICE_CLASS_VIDEO_CONFERENCING);
    eval 'sub SDP_SERVICE_CLASS_INTERCOM () {0x1110;}' unless defined(&SDP_SERVICE_CLASS_INTERCOM);
    eval 'sub SDP_SERVICE_CLASS_FAX () {0x1111;}' unless defined(&SDP_SERVICE_CLASS_FAX);
    eval 'sub SDP_SERVICE_CLASS_HEADSET_AUDIO_GATEWAY () {0x1112;}' unless defined(&SDP_SERVICE_CLASS_HEADSET_AUDIO_GATEWAY);
    eval 'sub SDP_SERVICE_CLASS_WAP () {0x1113;}' unless defined(&SDP_SERVICE_CLASS_WAP);
    eval 'sub SDP_SERVICE_CLASS_WAP_CLIENT () {0x1114;}' unless defined(&SDP_SERVICE_CLASS_WAP_CLIENT);
    eval 'sub SDP_SERVICE_CLASS_PANU () {0x1115;}' unless defined(&SDP_SERVICE_CLASS_PANU);
    eval 'sub SDP_SERVICE_CLASS_NAP () {0x1116;}' unless defined(&SDP_SERVICE_CLASS_NAP);
    eval 'sub SDP_SERVICE_CLASS_GN () {0x1117;}' unless defined(&SDP_SERVICE_CLASS_GN);
    eval 'sub SDP_SERVICE_CLASS_DIRECT_PRINTING () {0x1118;}' unless defined(&SDP_SERVICE_CLASS_DIRECT_PRINTING);
    eval 'sub SDP_SERVICE_CLASS_REFERENCE_PRINTING () {0x1119;}' unless defined(&SDP_SERVICE_CLASS_REFERENCE_PRINTING);
    eval 'sub SDP_SERVICE_CLASS_IMAGING () {0x111a;}' unless defined(&SDP_SERVICE_CLASS_IMAGING);
    eval 'sub SDP_SERVICE_CLASS_IMAGING_RESPONDER () {0x111b;}' unless defined(&SDP_SERVICE_CLASS_IMAGING_RESPONDER);
    eval 'sub SDP_SERVICE_CLASS_IMAGING_AUTOMATIC_ARCHIVE () {0x111c;}' unless defined(&SDP_SERVICE_CLASS_IMAGING_AUTOMATIC_ARCHIVE);
    eval 'sub SDP_SERVICE_CLASS_IMAGING_REFERENCED_OBJECTS () {0x111d;}' unless defined(&SDP_SERVICE_CLASS_IMAGING_REFERENCED_OBJECTS);
    eval 'sub SDP_SERVICE_CLASS_HANDSFREE () {0x111e;}' unless defined(&SDP_SERVICE_CLASS_HANDSFREE);
    eval 'sub SDP_SERVICE_CLASS_HANDSFREE_AUDIO_GATEWAY () {0x111f;}' unless defined(&SDP_SERVICE_CLASS_HANDSFREE_AUDIO_GATEWAY);
    eval 'sub SDP_SERVICE_CLASS_DIRECT_PRINTING_REFERENCE_OBJECTS () {0x1120;}' unless defined(&SDP_SERVICE_CLASS_DIRECT_PRINTING_REFERENCE_OBJECTS);
    eval 'sub SDP_SERVICE_CLASS_REFLECTED_UI () {0x1121;}' unless defined(&SDP_SERVICE_CLASS_REFLECTED_UI);
    eval 'sub SDP_SERVICE_CLASS_BASIC_PRINTING () {0x1122;}' unless defined(&SDP_SERVICE_CLASS_BASIC_PRINTING);
    eval 'sub SDP_SERVICE_CLASS_PRINTING_STATUS () {0x1123;}' unless defined(&SDP_SERVICE_CLASS_PRINTING_STATUS);
    eval 'sub SDP_SERVICE_CLASS_HUMAN_INTERFACE_DEVICE () {0x1124;}' unless defined(&SDP_SERVICE_CLASS_HUMAN_INTERFACE_DEVICE);
    eval 'sub SDP_SERVICE_CLASS_HARDCOPY_CABLE_REPLACEMENT () {0x1125;}' unless defined(&SDP_SERVICE_CLASS_HARDCOPY_CABLE_REPLACEMENT);
    eval 'sub SDP_SERVICE_CLASS_HCR_PRINT () {0x1126;}' unless defined(&SDP_SERVICE_CLASS_HCR_PRINT);
    eval 'sub SDP_SERVICE_CLASS_HCR_SCAN () {0x1127;}' unless defined(&SDP_SERVICE_CLASS_HCR_SCAN);
    eval 'sub SDP_SERVICE_CLASS_COMMON_ISDN_ACCESS () {0x1128;}' unless defined(&SDP_SERVICE_CLASS_COMMON_ISDN_ACCESS);
    eval 'sub SDP_SERVICE_CLASS_VIDEO_CONFERENCING_GW () {0x1129;}' unless defined(&SDP_SERVICE_CLASS_VIDEO_CONFERENCING_GW);
    eval 'sub SDP_SERVICE_CLASS_UDI_MT () {0x112a;}' unless defined(&SDP_SERVICE_CLASS_UDI_MT);
    eval 'sub SDP_SERVICE_CLASS_UDI_TA () {0x112b;}' unless defined(&SDP_SERVICE_CLASS_UDI_TA);
    eval 'sub SDP_SERVICE_CLASS_AUDIO_VIDEO () {0x112c;}' unless defined(&SDP_SERVICE_CLASS_AUDIO_VIDEO);
    eval 'sub SDP_SERVICE_CLASS_SIM_ACCESS () {0x112d;}' unless defined(&SDP_SERVICE_CLASS_SIM_ACCESS);
    eval 'sub SDP_SERVICE_CLASS_PHONEBOOK_ACCESS_PCE () {0x112e;}' unless defined(&SDP_SERVICE_CLASS_PHONEBOOK_ACCESS_PCE);
    eval 'sub SDP_SERVICE_CLASS_PHONEBOOK_ACCESS_PSE () {0x112f;}' unless defined(&SDP_SERVICE_CLASS_PHONEBOOK_ACCESS_PSE);
    eval 'sub SDP_SERVICE_CLASS_PHONEBOOK_ACCESS () {0x1130;}' unless defined(&SDP_SERVICE_CLASS_PHONEBOOK_ACCESS);
    eval 'sub SDP_SERVICE_CLASS_PNP_INFORMATION () {0x1200;}' unless defined(&SDP_SERVICE_CLASS_PNP_INFORMATION);
    eval 'sub SDP_SERVICE_CLASS_GENERIC_NETWORKING () {0x1201;}' unless defined(&SDP_SERVICE_CLASS_GENERIC_NETWORKING);
    eval 'sub SDP_SERVICE_CLASS_GENERIC_FILE_TRANSFER () {0x1202;}' unless defined(&SDP_SERVICE_CLASS_GENERIC_FILE_TRANSFER);
    eval 'sub SDP_SERVICE_CLASS_GENERIC_AUDIO () {0x1203;}' unless defined(&SDP_SERVICE_CLASS_GENERIC_AUDIO);
    eval 'sub SDP_SERVICE_CLASS_GENERIC_TELEPHONY () {0x1204;}' unless defined(&SDP_SERVICE_CLASS_GENERIC_TELEPHONY);
    eval 'sub SDP_SERVICE_CLASS_UPNP () {0x1205;}' unless defined(&SDP_SERVICE_CLASS_UPNP);
    eval 'sub SDP_SERVICE_CLASS_UPNP_IP () {0x1206;}' unless defined(&SDP_SERVICE_CLASS_UPNP_IP);
    eval 'sub SDP_SERVICE_CLASS_ESDP_UPNP_IP_PAN () {0x1300;}' unless defined(&SDP_SERVICE_CLASS_ESDP_UPNP_IP_PAN);
    eval 'sub SDP_SERVICE_CLASS_ESDP_UPNP_IP_LAP () {0x1301;}' unless defined(&SDP_SERVICE_CLASS_ESDP_UPNP_IP_LAP);
    eval 'sub SDP_SERVICE_CLASS_ESDP_UPNP_L2CAP () {0x1302;}' unless defined(&SDP_SERVICE_CLASS_ESDP_UPNP_L2CAP);
    eval 'sub SDP_SERVICE_CLASS_VIDEO_SOURCE () {0x1303;}' unless defined(&SDP_SERVICE_CLASS_VIDEO_SOURCE);
    eval 'sub SDP_SERVICE_CLASS_VIDEO_SINK () {0x1304;}' unless defined(&SDP_SERVICE_CLASS_VIDEO_SINK);
    eval 'sub SDP_SERVICE_CLASS_VIDEO_DISTRIBUTION () {0x1305;}' unless defined(&SDP_SERVICE_CLASS_VIDEO_DISTRIBUTION);
    eval 'sub SDP_ATTR_RANGE {
        my($lo, $hi) = @_;
	    eval q(( &uint32_t)((( &uint16_t)($lo) << 16) | (( &uint16_t)($hi))));
    }' unless defined(&SDP_ATTR_RANGE);
    eval 'sub SDP_ATTR_SERVICE_RECORD_HANDLE () {0x;}' unless defined(&SDP_ATTR_SERVICE_RECORD_HANDLE);
    eval 'sub SDP_ATTR_SERVICE_CLASS_ID_LIST () {0x1;}' unless defined(&SDP_ATTR_SERVICE_CLASS_ID_LIST);
    eval 'sub SDP_ATTR_SERVICE_RECORD_STATE () {0x2;}' unless defined(&SDP_ATTR_SERVICE_RECORD_STATE);
    eval 'sub SDP_ATTR_SERVICE_ID () {0x3;}' unless defined(&SDP_ATTR_SERVICE_ID);
    eval 'sub SDP_ATTR_PROTOCOL_DESCRIPTOR_LIST () {0x4;}' unless defined(&SDP_ATTR_PROTOCOL_DESCRIPTOR_LIST);
    eval 'sub SDP_ATTR_BROWSE_GROUP_LIST () {0x5;}' unless defined(&SDP_ATTR_BROWSE_GROUP_LIST);
    eval 'sub SDP_ATTR_LANGUAGE_BASE_ATTRIBUTE_ID_LIST () {0x6;}' unless defined(&SDP_ATTR_LANGUAGE_BASE_ATTRIBUTE_ID_LIST);
    eval 'sub SDP_ATTR_SERVICE_INFO_TIME_TO_LIVE () {0x7;}' unless defined(&SDP_ATTR_SERVICE_INFO_TIME_TO_LIVE);
    eval 'sub SDP_ATTR_SERVICE_AVAILABILITY () {0x8;}' unless defined(&SDP_ATTR_SERVICE_AVAILABILITY);
    eval 'sub SDP_ATTR_BLUETOOTH_PROFILE_DESCRIPTOR_LIST () {0x9;}' unless defined(&SDP_ATTR_BLUETOOTH_PROFILE_DESCRIPTOR_LIST);
    eval 'sub SDP_ATTR_DOCUMENTATION_URL () {0xa;}' unless defined(&SDP_ATTR_DOCUMENTATION_URL);
    eval 'sub SDP_ATTR_CLIENT_EXECUTABLE_URL () {0xb;}' unless defined(&SDP_ATTR_CLIENT_EXECUTABLE_URL);
    eval 'sub SDP_ATTR_ICON_URL () {0xc;}' unless defined(&SDP_ATTR_ICON_URL);
    eval 'sub SDP_ATTR_ADDITIONAL_PROTOCOL_DESCRIPTOR_LISTS () {0xd;}' unless defined(&SDP_ATTR_ADDITIONAL_PROTOCOL_DESCRIPTOR_LISTS);
    eval 'sub SDP_ATTR_GROUP_ID () {0x200;}' unless defined(&SDP_ATTR_GROUP_ID);
    eval 'sub SDP_ATTR_IP_SUBNET () {0x200;}' unless defined(&SDP_ATTR_IP_SUBNET);
    eval 'sub SDP_ATTR_VERSION_NUMBER_LIST () {0x200;}' unless defined(&SDP_ATTR_VERSION_NUMBER_LIST);
    eval 'sub SDP_ATTR_SERVICE_DATABASE_STATE () {0x201;}' unless defined(&SDP_ATTR_SERVICE_DATABASE_STATE);
    eval 'sub SDP_ATTR_SERVICE_VERSION () {0x300;}' unless defined(&SDP_ATTR_SERVICE_VERSION);
    eval 'sub SDP_ATTR_EXTERNAL_NETWORK () {0x301;}' unless defined(&SDP_ATTR_EXTERNAL_NETWORK);
    eval 'sub SDP_ATTR_NETWORK () {0x301;}' unless defined(&SDP_ATTR_NETWORK);
    eval 'sub SDP_ATTR_SUPPORTED_DATA_STORES_LIST () {0x301;}' unless defined(&SDP_ATTR_SUPPORTED_DATA_STORES_LIST);
    eval 'sub SDP_ATTR_FAX_CLASS1_SUPPORT () {0x302;}' unless defined(&SDP_ATTR_FAX_CLASS1_SUPPORT);
    eval 'sub SDP_ATTR_REMOTE_AUDIO_VOLUME_CONTROL () {0x302;}' unless defined(&SDP_ATTR_REMOTE_AUDIO_VOLUME_CONTROL);
    eval 'sub SDP_ATTR_FAX_CLASS20_SUPPORT () {0x303;}' unless defined(&SDP_ATTR_FAX_CLASS20_SUPPORT);
    eval 'sub SDP_ATTR_SUPPORTED_FORMATS_LIST () {0x303;}' unless defined(&SDP_ATTR_SUPPORTED_FORMATS_LIST);
    eval 'sub SDP_ATTR_FAX_CLASS2_SUPPORT () {0x304;}' unless defined(&SDP_ATTR_FAX_CLASS2_SUPPORT);
    eval 'sub SDP_ATTR_AUDIO_FEEDBACK_SUPPORT () {0x305;}' unless defined(&SDP_ATTR_AUDIO_FEEDBACK_SUPPORT);
    eval 'sub SDP_ATTR_NETWORK_ADDRESS () {0x306;}' unless defined(&SDP_ATTR_NETWORK_ADDRESS);
    eval 'sub SDP_ATTR_WAP_GATEWAY () {0x307;}' unless defined(&SDP_ATTR_WAP_GATEWAY);
    eval 'sub SDP_ATTR_HOME_PAGE_URL () {0x308;}' unless defined(&SDP_ATTR_HOME_PAGE_URL);
    eval 'sub SDP_ATTR_WAP_STACK_TYPE () {0x309;}' unless defined(&SDP_ATTR_WAP_STACK_TYPE);
    eval 'sub SDP_ATTR_SECURITY_DESCRIPTION () {0x30a;}' unless defined(&SDP_ATTR_SECURITY_DESCRIPTION);
    eval 'sub SDP_ATTR_NET_ACCESS_TYPE () {0x30b;}' unless defined(&SDP_ATTR_NET_ACCESS_TYPE);
    eval 'sub SDP_ATTR_MAX_NET_ACCESS_RATE () {0x30c;}' unless defined(&SDP_ATTR_MAX_NET_ACCESS_RATE);
    eval 'sub SDP_ATTR_IPV4_SUBNET () {0x30d;}' unless defined(&SDP_ATTR_IPV4_SUBNET);
    eval 'sub SDP_ATTR_IPV6_SUBNET () {0x30e;}' unless defined(&SDP_ATTR_IPV6_SUBNET);
    eval 'sub SDP_ATTR_SUPPORTED_CAPABALITIES () {0x310;}' unless defined(&SDP_ATTR_SUPPORTED_CAPABALITIES);
    eval 'sub SDP_ATTR_SUPPORTED_FEATURES () {0x311;}' unless defined(&SDP_ATTR_SUPPORTED_FEATURES);
    eval 'sub SDP_ATTR_SUPPORTED_FUNCTIONS () {0x312;}' unless defined(&SDP_ATTR_SUPPORTED_FUNCTIONS);
    eval 'sub SDP_ATTR_TOTAL_IMAGING_DATA_CAPACITY () {0x313;}' unless defined(&SDP_ATTR_TOTAL_IMAGING_DATA_CAPACITY);
    eval 'sub SDP_ATTR_SUPPORTED_REPOSITORIES () {0x314;}' unless defined(&SDP_ATTR_SUPPORTED_REPOSITORIES);
    eval 'sub SDP_ATTR_PRIMARY_LANGUAGE_BASE_ID () {0x100;}' unless defined(&SDP_ATTR_PRIMARY_LANGUAGE_BASE_ID);
    eval 'sub SDP_ATTR_SERVICE_NAME_OFFSET () {0x;}' unless defined(&SDP_ATTR_SERVICE_NAME_OFFSET);
    eval 'sub SDP_ATTR_SERVICE_DESCRIPTION_OFFSET () {0x1;}' unless defined(&SDP_ATTR_SERVICE_DESCRIPTION_OFFSET);
    eval 'sub SDP_ATTR_PROVIDER_NAME_OFFSET () {0x2;}' unless defined(&SDP_ATTR_PROVIDER_NAME_OFFSET);
    eval 'sub SDP_PDU_ERROR_RESPONSE () {0x1;}' unless defined(&SDP_PDU_ERROR_RESPONSE);
    eval 'sub SDP_PDU_SERVICE_SEARCH_REQUEST () {0x2;}' unless defined(&SDP_PDU_SERVICE_SEARCH_REQUEST);
    eval 'sub SDP_PDU_SERVICE_SEARCH_RESPONSE () {0x3;}' unless defined(&SDP_PDU_SERVICE_SEARCH_RESPONSE);
    eval 'sub SDP_PDU_SERVICE_ATTRIBUTE_REQUEST () {0x4;}' unless defined(&SDP_PDU_SERVICE_ATTRIBUTE_REQUEST);
    eval 'sub SDP_PDU_SERVICE_ATTRIBUTE_RESPONSE () {0x5;}' unless defined(&SDP_PDU_SERVICE_ATTRIBUTE_RESPONSE);
    eval 'sub SDP_PDU_SERVICE_SEARCH_ATTRIBUTE_REQUEST () {0x6;}' unless defined(&SDP_PDU_SERVICE_SEARCH_ATTRIBUTE_REQUEST);
    eval 'sub SDP_PDU_SERVICE_SEARCH_ATTRIBUTE_RESPONSE () {0x7;}' unless defined(&SDP_PDU_SERVICE_SEARCH_ATTRIBUTE_RESPONSE);
    eval 'sub SDP_ERROR_CODE_INVALID_SDP_VERSION () {0x1;}' unless defined(&SDP_ERROR_CODE_INVALID_SDP_VERSION);
    eval 'sub SDP_ERROR_CODE_INVALID_SERVICE_RECORD_HANDLE () {0x2;}' unless defined(&SDP_ERROR_CODE_INVALID_SERVICE_RECORD_HANDLE);
    eval 'sub SDP_ERROR_CODE_INVALID_REQUEST_SYNTAX () {0x3;}' unless defined(&SDP_ERROR_CODE_INVALID_REQUEST_SYNTAX);
    eval 'sub SDP_ERROR_CODE_INVALID_PDU_SIZE () {0x4;}' unless defined(&SDP_ERROR_CODE_INVALID_PDU_SIZE);
    eval 'sub SDP_ERROR_CODE_INVALID_CONTINUATION_STATE () {0x5;}' unless defined(&SDP_ERROR_CODE_INVALID_CONTINUATION_STATE);
    eval 'sub SDP_ERROR_CODE_INSUFFICIENT_RESOURCES () {0x6;}' unless defined(&SDP_ERROR_CODE_INSUFFICIENT_RESOURCES);
    eval 'sub SDP_ATTR_OK () {(0<< 0);}' unless defined(&SDP_ATTR_OK);
    eval 'sub SDP_ATTR_INVALID () {(1<< 0);}' unless defined(&SDP_ATTR_INVALID);
    eval 'sub SDP_ATTR_TRUNCATED () {(1<< 1);}' unless defined(&SDP_ATTR_TRUNCATED);
    eval 'sub SDP_GET8 {
        my($b, $cp) = @_;
	    eval q({  &const  &uint8_t * &t_cp = ( &const  &uint8_t *)($cp); ($b) = * &t_cp; ($cp) ++; });
    }' unless defined(&SDP_GET8);
    eval 'sub SDP_GET16 {
        my($s, $cp) = @_;
	    eval q({  &const  &uint8_t * &t_cp = ( &const  &uint8_t *)($cp); ($s) = (( &uint16_t) $t_cp[0] << 8) | (( &uint16_t) $t_cp[1]) ; ($cp) += 2; });
    }' unless defined(&SDP_GET16);
    eval 'sub SDP_GET32 {
        my($l, $cp) = @_;
	    eval q({  &const  &uint8_t * &t_cp = ( &const  &uint8_t *)($cp); ($l) = (( &uint32_t) $t_cp[0] << 24) | (( &uint32_t) $t_cp[1] << 16) | (( &uint32_t) $t_cp[2] << 8) | (( &uint32_t) $t_cp[3]) ; ($cp) += 4; });
    }' unless defined(&SDP_GET32);
    eval 'sub SDP_GET64 {
        my($l, $cp) = @_;
	    eval q({  &register  &uint8_t * &t_cp = ( &uint8_t *)($cp); ($l) = (( &uint64_t) $t_cp[0] << 56) | (( &uint64_t) $t_cp[1] << 48) | (( &uint64_t) $t_cp[2] << 40) | (( &uint64_t) $t_cp[3] << 32) | (( &uint64_t) $t_cp[4] << 24) | (( &uint64_t) $t_cp[5] << 16) | (( &uint64_t) $t_cp[6] << 8) | (( &uint64_t) $t_cp[7]) ; ($cp) += 8; });
    }' unless defined(&SDP_GET64);
    if((defined(&BYTE_ORDER) ? &BYTE_ORDER : undef) == (defined(&LITTLE_ENDIAN) ? &LITTLE_ENDIAN : undef)) {
	eval 'sub SDP_GET128 {
	    my($l, $cp) = @_;
    	    eval q({  &register  &uint8_t * &t_cp = ( &uint8_t *)($cp); ($l)-> $b[15] = * &t_cp++; ($l)-> $b[14] = * &t_cp++; ($l)-> $b[13] = * &t_cp++; ($l)-> $b[12] = * &t_cp++; ($l)-> $b[11] = * &t_cp++; ($l)-> $b[10] = * &t_cp++; ($l)-> $b[9] = * &t_cp++; ($l)-> $b[8] = * &t_cp++; ($l)-> $b[7] = * &t_cp++; ($l)-> $b[6] = * &t_cp++; ($l)-> $b[5] = * &t_cp++; ($l)-> $b[4] = * &t_cp++; ($l)-> $b[3] = * &t_cp++; ($l)-> $b[2] = * &t_cp++; ($l)-> $b[1] = * &t_cp++; ($l)-> $b[0] = * &t_cp++; ($cp) += 16; });
	}' unless defined(&SDP_GET128);
	eval 'sub SDP_GET_UUID128 {
	    my($l, $cp) = @_;
    	    eval q({  &register  &uint8_t * &t_cp = ( &uint8_t *)($cp); ($l)-> $b[0] = * &t_cp++; ($l)-> $b[1] = * &t_cp++; ($l)-> $b[2] = * &t_cp++; ($l)-> $b[3] = * &t_cp++; ($l)-> $b[4] = * &t_cp++; ($l)-> $b[5] = * &t_cp++; ($l)-> $b[6] = * &t_cp++; ($l)-> $b[7] = * &t_cp++; ($l)-> $b[8] = * &t_cp++; ($l)-> $b[9] = * &t_cp++; ($l)-> $b[10] = * &t_cp++; ($l)-> $b[11] = * &t_cp++; ($l)-> $b[12] = * &t_cp++; ($l)-> $b[13] = * &t_cp++; ($l)-> $b[14] = * &t_cp++; ($l)-> $b[15] = * &t_cp++; ($cp) += 16; });
	}' unless defined(&SDP_GET_UUID128);
    }
 elsif((defined(&BYTE_ORDER) ? &BYTE_ORDER : undef) == (defined(&BIG_ENDIAN) ? &BIG_ENDIAN : undef)) {
	eval 'sub SDP_GET128 {
	    my($l, $cp) = @_;
    	    eval q({  &register  &uint8_t * &t_cp = ( &uint8_t *)($cp); ($l)-> $b[0] = * &t_cp++; ($l)-> $b[1] = * &t_cp++; ($l)-> $b[2] = * &t_cp++; ($l)-> $b[3] = * &t_cp++; ($l)-> $b[4] = * &t_cp++; ($l)-> $b[5] = * &t_cp++; ($l)-> $b[6] = * &t_cp++; ($l)-> $b[7] = * &t_cp++; ($l)-> $b[8] = * &t_cp++; ($l)-> $b[9] = * &t_cp++; ($l)-> $b[10] = * &t_cp++; ($l)-> $b[11] = * &t_cp++; ($l)-> $b[12] = * &t_cp++; ($l)-> $b[13] = * &t_cp++; ($l)-> $b[14] = * &t_cp++; ($l)-> $b[15] = * &t_cp++; ($cp) += 16; });
	}' unless defined(&SDP_GET128);
	eval 'sub SDP_GET_UUID128 {
	    my($l, $cp) = @_;
    	    eval q( &SDP_GET128($l, $cp));
	}' unless defined(&SDP_GET_UUID128);
    } else {
	die("Unsupported BYTE_ORDER");
    }
    eval 'sub SDP_PUT8 {
        my($b, $cp) = @_;
	    eval q({  &register  &uint8_t  &t_b = ( &uint8_t)($b);  &register  &uint8_t * &t_cp = ( &uint8_t *)($cp); * &t_cp =  &t_b; ($cp) ++; });
    }' unless defined(&SDP_PUT8);
    eval 'sub SDP_PUT16 {
        my($s, $cp) = @_;
	    eval q({  &register  &uint16_t  &t_s = ( &uint16_t)($s);  &register  &uint8_t * &t_cp = ( &uint8_t *)($cp); * &t_cp++ =  &t_s >> 8; * &t_cp =  &t_s; ($cp) += 2; });
    }' unless defined(&SDP_PUT16);
    eval 'sub SDP_PUT32 {
        my($l, $cp) = @_;
	    eval q({  &register  &uint32_t  &t_l = ( &uint32_t)($l);  &register  &uint8_t * &t_cp = ( &uint8_t *)($cp); * &t_cp++ =  &t_l >> 24; * &t_cp++ =  &t_l >> 16; * &t_cp++ =  &t_l >> 8; * &t_cp =  &t_l; ($cp) += 4; });
    }' unless defined(&SDP_PUT32);
    eval 'sub SDP_PUT64 {
        my($l, $cp) = @_;
	    eval q({  &register  &uint64_t  &t_l = ( &uint64_t)($l);  &register  &uint8_t * &t_cp = ( &uint8_t *)($cp); * &t_cp++ =  &t_l >> 56; * &t_cp++ =  &t_l >> 48; * &t_cp++ =  &t_l >> 40; * &t_cp++ =  &t_l >> 32; * &t_cp++ =  &t_l >> 24; * &t_cp++ =  &t_l >> 16; * &t_cp++ =  &t_l >> 8; * &t_cp =  &t_l; ($cp) += 8; });
    }' unless defined(&SDP_PUT64);
    if((defined(&BYTE_ORDER) ? &BYTE_ORDER : undef) == (defined(&LITTLE_ENDIAN) ? &LITTLE_ENDIAN : undef)) {
	eval 'sub SDP_PUT128 {
	    my($l, $cp) = @_;
    	    eval q({  &register  &uint8_t * &t_cp = ( &uint8_t *)($cp); * &t_cp++ = ($l)-> $b[15]; * &t_cp++ = ($l)-> $b[14]; * &t_cp++ = ($l)-> $b[13]; * &t_cp++ = ($l)-> $b[12]; * &t_cp++ = ($l)-> $b[11]; * &t_cp++ = ($l)-> $b[10]; * &t_cp++ = ($l)-> $b[9]; * &t_cp++ = ($l)-> $b[8]; * &t_cp++ = ($l)-> $b[7]; * &t_cp++ = ($l)-> $b[6]; * &t_cp++ = ($l)-> $b[5]; * &t_cp++ = ($l)-> $b[4]; * &t_cp++ = ($l)-> $b[3]; * &t_cp++ = ($l)-> $b[2]; * &t_cp++ = ($l)-> $b[1]; * &t_cp = ($l)-> $b[0]; ($cp) += 16; });
	}' unless defined(&SDP_PUT128);
	eval 'sub SDP_PUT_UUID128 {
	    my($l, $cp) = @_;
    	    eval q({  &register  &uint8_t * &t_cp = ( &uint8_t *)($cp); * &t_cp++ = ($l)-> $b[0]; * &t_cp++ = ($l)-> $b[1]; * &t_cp++ = ($l)-> $b[2]; * &t_cp++ = ($l)-> $b[3]; * &t_cp++ = ($l)-> $b[4]; * &t_cp++ = ($l)-> $b[5]; * &t_cp++ = ($l)-> $b[6]; * &t_cp++ = ($l)-> $b[7]; * &t_cp++ = ($l)-> $b[8]; * &t_cp++ = ($l)-> $b[9]; * &t_cp++ = ($l)-> $b[10]; * &t_cp++ = ($l)-> $b[11]; * &t_cp++ = ($l)-> $b[12]; * &t_cp++ = ($l)-> $b[13]; * &t_cp++ = ($l)-> $b[14]; * &t_cp = ($l)-> $b[15]; ($cp) += 16; });
	}' unless defined(&SDP_PUT_UUID128);
    }
 elsif((defined(&BYTE_ORDER) ? &BYTE_ORDER : undef) == (defined(&BIG_ENDIAN) ? &BIG_ENDIAN : undef)) {
	eval 'sub SDP_PUT128 {
	    my($l, $cp) = @_;
    	    eval q({  &register  &uint8_t * &t_cp = ( &uint8_t *)($cp); * &t_cp++ = ($l)-> $b[0]; * &t_cp++ = ($l)-> $b[1]; * &t_cp++ = ($l)-> $b[2]; * &t_cp++ = ($l)-> $b[3]; * &t_cp++ = ($l)-> $b[4]; * &t_cp++ = ($l)-> $b[5]; * &t_cp++ = ($l)-> $b[6]; * &t_cp++ = ($l)-> $b[7]; * &t_cp++ = ($l)-> $b[8]; * &t_cp++ = ($l)-> $b[9]; * &t_cp++ = ($l)-> $b[10]; * &t_cp++ = ($l)-> $b[11]; * &t_cp++ = ($l)-> $b[12]; * &t_cp++ = ($l)-> $b[13]; * &t_cp++ = ($l)-> $b[14]; * &t_cp = ($l)-> $b[15]; ($cp) += 16; });
	}' unless defined(&SDP_PUT128);
	eval 'sub SDP_PUT_UUID128 {
	    my($l, $cp) = @_;
    	    eval q( &SDP_PUT128($l, $cp));
	}' unless defined(&SDP_PUT_UUID128);
    } else {
	die("Unsupported BYTE_ORDER");
    }
    eval 'sub SDP_LOCAL_PATH () {"/var/run/sdp";}' unless defined(&SDP_LOCAL_PATH);
    eval 'sub SDP_LOCAL_MTU () {4096;}' unless defined(&SDP_LOCAL_MTU);
    eval 'sub SDP_PDU_SERVICE_REGISTER_REQUEST () {0x81;}' unless defined(&SDP_PDU_SERVICE_REGISTER_REQUEST);
    eval 'sub SDP_PDU_SERVICE_UNREGISTER_REQUEST () {0x82;}' unless defined(&SDP_PDU_SERVICE_UNREGISTER_REQUEST);
    eval 'sub SDP_PDU_SERVICE_CHANGE_REQUEST () {0x83;}' unless defined(&SDP_PDU_SERVICE_CHANGE_REQUEST);
}
1;
