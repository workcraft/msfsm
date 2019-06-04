read_graph -format g Basic-FC-v03-PTnet.g
get_scover
fsm_collapsing
sync_fsm
write_fsms_to_petrify_format -format sg -multiplefiles 1
quit
