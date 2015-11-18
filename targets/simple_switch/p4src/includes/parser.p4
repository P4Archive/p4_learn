// Template parser.p4 file for myp4
// Edit this file as needed for your P4 program

// This parses an ethernet header
#define ETHERTYPE_IPV4 0x0800

parser start {
    return parse_ethernet;
}

parser parse_ethernet {
    extract(ethernet);
    return ingress;
}

