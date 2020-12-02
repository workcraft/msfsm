`timescale 1ns/1ns

module msfsms_mealy (
	clk,
	reset,
	b_P,
	b_M,
	t6,
	t0,
	a_P,
	a_M,
	t8,
	t5,
	out_P,
	t7,
	out_M);

	input clk;
	input reset;
	input b_P;
	input b_M;
	input t6;
	input t0;
	input a_P;
	input a_M;
	input t8;
	input t5;
	output out_P;
	input t7;
	output out_M;

	wire e_out_M_FSM1out; // Regular output signals of FSM1 //
	wire p7_FSM1out, p3_FSM1out, p0_FSM1out, p8_FSM1out; // State Synchronisation output signals of FSM1 //
	wire e_out_P_FSM2out, e_out_M_FSM2out; // Regular output signals of FSM2 //
	wire p7_FSM2out, p4_FSM2out, p1_FSM2out, p6_FSM2out, p8_FSM2out, p5_FSM2out; // State Synchronisation output signals of FSM2 //
	wire e_out_P_FSM3out, e_out_M_FSM3out; // Regular output signals of FSM3 //
	wire p7_FSM3out, p6_FSM3out, p3_FSM3out, p0_FSM3out, p8_FSM3out, p2_FSM3out; // State Synchronisation output signals of FSM3 //

	assign out_P = e_out_P_FSM2out & e_out_P_FSM3out;
	assign out_M = e_out_M_FSM1out & e_out_M_FSM2out & e_out_M_FSM3out;

	fsm_mealy_synth_01 fsm_mealy_synth_01_inst (
		.clk(clk),
		.reset(reset),
		.t0_(t0), .t0__p8_FSM2_TB(p8_FSM2out), .t0__p8_FSM3_TB(p8_FSM3out),
		.a_M_(a_M), .a_M__p0_FSM3_TB(p0_FSM3out),
		.t8_(t8), .t8__p5_FSM2_TB(p5_FSM2out), .t8__p3_FSM3_TB(p3_FSM3out),
		.t7_(t7), .t7__p4_FSM2_TB(p4_FSM2out), .t7__p3_FSM3_TB(p3_FSM3out),
		.e_out_M(e_out_M_FSM1out), .e_out_M_p7_FSM2_TB(p7_FSM2out), .e_out_M_p7_FSM3_TB(p7_FSM3out),
		.p7(p7_FSM1out),
		.p3(p3_FSM1out),
		.p0(p0_FSM1out),
		.p8(p8_FSM1out)
	);


	fsm_mealy_synth_02 fsm_mealy_synth_02_inst (
		.clk(clk),
		.reset(reset),
		.b_P_(b_P),
		.b_M_(b_M),
		.t6_(t6), .t6__p2_FSM3_TB(p2_FSM3out),
		.t0_(t0), .t0__p8_FSM1_TB(p8_FSM1out), .t0__p8_FSM3_TB(p8_FSM3out),
		.t8_(t8), .t8__p3_FSM1_TB(p3_FSM1out), .t8__p3_FSM3_TB(p3_FSM3out),
		.t5_(t5), .t5__p2_FSM3_TB(p2_FSM3out),
		.t7_(t7), .t7__p3_FSM1_TB(p3_FSM1out), .t7__p3_FSM3_TB(p3_FSM3out),
		.e_out_P(e_out_P_FSM2out), .e_out_P_p6_FSM3_TB(p6_FSM3out),
		.e_out_M(e_out_M_FSM2out), .e_out_M_p7_FSM1_TB(p7_FSM1out), .e_out_M_p7_FSM3_TB(p7_FSM3out),
		.p7(p7_FSM2out),
		.p4(p4_FSM2out),
		.p6(p6_FSM2out),
		.p8(p8_FSM2out),
		.p5(p5_FSM2out)
	);


	fsm_mealy_synth_03 fsm_mealy_synth_03_inst (
		.clk(clk),
		.reset(reset),
		.t6_(t6), .t6__p5_FSM2_TB(p5_FSM2out),
		.t0_(t0), .t0__p8_FSM1_TB(p8_FSM1out), .t0__p8_FSM2_TB(p8_FSM2out),
		.a_P_(a_P),
		.a_M_(a_M), .a_M__p0_FSM1_TB(p0_FSM1out),
		.t8_(t8), .t8__p3_FSM1_TB(p3_FSM1out), .t8__p5_FSM2_TB(p5_FSM2out),
		.t5_(t5), .t5__p4_FSM2_TB(p4_FSM2out),
		.t7_(t7), .t7__p3_FSM1_TB(p3_FSM1out), .t7__p4_FSM2_TB(p4_FSM2out),
		.e_out_P(e_out_P_FSM3out), .e_out_P_p6_FSM2_TB(p6_FSM2out),
		.e_out_M(e_out_M_FSM3out), .e_out_M_p7_FSM1_TB(p7_FSM1out), .e_out_M_p7_FSM2_TB(p7_FSM2out),
		.p7(p7_FSM3out),
		.p6(p6_FSM3out),
		.p3(p3_FSM3out),
		.p0(p0_FSM3out),
		.p8(p8_FSM3out),
		.p2(p2_FSM3out)
	);

endmodule  // msfsms_mealy //
