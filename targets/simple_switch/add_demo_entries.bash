python ../../cli/pd_cli.py -p simple_switch -i p4_pd_rpc.simple_switch -s $PWD/tests/pd_thrift:$PWD/../../testutils -m "set_default_action smac mac_learn" -c localhost:22222



python ../../cli/pd_cli.py -p simple_switch -i p4_pd_rpc.simple_switch -s $PWD/tests/pd_thrift:$PWD/../../testutils -m "add_entry dmac 00:04:00:00:00:00 forward 1" -c localhost:22222
python ../../cli/pd_cli.py -p simple_switch -i p4_pd_rpc.simple_switch -s $PWD/tests/pd_thrift:$PWD/../../testutils -m "add_entry dmac 00:04:00:00:00:01 forward 2" -c localhost:22222
python ../../cli/pd_cli.py -p simple_switch -i p4_pd_rpc.simple_switch -s $PWD/tests/pd_thrift:$PWD/../../testutils -m "add_entry dmac 00:04:00:00:00:02 forward 3" -c localhost:22222
python ../../cli/pd_cli.py -p simple_switch -i p4_pd_rpc.simple_switch -s $PWD/tests/pd_thrift:$PWD/../../testutils -m "add_entry dmac 00:04:00:00:00:03 forward 4" -c localhost:22222

python ../../cli/pd_cli.py -p simple_switch -i p4_pd_rpc.simple_switch -s $PWD/tests/pd_thrift:$PWD/../../testutils -m "set_default_action dmac broadcast" -c localhost:22222












#==============================================================================
# The rest part is in comment
#python ../../cli/pd_cli.py -p simple_switch -i p4_pd_rpc.simple_switch -s $PWD/tests/pd_thrift:$PWD/../../testutils -m "add_entry send_frame 1 rewrite_mac" -c localhost:22222
#python ../../cli/pd_cli.py -p simple_switch -i p4_pd_rpc.simple_switch -s $PWD/tests/pd_thrift:$PWD/../../testutils -m "add_entry send_frame 2 rewrite_mac" -c localhost:22222
#python ../../cli/pd_cli.py -p simple_switch -i p4_pd_rpc.simple_switch -s $PWD/tests/pd_thrift:$PWD/../../testutils -m "add_entry send_frame 3 rewrite_mac" -c localhost:22222
#python ../../cli/pd_cli.py -p simple_switch -i p4_pd_rpc.simple_switch -s $PWD/tests/pd_thrift:$PWD/../../testutils -m "add_entry send_frame 4 rewrite_mac" -c localhost:22222


#python ../../cli/pd_cli.py -p simple_switch -i p4_pd_rpc.simple_switch -s $PWD/tests/pd_thrift:$PWD/../../testutils -m "set_default_action send_frame _drop" -c localhost:22222



#python ../../cli/pd_cli.py -p simple_switch -i p4_pd_rpc.simple_switch -s $PWD/tests/pd_thrift:$PWD/../../testutils -m "add_entry mcast_src_pruning 5 _drop" -c localhost:22222

#python ../../cli/pd_cli.py -p simple_switch -i p4_pd_rpc.simple_switch -s $PWD/tests/pd_thrift:$PWD/../../testutils -m "set_default_action mcast_src_pruning _nop" -c localhost:22222

