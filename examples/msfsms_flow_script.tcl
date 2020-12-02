###########################################################
### Basic TCL script template for MSFSMs Synthesis Tool ###
###########################################################

### Flow STEP #1 ###
# Load a Well-formed Petri-Net file from '.g' or '.work' file #
read_graph examples/xor-gate_GN/xor-gate.pterinet.GN.workcraft.g

# Display in command line structure representation of loaded Petri-Net #
list_petrinet

### Flow STEP #2 ###
# Calculate Strongly Connected S-Nets #
get_SC_Snets

# Display in command line structure representation of calculated Strongly Connected S-Nets #
list_SC_Snet -all

### Flow STEP #3 ###
# Extract FSMs from Strongly Connected S-Nets and attempt to horizontally collapse them if possible #
create_FSMs -hcollapse

# Display in command line structure representation of extracted FSMs #
list_FSM -all

### Flow STEP #4 ###
# Synchronise FSMs to compose the MSFSMs system #
synchronise_FSMs

### Flow STEP #5 ###
# Create MSFSMs Files of AFSM internal format #
write_MSFSMs -format afsm_format -dlatchimplementation clk EN data D

# Create MSFSMs Files of Behavioral Verilog RTL #
write_MSFSMs -format syncmealy_behav

# Create MSFSMs Files of Synthesisable Verilog RTL #
write_MSFSMs -format syncmealy_synth

### Terminate Program ###
quit

########################### EOF ###########################
