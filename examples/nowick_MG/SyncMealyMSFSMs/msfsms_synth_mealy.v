`timescale 1ns/1ns

module msfsms_mealy (
	clk,
	reset,
	x_PLUS,
	q_PLUS,
	b_MINUS,
	c_PLUS,
	x_MINUS,
	c_MINUS,
	x_MINUSa,
	y_MINUS,
	x_PLUSa,
	b_PLUS,
	y_MINUSa,
	y_PLUS,
	y_PLUSa,
	a_PLUS,
	a_MINUS,
	q_MINUS);

	input clk;
	input reset;
	output x_PLUS;
	output q_PLUS;
	input b_MINUS;
	input c_PLUS;
	output x_MINUS;
	input c_MINUS;
	output x_MINUSa;
	output y_MINUS;
	output x_PLUSa;
	input b_PLUS;
	output y_MINUSa;
	output y_PLUS;
	output y_PLUSa;
	input a_PLUS;
	input a_MINUS;
	output q_MINUS;

	wire e_x_PLUS_FSM1out, e_q_PLUS_FSM1out, e_x_MINUS_FSM1out, e_x_MINUSa_FSM1out, e_x_PLUSa_FSM1out, e_y_MINUSa_FSM1out, e_q_MINUS_FSM1out; // Regular output signals of FSM1 //
	wire p19_FSM1out, p18_FSM1out, p4_FSM1out, p17_FSM1out, p15_FSM1out, p0_FSM1out, p9_FSM1out, p13_FSM1out, p8_FSM1out, p7_FSM1out, p11_FSM1out, p6_FSM1out; // State Synchronisation output signals of FSM1 //
	wire e_q_PLUS_FSM2out, e_x_MINUS_FSM2out, e_x_MINUSa_FSM2out, e_x_PLUSa_FSM2out, e_y_MINUSa_FSM2out, e_y_PLUS_FSM2out, e_q_MINUS_FSM2out; // Regular output signals of FSM2 //
	wire p19_FSM2out, p5_FSM2out, p18_FSM2out, p17_FSM2out, p15_FSM2out, p1_FSM2out, p9_FSM2out, p13_FSM2out, p8_FSM2out, p7_FSM2out, p11_FSM2out, p6_FSM2out; // State Synchronisation output signals of FSM2 //
	wire e_q_PLUS_FSM3out, e_x_MINUS_FSM3out, e_x_MINUSa_FSM3out, e_x_PLUSa_FSM3out, e_y_MINUSa_FSM3out, e_y_PLUS_FSM3out, e_q_MINUS_FSM3out; // Regular output signals of FSM3 //
	wire p5_FSM3out, p18_FSM3out, p17_FSM3out, p3_FSM3out, p20_FSM3out, p15_FSM3out, p9_FSM3out, p13_FSM3out, p8_FSM3out, p7_FSM3out, p11_FSM3out, p6_FSM3out; // State Synchronisation output signals of FSM3 //
	wire e_x_PLUS_FSM4out, e_q_PLUS_FSM4out, e_x_MINUS_FSM4out, e_x_PLUSa_FSM4out, e_y_MINUSa_FSM4out, e_y_PLUSa_FSM4out, e_q_MINUS_FSM4out; // Regular output signals of FSM4 //
	wire p19_FSM4out, p18_FSM4out, p4_FSM4out, p17_FSM4out, p16_FSM4out, p14_FSM4out, p0_FSM4out, p9_FSM4out, p8_FSM4out, p7_FSM4out, p11_FSM4out, p6_FSM4out; // State Synchronisation output signals of FSM4 //
	wire e_x_PLUS_FSM5out, e_q_PLUS_FSM5out, e_x_MINUS_FSM5out, e_x_MINUSa_FSM5out, e_x_PLUSa_FSM5out, e_y_MINUSa_FSM5out, e_q_MINUS_FSM5out; // Regular output signals of FSM5 //
	wire p18_FSM5out, p4_FSM5out, p17_FSM5out, p2_FSM5out, p20_FSM5out, p15_FSM5out, p9_FSM5out, p13_FSM5out, p8_FSM5out, p7_FSM5out, p11_FSM5out, p6_FSM5out; // State Synchronisation output signals of FSM5 //
	wire e_x_PLUS_FSM6out, e_q_PLUS_FSM6out, e_x_MINUS_FSM6out, e_x_MINUSa_FSM6out, e_y_MINUS_FSM6out, e_y_MINUSa_FSM6out, e_q_MINUS_FSM6out; // Regular output signals of FSM6 //
	wire p19_FSM6out, p18_FSM6out, p4_FSM6out, p17_FSM6out, p15_FSM6out, p0_FSM6out, p13_FSM6out, p8_FSM6out, p12_FSM6out, p7_FSM6out, p6_FSM6out, p10_FSM6out; // State Synchronisation output signals of FSM6 //

	assign x_PLUS = e_x_PLUS_FSM1out & e_x_PLUS_FSM4out & e_x_PLUS_FSM5out & e_x_PLUS_FSM6out;
	assign q_PLUS = e_q_PLUS_FSM1out & e_q_PLUS_FSM2out & e_q_PLUS_FSM3out & e_q_PLUS_FSM4out & e_q_PLUS_FSM5out & e_q_PLUS_FSM6out;
	assign x_MINUS = e_x_MINUS_FSM1out & e_x_MINUS_FSM2out & e_x_MINUS_FSM3out & e_x_MINUS_FSM4out & e_x_MINUS_FSM5out & e_x_MINUS_FSM6out;
	assign x_MINUSa = e_x_MINUSa_FSM1out & e_x_MINUSa_FSM2out & e_x_MINUSa_FSM3out & e_x_MINUSa_FSM5out & e_x_MINUSa_FSM6out;
	assign y_MINUS = e_y_MINUS_FSM6out;
	assign x_PLUSa = e_x_PLUSa_FSM1out & e_x_PLUSa_FSM2out & e_x_PLUSa_FSM3out & e_x_PLUSa_FSM4out & e_x_PLUSa_FSM5out;
	assign y_MINUSa = e_y_MINUSa_FSM1out & e_y_MINUSa_FSM2out & e_y_MINUSa_FSM3out & e_y_MINUSa_FSM4out & e_y_MINUSa_FSM5out & e_y_MINUSa_FSM6out;
	assign y_PLUS = e_y_PLUS_FSM2out & e_y_PLUS_FSM3out;
	assign y_PLUSa = e_y_PLUSa_FSM4out;
	assign q_MINUS = e_q_MINUS_FSM1out & e_q_MINUS_FSM2out & e_q_MINUS_FSM3out & e_q_MINUS_FSM4out & e_q_MINUS_FSM5out & e_q_MINUS_FSM6out;

	fsm_mealy_synth_01 fsm_mealy_synth_01_inst (
		.clk(clk),
		.reset(reset),
		.b_MINUS_(b_MINUS), .b_MINUS__p11_FSM2_TB(p11_FSM2out), .b_MINUS__p11_FSM3_TB(p11_FSM3out), .b_MINUS__p11_FSM4_TB(p11_FSM4out), .b_MINUS__p11_FSM5_TB(p11_FSM5out), .b_MINUS__p12_FSM6_TB(p12_FSM6out),
		.c_PLUS_(c_PLUS), .c_PLUS__p5_FSM2_TB(p5_FSM2out), .c_PLUS__p5_FSM3_TB(p5_FSM3out), .c_PLUS__p4_FSM4_TB(p4_FSM4out), .c_PLUS__p4_FSM5_TB(p4_FSM5out), .c_PLUS__p4_FSM6_TB(p4_FSM6out),
		.c_MINUS_(c_MINUS), .c_MINUS__p8_FSM2_TB(p8_FSM2out), .c_MINUS__p8_FSM3_TB(p8_FSM3out), .c_MINUS__p8_FSM4_TB(p8_FSM4out), .c_MINUS__p8_FSM5_TB(p8_FSM5out), .c_MINUS__p8_FSM6_TB(p8_FSM6out),
		.a_PLUS_(a_PLUS), .a_PLUS__p19_FSM2_TB(p19_FSM2out), .a_PLUS__p19_FSM4_TB(p19_FSM4out), .a_PLUS__p19_FSM6_TB(p19_FSM6out),
		.a_MINUS_(a_MINUS), .a_MINUS__p15_FSM2_TB(p15_FSM2out), .a_MINUS__p15_FSM3_TB(p15_FSM3out), .a_MINUS__p16_FSM4_TB(p16_FSM4out), .a_MINUS__p15_FSM5_TB(p15_FSM5out), .a_MINUS__p15_FSM6_TB(p15_FSM6out),
		.e_x_PLUS(e_x_PLUS_FSM1out), .e_x_PLUS_p0_FSM4_TB(p0_FSM4out), .e_x_PLUS_p2_FSM5_TB(p2_FSM5out), .e_x_PLUS_p0_FSM6_TB(p0_FSM6out),
		.e_q_PLUS(e_q_PLUS_FSM1out), .e_q_PLUS_p6_FSM2_TB(p6_FSM2out), .e_q_PLUS_p6_FSM3_TB(p6_FSM3out), .e_q_PLUS_p6_FSM4_TB(p6_FSM4out), .e_q_PLUS_p6_FSM5_TB(p6_FSM5out), .e_q_PLUS_p6_FSM6_TB(p6_FSM6out),
		.e_x_MINUS(e_x_MINUS_FSM1out), .e_x_MINUS_p7_FSM2_TB(p7_FSM2out), .e_x_MINUS_p7_FSM3_TB(p7_FSM3out), .e_x_MINUS_p7_FSM4_TB(p7_FSM4out), .e_x_MINUS_p7_FSM5_TB(p7_FSM5out), .e_x_MINUS_p7_FSM6_TB(p7_FSM6out),
		.e_x_MINUSa(e_x_MINUSa_FSM1out), .e_x_MINUSa_p13_FSM2_TB(p13_FSM2out), .e_x_MINUSa_p13_FSM3_TB(p13_FSM3out), .e_x_MINUSa_p13_FSM5_TB(p13_FSM5out), .e_x_MINUSa_p13_FSM6_TB(p13_FSM6out),
		.e_x_PLUSa(e_x_PLUSa_FSM1out), .e_x_PLUSa_p9_FSM2_TB(p9_FSM2out), .e_x_PLUSa_p9_FSM3_TB(p9_FSM3out), .e_x_PLUSa_p9_FSM4_TB(p9_FSM4out), .e_x_PLUSa_p9_FSM5_TB(p9_FSM5out),
		.e_y_MINUSa(e_y_MINUSa_FSM1out), .e_y_MINUSa_p18_FSM2_TB(p18_FSM2out), .e_y_MINUSa_p18_FSM3_TB(p18_FSM3out), .e_y_MINUSa_p18_FSM4_TB(p18_FSM4out), .e_y_MINUSa_p18_FSM5_TB(p18_FSM5out), .e_y_MINUSa_p18_FSM6_TB(p18_FSM6out),
		.e_q_MINUS(e_q_MINUS_FSM1out), .e_q_MINUS_p17_FSM2_TB(p17_FSM2out), .e_q_MINUS_p17_FSM3_TB(p17_FSM3out), .e_q_MINUS_p17_FSM4_TB(p17_FSM4out), .e_q_MINUS_p17_FSM5_TB(p17_FSM5out), .e_q_MINUS_p17_FSM6_TB(p17_FSM6out),
		.p19(p19_FSM1out),
		.p18(p18_FSM1out),
		.p4(p4_FSM1out),
		.p17(p17_FSM1out),
		.p15(p15_FSM1out),
		.p0(p0_FSM1out),
		.p9(p9_FSM1out),
		.p13(p13_FSM1out),
		.p8(p8_FSM1out),
		.p7(p7_FSM1out),
		.p11(p11_FSM1out),
		.p6(p6_FSM1out)
	);


	fsm_mealy_synth_02 fsm_mealy_synth_02_inst (
		.clk(clk),
		.reset(reset),
		.b_MINUS_(b_MINUS), .b_MINUS__p11_FSM1_TB(p11_FSM1out), .b_MINUS__p11_FSM3_TB(p11_FSM3out), .b_MINUS__p11_FSM4_TB(p11_FSM4out), .b_MINUS__p11_FSM5_TB(p11_FSM5out), .b_MINUS__p12_FSM6_TB(p12_FSM6out),
		.c_PLUS_(c_PLUS), .c_PLUS__p4_FSM1_TB(p4_FSM1out), .c_PLUS__p5_FSM3_TB(p5_FSM3out), .c_PLUS__p4_FSM4_TB(p4_FSM4out), .c_PLUS__p4_FSM5_TB(p4_FSM5out), .c_PLUS__p4_FSM6_TB(p4_FSM6out),
		.c_MINUS_(c_MINUS), .c_MINUS__p8_FSM1_TB(p8_FSM1out), .c_MINUS__p8_FSM3_TB(p8_FSM3out), .c_MINUS__p8_FSM4_TB(p8_FSM4out), .c_MINUS__p8_FSM5_TB(p8_FSM5out), .c_MINUS__p8_FSM6_TB(p8_FSM6out),
		.a_PLUS_(a_PLUS), .a_PLUS__p19_FSM1_TB(p19_FSM1out), .a_PLUS__p19_FSM4_TB(p19_FSM4out), .a_PLUS__p19_FSM6_TB(p19_FSM6out),
		.a_MINUS_(a_MINUS), .a_MINUS__p15_FSM1_TB(p15_FSM1out), .a_MINUS__p15_FSM3_TB(p15_FSM3out), .a_MINUS__p16_FSM4_TB(p16_FSM4out), .a_MINUS__p15_FSM5_TB(p15_FSM5out), .a_MINUS__p15_FSM6_TB(p15_FSM6out),
		.e_q_PLUS(e_q_PLUS_FSM2out), .e_q_PLUS_p6_FSM1_TB(p6_FSM1out), .e_q_PLUS_p6_FSM3_TB(p6_FSM3out), .e_q_PLUS_p6_FSM4_TB(p6_FSM4out), .e_q_PLUS_p6_FSM5_TB(p6_FSM5out), .e_q_PLUS_p6_FSM6_TB(p6_FSM6out),
		.e_x_MINUS(e_x_MINUS_FSM2out), .e_x_MINUS_p7_FSM1_TB(p7_FSM1out), .e_x_MINUS_p7_FSM3_TB(p7_FSM3out), .e_x_MINUS_p7_FSM4_TB(p7_FSM4out), .e_x_MINUS_p7_FSM5_TB(p7_FSM5out), .e_x_MINUS_p7_FSM6_TB(p7_FSM6out),
		.e_x_MINUSa(e_x_MINUSa_FSM2out), .e_x_MINUSa_p13_FSM1_TB(p13_FSM1out), .e_x_MINUSa_p13_FSM3_TB(p13_FSM3out), .e_x_MINUSa_p13_FSM5_TB(p13_FSM5out), .e_x_MINUSa_p13_FSM6_TB(p13_FSM6out),
		.e_x_PLUSa(e_x_PLUSa_FSM2out), .e_x_PLUSa_p9_FSM1_TB(p9_FSM1out), .e_x_PLUSa_p9_FSM3_TB(p9_FSM3out), .e_x_PLUSa_p9_FSM4_TB(p9_FSM4out), .e_x_PLUSa_p9_FSM5_TB(p9_FSM5out),
		.e_y_MINUSa(e_y_MINUSa_FSM2out), .e_y_MINUSa_p18_FSM1_TB(p18_FSM1out), .e_y_MINUSa_p18_FSM3_TB(p18_FSM3out), .e_y_MINUSa_p18_FSM4_TB(p18_FSM4out), .e_y_MINUSa_p18_FSM5_TB(p18_FSM5out), .e_y_MINUSa_p18_FSM6_TB(p18_FSM6out),
		.e_y_PLUS(e_y_PLUS_FSM2out), .e_y_PLUS_p3_FSM3_TB(p3_FSM3out),
		.e_q_MINUS(e_q_MINUS_FSM2out), .e_q_MINUS_p17_FSM1_TB(p17_FSM1out), .e_q_MINUS_p17_FSM3_TB(p17_FSM3out), .e_q_MINUS_p17_FSM4_TB(p17_FSM4out), .e_q_MINUS_p17_FSM5_TB(p17_FSM5out), .e_q_MINUS_p17_FSM6_TB(p17_FSM6out),
		.p19(p19_FSM2out),
		.p5(p5_FSM2out),
		.p18(p18_FSM2out),
		.p17(p17_FSM2out),
		.p15(p15_FSM2out),
		.p1(p1_FSM2out),
		.p9(p9_FSM2out),
		.p13(p13_FSM2out),
		.p8(p8_FSM2out),
		.p7(p7_FSM2out),
		.p11(p11_FSM2out),
		.p6(p6_FSM2out)
	);


	fsm_mealy_synth_03 fsm_mealy_synth_03_inst (
		.clk(clk),
		.reset(reset),
		.b_MINUS_(b_MINUS), .b_MINUS__p11_FSM1_TB(p11_FSM1out), .b_MINUS__p11_FSM2_TB(p11_FSM2out), .b_MINUS__p11_FSM4_TB(p11_FSM4out), .b_MINUS__p11_FSM5_TB(p11_FSM5out), .b_MINUS__p12_FSM6_TB(p12_FSM6out),
		.c_PLUS_(c_PLUS), .c_PLUS__p4_FSM1_TB(p4_FSM1out), .c_PLUS__p5_FSM2_TB(p5_FSM2out), .c_PLUS__p4_FSM4_TB(p4_FSM4out), .c_PLUS__p4_FSM5_TB(p4_FSM5out), .c_PLUS__p4_FSM6_TB(p4_FSM6out),
		.c_MINUS_(c_MINUS), .c_MINUS__p8_FSM1_TB(p8_FSM1out), .c_MINUS__p8_FSM2_TB(p8_FSM2out), .c_MINUS__p8_FSM4_TB(p8_FSM4out), .c_MINUS__p8_FSM5_TB(p8_FSM5out), .c_MINUS__p8_FSM6_TB(p8_FSM6out),
		.b_PLUS_(b_PLUS), .b_PLUS__p20_FSM5_TB(p20_FSM5out),
		.a_MINUS_(a_MINUS), .a_MINUS__p15_FSM1_TB(p15_FSM1out), .a_MINUS__p15_FSM2_TB(p15_FSM2out), .a_MINUS__p16_FSM4_TB(p16_FSM4out), .a_MINUS__p15_FSM5_TB(p15_FSM5out), .a_MINUS__p15_FSM6_TB(p15_FSM6out),
		.e_q_PLUS(e_q_PLUS_FSM3out), .e_q_PLUS_p6_FSM1_TB(p6_FSM1out), .e_q_PLUS_p6_FSM2_TB(p6_FSM2out), .e_q_PLUS_p6_FSM4_TB(p6_FSM4out), .e_q_PLUS_p6_FSM5_TB(p6_FSM5out), .e_q_PLUS_p6_FSM6_TB(p6_FSM6out),
		.e_x_MINUS(e_x_MINUS_FSM3out), .e_x_MINUS_p7_FSM1_TB(p7_FSM1out), .e_x_MINUS_p7_FSM2_TB(p7_FSM2out), .e_x_MINUS_p7_FSM4_TB(p7_FSM4out), .e_x_MINUS_p7_FSM5_TB(p7_FSM5out), .e_x_MINUS_p7_FSM6_TB(p7_FSM6out),
		.e_x_MINUSa(e_x_MINUSa_FSM3out), .e_x_MINUSa_p13_FSM1_TB(p13_FSM1out), .e_x_MINUSa_p13_FSM2_TB(p13_FSM2out), .e_x_MINUSa_p13_FSM5_TB(p13_FSM5out), .e_x_MINUSa_p13_FSM6_TB(p13_FSM6out),
		.e_x_PLUSa(e_x_PLUSa_FSM3out), .e_x_PLUSa_p9_FSM1_TB(p9_FSM1out), .e_x_PLUSa_p9_FSM2_TB(p9_FSM2out), .e_x_PLUSa_p9_FSM4_TB(p9_FSM4out), .e_x_PLUSa_p9_FSM5_TB(p9_FSM5out),
		.e_y_MINUSa(e_y_MINUSa_FSM3out), .e_y_MINUSa_p18_FSM1_TB(p18_FSM1out), .e_y_MINUSa_p18_FSM2_TB(p18_FSM2out), .e_y_MINUSa_p18_FSM4_TB(p18_FSM4out), .e_y_MINUSa_p18_FSM5_TB(p18_FSM5out), .e_y_MINUSa_p18_FSM6_TB(p18_FSM6out),
		.e_y_PLUS(e_y_PLUS_FSM3out), .e_y_PLUS_p1_FSM2_TB(p1_FSM2out),
		.e_q_MINUS(e_q_MINUS_FSM3out), .e_q_MINUS_p17_FSM1_TB(p17_FSM1out), .e_q_MINUS_p17_FSM2_TB(p17_FSM2out), .e_q_MINUS_p17_FSM4_TB(p17_FSM4out), .e_q_MINUS_p17_FSM5_TB(p17_FSM5out), .e_q_MINUS_p17_FSM6_TB(p17_FSM6out),
		.p5(p5_FSM3out),
		.p18(p18_FSM3out),
		.p17(p17_FSM3out),
		.p3(p3_FSM3out),
		.p20(p20_FSM3out),
		.p15(p15_FSM3out),
		.p9(p9_FSM3out),
		.p13(p13_FSM3out),
		.p8(p8_FSM3out),
		.p7(p7_FSM3out),
		.p11(p11_FSM3out),
		.p6(p6_FSM3out)
	);


	fsm_mealy_synth_04 fsm_mealy_synth_04_inst (
		.clk(clk),
		.reset(reset),
		.b_MINUS_(b_MINUS), .b_MINUS__p11_FSM1_TB(p11_FSM1out), .b_MINUS__p11_FSM2_TB(p11_FSM2out), .b_MINUS__p11_FSM3_TB(p11_FSM3out), .b_MINUS__p11_FSM5_TB(p11_FSM5out), .b_MINUS__p12_FSM6_TB(p12_FSM6out),
		.c_PLUS_(c_PLUS), .c_PLUS__p4_FSM1_TB(p4_FSM1out), .c_PLUS__p5_FSM2_TB(p5_FSM2out), .c_PLUS__p5_FSM3_TB(p5_FSM3out), .c_PLUS__p4_FSM5_TB(p4_FSM5out), .c_PLUS__p4_FSM6_TB(p4_FSM6out),
		.c_MINUS_(c_MINUS), .c_MINUS__p8_FSM1_TB(p8_FSM1out), .c_MINUS__p8_FSM2_TB(p8_FSM2out), .c_MINUS__p8_FSM3_TB(p8_FSM3out), .c_MINUS__p8_FSM5_TB(p8_FSM5out), .c_MINUS__p8_FSM6_TB(p8_FSM6out),
		.a_PLUS_(a_PLUS), .a_PLUS__p19_FSM1_TB(p19_FSM1out), .a_PLUS__p19_FSM2_TB(p19_FSM2out), .a_PLUS__p19_FSM6_TB(p19_FSM6out),
		.a_MINUS_(a_MINUS), .a_MINUS__p15_FSM1_TB(p15_FSM1out), .a_MINUS__p15_FSM2_TB(p15_FSM2out), .a_MINUS__p15_FSM3_TB(p15_FSM3out), .a_MINUS__p15_FSM5_TB(p15_FSM5out), .a_MINUS__p15_FSM6_TB(p15_FSM6out),
		.e_x_PLUS(e_x_PLUS_FSM4out), .e_x_PLUS_p0_FSM1_TB(p0_FSM1out), .e_x_PLUS_p2_FSM5_TB(p2_FSM5out), .e_x_PLUS_p0_FSM6_TB(p0_FSM6out),
		.e_q_PLUS(e_q_PLUS_FSM4out), .e_q_PLUS_p6_FSM1_TB(p6_FSM1out), .e_q_PLUS_p6_FSM2_TB(p6_FSM2out), .e_q_PLUS_p6_FSM3_TB(p6_FSM3out), .e_q_PLUS_p6_FSM5_TB(p6_FSM5out), .e_q_PLUS_p6_FSM6_TB(p6_FSM6out),
		.e_x_MINUS(e_x_MINUS_FSM4out), .e_x_MINUS_p7_FSM1_TB(p7_FSM1out), .e_x_MINUS_p7_FSM2_TB(p7_FSM2out), .e_x_MINUS_p7_FSM3_TB(p7_FSM3out), .e_x_MINUS_p7_FSM5_TB(p7_FSM5out), .e_x_MINUS_p7_FSM6_TB(p7_FSM6out),
		.e_x_PLUSa(e_x_PLUSa_FSM4out), .e_x_PLUSa_p9_FSM1_TB(p9_FSM1out), .e_x_PLUSa_p9_FSM2_TB(p9_FSM2out), .e_x_PLUSa_p9_FSM3_TB(p9_FSM3out), .e_x_PLUSa_p9_FSM5_TB(p9_FSM5out),
		.e_y_MINUSa(e_y_MINUSa_FSM4out), .e_y_MINUSa_p18_FSM1_TB(p18_FSM1out), .e_y_MINUSa_p18_FSM2_TB(p18_FSM2out), .e_y_MINUSa_p18_FSM3_TB(p18_FSM3out), .e_y_MINUSa_p18_FSM5_TB(p18_FSM5out), .e_y_MINUSa_p18_FSM6_TB(p18_FSM6out),
		.e_y_PLUSa(e_y_PLUSa_FSM4out),
		.e_q_MINUS(e_q_MINUS_FSM4out), .e_q_MINUS_p17_FSM1_TB(p17_FSM1out), .e_q_MINUS_p17_FSM2_TB(p17_FSM2out), .e_q_MINUS_p17_FSM3_TB(p17_FSM3out), .e_q_MINUS_p17_FSM5_TB(p17_FSM5out), .e_q_MINUS_p17_FSM6_TB(p17_FSM6out),
		.p19(p19_FSM4out),
		.p18(p18_FSM4out),
		.p4(p4_FSM4out),
		.p17(p17_FSM4out),
		.p16(p16_FSM4out),
		.p0(p0_FSM4out),
		.p9(p9_FSM4out),
		.p8(p8_FSM4out),
		.p7(p7_FSM4out),
		.p11(p11_FSM4out),
		.p6(p6_FSM4out)
	);


	fsm_mealy_synth_05 fsm_mealy_synth_05_inst (
		.clk(clk),
		.reset(reset),
		.b_MINUS_(b_MINUS), .b_MINUS__p11_FSM1_TB(p11_FSM1out), .b_MINUS__p11_FSM2_TB(p11_FSM2out), .b_MINUS__p11_FSM3_TB(p11_FSM3out), .b_MINUS__p11_FSM4_TB(p11_FSM4out), .b_MINUS__p12_FSM6_TB(p12_FSM6out),
		.c_PLUS_(c_PLUS), .c_PLUS__p4_FSM1_TB(p4_FSM1out), .c_PLUS__p5_FSM2_TB(p5_FSM2out), .c_PLUS__p5_FSM3_TB(p5_FSM3out), .c_PLUS__p4_FSM4_TB(p4_FSM4out), .c_PLUS__p4_FSM6_TB(p4_FSM6out),
		.c_MINUS_(c_MINUS), .c_MINUS__p8_FSM1_TB(p8_FSM1out), .c_MINUS__p8_FSM2_TB(p8_FSM2out), .c_MINUS__p8_FSM3_TB(p8_FSM3out), .c_MINUS__p8_FSM4_TB(p8_FSM4out), .c_MINUS__p8_FSM6_TB(p8_FSM6out),
		.b_PLUS_(b_PLUS), .b_PLUS__p20_FSM3_TB(p20_FSM3out),
		.a_MINUS_(a_MINUS), .a_MINUS__p15_FSM1_TB(p15_FSM1out), .a_MINUS__p15_FSM2_TB(p15_FSM2out), .a_MINUS__p15_FSM3_TB(p15_FSM3out), .a_MINUS__p16_FSM4_TB(p16_FSM4out), .a_MINUS__p15_FSM6_TB(p15_FSM6out),
		.e_x_PLUS(e_x_PLUS_FSM5out), .e_x_PLUS_p0_FSM1_TB(p0_FSM1out), .e_x_PLUS_p0_FSM4_TB(p0_FSM4out), .e_x_PLUS_p0_FSM6_TB(p0_FSM6out),
		.e_q_PLUS(e_q_PLUS_FSM5out), .e_q_PLUS_p6_FSM1_TB(p6_FSM1out), .e_q_PLUS_p6_FSM2_TB(p6_FSM2out), .e_q_PLUS_p6_FSM3_TB(p6_FSM3out), .e_q_PLUS_p6_FSM4_TB(p6_FSM4out), .e_q_PLUS_p6_FSM6_TB(p6_FSM6out),
		.e_x_MINUS(e_x_MINUS_FSM5out), .e_x_MINUS_p7_FSM1_TB(p7_FSM1out), .e_x_MINUS_p7_FSM2_TB(p7_FSM2out), .e_x_MINUS_p7_FSM3_TB(p7_FSM3out), .e_x_MINUS_p7_FSM4_TB(p7_FSM4out), .e_x_MINUS_p7_FSM6_TB(p7_FSM6out),
		.e_x_MINUSa(e_x_MINUSa_FSM5out), .e_x_MINUSa_p13_FSM1_TB(p13_FSM1out), .e_x_MINUSa_p13_FSM2_TB(p13_FSM2out), .e_x_MINUSa_p13_FSM3_TB(p13_FSM3out), .e_x_MINUSa_p13_FSM6_TB(p13_FSM6out),
		.e_x_PLUSa(e_x_PLUSa_FSM5out), .e_x_PLUSa_p9_FSM1_TB(p9_FSM1out), .e_x_PLUSa_p9_FSM2_TB(p9_FSM2out), .e_x_PLUSa_p9_FSM3_TB(p9_FSM3out), .e_x_PLUSa_p9_FSM4_TB(p9_FSM4out),
		.e_y_MINUSa(e_y_MINUSa_FSM5out), .e_y_MINUSa_p18_FSM1_TB(p18_FSM1out), .e_y_MINUSa_p18_FSM2_TB(p18_FSM2out), .e_y_MINUSa_p18_FSM3_TB(p18_FSM3out), .e_y_MINUSa_p18_FSM4_TB(p18_FSM4out), .e_y_MINUSa_p18_FSM6_TB(p18_FSM6out),
		.e_q_MINUS(e_q_MINUS_FSM5out), .e_q_MINUS_p17_FSM1_TB(p17_FSM1out), .e_q_MINUS_p17_FSM2_TB(p17_FSM2out), .e_q_MINUS_p17_FSM3_TB(p17_FSM3out), .e_q_MINUS_p17_FSM4_TB(p17_FSM4out), .e_q_MINUS_p17_FSM6_TB(p17_FSM6out),
		.p18(p18_FSM5out),
		.p4(p4_FSM5out),
		.p17(p17_FSM5out),
		.p2(p2_FSM5out),
		.p20(p20_FSM5out),
		.p15(p15_FSM5out),
		.p9(p9_FSM5out),
		.p13(p13_FSM5out),
		.p8(p8_FSM5out),
		.p7(p7_FSM5out),
		.p11(p11_FSM5out),
		.p6(p6_FSM5out)
	);


	fsm_mealy_synth_06 fsm_mealy_synth_06_inst (
		.clk(clk),
		.reset(reset),
		.b_MINUS_(b_MINUS), .b_MINUS__p11_FSM1_TB(p11_FSM1out), .b_MINUS__p11_FSM2_TB(p11_FSM2out), .b_MINUS__p11_FSM3_TB(p11_FSM3out), .b_MINUS__p11_FSM4_TB(p11_FSM4out), .b_MINUS__p11_FSM5_TB(p11_FSM5out),
		.c_PLUS_(c_PLUS), .c_PLUS__p4_FSM1_TB(p4_FSM1out), .c_PLUS__p5_FSM2_TB(p5_FSM2out), .c_PLUS__p5_FSM3_TB(p5_FSM3out), .c_PLUS__p4_FSM4_TB(p4_FSM4out), .c_PLUS__p4_FSM5_TB(p4_FSM5out),
		.c_MINUS_(c_MINUS), .c_MINUS__p8_FSM1_TB(p8_FSM1out), .c_MINUS__p8_FSM2_TB(p8_FSM2out), .c_MINUS__p8_FSM3_TB(p8_FSM3out), .c_MINUS__p8_FSM4_TB(p8_FSM4out), .c_MINUS__p8_FSM5_TB(p8_FSM5out),
		.a_PLUS_(a_PLUS), .a_PLUS__p19_FSM1_TB(p19_FSM1out), .a_PLUS__p19_FSM2_TB(p19_FSM2out), .a_PLUS__p19_FSM4_TB(p19_FSM4out),
		.a_MINUS_(a_MINUS), .a_MINUS__p15_FSM1_TB(p15_FSM1out), .a_MINUS__p15_FSM2_TB(p15_FSM2out), .a_MINUS__p15_FSM3_TB(p15_FSM3out), .a_MINUS__p16_FSM4_TB(p16_FSM4out), .a_MINUS__p15_FSM5_TB(p15_FSM5out),
		.e_x_PLUS(e_x_PLUS_FSM6out), .e_x_PLUS_p0_FSM1_TB(p0_FSM1out), .e_x_PLUS_p0_FSM4_TB(p0_FSM4out), .e_x_PLUS_p2_FSM5_TB(p2_FSM5out),
		.e_q_PLUS(e_q_PLUS_FSM6out), .e_q_PLUS_p6_FSM1_TB(p6_FSM1out), .e_q_PLUS_p6_FSM2_TB(p6_FSM2out), .e_q_PLUS_p6_FSM3_TB(p6_FSM3out), .e_q_PLUS_p6_FSM4_TB(p6_FSM4out), .e_q_PLUS_p6_FSM5_TB(p6_FSM5out),
		.e_x_MINUS(e_x_MINUS_FSM6out), .e_x_MINUS_p7_FSM1_TB(p7_FSM1out), .e_x_MINUS_p7_FSM2_TB(p7_FSM2out), .e_x_MINUS_p7_FSM3_TB(p7_FSM3out), .e_x_MINUS_p7_FSM4_TB(p7_FSM4out), .e_x_MINUS_p7_FSM5_TB(p7_FSM5out),
		.e_x_MINUSa(e_x_MINUSa_FSM6out), .e_x_MINUSa_p13_FSM1_TB(p13_FSM1out), .e_x_MINUSa_p13_FSM2_TB(p13_FSM2out), .e_x_MINUSa_p13_FSM3_TB(p13_FSM3out), .e_x_MINUSa_p13_FSM5_TB(p13_FSM5out),
		.e_y_MINUS(e_y_MINUS_FSM6out),
		.e_y_MINUSa(e_y_MINUSa_FSM6out), .e_y_MINUSa_p18_FSM1_TB(p18_FSM1out), .e_y_MINUSa_p18_FSM2_TB(p18_FSM2out), .e_y_MINUSa_p18_FSM3_TB(p18_FSM3out), .e_y_MINUSa_p18_FSM4_TB(p18_FSM4out), .e_y_MINUSa_p18_FSM5_TB(p18_FSM5out),
		.e_q_MINUS(e_q_MINUS_FSM6out), .e_q_MINUS_p17_FSM1_TB(p17_FSM1out), .e_q_MINUS_p17_FSM2_TB(p17_FSM2out), .e_q_MINUS_p17_FSM3_TB(p17_FSM3out), .e_q_MINUS_p17_FSM4_TB(p17_FSM4out), .e_q_MINUS_p17_FSM5_TB(p17_FSM5out),
		.p19(p19_FSM6out),
		.p18(p18_FSM6out),
		.p4(p4_FSM6out),
		.p17(p17_FSM6out),
		.p15(p15_FSM6out),
		.p0(p0_FSM6out),
		.p13(p13_FSM6out),
		.p8(p8_FSM6out),
		.p12(p12_FSM6out),
		.p7(p7_FSM6out),
		.p6(p6_FSM6out)
	);

endmodule  // msfsms_mealy //
