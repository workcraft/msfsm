`timescale 1ns/1ns

module msfsms_mealy (
	clk,
	reset,
	t3,
	t2,
	t1,
	t7,
	t0,
	t6,
	t5,
	t4);

	input clk;
	input reset;
	input t3;
	input t2;
	input t1;
	input t7;
	input t0;
	input t6;
	input t5;
	input t4;

	wire p3_FSM1out, p2_FSM1out, p0_FSM1out; // State Synchronisation output signals of FSM1 //
	wire p9_FSM2out, p8_FSM2out, p1_FSM2out; // State Synchronisation output signals of FSM2 //
	wire p1_FSM3out, p7_FSM3out, p5_FSM3out; // State Synchronisation output signals of FSM3 //
	wire p1_FSM4out, p6_FSM4out, p4_FSM4out; // State Synchronisation output signals of FSM4 //


	fsm_mealy_synth_01 fsm_mealy_synth_01_inst (
		.clk(clk),
		.reset(reset),
		.t2_(t2),
		.t1_(t1),
		.t0_(t0), .t0__p9_FSM2_TB(p9_FSM2out), .t0__p7_FSM3_TB(p7_FSM3out), .t0__p6_FSM4_TB(p6_FSM4out),
		.t4_(t4),
		.p3(p3_FSM1out)
	);


	fsm_mealy_synth_02 fsm_mealy_synth_02_inst (
		.clk(clk),
		.reset(reset),
		.t3_(t3), .t3__p1_FSM3_TB(p1_FSM3out), .t3__p1_FSM4_TB(p1_FSM4out),
		.t7_(t7),
		.t0_(t0), .t0__p3_FSM1_TB(p3_FSM1out), .t0__p7_FSM3_TB(p7_FSM3out), .t0__p6_FSM4_TB(p6_FSM4out),
		.p9(p9_FSM2out),
		.p1(p1_FSM2out)
	);


	fsm_mealy_synth_03 fsm_mealy_synth_03_inst (
		.clk(clk),
		.reset(reset),
		.t3_(t3), .t3__p1_FSM2_TB(p1_FSM2out), .t3__p1_FSM4_TB(p1_FSM4out),
		.t0_(t0), .t0__p3_FSM1_TB(p3_FSM1out), .t0__p9_FSM2_TB(p9_FSM2out), .t0__p6_FSM4_TB(p6_FSM4out),
		.t6_(t6),
		.p1(p1_FSM3out),
		.p7(p7_FSM3out)
	);


	fsm_mealy_synth_04 fsm_mealy_synth_04_inst (
		.clk(clk),
		.reset(reset),
		.t3_(t3), .t3__p1_FSM2_TB(p1_FSM2out), .t3__p1_FSM3_TB(p1_FSM3out),
		.t0_(t0), .t0__p3_FSM1_TB(p3_FSM1out), .t0__p9_FSM2_TB(p9_FSM2out), .t0__p7_FSM3_TB(p7_FSM3out),
		.t5_(t5),
		.p1(p1_FSM4out),
		.p6(p6_FSM4out)
	);

endmodule  // msfsms_mealy //
