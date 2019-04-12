# msfsms 2018-2019

How to run the MSFSM (Multiple Synchronised FSMs) flow in MSFSMs tool:

	step 1: save a workcraft petri net
	step 2: run read_graph TCL command to read petri net structure into MSFSMs tool
	step 3: run get_scover TCL command to obtain an S-cover, and obtain an array of
	     	S-components, for the specified petri net
	step 4: run fsm_collapsing TCL command, to obtain an array of MSFSMs; during
	     	this step, FSM mapping and state collapsing take place
	step 5: run sync_fsm TCL command to obtain the final MSFSMs array, including
	     	synchronisation between them; this command also generates verilog code
		per MSFSM
	step 6: run draw_graph_dot TCL command to display the MSFSMs using graphviz/dotty

Available TCL commands in MSFSMs tool:
	read_graph 		: reads the petri net corresponding graph form
	print_graph 		: prints the petri net graph
	print_connections	: prints the petri net connectivity
	print_places		: prints petri net places
	print_transitions	: prints petri net transitions
	get_scover		: computes and returns the petri net's S-cover
	fsm_collapsing		: computes and returns the set of collapsed S-cover
				  derived FSMs
	sync_fsm		: computes and returns the FSMs, inclusing
				  inter-FSM synhronisation, i.e. MSFSMs
	draw_graph_dot		: displays MSFSMs using gravhviz/dot
