`timescale 1ns/1ns

module msfsms_mealy (
	clk,
	data,
	reset,
	Ri_PLUS,
	Ro_PLUS,
	Ro_MINUS,
	Ri_MINUS,
	Ai_PLUS,
	Ao_PLUS,
	Ao_MINUS,
	Ai_MINUS);

	input reset;
	input Ri_PLUS;
	output Ro_PLUS;
	output Ro_MINUS;
	input Ri_MINUS;
	input Ai_PLUS;
	output Ao_PLUS;
	output Ao_MINUS;
	input Ai_MINUS;

	wire e_Ro_PLUS_FSM1out, e_Ro_MINUS_FSM1out, e_Ao_MINUS_FSM1out; // Regular output signals of FSM1 //
	wire p9_FSM1out, p4_FSM1out, p7_FSM1out, p3_FSM1out, p2_FSM1out; // State Synchronisation output signals of FSM1 //
	wire e_Ro_PLUS_FSM2out, e_Ro_MINUS_FSM2out; // Regular output signals of FSM2 //
	wire p5_FSM2out, p4_FSM2out, p3_FSM2out, p6_FSM2out; // State Synchronisation output signals of FSM2 //
	wire e_Ro_PLUS_FSM3out, e_Ao_PLUS_FSM3out, e_Ao_MINUS_FSM3out; // Regular output signals of FSM3 //
	wire p1_FSM3out, p8_FSM3out, p0_FSM3out, p7_FSM3out, p2_FSM3out; // State Synchronisation output signals of FSM3 //
	wire e_Ro_PLUS_FSM4out, e_Ro_MINUS_FSM4out, e_Ao_PLUS_FSM4out; // Regular output signals of FSM4 //
	wire p5_FSM4out, p8_FSM4out, p10_FSM4out, p6_FSM4out; // State Synchronisation output signals of FSM4 //

	assign Ro_PLUS = e_Ro_PLUS_FSM1out & e_Ro_PLUS_FSM2out & e_Ro_PLUS_FSM3out & e_Ro_PLUS_FSM4out;
	assign Ro_MINUS = e_Ro_MINUS_FSM1out & e_Ro_MINUS_FSM2out & e_Ro_MINUS_FSM4out;
	assign Ao_PLUS = e_Ao_PLUS_FSM3out & e_Ao_PLUS_FSM4out;
	assign Ao_MINUS = e_Ao_MINUS_FSM1out & e_Ao_MINUS_FSM3out;

	fsm_afsm_01 fsm_afsm_01_inst (
		.sreset(reset)
		.EN(clk)
		.D(data),
		.Ri_PLUS_(Ri_PLUS), .Ri_PLUS__p2_FSM3_TB(p2_FSM3out),
		.Ai_PLUS_(Ai_PLUS), .Ai_PLUS__p3_FSM2_TB(p3_FSM2out),
		.e_Ro_PLUS(p7_FSM1out), .e_Ro_PLUS_p6_FSM2_TB(p6_FSM2out), .e_Ro_PLUS_p7_FSM3_TB(p7_FSM3out), .e_Ro_PLUS_p6_FSM4_TB(p6_FSM4out),
		.e_Ro_MINUS(p4_FSM1out), .e_Ro_MINUS_p4_FSM2_TB(p4_FSM2out), .e_Ro_MINUS_p10_FSM4_TB(p10_FSM4out),
		.e_Ao_MINUS(p9_FSM1out), .e_Ao_MINUS_p1_FSM3_TB(p1_FSM3out),
		.e/Ro_PLUS(e/Ro_PLUS_FSM1out),
		.e/Ro_MINUS(e/Ro_MINUS_FSM1out),
		.e/Ao_MINUS(e/Ao_MINUS_FSM1out)
	);


	fsm_afsm_02 fsm_afsm_02_inst (
		.sreset(reset)
		.EN(clk)
		.D(data),
		.Ai_PLUS_(Ai_PLUS), .Ai_PLUS__p3_FSM1_TB(p3_FSM1out),
		.Ai_MINUS_(Ai_MINUS), .Ai_MINUS__p5_FSM4_TB(p5_FSM4out),
		.e_Ro_PLUS(p6_FSM2out), .e_Ro_PLUS_p7_FSM1_TB(p7_FSM1out), .e_Ro_PLUS_p7_FSM3_TB(p7_FSM3out), .e_Ro_PLUS_p6_FSM4_TB(p6_FSM4out),
		.e_Ro_MINUS(p4_FSM2out), .e_Ro_MINUS_p4_FSM1_TB(p4_FSM1out), .e_Ro_MINUS_p10_FSM4_TB(p10_FSM4out),
		.e/Ro_PLUS(e/Ro_PLUS_FSM2out),
		.e/Ro_MINUS(e/Ro_MINUS_FSM2out)
	);


	fsm_afsm_03 fsm_afsm_03_inst (
		.sreset(reset)
		.EN(clk)
		.D(data),
		.Ri_PLUS_(Ri_PLUS), .Ri_PLUS__p2_FSM1_TB(p2_FSM1out),
		.Ri_MINUS_(Ri_MINUS),
		.e_Ro_PLUS(p7_FSM3out), .e_Ro_PLUS_p7_FSM1_TB(p7_FSM1out), .e_Ro_PLUS_p6_FSM2_TB(p6_FSM2out), .e_Ro_PLUS_p6_FSM4_TB(p6_FSM4out),
		.e_Ao_PLUS(p8_FSM3out), .e_Ao_PLUS_p8_FSM4_TB(p8_FSM4out),
		.e_Ao_MINUS(p1_FSM3out), .e_Ao_MINUS_p9_FSM1_TB(p9_FSM1out),
		.e/Ro_PLUS(e/Ro_PLUS_FSM3out),
		.e/Ao_PLUS(e/Ao_PLUS_FSM3out),
		.e/Ao_MINUS(e/Ao_MINUS_FSM3out)
	);


	fsm_afsm_04 fsm_afsm_04_inst (
		.sreset(reset)
		.EN(clk)
		.D(data),
		.Ai_MINUS_(Ai_MINUS), .Ai_MINUS__p5_FSM2_TB(p5_FSM2out),
		.e_Ro_PLUS(p6_FSM4out), .e_Ro_PLUS_p7_FSM1_TB(p7_FSM1out), .e_Ro_PLUS_p6_FSM2_TB(p6_FSM2out), .e_Ro_PLUS_p7_FSM3_TB(p7_FSM3out),
		.e_Ro_MINUS(p10_FSM4out), .e_Ro_MINUS_p4_FSM1_TB(p4_FSM1out), .e_Ro_MINUS_p4_FSM2_TB(p4_FSM2out),
		.e_Ao_PLUS(p8_FSM4out), .e_Ao_PLUS_p8_FSM3_TB(p8_FSM3out),
		.e/Ro_PLUS(e/Ro_PLUS_FSM4out),
		.e/Ro_MINUS(e/Ro_MINUS_FSM4out),
		.e/Ao_PLUS(e/Ao_PLUS_FSM4out)
	);

endmodule  // msfsms_mealy //
