`timescale 1ns/1ns

module msfsms_mealy (
	clk,
	reset,
	x_MINUS,
	Ro_PLUSa,
	Ao_PLUS,
	Ri_MINUS,
	Ai_PLUS,
	Ai_MINUS,
	Ro_PLUS,
	x_PLUS,
	Ri_PLUS,
	Ro_MINUS,
	Ao_MINUS,
	Ro_MINUSa,
	Ai_PLUSa,
	Ai_MINUSa);

	input clk;
	input reset;
	output x_MINUS;
	output Ro_PLUSa;
	output Ao_PLUS;
	input Ri_MINUS;
	input Ai_PLUS;
	input Ai_MINUS;
	output Ro_PLUS;
	output x_PLUS;
	input Ri_PLUS;
	output Ro_MINUS;
	output Ao_MINUS;
	output Ro_MINUSa;
	input Ai_PLUSa;
	input Ai_MINUSa;

	wire e_x_MINUS_FSM1out, e_Ro_PLUSa_FSM1out, e_Ao_PLUS_FSM1out, e_Ro_PLUS_FSM1out, e_x_PLUS_FSM1out, e_Ro_MINUS_FSM1out, e_Ao_MINUS_FSM1out, e_Ro_MINUSa_FSM1out; // Regular output signals of FSM1 //
	wire p7_FSM1out, p10_FSM1out, p9_FSM1out, p12_FSM1out, p0_FSM1out, p1_FSM1out, p14_FSM1out, p2_FSM1out, p15_FSM1out, p3_FSM1out, p4_FSM1out, p5_FSM1out; // State Synchronisation output signals of FSM1 //
	wire e_x_MINUS_FSM2out, e_Ro_PLUSa_FSM2out, e_Ro_PLUS_FSM2out, e_x_PLUS_FSM2out, e_Ro_MINUS_FSM2out, e_Ao_MINUS_FSM2out, e_Ro_MINUSa_FSM2out; // Regular output signals of FSM2 //
	wire p7_FSM2out, p10_FSM2out, p8_FSM2out, p9_FSM2out, p12_FSM2out, p0_FSM2out, p14_FSM2out, p15_FSM2out, p3_FSM2out, p4_FSM2out, p6_FSM2out; // State Synchronisation output signals of FSM2 //
	wire e_x_MINUS_FSM3out, e_Ro_PLUSa_FSM3out, e_Ao_PLUS_FSM3out, e_Ro_PLUS_FSM3out, e_x_PLUS_FSM3out, e_Ro_MINUS_FSM3out, e_Ro_MINUSa_FSM3out; // Regular output signals of FSM3 //
	wire p7_FSM3out, p11_FSM3out, p9_FSM3out, p12_FSM3out, p13_FSM3out, p1_FSM3out, p14_FSM3out, p2_FSM3out, p15_FSM3out, p4_FSM3out, p5_FSM3out; // State Synchronisation output signals of FSM3 //

	assign x_MINUS = e_x_MINUS_FSM1out & e_x_MINUS_FSM2out & e_x_MINUS_FSM3out;
	assign Ro_PLUSa = e_Ro_PLUSa_FSM1out & e_Ro_PLUSa_FSM2out & e_Ro_PLUSa_FSM3out;
	assign Ao_PLUS = e_Ao_PLUS_FSM1out & e_Ao_PLUS_FSM3out;
	assign Ro_PLUS = e_Ro_PLUS_FSM1out & e_Ro_PLUS_FSM2out & e_Ro_PLUS_FSM3out;
	assign x_PLUS = e_x_PLUS_FSM1out & e_x_PLUS_FSM2out & e_x_PLUS_FSM3out;
	assign Ro_MINUS = e_Ro_MINUS_FSM1out & e_Ro_MINUS_FSM2out & e_Ro_MINUS_FSM3out;
	assign Ao_MINUS = e_Ao_MINUS_FSM1out & e_Ao_MINUS_FSM2out;
	assign Ro_MINUSa = e_Ro_MINUSa_FSM1out & e_Ro_MINUSa_FSM2out & e_Ro_MINUSa_FSM3out;

	fsm_mealy_synth_01 fsm_mealy_synth_01_inst (
		.clk(clk),
		.reset(reset),
		.Ri_MINUS_(Ri_MINUS), .Ri_MINUS__p2_FSM3_TB(p2_FSM3out),
		.Ai_PLUS_(Ai_PLUS), .Ai_PLUS__p4_FSM2_TB(p4_FSM2out), .Ai_PLUS__p4_FSM3_TB(p4_FSM3out),
		.Ri_PLUS_(Ri_PLUS), .Ri_PLUS__p3_FSM2_TB(p3_FSM2out),
		.Ai_PLUSa_(Ai_PLUSa), .Ai_PLUSa__p9_FSM2_TB(p9_FSM2out), .Ai_PLUSa__p9_FSM3_TB(p9_FSM3out),
		.e_x_MINUS(e_x_MINUS_FSM1out), .e_x_MINUS_p12_FSM2_TB(p12_FSM2out), .e_x_MINUS_p12_FSM3_TB(p12_FSM3out),
		.e_Ro_PLUSa(e_Ro_PLUSa_FSM1out), .e_Ro_PLUSa_p8_FSM2_TB(p8_FSM2out), .e_Ro_PLUSa_p1_FSM3_TB(p1_FSM3out),
		.e_Ao_PLUS(e_Ao_PLUS_FSM1out), .e_Ao_PLUS_p5_FSM3_TB(p5_FSM3out),
		.e_Ro_PLUS(e_Ro_PLUS_FSM1out), .e_Ro_PLUS_p0_FSM2_TB(p0_FSM2out), .e_Ro_PLUS_p13_FSM3_TB(p13_FSM3out),
		.e_x_PLUS(e_x_PLUS_FSM1out), .e_x_PLUS_p7_FSM2_TB(p7_FSM2out), .e_x_PLUS_p7_FSM3_TB(p7_FSM3out),
		.e_Ro_MINUS(e_Ro_MINUS_FSM1out), .e_Ro_MINUS_p14_FSM2_TB(p14_FSM2out), .e_Ro_MINUS_p14_FSM3_TB(p14_FSM3out),
		.e_Ao_MINUS(e_Ao_MINUS_FSM1out), .e_Ao_MINUS_p10_FSM2_TB(p10_FSM2out),
		.e_Ro_MINUSa(e_Ro_MINUSa_FSM1out), .e_Ro_MINUSa_p15_FSM2_TB(p15_FSM2out), .e_Ro_MINUSa_p15_FSM3_TB(p15_FSM3out),
		.p7(p7_FSM1out),
		.p10(p10_FSM1out),
		.p9(p9_FSM1out),
		.p12(p12_FSM1out),
		.p0(p0_FSM1out),
		.p1(p1_FSM1out),
		.p14(p14_FSM1out),
		.p2(p2_FSM1out),
		.p15(p15_FSM1out),
		.p3(p3_FSM1out),
		.p4(p4_FSM1out),
		.p5(p5_FSM1out)
	);


	fsm_mealy_synth_02 fsm_mealy_synth_02_inst (
		.clk(clk),
		.reset(reset),
		.Ai_PLUS_(Ai_PLUS), .Ai_PLUS__p4_FSM1_TB(p4_FSM1out), .Ai_PLUS__p4_FSM3_TB(p4_FSM3out),
		.Ai_MINUS_(Ai_MINUS),
		.Ri_PLUS_(Ri_PLUS), .Ri_PLUS__p3_FSM1_TB(p3_FSM1out),
		.Ai_PLUSa_(Ai_PLUSa), .Ai_PLUSa__p9_FSM1_TB(p9_FSM1out), .Ai_PLUSa__p9_FSM3_TB(p9_FSM3out),
		.e_x_MINUS(e_x_MINUS_FSM2out), .e_x_MINUS_p12_FSM1_TB(p12_FSM1out), .e_x_MINUS_p12_FSM3_TB(p12_FSM3out),
		.e_Ro_PLUSa(e_Ro_PLUSa_FSM2out), .e_Ro_PLUSa_p1_FSM1_TB(p1_FSM1out), .e_Ro_PLUSa_p1_FSM3_TB(p1_FSM3out),
		.e_Ro_PLUS(e_Ro_PLUS_FSM2out), .e_Ro_PLUS_p0_FSM1_TB(p0_FSM1out), .e_Ro_PLUS_p13_FSM3_TB(p13_FSM3out),
		.e_x_PLUS(e_x_PLUS_FSM2out), .e_x_PLUS_p7_FSM1_TB(p7_FSM1out), .e_x_PLUS_p7_FSM3_TB(p7_FSM3out),
		.e_Ro_MINUS(e_Ro_MINUS_FSM2out), .e_Ro_MINUS_p14_FSM1_TB(p14_FSM1out), .e_Ro_MINUS_p14_FSM3_TB(p14_FSM3out),
		.e_Ao_MINUS(e_Ao_MINUS_FSM2out), .e_Ao_MINUS_p10_FSM1_TB(p10_FSM1out),
		.e_Ro_MINUSa(e_Ro_MINUSa_FSM2out), .e_Ro_MINUSa_p15_FSM1_TB(p15_FSM1out), .e_Ro_MINUSa_p15_FSM3_TB(p15_FSM3out),
		.p7(p7_FSM2out),
		.p10(p10_FSM2out),
		.p8(p8_FSM2out),
		.p9(p9_FSM2out),
		.p12(p12_FSM2out),
		.p0(p0_FSM2out),
		.p14(p14_FSM2out),
		.p15(p15_FSM2out),
		.p3(p3_FSM2out),
		.p4(p4_FSM2out)
	);


	fsm_mealy_synth_03 fsm_mealy_synth_03_inst (
		.clk(clk),
		.reset(reset),
		.Ri_MINUS_(Ri_MINUS), .Ri_MINUS__p2_FSM1_TB(p2_FSM1out),
		.Ai_PLUS_(Ai_PLUS), .Ai_PLUS__p4_FSM1_TB(p4_FSM1out), .Ai_PLUS__p4_FSM2_TB(p4_FSM2out),
		.Ai_PLUSa_(Ai_PLUSa), .Ai_PLUSa__p9_FSM1_TB(p9_FSM1out), .Ai_PLUSa__p9_FSM2_TB(p9_FSM2out),
		.Ai_MINUSa_(Ai_MINUSa),
		.e_x_MINUS(e_x_MINUS_FSM3out), .e_x_MINUS_p12_FSM1_TB(p12_FSM1out), .e_x_MINUS_p12_FSM2_TB(p12_FSM2out),
		.e_Ro_PLUSa(e_Ro_PLUSa_FSM3out), .e_Ro_PLUSa_p1_FSM1_TB(p1_FSM1out), .e_Ro_PLUSa_p8_FSM2_TB(p8_FSM2out),
		.e_Ao_PLUS(e_Ao_PLUS_FSM3out), .e_Ao_PLUS_p5_FSM1_TB(p5_FSM1out),
		.e_Ro_PLUS(e_Ro_PLUS_FSM3out), .e_Ro_PLUS_p0_FSM1_TB(p0_FSM1out), .e_Ro_PLUS_p0_FSM2_TB(p0_FSM2out),
		.e_x_PLUS(e_x_PLUS_FSM3out), .e_x_PLUS_p7_FSM1_TB(p7_FSM1out), .e_x_PLUS_p7_FSM2_TB(p7_FSM2out),
		.e_Ro_MINUS(e_Ro_MINUS_FSM3out), .e_Ro_MINUS_p14_FSM1_TB(p14_FSM1out), .e_Ro_MINUS_p14_FSM2_TB(p14_FSM2out),
		.e_Ro_MINUSa(e_Ro_MINUSa_FSM3out), .e_Ro_MINUSa_p15_FSM1_TB(p15_FSM1out), .e_Ro_MINUSa_p15_FSM2_TB(p15_FSM2out),
		.p7(p7_FSM3out),
		.p9(p9_FSM3out),
		.p12(p12_FSM3out),
		.p13(p13_FSM3out),
		.p1(p1_FSM3out),
		.p14(p14_FSM3out),
		.p2(p2_FSM3out),
		.p15(p15_FSM3out),
		.p4(p4_FSM3out),
		.p5(p5_FSM3out)
	);

endmodule  // msfsms_mealy //
