# msfsms 2018-2019

How to run the MSFSM (Multiple Synchronised FSMs) flow in MSFSMs tool:

	step 1: save a workcraft Petri Net
	step 2: run read_graph TCL command to read Petri Net structure into MSFSMs tool
	step 3: run get_scover TCL command to obtain an S-cover, and obtain an array of
	     	S-components, for the specified Petri Net
	step 4: run fsm_collapsing TCL command, to obtain an array of MSFSMs; during
	     	this step, FSM mapping and state collapsing take place
	step 5: run sync_fsm TCL command to obtain the final MSFSMs array, including
	     	synchronisation between them; this command also generates verilog code
		per MSFSM
	step 6: run write_scomponents_to_dot to produce .dot file illustrating the FSMs
	     	correspondence, in terms of places, transitions on the original Petri Net
	step 7: run write_fsms_to_petrify_format to write FSMs to individual .sg files
	step 8: run draw_graph_dot TCL command to display the MSFSMs using graphviz/dotty

Available TCL commands in MSFSMs tool:
	read_graph 		      : reads the Petri Net corresponding graph form
	print_graph 		      : prints the Petri Net graph
	print_connections	      : prints the Petri Net connectivity
	print_places		      : prints Petri Net places
	print_transitions	      : prints Petri Net transitions
	get_scover		      : computes and returns the Petri Net's S-cover
	fsm_collapsing		      : computes and returns the set of collapsed S-cover
				      	derived FSMs
	sync_fsm		      : computes and returns the FSMs, inclusing
				  	inter-FSM synhronisation, i.e. MSFSMs
	write_scomponents_to_dot      : creates dot files illustrating the FSMs places
				      	and transitions on the Petri Net
	write_fsms_to_petrify_format  : writes FSMs in .sg file format
	draw_graph_dot		      : displays MSFSMs using gravhviz/dot
