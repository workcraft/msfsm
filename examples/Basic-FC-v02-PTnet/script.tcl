read_graph -format work Basic-FC-v02-PTnet.work
get_scover
fsm_collapsing
sync_fsm
write_fsms_to_petrify_format -format sg -multiplefiles 1
quit
