read_graph -format work Basic-EFC-v01-PTnet.work
get_scover
fsm_collapsing
sync_fsm
write_fsms_to_petrify_format -format sg -multiplefiles 1
quit
