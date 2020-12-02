`timescale 1ns/1ns

module msfsms_mealy (
	clk,
	reset,
	t9,
	t6,
	t3,
	t0,
	t8,
	t5,
	t2,
	t7,
	t4,
	t1);

	input clk;
	input reset;
	input t9;
	input t6;
	input t3;
	input t0;
	input t8;
	input t5;
	input t2;
	input t7;
	input t4;
	input t1;

	wire p7_FSM1out, p4_FSM1out, p1_FSM1out, p9_FSM1out, p6_FSM1out, p3_FSM1out, p0_FSM1out, p8_FSM1out, p5_FSM1out, p2_FSM1out; // State Synchronisation output signals of FSM1 //


	fsm_mealy_behav_01 fsm_mealy_behav_01_inst (
		.clk(clk),
		.reset(reset),
		.t9_(t9),
		.t6_(t6),
		.t3_(t3),
		.t0_(t0),
		.t8_(t8),
		.t5_(t5),
		.t2_(t2),
		.t7_(t7),
		.t4_(t4),
		.t1_(t1)
	);

endmodule  // msfsms_mealy //
