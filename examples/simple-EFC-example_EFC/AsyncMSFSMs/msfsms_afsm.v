`timescale 1ns/1ns

module msfsms_mealy (
	clk,
	data,
	reset,
	t0,
	t5,
	t1,
	t6,
	t2,
	t3,
	t4);

	input reset;
	input t0;
	input t5;
	input t1;
	input t6;
	input t2;
	input t3;
	input t4;

	wire p2_FSM1out, p4_FSM1out, p0_FSM1out, p6_FSM1out; // State Synchronisation output signals of FSM1 //
	wire p7_FSM2out, p3_FSM2out, p5_FSM2out, p0_FSM2out; // State Synchronisation output signals of FSM2 //
	wire p2_FSM3out, p4_FSM3out, p6_FSM3out, p1_FSM3out; // State Synchronisation output signals of FSM3 //


	fsm_afsm_01 fsm_afsm_01_inst (
		.sreset(reset)
		.EN(clk)
		.D(data),
		.t0_(t0), .t0__p0_FSM2_TB(p0_FSM2out), .t0__p1_FSM3_TB(p1_FSM3out),
		.t1_(t1), .t1__p0_FSM2_TB(p0_FSM2out), .t1__p1_FSM3_TB(p1_FSM3out),
		.t6_(t6), .t6__p7_FSM2_TB(p7_FSM2out), .t6__p6_FSM3_TB(p6_FSM3out),
		.t2_(t2), .t2__p2_FSM3_TB(p2_FSM3out),
		.t4_(t4), .t4__p4_FSM3_TB(p4_FSM3out)
	);


	fsm_afsm_02 fsm_afsm_02_inst (
		.sreset(reset)
		.EN(clk)
		.D(data),
		.t0_(t0), .t0__p0_FSM1_TB(p0_FSM1out), .t0__p1_FSM3_TB(p1_FSM3out),
		.t5_(t5),
		.t1_(t1), .t1__p0_FSM1_TB(p0_FSM1out), .t1__p1_FSM3_TB(p1_FSM3out),
		.t6_(t6), .t6__p6_FSM1_TB(p6_FSM1out), .t6__p6_FSM3_TB(p6_FSM3out),
		.t3_(t3)
	);


	fsm_afsm_03 fsm_afsm_03_inst (
		.sreset(reset)
		.EN(clk)
		.D(data),
		.t0_(t0), .t0__p0_FSM1_TB(p0_FSM1out), .t0__p0_FSM2_TB(p0_FSM2out),
		.t1_(t1), .t1__p0_FSM1_TB(p0_FSM1out), .t1__p0_FSM2_TB(p0_FSM2out),
		.t6_(t6), .t6__p6_FSM1_TB(p6_FSM1out), .t6__p7_FSM2_TB(p7_FSM2out),
		.t2_(t2), .t2__p2_FSM1_TB(p2_FSM1out),
		.t4_(t4), .t4__p4_FSM1_TB(p4_FSM1out)
	);

endmodule  // msfsms_mealy //
