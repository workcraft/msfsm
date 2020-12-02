`timescale 1ns/1ns

module msfsms_mealy (
	clk,
	reset,
	a_P,
	b_M,
	t8,
	out_M,
	t7,
	t6,
	a_M,
	b_P,
	t5,
	out_P);

	input clk;
	input reset;
	input a_P;
	input b_M;
	input t8;
	output out_M;
	input t7;
	input t6;
	input a_M;
	input b_P;
	input t5;
	output out_P;

	wire e_out_M_FSM1out, e_out_P_FSM1out; // Regular output signals of FSM1 //
	wire p3_FSM1out, p2_FSM1out, p7_FSM1out, p1_FSM1out, p6_FSM1out, p0_FSM1out, p4_FSM1out; // State Synchronisation output signals of FSM1 //
	wire e_out_M_FSM2out, e_out_P_FSM2out; // Regular output signals of FSM2 //
	wire p3_FSM2out, p2_FSM2out, p7_FSM2out, p1_FSM2out, p6_FSM2out, p0_FSM2out, p5_FSM2out; // State Synchronisation output signals of FSM2 //

	assign out_M = e_out_M_FSM1out & e_out_M_FSM2out;
	assign out_P = e_out_P_FSM1out & e_out_P_FSM2out;

	fsm_mealy_behav_01 fsm_mealy_behav_01_inst (
		.clk(clk),
		.reset(reset),
		.a_P_(a_P), .a_P__p0_FSM2_TB(p0_FSM2out),
		.t8_(t8), .t8__p5_FSM2_TB(p5_FSM2out),
		.t7_(t7), .t7__p3_FSM2_TB(p3_FSM2out),
		.t6_(t6), .t6__p2_FSM2_TB(p2_FSM2out),
		.a_M_(a_M), .a_M__p0_FSM2_TB(p0_FSM2out),
		.b_P_(b_P),
		.t5_(t5), .t5__p2_FSM2_TB(p2_FSM2out),
		.e_out_M(e_out_M_FSM1out), .e_out_M_p7_FSM2_TB(p7_FSM2out),
		.e_out_P(e_out_P_FSM1out), .e_out_P_p6_FSM2_TB(p6_FSM2out),
		.p3(p3_FSM1out),
		.p2(p2_FSM1out),
		.p7(p7_FSM1out),
		.p6(p6_FSM1out),
		.p0(p0_FSM1out),
		.p4(p4_FSM1out)
	);


	fsm_mealy_behav_02 fsm_mealy_behav_02_inst (
		.clk(clk),
		.reset(reset),
		.a_P_(a_P), .a_P__p0_FSM1_TB(p0_FSM1out),
		.b_M_(b_M),
		.t8_(t8), .t8__p3_FSM1_TB(p3_FSM1out),
		.t7_(t7), .t7__p3_FSM1_TB(p3_FSM1out),
		.t6_(t6), .t6__p2_FSM1_TB(p2_FSM1out),
		.a_M_(a_M), .a_M__p0_FSM1_TB(p0_FSM1out),
		.t5_(t5), .t5__p4_FSM1_TB(p4_FSM1out),
		.e_out_M(e_out_M_FSM2out), .e_out_M_p7_FSM1_TB(p7_FSM1out),
		.e_out_P(e_out_P_FSM2out), .e_out_P_p6_FSM1_TB(p6_FSM1out),
		.p3(p3_FSM2out),
		.p2(p2_FSM2out),
		.p7(p7_FSM2out),
		.p6(p6_FSM2out),
		.p0(p0_FSM2out),
		.p5(p5_FSM2out)
	);

endmodule  // msfsms_mealy //
