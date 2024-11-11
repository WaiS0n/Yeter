require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_NETGRAPH_H_)) {
    eval 'sub _NETGRAPH_H_ () {1;}' unless defined(&_NETGRAPH_H_);
    require 'sys/types.ph';
    require 'netgraph/ng_message.ph';
}
1;
