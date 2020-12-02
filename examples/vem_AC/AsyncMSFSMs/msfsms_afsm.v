`timescale 1ns/1ns

module msfsms_mealy (
	clk,
	data,
	reset,
	dsr_PLUS,
	d_PLUS,
	ldtack_PLUSa,
	lds_MINUS,
	d_PLUSa,
	dtack_PLUSa,
	dsw_PLUS,
	dtack_PLUS,
	d_MINUSa,
	dsw_MINUS,
	lds_MINUSa,
	lds_PLUS,
	ldtack_MINUS,
	d_MINUS,
	dsr_MINUS,
	ldtack_PLUS,
	dtack_MINUS);

	input reset;
	input dsr_PLUS;
	output d_PLUS;
	input ldtack_PLUSa;
	output lds_MINUS;
	output d_PLUSa;
	output dtack_PLUSa;
	input dsw_PLUS;
	output dtack_PLUS;
	input d_MINUSa;
	input dsw_MINUS;
	output lds_MINUSa;
	output lds_PLUS;
	input ldtack_MINUS;
	output d_MINUS;
	input dsr_MINUS;
	input ldtack_PLUS;
	output dtack_MINUS;

	wire e_d_PLUS_FSM1out, e_lds_MINUS_FSM1out, e_d_PLUSa_FSM1out, e_dtack_PLUSa_FSM1out, e_dtack_PLUS_FSM1out, e_lds_PLUS_FSM1out, e_d_MINUS_FSM1out, e_dtack_MINUS_FSM1out; // Regular output signals of FSM1 //
	wire p10_FSM1out, p9_FSM1out, p8_FSM1out, p7_FSM1out, p6_FSM1out, p5_FSM1out, p4_FSM1out, p1_FSM1out, p0_FSM1out, p15_FSM1out, p14_FSM1out, p13_FSM1out, p12_FSM1out, p11_FSM1out; // State Synchronisation output signals of FSM1 //
	wire e_lds_MINUS_FSM2out, e_d_PLUSa_FSM2out, e_dtack_PLUSa_FSM2out, e_dtack_PLUS_FSM2out, e_lds_MINUSa_FSM2out, e_lds_PLUS_FSM2out, e_d_MINUS_FSM2out; // Regular output signals of FSM2 //
	wire p9_FSM2out, p8_FSM2out, p7_FSM2out, p6_FSM2out, p5_FSM2out, p3_FSM2out, p2_FSM2out, p16_FSM2out, p15_FSM2out, p14_FSM2out, p13_FSM2out, p12_FSM2out; // State Synchronisation output signals of FSM2 //

	assign d_PLUS = e_d_PLUS_FSM1out;
	assign lds_MINUS = e_lds_MINUS_FSM1out & e_lds_MINUS_FSM2out;
	assign d_PLUSa = e_d_PLUSa_FSM1out & e_d_PLUSa_FSM2out;
	assign dtack_PLUSa = e_dtack_PLUSa_FSM1out & e_dtack_PLUSa_FSM2out;
	assign dtack_PLUS = e_dtack_PLUS_FSM1out & e_dtack_PLUS_FSM2out;
	assign lds_MINUSa = e_lds_MINUSa_FSM2out;
	assign lds_PLUS = e_lds_PLUS_FSM1out & e_lds_PLUS_FSM2out;
	assign d_MINUS = e_d_MINUS_FSM1out & e_d_MINUS_FSM2out;
	assign dtack_MINUS = e_dtack_MINUS_FSM1out;

	fsm_afsm_01 fsm_afsm_01_inst (
		.sreset(reset)
		.EN(clk)
		.D(data),
		.dsr_PLUS_(dsr_PLUS),
		.ldtack_PLUSa_(ldtack_PLUSa), .ldtack_PLUSa__p12_FSM2_TB(p12_FSM2out),
		.dsw_PLUS_(dsw_PLUS),
		.d_MINUSa_(d_MINUSa), .d_MINUSa__p9_FSM2_TB(p9_FSM2out),
		.dsw_MINUS_(dsw_MINUS), .dsw_MINUS__p15_FSM2_TB(p15_FSM2out),
		.dsr_MINUS_(dsr_MINUS), .dsr_MINUS__p8_FSM2_TB(p8_FSM2out),
		.ldtack_PLUS_(ldtack_PLUS), .ldtack_PLUS__p5_FSM2_TB(p5_FSM2out),
		.e_d_PLUS(p10_FSM1out),
		.e_lds_MINUS(p11_FSM1out), .e_lds_MINUS_p2_FSM2_TB(p2_FSM2out),
		.e_d_PLUSa(p6_FSM1out), .e_d_PLUSa_p6_FSM2_TB(p6_FSM2out),
		.e_dtack_PLUSa(p14_FSM1out), .e_dtack_PLUSa_p14_FSM2_TB(p14_FSM2out),
		.e_dtack_PLUS(p7_FSM1out), .e_dtack_PLUS_p7_FSM2_TB(p7_FSM2out),
		.e_lds_PLUS(p0_FSM1out), .e_lds_PLUS_p2_FSM2_TB(p2_FSM2out),
		.e_d_MINUS(p13_FSM1out), .e_d_MINUS_p13_FSM2_TB(p13_FSM2out),
		.e_dtack_MINUS(p4_FSM1out),
		.e/d_PLUS(e/d_PLUS_FSM1out),
		.e/lds_MINUS(e/lds_MINUS_FSM1out),
		.e/d_PLUSa(e/d_PLUSa_FSM1out),
		.e/dtack_PLUSa(e/dtack_PLUSa_FSM1out),
		.e/dtack_PLUS(e/dtack_PLUS_FSM1out),
		.e/lds_PLUS(e/lds_PLUS_FSM1out),
		.e/d_MINUS(e/d_MINUS_FSM1out),
		.e/dtack_MINUS(e/dtack_MINUS_FSM1out)
	);


	fsm_afsm_02 fsm_afsm_02_inst (
		.sreset(reset)
		.EN(clk)
		.D(data),
		.ldtack_PLUSa_(ldtack_PLUSa), .ldtack_PLUSa__p12_FSM1_TB(p12_FSM1out),
		.d_MINUSa_(d_MINUSa), .d_MINUSa__p9_FSM1_TB(p9_FSM1out),
		.dsw_MINUS_(dsw_MINUS), .dsw_MINUS__p15_FSM1_TB(p15_FSM1out),
		.ldtack_MINUS_(ldtack_MINUS),
		.dsr_MINUS_(dsr_MINUS), .dsr_MINUS__p8_FSM1_TB(p8_FSM1out),
		.ldtack_PLUS_(ldtack_PLUS), .ldtack_PLUS__p5_FSM1_TB(p5_FSM1out),
		.e_lds_MINUS(p2_FSM2out), .e_lds_MINUS_p11_FSM1_TB(p11_FSM1out),
		.e_d_PLUSa(p6_FSM2out), .e_d_PLUSa_p6_FSM1_TB(p6_FSM1out),
		.e_dtack_PLUSa(p14_FSM2out), .e_dtack_PLUSa_p14_FSM1_TB(p14_FSM1out),
		.e_dtack_PLUS(p7_FSM2out), .e_dtack_PLUS_p7_FSM1_TB(p7_FSM1out),
		.e_lds_MINUSa(p3_FSM2out),
		.e_lds_PLUS(p2_FSM2out), .e_lds_PLUS_p0_FSM1_TB(p0_FSM1out),
		.e_d_MINUS(p13_FSM2out), .e_d_MINUS_p13_FSM1_TB(p13_FSM1out),
		.e/lds_MINUS(e/lds_MINUS_FSM2out),
		.e/d_PLUSa(e/d_PLUSa_FSM2out),
		.e/dtack_PLUSa(e/dtack_PLUSa_FSM2out),
		.e/dtack_PLUS(e/dtack_PLUS_FSM2out),
		.e/lds_MINUSa(e/lds_MINUSa_FSM2out),
		.e/lds_PLUS(e/lds_PLUS_FSM2out),
		.e/d_MINUS(e/d_MINUS_FSM2out)
	);

endmodule  // msfsms_mealy //
