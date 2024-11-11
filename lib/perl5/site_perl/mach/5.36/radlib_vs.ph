require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_RADLIB_VS_H_)) {
    eval 'sub _RADLIB_VS_H_ () {1;}' unless defined(&_RADLIB_VS_H_);
    require 'sys/types.ph';
    require 'netinet/in.ph';
    eval 'sub RAD_VENDOR_MICROSOFT () {311;}' unless defined(&RAD_VENDOR_MICROSOFT);
    eval 'sub RAD_MICROSOFT_MS_CHAP_RESPONSE () {1;}' unless defined(&RAD_MICROSOFT_MS_CHAP_RESPONSE);
    eval 'sub RAD_MICROSOFT_MS_CHAP_ERROR () {2;}' unless defined(&RAD_MICROSOFT_MS_CHAP_ERROR);
    eval 'sub RAD_MICROSOFT_MS_CHAP_PW_1 () {3;}' unless defined(&RAD_MICROSOFT_MS_CHAP_PW_1);
    eval 'sub RAD_MICROSOFT_MS_CHAP_PW_2 () {4;}' unless defined(&RAD_MICROSOFT_MS_CHAP_PW_2);
    eval 'sub RAD_MICROSOFT_MS_CHAP_LM_ENC_PW () {5;}' unless defined(&RAD_MICROSOFT_MS_CHAP_LM_ENC_PW);
    eval 'sub RAD_MICROSOFT_MS_CHAP_NT_ENC_PW () {6;}' unless defined(&RAD_MICROSOFT_MS_CHAP_NT_ENC_PW);
    eval 'sub RAD_MICROSOFT_MS_MPPE_ENCRYPTION_POLICY () {7;}' unless defined(&RAD_MICROSOFT_MS_MPPE_ENCRYPTION_POLICY);
    eval 'sub RAD_MICROSOFT_MS_MPPE_ENCRYPTION_TYPES () {8;}' unless defined(&RAD_MICROSOFT_MS_MPPE_ENCRYPTION_TYPES);
    eval 'sub RAD_MICROSOFT_MS_RAS_VENDOR () {9;}' unless defined(&RAD_MICROSOFT_MS_RAS_VENDOR);
    eval 'sub RAD_MICROSOFT_MS_CHAP_DOMAIN () {10;}' unless defined(&RAD_MICROSOFT_MS_CHAP_DOMAIN);
    eval 'sub RAD_MICROSOFT_MS_CHAP_CHALLENGE () {11;}' unless defined(&RAD_MICROSOFT_MS_CHAP_CHALLENGE);
    eval 'sub RAD_MICROSOFT_MS_CHAP_MPPE_KEYS () {12;}' unless defined(&RAD_MICROSOFT_MS_CHAP_MPPE_KEYS);
    eval 'sub RAD_MICROSOFT_MS_BAP_USAGE () {13;}' unless defined(&RAD_MICROSOFT_MS_BAP_USAGE);
    eval 'sub RAD_MICROSOFT_MS_LINK_UTILIZATION_THRESHOLD () {14;}' unless defined(&RAD_MICROSOFT_MS_LINK_UTILIZATION_THRESHOLD);
    eval 'sub RAD_MICROSOFT_MS_LINK_DROP_TIME_LIMIT () {15;}' unless defined(&RAD_MICROSOFT_MS_LINK_DROP_TIME_LIMIT);
    eval 'sub RAD_MICROSOFT_MS_MPPE_SEND_KEY () {16;}' unless defined(&RAD_MICROSOFT_MS_MPPE_SEND_KEY);
    eval 'sub RAD_MICROSOFT_MS_MPPE_RECV_KEY () {17;}' unless defined(&RAD_MICROSOFT_MS_MPPE_RECV_KEY);
    eval 'sub RAD_MICROSOFT_MS_RAS_VERSION () {18;}' unless defined(&RAD_MICROSOFT_MS_RAS_VERSION);
    eval 'sub RAD_MICROSOFT_MS_OLD_ARAP_PASSWORD () {19;}' unless defined(&RAD_MICROSOFT_MS_OLD_ARAP_PASSWORD);
    eval 'sub RAD_MICROSOFT_MS_NEW_ARAP_PASSWORD () {20;}' unless defined(&RAD_MICROSOFT_MS_NEW_ARAP_PASSWORD);
    eval 'sub RAD_MICROSOFT_MS_ARAP_PASSWORD_CHANGE_REASON () {21;}' unless defined(&RAD_MICROSOFT_MS_ARAP_PASSWORD_CHANGE_REASON);
    eval 'sub RAD_MICROSOFT_MS_FILTER () {22;}' unless defined(&RAD_MICROSOFT_MS_FILTER);
    eval 'sub RAD_MICROSOFT_MS_ACCT_AUTH_TYPE () {23;}' unless defined(&RAD_MICROSOFT_MS_ACCT_AUTH_TYPE);
    eval 'sub RAD_MICROSOFT_MS_ACCT_EAP_TYPE () {24;}' unless defined(&RAD_MICROSOFT_MS_ACCT_EAP_TYPE);
    eval 'sub RAD_MICROSOFT_MS_CHAP2_RESPONSE () {25;}' unless defined(&RAD_MICROSOFT_MS_CHAP2_RESPONSE);
    eval 'sub RAD_MICROSOFT_MS_CHAP2_SUCCESS () {26;}' unless defined(&RAD_MICROSOFT_MS_CHAP2_SUCCESS);
    eval 'sub RAD_MICROSOFT_MS_CHAP2_PW () {27;}' unless defined(&RAD_MICROSOFT_MS_CHAP2_PW);
    eval 'sub RAD_MICROSOFT_MS_PRIMARY_DNS_SERVER () {28;}' unless defined(&RAD_MICROSOFT_MS_PRIMARY_DNS_SERVER);
    eval 'sub RAD_MICROSOFT_MS_SECONDARY_DNS_SERVER () {29;}' unless defined(&RAD_MICROSOFT_MS_SECONDARY_DNS_SERVER);
    eval 'sub RAD_MICROSOFT_MS_PRIMARY_NBNS_SERVER () {30;}' unless defined(&RAD_MICROSOFT_MS_PRIMARY_NBNS_SERVER);
    eval 'sub RAD_MICROSOFT_MS_SECONDARY_NBNS_SERVER () {31;}' unless defined(&RAD_MICROSOFT_MS_SECONDARY_NBNS_SERVER);
    eval 'sub RAD_MICROSOFT_MS_ARAP_CHALLENGE () {33;}' unless defined(&RAD_MICROSOFT_MS_ARAP_CHALLENGE);
    eval 'sub SALT_LEN () {2;}' unless defined(&SALT_LEN);
}
1;
