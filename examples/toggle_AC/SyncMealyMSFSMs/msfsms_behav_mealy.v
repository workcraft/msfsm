`timescale 1ns/1ns

module msfsms_mealy (
	clk,
	reset,
	Ro1_MINUS,
	Ri_PLUS,
	Ro2_MINUS,
	Ro1_PLUS,
	Ri_MINUS,
	Ro2_PLUS);

	input clk;
	input reset;
	output Ro1_MINUS;
	input Ri_PLUS;
	output Ro2_MINUS;
	output Ro1_PLUS;
	input Ri_MINUS;
	output Ro2_PLUS;

	wire p0_FSM1out, p1_FSM1out; // State Synchronisation output signals of FSM1 //
	wire e_Ro1_MINUS_FSM2out, e_Ro1_PLUS_FSM2out; // Regular output signals of FSM2 //
	wire p1_FSM2out, p2_FSM2out, p4_FSM2out; // State Synchronisation output signals of FSM2 //
	wire e_Ro2_MINUS_FSM3out, e_Ro2_PLUS_FSM3out; // Regular output signals of FSM3 //
	wire p0_FSM3out, p3_FSM3out, p7_FSM3out; // State Synchronisation output signals of FSM3 //
	wire e_Ro1_MINUS_FSM4out, e_Ro1_PLUS_FSM4out; // Regular output signals of FSM4 //
	wire p1_FSM4out, p2_FSM4out, p4_FSM4out, p5_FSM4out; // State Synchronisation output signals of FSM4 //
	wire e_Ro2_MINUS_FSM5out, e_Ro2_PLUS_FSM5out; // Regular output signals of FSM5 //
	wire p0_FSM5out, p3_FSM5out, p6_FSM5out, p7_FSM5out; // State Synchronisation output signals of FSM5 //
	wire e_Ro2_MINUS_FSM6out, e_Ro2_PLUS_FSM6out; // Regular output signals of FSM6 //
	wire p0_FSM6out, p3_FSM6out, p7_FSM6out, p8_FSM6out; // State Synchronisation output signals of FSM6 //
	wire e_Ro1_MINUS_FSM7out, e_Ro1_PLUS_FSM7out; // Regular output signals of FSM7 //
	wire p1_FSM7out, p2_FSM7out, p4_FSM7out, p9_FSM7out; // State Synchronisation output signals of FSM7 //

	assign Ro1_MINUS = e_Ro1_MINUS_FSM2out & e_Ro1_MINUS_FSM4out & e_Ro1_MINUS_FSM7out;
	assign Ro2_MINUS = e_Ro2_MINUS_FSM3out & e_Ro2_MINUS_FSM5out & e_Ro2_MINUS_FSM6out;
	assign Ro1_PLUS = e_Ro1_PLUS_FSM2out & e_Ro1_PLUS_FSM4out & e_Ro1_PLUS_FSM7out;
	assign Ro2_PLUS = e_Ro2_PLUS_FSM3out & e_Ro2_PLUS_FSM5out & e_Ro2_PLUS_FSM6out;

	fsm_mealy_behav_01 fsm_mealy_behav_01_inst (
		.clk(clk),
		.reset(reset),
		.Ri_PLUS_(Ri_PLUS), .Ri_PLUS__p1_FSM2_TB(p1_FSM2out), .Ri_PLUS__p7_FSM3_TB(p7_FSM3out), .Ri_PLUS__p1_FSM4_TB(p1_FSM4out), .Ri_PLUS__p7_FSM5_TB(p7_FSM5out), .Ri_PLUS__p7_FSM6_TB(p7_FSM6out), .Ri_PLUS__p1_FSM7_TB(p1_FSM7out),
		.Ri_MINUS_(Ri_MINUS), .Ri_MINUS__p4_FSM2_TB(p4_FSM2out), .Ri_MINUS__p0_FSM3_TB(p0_FSM3out), .Ri_MINUS__p4_FSM4_TB(p4_FSM4out), .Ri_MINUS__p0_FSM5_TB(p0_FSM5out), .Ri_MINUS__p0_FSM6_TB(p0_FSM6out), .Ri_MINUS__p4_FSM7_TB(p4_FSM7out),
		.p0(p0_FSM1out),
		.p1(p1_FSM1out)
	);


	fsm_mealy_behav_02 fsm_mealy_behav_02_inst (
		.clk(clk),
		.reset(reset),
		.Ri_PLUS_(Ri_PLUS), .Ri_PLUS__p1_FSM1_TB(p1_FSM1out), .Ri_PLUS__p7_FSM3_TB(p7_FSM3out), .Ri_PLUS__p1_FSM4_TB(p1_FSM4out), .Ri_PLUS__p7_FSM5_TB(p7_FSM5out), .Ri_PLUS__p7_FSM6_TB(p7_FSM6out), .Ri_PLUS__p1_FSM7_TB(p1_FSM7out),
		.Ri_MINUS_(Ri_MINUS), .Ri_MINUS__p0_FSM1_TB(p0_FSM1out), .Ri_MINUS__p0_FSM3_TB(p0_FSM3out), .Ri_MINUS__p4_FSM4_TB(p4_FSM4out), .Ri_MINUS__p0_FSM5_TB(p0_FSM5out), .Ri_MINUS__p0_FSM6_TB(p0_FSM6out), .Ri_MINUS__p4_FSM7_TB(p4_FSM7out),
		.e_Ro1_MINUS(e_Ro1_MINUS_FSM2out), .e_Ro1_MINUS_p5_FSM4_TB(p5_FSM4out), .e_Ro1_MINUS_p2_FSM7_TB(p2_FSM7out),
		.e_Ro1_PLUS(e_Ro1_PLUS_FSM2out), .e_Ro1_PLUS_p2_FSM4_TB(p2_FSM4out), .e_Ro1_PLUS_p9_FSM7_TB(p9_FSM7out),
		.p1(p1_FSM2out),
		.p2(p2_FSM2out),
		.p4(p4_FSM2out)
	);


	fsm_mealy_behav_03 fsm_mealy_behav_03_inst (
		.clk(clk),
		.reset(reset),
		.Ri_PLUS_(Ri_PLUS), .Ri_PLUS__p1_FSM1_TB(p1_FSM1out), .Ri_PLUS__p1_FSM2_TB(p1_FSM2out), .Ri_PLUS__p1_FSM4_TB(p1_FSM4out), .Ri_PLUS__p7_FSM5_TB(p7_FSM5out), .Ri_PLUS__p7_FSM6_TB(p7_FSM6out), .Ri_PLUS__p1_FSM7_TB(p1_FSM7out),
		.Ri_MINUS_(Ri_MINUS), .Ri_MINUS__p0_FSM1_TB(p0_FSM1out), .Ri_MINUS__p4_FSM2_TB(p4_FSM2out), .Ri_MINUS__p4_FSM4_TB(p4_FSM4out), .Ri_MINUS__p0_FSM5_TB(p0_FSM5out), .Ri_MINUS__p0_FSM6_TB(p0_FSM6out), .Ri_MINUS__p4_FSM7_TB(p4_FSM7out),
		.e_Ro2_MINUS(e_Ro2_MINUS_FSM3out), .e_Ro2_MINUS_p6_FSM5_TB(p6_FSM5out), .e_Ro2_MINUS_p3_FSM6_TB(p3_FSM6out),
		.e_Ro2_PLUS(e_Ro2_PLUS_FSM3out), .e_Ro2_PLUS_p3_FSM5_TB(p3_FSM5out), .e_Ro2_PLUS_p8_FSM6_TB(p8_FSM6out),
		.p0(p0_FSM3out),
		.p3(p3_FSM3out),
		.p7(p7_FSM3out)
	);


	fsm_mealy_behav_04 fsm_mealy_behav_04_inst (
		.clk(clk),
		.reset(reset),
		.Ri_PLUS_(Ri_PLUS), .Ri_PLUS__p1_FSM1_TB(p1_FSM1out), .Ri_PLUS__p1_FSM2_TB(p1_FSM2out), .Ri_PLUS__p7_FSM3_TB(p7_FSM3out), .Ri_PLUS__p7_FSM5_TB(p7_FSM5out), .Ri_PLUS__p7_FSM6_TB(p7_FSM6out), .Ri_PLUS__p1_FSM7_TB(p1_FSM7out),
		.Ri_MINUS_(Ri_MINUS), .Ri_MINUS__p0_FSM1_TB(p0_FSM1out), .Ri_MINUS__p4_FSM2_TB(p4_FSM2out), .Ri_MINUS__p0_FSM3_TB(p0_FSM3out), .Ri_MINUS__p0_FSM5_TB(p0_FSM5out), .Ri_MINUS__p0_FSM6_TB(p0_FSM6out), .Ri_MINUS__p4_FSM7_TB(p4_FSM7out),
		.e_Ro1_MINUS(e_Ro1_MINUS_FSM4out), .e_Ro1_MINUS_p2_FSM2_TB(p2_FSM2out), .e_Ro1_MINUS_p2_FSM7_TB(p2_FSM7out),
		.e_Ro1_PLUS(e_Ro1_PLUS_FSM4out), .e_Ro1_PLUS_p2_FSM2_TB(p2_FSM2out), .e_Ro1_PLUS_p9_FSM7_TB(p9_FSM7out),
		.p1(p1_FSM4out),
		.p2(p2_FSM4out),
		.p4(p4_FSM4out),
		.p5(p5_FSM4out)
	);


	fsm_mealy_behav_05 fsm_mealy_behav_05_inst (
		.clk(clk),
		.reset(reset),
		.Ri_PLUS_(Ri_PLUS), .Ri_PLUS__p1_FSM1_TB(p1_FSM1out), .Ri_PLUS__p1_FSM2_TB(p1_FSM2out), .Ri_PLUS__p7_FSM3_TB(p7_FSM3out), .Ri_PLUS__p1_FSM4_TB(p1_FSM4out), .Ri_PLUS__p7_FSM6_TB(p7_FSM6out), .Ri_PLUS__p1_FSM7_TB(p1_FSM7out),
		.Ri_MINUS_(Ri_MINUS), .Ri_MINUS__p0_FSM1_TB(p0_FSM1out), .Ri_MINUS__p4_FSM2_TB(p4_FSM2out), .Ri_MINUS__p0_FSM3_TB(p0_FSM3out), .Ri_MINUS__p4_FSM4_TB(p4_FSM4out), .Ri_MINUS__p0_FSM6_TB(p0_FSM6out), .Ri_MINUS__p4_FSM7_TB(p4_FSM7out),
		.e_Ro2_MINUS(e_Ro2_MINUS_FSM5out), .e_Ro2_MINUS_p3_FSM3_TB(p3_FSM3out), .e_Ro2_MINUS_p3_FSM6_TB(p3_FSM6out),
		.e_Ro2_PLUS(e_Ro2_PLUS_FSM5out), .e_Ro2_PLUS_p3_FSM3_TB(p3_FSM3out), .e_Ro2_PLUS_p8_FSM6_TB(p8_FSM6out),
		.p0(p0_FSM5out),
		.p3(p3_FSM5out),
		.p6(p6_FSM5out),
		.p7(p7_FSM5out)
	);


	fsm_mealy_behav_06 fsm_mealy_behav_06_inst (
		.clk(clk),
		.reset(reset),
		.Ri_PLUS_(Ri_PLUS), .Ri_PLUS__p1_FSM1_TB(p1_FSM1out), .Ri_PLUS__p1_FSM2_TB(p1_FSM2out), .Ri_PLUS__p7_FSM3_TB(p7_FSM3out), .Ri_PLUS__p1_FSM4_TB(p1_FSM4out), .Ri_PLUS__p7_FSM5_TB(p7_FSM5out), .Ri_PLUS__p1_FSM7_TB(p1_FSM7out),
		.Ri_MINUS_(Ri_MINUS), .Ri_MINUS__p0_FSM1_TB(p0_FSM1out), .Ri_MINUS__p4_FSM2_TB(p4_FSM2out), .Ri_MINUS__p0_FSM3_TB(p0_FSM3out), .Ri_MINUS__p4_FSM4_TB(p4_FSM4out), .Ri_MINUS__p0_FSM5_TB(p0_FSM5out), .Ri_MINUS__p4_FSM7_TB(p4_FSM7out),
		.e_Ro2_MINUS(e_Ro2_MINUS_FSM6out), .e_Ro2_MINUS_p3_FSM3_TB(p3_FSM3out), .e_Ro2_MINUS_p6_FSM5_TB(p6_FSM5out),
		.e_Ro2_PLUS(e_Ro2_PLUS_FSM6out), .e_Ro2_PLUS_p3_FSM3_TB(p3_FSM3out), .e_Ro2_PLUS_p3_FSM5_TB(p3_FSM5out),
		.p0(p0_FSM6out),
		.p3(p3_FSM6out),
		.p7(p7_FSM6out),
		.p8(p8_FSM6out)
	);


	fsm_mealy_behav_07 fsm_mealy_behav_07_inst (
		.clk(clk),
		.reset(reset),
		.Ri_PLUS_(Ri_PLUS), .Ri_PLUS__p1_FSM1_TB(p1_FSM1out), .Ri_PLUS__p1_FSM2_TB(p1_FSM2out), .Ri_PLUS__p7_FSM3_TB(p7_FSM3out), .Ri_PLUS__p1_FSM4_TB(p1_FSM4out), .Ri_PLUS__p7_FSM5_TB(p7_FSM5out), .Ri_PLUS__p7_FSM6_TB(p7_FSM6out),
		.Ri_MINUS_(Ri_MINUS), .Ri_MINUS__p0_FSM1_TB(p0_FSM1out), .Ri_MINUS__p4_FSM2_TB(p4_FSM2out), .Ri_MINUS__p0_FSM3_TB(p0_FSM3out), .Ri_MINUS__p4_FSM4_TB(p4_FSM4out), .Ri_MINUS__p0_FSM5_TB(p0_FSM5out), .Ri_MINUS__p0_FSM6_TB(p0_FSM6out),
		.e_Ro1_MINUS(e_Ro1_MINUS_FSM7out), .e_Ro1_MINUS_p2_FSM2_TB(p2_FSM2out), .e_Ro1_MINUS_p5_FSM4_TB(p5_FSM4out),
		.e_Ro1_PLUS(e_Ro1_PLUS_FSM7out), .e_Ro1_PLUS_p2_FSM2_TB(p2_FSM2out), .e_Ro1_PLUS_p2_FSM4_TB(p2_FSM4out),
		.p1(p1_FSM7out),
		.p2(p2_FSM7out),
		.p4(p4_FSM7out),
		.p9(p9_FSM7out)
	);

endmodule  // msfsms_mealy //
