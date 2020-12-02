`timescale 1ns/1ns

module fsm_mealy_synth_01 (
	clk,
	reset,
	dsr_PLUS_,
	ldtack_PLUSa_, ldtack_PLUSa__p12_FSM2_TB,
	dsw_PLUS_,
	d_MINUSa_, d_MINUSa__p9_FSM2_TB,
	dsw_MINUS_, dsw_MINUS__p15_FSM2_TB,
	dsr_MINUS_, dsr_MINUS__p8_FSM2_TB,
	ldtack_PLUS_, ldtack_PLUS__p5_FSM2_TB,
	e_d_PLUS,
	e_lds_MINUS, e_lds_MINUS_p2_FSM2_TB,
	e_d_PLUSa, e_d_PLUSa_p6_FSM2_TB,
	e_dtack_PLUSa, e_dtack_PLUSa_p14_FSM2_TB,
	e_dtack_PLUS, e_dtack_PLUS_p7_FSM2_TB,
	e_lds_PLUS, e_lds_PLUS_p2_FSM2_TB,
	e_d_MINUS, e_d_MINUS_p13_FSM2_TB,
	e_dtack_MINUS,
	p9,
	p8,
	p7,
	p6,
	p5,
	p0,
	p15,
	p14,
	p13,
	p12,
	p11
);

	// Regular Synchronous FSM input Signals //
	input clk;
	input reset;

	// Regular input Signals //
	input dsr_PLUS_;
	input ldtack_PLUSa_;
	input dsw_PLUS_;
	input d_MINUSa_;
	input dsw_MINUS_;
	input dsr_MINUS_;
	input ldtack_PLUS_;
	// Transition Barrier Inputs for input Signals //
	input ldtack_PLUSa__p12_FSM2_TB;
	input d_MINUSa__p9_FSM2_TB;
	input dsw_MINUS__p15_FSM2_TB;
	input dsr_MINUS__p8_FSM2_TB;
	input ldtack_PLUS__p5_FSM2_TB;

	// Regular output Signals //
	output e_d_PLUS;
	output e_lds_MINUS;
	output e_d_PLUSa;
	output e_dtack_PLUSa;
	output e_dtack_PLUS;
	output e_lds_PLUS;
	output e_d_MINUS;
	output e_dtack_MINUS;
	// Transition Barrier outputs for output Signals //
	input e_lds_MINUS_p2_FSM2_TB;
	input e_d_PLUSa_p6_FSM2_TB;
	input e_dtack_PLUSa_p14_FSM2_TB;
	input e_dtack_PLUS_p7_FSM2_TB;
	input e_lds_PLUS_p2_FSM2_TB;
	input e_d_MINUS_p13_FSM2_TB;

	// FSMs' Synchronisation output Signals //
	output p9;
	output p8;
	output p7;
	output p6;
	output p5;
	output p0;
	output p15;
	output p14;
	output p13;
	output p12;
	output p11;

	reg e_d_PLUS;
	reg e_lds_MINUS;
	reg e_d_PLUSa;
	reg e_dtack_PLUSa;
	reg e_dtack_PLUS;
	reg e_lds_PLUS;
	reg e_d_MINUS;
	reg e_dtack_MINUS;
	wire p9;
	wire p8;
	wire p7;
	wire p6;
	wire p5;
	wire p0;
	wire p15;
	wire p14;
	wire p13;
	wire p12;
	wire p11;

	wire ldtack_PLUSa__TB_sync;
	wire d_MINUSa__TB_sync;
	wire dsw_MINUS__TB_sync;
	wire dsr_MINUS__TB_sync;
	wire ldtack_PLUS__TB_sync;
	wire e_lds_MINUS_TB_sync;
	wire e_d_PLUSa_TB_sync;
	wire e_dtack_PLUSa_TB_sync;
	wire e_dtack_PLUS_TB_sync;
	wire e_lds_PLUS_TB_sync;
	wire e_d_MINUS_TB_sync;
	assign ldtack_PLUSa__TB_sync = ldtack_PLUSa_ & ldtack_PLUSa__p12_FSM2_TB;
	assign d_MINUSa__TB_sync = d_MINUSa_ & d_MINUSa__p9_FSM2_TB;
	assign dsw_MINUS__TB_sync = dsw_MINUS_ & dsw_MINUS__p15_FSM2_TB;
	assign dsr_MINUS__TB_sync = dsr_MINUS_ & dsr_MINUS__p8_FSM2_TB;
	assign ldtack_PLUS__TB_sync = ldtack_PLUS_ & ldtack_PLUS__p5_FSM2_TB;
	assign e_lds_MINUS_TB_sync = e_lds_MINUS_p2_FSM2_TB;
	assign e_d_PLUSa_TB_sync = e_d_PLUSa_p6_FSM2_TB;
	assign e_dtack_PLUSa_TB_sync = e_dtack_PLUSa_p14_FSM2_TB;
	assign e_dtack_PLUS_TB_sync = e_dtack_PLUS_p7_FSM2_TB;
	assign e_lds_PLUS_TB_sync = e_lds_PLUS_p2_FSM2_TB;
	assign e_d_MINUS_TB_sync = e_d_MINUS_p13_FSM2_TB;

	parameter p10_1HOT_ENCODING = 14'd1; // 14'b00000000000001 //
	parameter p9_1HOT_ENCODING = 14'd2; // 14'b00000000000010 //
	parameter p8_1HOT_ENCODING = 14'd4; // 14'b00000000000100 //
	parameter p7_1HOT_ENCODING = 14'd8; // 14'b00000000001000 //
	parameter p6_1HOT_ENCODING = 14'd16; // 14'b00000000010000 //
	parameter p5_1HOT_ENCODING = 14'd32; // 14'b00000000100000 //
	parameter p4_1HOT_ENCODING = 14'd64; // 14'b00000001000000 //
	parameter p1_1HOT_ENCODING = 14'd128; // 14'b00000010000000 //
	parameter p0_1HOT_ENCODING = 14'd256; // 14'b00000100000000 //
	parameter p15_1HOT_ENCODING = 14'd512; // 14'b00001000000000 //
	parameter p14_1HOT_ENCODING = 14'd1024; // 14'b00010000000000 //
	parameter p13_1HOT_ENCODING = 14'd2048; // 14'b00100000000000 //
	parameter p12_1HOT_ENCODING = 14'd4096; // 14'b01000000000000 //
	parameter p11_1HOT_ENCODING = 14'd8192; // 14'b10000000000000 //

	reg [13 : 0]	state;
	reg [13 : 0]	next_state;

	always @(posedge clk)
		begin
			if (reset)
				begin
						state <= p1_1HOT_ENCODING;
				end
			else
				begin
						state <= next_state;
				end
		end

	assign p9 = (state == p9_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p8 = (state == p8_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p7 = (state == p7_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p6 = (state == p6_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p5 = (state == p5_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p0 = (state == p0_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p15 = (state == p15_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p14 = (state == p14_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p13 = (state == p13_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p12 = (state == p12_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p11 = (state == p11_1HOT_ENCODING) ? 1'b1 : 1'b0;

	always @(state or dsr_PLUS_ or ldtack_PLUSa__TB_sync or dsw_PLUS_ or d_MINUSa__TB_sync or dsw_MINUS__TB_sync or dsr_MINUS__TB_sync or ldtack_PLUS__TB_sync or e_lds_MINUS_TB_sync or e_d_PLUSa_TB_sync or e_dtack_PLUSa_TB_sync or e_dtack_PLUS_TB_sync or e_lds_PLUS_TB_sync or e_d_MINUS_TB_sync)
		begin
			// MEALY FSMs - Blocking Operations //
			next_state = state;

			e_d_PLUS = 1'b0;
			e_lds_MINUS = 1'b0;
			e_d_PLUSa = 1'b0;
			e_dtack_PLUSa = 1'b0;
			e_dtack_PLUS = 1'b0;
			e_lds_PLUS = 1'b0;
			e_d_MINUS = 1'b0;
			e_dtack_MINUS = 1'b0;

			case (state)
				p10_1HOT_ENCODING: // 14'b00000000000001: //
					begin
								e_d_PLUS = 1'b1;
								next_state = p11_1HOT_ENCODING;
					end

				p9_1HOT_ENCODING: // 14'b00000000000010: //
					begin
						if (d_MINUSa__TB_sync)
							begin
								next_state = p4_1HOT_ENCODING;
							end
					end

				p8_1HOT_ENCODING: // 14'b00000000000100: //
					begin
						if (dsr_MINUS__TB_sync)
							begin
								next_state = p9_1HOT_ENCODING;
							end
					end

				p7_1HOT_ENCODING: // 14'b00000000001000: //
					begin
						if (e_dtack_PLUS_TB_sync)
							begin
								e_dtack_PLUS = 1'b1;
								next_state = p8_1HOT_ENCODING;
							end
					end

				p6_1HOT_ENCODING: // 14'b00000000010000: //
					begin
						if (e_d_PLUSa_TB_sync)
							begin
								e_d_PLUSa = 1'b1;
								next_state = p7_1HOT_ENCODING;
							end
					end

				p5_1HOT_ENCODING: // 14'b00000000100000: //
					begin
						if (ldtack_PLUS__TB_sync)
							begin
								next_state = p6_1HOT_ENCODING;
							end
					end

				p4_1HOT_ENCODING: // 14'b00000001000000: //
					begin
								e_dtack_MINUS = 1'b1;
								next_state = p1_1HOT_ENCODING;
					end

				p1_1HOT_ENCODING: // 14'b00000010000000: //
					begin
						if (dsr_PLUS_)
							begin
								next_state = p0_1HOT_ENCODING;
							end
						else if (dsw_PLUS_)
							begin
								next_state = p10_1HOT_ENCODING;
							end
					end

				p0_1HOT_ENCODING: // 14'b00000100000000: //
					begin
						if (e_lds_PLUS_TB_sync)
							begin
								e_lds_PLUS = 1'b1;
								next_state = p5_1HOT_ENCODING;
							end
					end

				p15_1HOT_ENCODING: // 14'b00001000000000: //
					begin
						if (dsw_MINUS__TB_sync)
							begin
								next_state = p4_1HOT_ENCODING;
							end
					end

				p14_1HOT_ENCODING: // 14'b00010000000000: //
					begin
						if (e_dtack_PLUSa_TB_sync)
							begin
								e_dtack_PLUSa = 1'b1;
								next_state = p15_1HOT_ENCODING;
							end
					end

				p13_1HOT_ENCODING: // 14'b00100000000000: //
					begin
						if (e_d_MINUS_TB_sync)
							begin
								e_d_MINUS = 1'b1;
								next_state = p14_1HOT_ENCODING;
							end
					end

				p12_1HOT_ENCODING: // 14'b01000000000000: //
					begin
						if (ldtack_PLUSa__TB_sync)
							begin
								next_state = p13_1HOT_ENCODING;
							end
					end

				p11_1HOT_ENCODING: // 14'b10000000000000: //
					begin
						if (e_lds_MINUS_TB_sync)
							begin
								e_lds_MINUS = 1'b1;
								next_state = p12_1HOT_ENCODING;
							end
					end

				default:
						begin
							next_state = 14'dx;
						end
			endcase
		end
endmodule

module fsm_mealy_synth_02 (
	clk,
	reset,
	ldtack_PLUSa_, ldtack_PLUSa__p12_FSM1_TB,
	d_MINUSa_, d_MINUSa__p9_FSM1_TB,
	dsw_MINUS_, dsw_MINUS__p15_FSM1_TB,
	ldtack_MINUS_,
	dsr_MINUS_, dsr_MINUS__p8_FSM1_TB,
	ldtack_PLUS_, ldtack_PLUS__p5_FSM1_TB,
	e_lds_MINUS, e_lds_MINUS_p11_FSM1_TB,
	e_d_PLUSa, e_d_PLUSa_p6_FSM1_TB,
	e_dtack_PLUSa, e_dtack_PLUSa_p14_FSM1_TB,
	e_dtack_PLUS, e_dtack_PLUS_p7_FSM1_TB,
	e_lds_MINUSa,
	e_lds_PLUS, e_lds_PLUS_p0_FSM1_TB,
	e_d_MINUS, e_d_MINUS_p13_FSM1_TB,
	p9,
	p8,
	p7,
	p6,
	p5,
	p2,
	p15,
	p14,
	p13,
	p12
);

	// Regular Synchronous FSM input Signals //
	input clk;
	input reset;

	// Regular input Signals //
	input ldtack_PLUSa_;
	input d_MINUSa_;
	input dsw_MINUS_;
	input ldtack_MINUS_;
	input dsr_MINUS_;
	input ldtack_PLUS_;
	// Transition Barrier Inputs for input Signals //
	input ldtack_PLUSa__p12_FSM1_TB;
	input d_MINUSa__p9_FSM1_TB;
	input dsw_MINUS__p15_FSM1_TB;
	input dsr_MINUS__p8_FSM1_TB;
	input ldtack_PLUS__p5_FSM1_TB;

	// Regular output Signals //
	output e_lds_MINUS;
	output e_d_PLUSa;
	output e_dtack_PLUSa;
	output e_dtack_PLUS;
	output e_lds_MINUSa;
	output e_lds_PLUS;
	output e_d_MINUS;
	// Transition Barrier outputs for output Signals //
	input e_lds_MINUS_p11_FSM1_TB;
	input e_d_PLUSa_p6_FSM1_TB;
	input e_dtack_PLUSa_p14_FSM1_TB;
	input e_dtack_PLUS_p7_FSM1_TB;
	input e_lds_PLUS_p0_FSM1_TB;
	input e_d_MINUS_p13_FSM1_TB;

	// FSMs' Synchronisation output Signals //
	output p9;
	output p8;
	output p7;
	output p6;
	output p5;
	output p2;
	output p15;
	output p14;
	output p13;
	output p12;

	reg e_lds_MINUS;
	reg e_d_PLUSa;
	reg e_dtack_PLUSa;
	reg e_dtack_PLUS;
	reg e_lds_MINUSa;
	reg e_lds_PLUS;
	reg e_d_MINUS;
	wire p9;
	wire p8;
	wire p7;
	wire p6;
	wire p5;
	wire p2;
	wire p15;
	wire p14;
	wire p13;
	wire p12;

	wire ldtack_PLUSa__TB_sync;
	wire d_MINUSa__TB_sync;
	wire dsw_MINUS__TB_sync;
	wire dsr_MINUS__TB_sync;
	wire ldtack_PLUS__TB_sync;
	wire e_lds_MINUS_TB_sync;
	wire e_d_PLUSa_TB_sync;
	wire e_dtack_PLUSa_TB_sync;
	wire e_dtack_PLUS_TB_sync;
	wire e_lds_PLUS_TB_sync;
	wire e_d_MINUS_TB_sync;
	assign ldtack_PLUSa__TB_sync = ldtack_PLUSa_ & ldtack_PLUSa__p12_FSM1_TB;
	assign d_MINUSa__TB_sync = d_MINUSa_ & d_MINUSa__p9_FSM1_TB;
	assign dsw_MINUS__TB_sync = dsw_MINUS_ & dsw_MINUS__p15_FSM1_TB;
	assign dsr_MINUS__TB_sync = dsr_MINUS_ & dsr_MINUS__p8_FSM1_TB;
	assign ldtack_PLUS__TB_sync = ldtack_PLUS_ & ldtack_PLUS__p5_FSM1_TB;
	assign e_lds_MINUS_TB_sync = e_lds_MINUS_p11_FSM1_TB;
	assign e_d_PLUSa_TB_sync = e_d_PLUSa_p6_FSM1_TB;
	assign e_dtack_PLUSa_TB_sync = e_dtack_PLUSa_p14_FSM1_TB;
	assign e_dtack_PLUS_TB_sync = e_dtack_PLUS_p7_FSM1_TB;
	assign e_lds_PLUS_TB_sync = e_lds_PLUS_p0_FSM1_TB;
	assign e_d_MINUS_TB_sync = e_d_MINUS_p13_FSM1_TB;

	parameter p9_1HOT_ENCODING = 12'd1; // 12'b000000000001 //
	parameter p8_1HOT_ENCODING = 12'd2; // 12'b000000000010 //
	parameter p7_1HOT_ENCODING = 12'd4; // 12'b000000000100 //
	parameter p6_1HOT_ENCODING = 12'd8; // 12'b000000001000 //
	parameter p5_1HOT_ENCODING = 12'd16; // 12'b000000010000 //
	parameter p3_1HOT_ENCODING = 12'd32; // 12'b000000100000 //
	parameter p2_1HOT_ENCODING = 12'd64; // 12'b000001000000 //
	parameter p16_1HOT_ENCODING = 12'd128; // 12'b000010000000 //
	parameter p15_1HOT_ENCODING = 12'd256; // 12'b000100000000 //
	parameter p14_1HOT_ENCODING = 12'd512; // 12'b001000000000 //
	parameter p13_1HOT_ENCODING = 12'd1024; // 12'b010000000000 //
	parameter p12_1HOT_ENCODING = 12'd2048; // 12'b100000000000 //

	reg [11 : 0]	state;
	reg [11 : 0]	next_state;

	always @(posedge clk)
		begin
			if (reset)
				begin
						state <= p2_1HOT_ENCODING;
				end
			else
				begin
						state <= next_state;
				end
		end

	assign p9 = (state == p9_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p8 = (state == p8_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p7 = (state == p7_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p6 = (state == p6_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p5 = (state == p5_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p2 = (state == p2_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p15 = (state == p15_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p14 = (state == p14_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p13 = (state == p13_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p12 = (state == p12_1HOT_ENCODING) ? 1'b1 : 1'b0;

	always @(state or ldtack_PLUSa__TB_sync or d_MINUSa__TB_sync or dsw_MINUS__TB_sync or ldtack_MINUS_ or dsr_MINUS__TB_sync or ldtack_PLUS__TB_sync or e_lds_MINUS_TB_sync or e_d_PLUSa_TB_sync or e_dtack_PLUSa_TB_sync or e_dtack_PLUS_TB_sync or e_lds_PLUS_TB_sync or e_d_MINUS_TB_sync)
		begin
			// MEALY FSMs - Blocking Operations //
			next_state = state;

			e_lds_MINUS = 1'b0;
			e_d_PLUSa = 1'b0;
			e_dtack_PLUSa = 1'b0;
			e_dtack_PLUS = 1'b0;
			e_lds_MINUSa = 1'b0;
			e_lds_PLUS = 1'b0;
			e_d_MINUS = 1'b0;

			case (state)
				p9_1HOT_ENCODING: // 12'b000000000001: //
					begin
						if (d_MINUSa__TB_sync)
							begin
								next_state = p3_1HOT_ENCODING;
							end
					end

				p8_1HOT_ENCODING: // 12'b000000000010: //
					begin
						if (dsr_MINUS__TB_sync)
							begin
								next_state = p9_1HOT_ENCODING;
							end
					end

				p7_1HOT_ENCODING: // 12'b000000000100: //
					begin
						if (e_dtack_PLUS_TB_sync)
							begin
								e_dtack_PLUS = 1'b1;
								next_state = p8_1HOT_ENCODING;
							end
					end

				p6_1HOT_ENCODING: // 12'b000000001000: //
					begin
						if (e_d_PLUSa_TB_sync)
							begin
								e_d_PLUSa = 1'b1;
								next_state = p7_1HOT_ENCODING;
							end
					end

				p5_1HOT_ENCODING: // 12'b000000010000: //
					begin
						if (ldtack_PLUS__TB_sync)
							begin
								next_state = p6_1HOT_ENCODING;
							end
					end

				p3_1HOT_ENCODING: // 12'b000000100000: //
					begin
								e_lds_MINUSa = 1'b1;
								next_state = p16_1HOT_ENCODING;
					end

				p2_1HOT_ENCODING: // 12'b000001000000: //
					begin
						if (e_lds_MINUS_TB_sync)
							begin
								e_lds_MINUS = 1'b1;
								next_state = p12_1HOT_ENCODING;
							end
						else if (e_lds_PLUS_TB_sync)
							begin
								e_lds_PLUS = 1'b1;
								next_state = p5_1HOT_ENCODING;
							end
					end

				p16_1HOT_ENCODING: // 12'b000010000000: //
					begin
						if (ldtack_MINUS_)
							begin
								next_state = p2_1HOT_ENCODING;
							end
					end

				p15_1HOT_ENCODING: // 12'b000100000000: //
					begin
						if (dsw_MINUS__TB_sync)
							begin
								next_state = p3_1HOT_ENCODING;
							end
					end

				p14_1HOT_ENCODING: // 12'b001000000000: //
					begin
						if (e_dtack_PLUSa_TB_sync)
							begin
								e_dtack_PLUSa = 1'b1;
								next_state = p15_1HOT_ENCODING;
							end
					end

				p13_1HOT_ENCODING: // 12'b010000000000: //
					begin
						if (e_d_MINUS_TB_sync)
							begin
								e_d_MINUS = 1'b1;
								next_state = p14_1HOT_ENCODING;
							end
					end

				p12_1HOT_ENCODING: // 12'b100000000000: //
					begin
						if (ldtack_PLUSa__TB_sync)
							begin
								next_state = p13_1HOT_ENCODING;
							end
					end

				default:
						begin
							next_state = 12'dx;
						end
			endcase
		end
endmodule

