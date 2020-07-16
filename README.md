## MSFSMs Tool 2018-2020

MSFSMs stands for Multiple Synchronised FSMs. Our work is extended and updated work of [A polynomial time flow for implementing free-choice Petri-nets](https://ieeexplore.ieee.org/abstract/document/6378645) supporting all classes of Well-formed Petri-Nets.

#### How to run the MSFSMs (Multiple Synchronised FSMs) Tool flow:

##### Mandatory Step(s):

  - step 1: save a Workcraft Petri Net Graph either in .work or .g format
  - step 2: run *read_graph* TCL command, to load Petri Net structure into
          MSFSMs tool
  - step 3: run *get_scover* TCL command, to obtain an S-cover, and obtain an
          array of S-components, for the specified Petri Net
  - step 4: run *fsm_create_and_collapse* TCL command, to obtain an array of
          MSFSMs; during this step, FSM mapping and vertical state collapsing
          take place
  - step 5: run *sync_fsms* TCL command, to obtain the final MSFSMs array,
          including synchronisation between them
  - step 6: run *write_msfsms* TCL command, to generate verilog RTL code per
          FSM and for the whole MSFSMs logic

##### Optional Steps(s):

  - Edit exported .g file set input and output events
  - run *write_scomponents_to_dot* TCL command, to produce .dot file
   illustrating the FSMs correspondence, in terms of places, transitions on
   the original Petri Net
  - run *draw_graph_dot* TCL command, to display the MSFSMs using graphviz/dotty

#### All Available TCL commands in MSFSMs tool:

    - read_graph,
      - syntax: "?-format <g (default) | work> <filename>?"
      - description:
    - list_graph,
      - syntax: ""
      - description:
    - list_places,
      - syntax: ""
      - description:
    - list_transitions,
      - syntax: ""
      - description:
    - list_places_with_tokens,
      - syntax: ""
      - description:
    - list_connections,
      - syntax: ""
      - description:
    - list_scomponent,
      - syntax: "<integer (S-component number)>"
      - description:
    - list_scomponents,
      - syntax: ""
      - description:
    - list_fsm,
      - syntax: "<integer (FSM number)>"
      - description:
    - list_fsms,
      - syntax: ""
      - description:
    - list_fsms_with_transition_barriers,
      - syntax: ""
      - description:
    - draw_graph_dot,
      - syntax: ""
      - description:
    - get_scover,
      - syntax: ""
      - description:
    - fsm_create_and_collapse,
      - syntax: ""
      - description:
    - fsm_collapse,
      - syntax: ""
      - description:
    - fsm_create,
      - syntax: ""
      - description:
    - clear_fsms,
      - syntax: ""
      - description:
    - sync_fsms,
      - syntax: "?-createcollapsed?"
      - description:
    - write_msfsms,
      - syntax: "?-format <syncmealy_behav (default) | syncmealy_synth | afsm_format>?"
                "?-createcollapsed?"
                "?-fulloutputstate?"
                "?-timescale <string>?"
      - description:
    - write_scomponents_to_dot,
      - syntax: ""
      - description:
    - quit,
      - syntax: ""
      - description:
