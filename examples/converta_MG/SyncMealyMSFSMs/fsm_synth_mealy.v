`timescale 1ns/1ns

module fsm_mealy_synth_01 (
	clk,
	reset,
	Ri_MINUS_, Ri_MINUS__p2_FSM3_TB,
	Ai_PLUS_, Ai_PLUS__p4_FSM2_TB, Ai_PLUS__p4_FSM3_TB,
	Ri_PLUS_, Ri_PLUS__p3_FSM2_TB,
	Ai_PLUSa_, Ai_PLUSa__p9_FSM2_TB, Ai_PLUSa__p9_FSM3_TB,
	e_x_MINUS, e_x_MINUS_p12_FSM2_TB, e_x_MINUS_p12_FSM3_TB,
	e_Ro_PLUSa, e_Ro_PLUSa_p8_FSM2_TB, e_Ro_PLUSa_p1_FSM3_TB,
	e_Ao_PLUS, e_Ao_PLUS_p5_FSM3_TB,
	e_Ro_PLUS, e_Ro_PLUS_p0_FSM2_TB, e_Ro_PLUS_p13_FSM3_TB,
	e_x_PLUS, e_x_PLUS_p7_FSM2_TB, e_x_PLUS_p7_FSM3_TB,
	e_Ro_MINUS, e_Ro_MINUS_p14_FSM2_TB, e_Ro_MINUS_p14_FSM3_TB,
	e_Ao_MINUS, e_Ao_MINUS_p10_FSM2_TB,
	e_Ro_MINUSa, e_Ro_MINUSa_p15_FSM2_TB, e_Ro_MINUSa_p15_FSM3_TB,
	p7,
	p10,
	p9,
	p12,
	p0,
	p1,
	p14,
	p2,
	p15,
	p3,
	p4,
	p5
);

	// Regular Synchronous FSM input Signals //
	input clk;
	input reset;

	// Regular input Signals //
	input Ri_MINUS_;
	input Ai_PLUS_;
	input Ri_PLUS_;
	input Ai_PLUSa_;
	// Transition Barrier Inputs for input Signals //
	input Ri_MINUS__p2_FSM3_TB;
	input Ai_PLUS__p4_FSM2_TB, Ai_PLUS__p4_FSM3_TB;
	input Ri_PLUS__p3_FSM2_TB;
	input Ai_PLUSa__p9_FSM2_TB, Ai_PLUSa__p9_FSM3_TB;

	// Regular output Signals //
	output e_x_MINUS;
	output e_Ro_PLUSa;
	output e_Ao_PLUS;
	output e_Ro_PLUS;
	output e_x_PLUS;
	output e_Ro_MINUS;
	output e_Ao_MINUS;
	output e_Ro_MINUSa;
	// Transition Barrier outputs for output Signals //
	input e_x_MINUS_p12_FSM2_TB, e_x_MINUS_p12_FSM3_TB;
	input e_Ro_PLUSa_p8_FSM2_TB, e_Ro_PLUSa_p1_FSM3_TB;
	input e_Ao_PLUS_p5_FSM3_TB;
	input e_Ro_PLUS_p0_FSM2_TB, e_Ro_PLUS_p13_FSM3_TB;
	input e_x_PLUS_p7_FSM2_TB, e_x_PLUS_p7_FSM3_TB;
	input e_Ro_MINUS_p14_FSM2_TB, e_Ro_MINUS_p14_FSM3_TB;
	input e_Ao_MINUS_p10_FSM2_TB;
	input e_Ro_MINUSa_p15_FSM2_TB, e_Ro_MINUSa_p15_FSM3_TB;

	// FSMs' Synchronisation output Signals //
	output p7;
	output p10;
	output p9;
	output p12;
	output p0;
	output p1;
	output p14;
	output p2;
	output p15;
	output p3;
	output p4;
	output p5;

	reg e_x_MINUS;
	reg e_Ro_PLUSa;
	reg e_Ao_PLUS;
	reg e_Ro_PLUS;
	reg e_x_PLUS;
	reg e_Ro_MINUS;
	reg e_Ao_MINUS;
	reg e_Ro_MINUSa;
	wire p7;
	wire p10;
	wire p9;
	wire p12;
	wire p0;
	wire p1;
	wire p14;
	wire p2;
	wire p15;
	wire p3;
	wire p4;
	wire p5;

	wire Ri_MINUS__TB_sync;
	wire Ai_PLUS__TB_sync;
	wire Ri_PLUS__TB_sync;
	wire Ai_PLUSa__TB_sync;
	wire e_x_MINUS_TB_sync;
	wire e_Ro_PLUSa_TB_sync;
	wire e_Ao_PLUS_TB_sync;
	wire e_Ro_PLUS_TB_sync;
	wire e_x_PLUS_TB_sync;
	wire e_Ro_MINUS_TB_sync;
	wire e_Ao_MINUS_TB_sync;
	wire e_Ro_MINUSa_TB_sync;
	assign Ri_MINUS__TB_sync = Ri_MINUS_ & Ri_MINUS__p2_FSM3_TB;
	assign Ai_PLUS__TB_sync = Ai_PLUS_ & Ai_PLUS__p4_FSM2_TB & Ai_PLUS__p4_FSM3_TB;
	assign Ri_PLUS__TB_sync = Ri_PLUS_ & Ri_PLUS__p3_FSM2_TB;
	assign Ai_PLUSa__TB_sync = Ai_PLUSa_ & Ai_PLUSa__p9_FSM2_TB & Ai_PLUSa__p9_FSM3_TB;
	assign e_x_MINUS_TB_sync = e_x_MINUS_p12_FSM2_TB & e_x_MINUS_p12_FSM3_TB;
	assign e_Ro_PLUSa_TB_sync = e_Ro_PLUSa_p8_FSM2_TB & e_Ro_PLUSa_p1_FSM3_TB;
	assign e_Ao_PLUS_TB_sync = e_Ao_PLUS_p5_FSM3_TB;
	assign e_Ro_PLUS_TB_sync = e_Ro_PLUS_p0_FSM2_TB & e_Ro_PLUS_p13_FSM3_TB;
	assign e_x_PLUS_TB_sync = e_x_PLUS_p7_FSM2_TB & e_x_PLUS_p7_FSM3_TB;
	assign e_Ro_MINUS_TB_sync = e_Ro_MINUS_p14_FSM2_TB & e_Ro_MINUS_p14_FSM3_TB;
	assign e_Ao_MINUS_TB_sync = e_Ao_MINUS_p10_FSM2_TB;
	assign e_Ro_MINUSa_TB_sync = e_Ro_MINUSa_p15_FSM2_TB & e_Ro_MINUSa_p15_FSM3_TB;

	parameter p7_1HOT_ENCODING = 12'd1; // 12'b000000000001 //
	parameter p10_1HOT_ENCODING = 12'd2; // 12'b000000000010 //
	parameter p9_1HOT_ENCODING = 12'd4; // 12'b000000000100 //
	parameter p12_1HOT_ENCODING = 12'd8; // 12'b000000001000 //
	parameter p0_1HOT_ENCODING = 12'd16; // 12'b000000010000 //
	parameter p1_1HOT_ENCODING = 12'd32; // 12'b000000100000 //
	parameter p14_1HOT_ENCODING = 12'd64; // 12'b000001000000 //
	parameter p2_1HOT_ENCODING = 12'd128; // 12'b000010000000 //
	parameter p15_1HOT_ENCODING = 12'd256; // 12'b000100000000 //
	parameter p3_1HOT_ENCODING = 12'd512; // 12'b001000000000 //
	parameter p4_1HOT_ENCODING = 12'd1024; // 12'b010000000000 //
	parameter p5_1HOT_ENCODING = 12'd2048; // 12'b100000000000 //

	reg [11 : 0]	state;
	reg [11 : 0]	next_state;

	always @(posedge clk)
		begin
			if (reset)
				begin
						state <= p3_1HOT_ENCODING;
				end
			else
				begin
						state <= next_state;
				end
		end

	assign p7 = (state == p7_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p10 = (state == p10_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p9 = (state == p9_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p12 = (state == p12_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p0 = (state == p0_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p1 = (state == p1_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p14 = (state == p14_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p2 = (state == p2_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p15 = (state == p15_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p3 = (state == p3_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p4 = (state == p4_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p5 = (state == p5_1HOT_ENCODING) ? 1'b1 : 1'b0;

	always @(state or Ri_MINUS__TB_sync or Ai_PLUS__TB_sync or Ri_PLUS__TB_sync or Ai_PLUSa__TB_sync or e_x_MINUS_TB_sync or e_Ro_PLUSa_TB_sync or e_Ao_PLUS_TB_sync or e_Ro_PLUS_TB_sync or e_x_PLUS_TB_sync or e_Ro_MINUS_TB_sync or e_Ao_MINUS_TB_sync or e_Ro_MINUSa_TB_sync)
		begin
			// MEALY FSMs - Blocking Operations //
			next_state = state;

			e_x_MINUS = 1'b0;
			e_Ro_PLUSa = 1'b0;
			e_Ao_PLUS = 1'b0;
			e_Ro_PLUS = 1'b0;
			e_x_PLUS = 1'b0;
			e_Ro_MINUS = 1'b0;
			e_Ao_MINUS = 1'b0;
			e_Ro_MINUSa = 1'b0;

			case (state)
				p7_1HOT_ENCODING: // 12'b000000000001: //
					begin
						if (e_x_PLUS_TB_sync)
							begin
								e_x_PLUS = 1'b1;
								next_state = p14_1HOT_ENCODING;
							end
					end

				p10_1HOT_ENCODING: // 12'b000000000010: //
					begin
						if (e_Ao_MINUS_TB_sync)
							begin
								e_Ao_MINUS = 1'b1;
								next_state = p3_1HOT_ENCODING;
							end
					end

				p9_1HOT_ENCODING: // 12'b000000000100: //
					begin
						if (Ai_PLUSa__TB_sync)
							begin
								next_state = p12_1HOT_ENCODING;
							end
					end

				p12_1HOT_ENCODING: // 12'b000000001000: //
					begin
						if (e_x_MINUS_TB_sync)
							begin
								e_x_MINUS = 1'b1;
								next_state = p15_1HOT_ENCODING;
							end
					end

				p0_1HOT_ENCODING: // 12'b000000010000: //
					begin
						if (e_Ro_PLUS_TB_sync)
							begin
								e_Ro_PLUS = 1'b1;
								next_state = p4_1HOT_ENCODING;
							end
					end

				p1_1HOT_ENCODING: // 12'b000000100000: //
					begin
						if (e_Ro_PLUSa_TB_sync)
							begin
								e_Ro_PLUSa = 1'b1;
								next_state = p9_1HOT_ENCODING;
							end
					end

				p14_1HOT_ENCODING: // 12'b000001000000: //
					begin
						if (e_Ro_MINUS_TB_sync)
							begin
								e_Ro_MINUS = 1'b1;
								next_state = p5_1HOT_ENCODING;
							end
					end

				p2_1HOT_ENCODING: // 12'b000010000000: //
					begin
						if (Ri_MINUS__TB_sync)
							begin
								next_state = p1_1HOT_ENCODING;
							end
					end

				p15_1HOT_ENCODING: // 12'b000100000000: //
					begin
						if (e_Ro_MINUSa_TB_sync)
							begin
								e_Ro_MINUSa = 1'b1;
								next_state = p10_1HOT_ENCODING;
							end
					end

				p3_1HOT_ENCODING: // 12'b001000000000: //
					begin
						if (Ri_PLUS__TB_sync)
							begin
								next_state = p0_1HOT_ENCODING;
							end
					end

				p4_1HOT_ENCODING: // 12'b010000000000: //
					begin
						if (Ai_PLUS__TB_sync)
							begin
								next_state = p7_1HOT_ENCODING;
							end
					end

				p5_1HOT_ENCODING: // 12'b100000000000: //
					begin
						if (e_Ao_PLUS_TB_sync)
							begin
								e_Ao_PLUS = 1'b1;
								next_state = p2_1HOT_ENCODING;
							end
					end

				default:
						begin
							next_state = 12'dx;
						end
			endcase
		end
endmodule

module fsm_mealy_synth_02 (
	clk,
	reset,
	Ai_PLUS_, Ai_PLUS__p4_FSM1_TB, Ai_PLUS__p4_FSM3_TB,
	Ai_MINUS_,
	Ri_PLUS_, Ri_PLUS__p3_FSM1_TB,
	Ai_PLUSa_, Ai_PLUSa__p9_FSM1_TB, Ai_PLUSa__p9_FSM3_TB,
	e_x_MINUS, e_x_MINUS_p12_FSM1_TB, e_x_MINUS_p12_FSM3_TB,
	e_Ro_PLUSa, e_Ro_PLUSa_p1_FSM1_TB, e_Ro_PLUSa_p1_FSM3_TB,
	e_Ro_PLUS, e_Ro_PLUS_p0_FSM1_TB, e_Ro_PLUS_p13_FSM3_TB,
	e_x_PLUS, e_x_PLUS_p7_FSM1_TB, e_x_PLUS_p7_FSM3_TB,
	e_Ro_MINUS, e_Ro_MINUS_p14_FSM1_TB, e_Ro_MINUS_p14_FSM3_TB,
	e_Ao_MINUS, e_Ao_MINUS_p10_FSM1_TB,
	e_Ro_MINUSa, e_Ro_MINUSa_p15_FSM1_TB, e_Ro_MINUSa_p15_FSM3_TB,
	p7,
	p10,
	p8,
	p9,
	p12,
	p0,
	p14,
	p15,
	p3,
	p4
);

	// Regular Synchronous FSM input Signals //
	input clk;
	input reset;

	// Regular input Signals //
	input Ai_PLUS_;
	input Ai_MINUS_;
	input Ri_PLUS_;
	input Ai_PLUSa_;
	// Transition Barrier Inputs for input Signals //
	input Ai_PLUS__p4_FSM1_TB, Ai_PLUS__p4_FSM3_TB;
	input Ri_PLUS__p3_FSM1_TB;
	input Ai_PLUSa__p9_FSM1_TB, Ai_PLUSa__p9_FSM3_TB;

	// Regular output Signals //
	output e_x_MINUS;
	output e_Ro_PLUSa;
	output e_Ro_PLUS;
	output e_x_PLUS;
	output e_Ro_MINUS;
	output e_Ao_MINUS;
	output e_Ro_MINUSa;
	// Transition Barrier outputs for output Signals //
	input e_x_MINUS_p12_FSM1_TB, e_x_MINUS_p12_FSM3_TB;
	input e_Ro_PLUSa_p1_FSM1_TB, e_Ro_PLUSa_p1_FSM3_TB;
	input e_Ro_PLUS_p0_FSM1_TB, e_Ro_PLUS_p13_FSM3_TB;
	input e_x_PLUS_p7_FSM1_TB, e_x_PLUS_p7_FSM3_TB;
	input e_Ro_MINUS_p14_FSM1_TB, e_Ro_MINUS_p14_FSM3_TB;
	input e_Ao_MINUS_p10_FSM1_TB;
	input e_Ro_MINUSa_p15_FSM1_TB, e_Ro_MINUSa_p15_FSM3_TB;

	// FSMs' Synchronisation output Signals //
	output p7;
	output p10;
	output p8;
	output p9;
	output p12;
	output p0;
	output p14;
	output p15;
	output p3;
	output p4;

	reg e_x_MINUS;
	reg e_Ro_PLUSa;
	reg e_Ro_PLUS;
	reg e_x_PLUS;
	reg e_Ro_MINUS;
	reg e_Ao_MINUS;
	reg e_Ro_MINUSa;
	wire p7;
	wire p10;
	wire p8;
	wire p9;
	wire p12;
	wire p0;
	wire p14;
	wire p15;
	wire p3;
	wire p4;

	wire Ai_PLUS__TB_sync;
	wire Ri_PLUS__TB_sync;
	wire Ai_PLUSa__TB_sync;
	wire e_x_MINUS_TB_sync;
	wire e_Ro_PLUSa_TB_sync;
	wire e_Ro_PLUS_TB_sync;
	wire e_x_PLUS_TB_sync;
	wire e_Ro_MINUS_TB_sync;
	wire e_Ao_MINUS_TB_sync;
	wire e_Ro_MINUSa_TB_sync;
	assign Ai_PLUS__TB_sync = Ai_PLUS_ & Ai_PLUS__p4_FSM1_TB & Ai_PLUS__p4_FSM3_TB;
	assign Ri_PLUS__TB_sync = Ri_PLUS_ & Ri_PLUS__p3_FSM1_TB;
	assign Ai_PLUSa__TB_sync = Ai_PLUSa_ & Ai_PLUSa__p9_FSM1_TB & Ai_PLUSa__p9_FSM3_TB;
	assign e_x_MINUS_TB_sync = e_x_MINUS_p12_FSM1_TB & e_x_MINUS_p12_FSM3_TB;
	assign e_Ro_PLUSa_TB_sync = e_Ro_PLUSa_p1_FSM1_TB & e_Ro_PLUSa_p1_FSM3_TB;
	assign e_Ro_PLUS_TB_sync = e_Ro_PLUS_p0_FSM1_TB & e_Ro_PLUS_p13_FSM3_TB;
	assign e_x_PLUS_TB_sync = e_x_PLUS_p7_FSM1_TB & e_x_PLUS_p7_FSM3_TB;
	assign e_Ro_MINUS_TB_sync = e_Ro_MINUS_p14_FSM1_TB & e_Ro_MINUS_p14_FSM3_TB;
	assign e_Ao_MINUS_TB_sync = e_Ao_MINUS_p10_FSM1_TB;
	assign e_Ro_MINUSa_TB_sync = e_Ro_MINUSa_p15_FSM1_TB & e_Ro_MINUSa_p15_FSM3_TB;

	parameter p7_1HOT_ENCODING = 11'd1; // 11'b00000000001 //
	parameter p10_1HOT_ENCODING = 11'd2; // 11'b00000000010 //
	parameter p8_1HOT_ENCODING = 11'd4; // 11'b00000000100 //
	parameter p9_1HOT_ENCODING = 11'd8; // 11'b00000001000 //
	parameter p12_1HOT_ENCODING = 11'd16; // 11'b00000010000 //
	parameter p0_1HOT_ENCODING = 11'd32; // 11'b00000100000 //
	parameter p14_1HOT_ENCODING = 11'd64; // 11'b00001000000 //
	parameter p15_1HOT_ENCODING = 11'd128; // 11'b00010000000 //
	parameter p3_1HOT_ENCODING = 11'd256; // 11'b00100000000 //
	parameter p4_1HOT_ENCODING = 11'd512; // 11'b01000000000 //
	parameter p6_1HOT_ENCODING = 11'd1024; // 11'b10000000000 //

	reg [10 : 0]	state;
	reg [10 : 0]	next_state;

	always @(posedge clk)
		begin
			if (reset)
				begin
						state <= p3_1HOT_ENCODING;
				end
			else
				begin
						state <= next_state;
				end
		end

	assign p7 = (state == p7_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p10 = (state == p10_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p8 = (state == p8_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p9 = (state == p9_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p12 = (state == p12_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p0 = (state == p0_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p14 = (state == p14_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p15 = (state == p15_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p3 = (state == p3_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p4 = (state == p4_1HOT_ENCODING) ? 1'b1 : 1'b0;

	always @(state or Ai_PLUS__TB_sync or Ai_MINUS_ or Ri_PLUS__TB_sync or Ai_PLUSa__TB_sync or e_x_MINUS_TB_sync or e_Ro_PLUSa_TB_sync or e_Ro_PLUS_TB_sync or e_x_PLUS_TB_sync or e_Ro_MINUS_TB_sync or e_Ao_MINUS_TB_sync or e_Ro_MINUSa_TB_sync)
		begin
			// MEALY FSMs - Blocking Operations //
			next_state = state;

			e_x_MINUS = 1'b0;
			e_Ro_PLUSa = 1'b0;
			e_Ro_PLUS = 1'b0;
			e_x_PLUS = 1'b0;
			e_Ro_MINUS = 1'b0;
			e_Ao_MINUS = 1'b0;
			e_Ro_MINUSa = 1'b0;

			case (state)
				p7_1HOT_ENCODING: // 11'b00000000001: //
					begin
						if (e_x_PLUS_TB_sync)
							begin
								e_x_PLUS = 1'b1;
								next_state = p14_1HOT_ENCODING;
							end
					end

				p10_1HOT_ENCODING: // 11'b00000000010: //
					begin
						if (e_Ao_MINUS_TB_sync)
							begin
								e_Ao_MINUS = 1'b1;
								next_state = p3_1HOT_ENCODING;
							end
					end

				p8_1HOT_ENCODING: // 11'b00000000100: //
					begin
						if (e_Ro_PLUSa_TB_sync)
							begin
								e_Ro_PLUSa = 1'b1;
								next_state = p9_1HOT_ENCODING;
							end
					end

				p9_1HOT_ENCODING: // 11'b00000001000: //
					begin
						if (Ai_PLUSa__TB_sync)
							begin
								next_state = p12_1HOT_ENCODING;
							end
					end

				p12_1HOT_ENCODING: // 11'b00000010000: //
					begin
						if (e_x_MINUS_TB_sync)
							begin
								e_x_MINUS = 1'b1;
								next_state = p15_1HOT_ENCODING;
							end
					end

				p0_1HOT_ENCODING: // 11'b00000100000: //
					begin
						if (e_Ro_PLUS_TB_sync)
							begin
								e_Ro_PLUS = 1'b1;
								next_state = p4_1HOT_ENCODING;
							end
					end

				p14_1HOT_ENCODING: // 11'b00001000000: //
					begin
						if (e_Ro_MINUS_TB_sync)
							begin
								e_Ro_MINUS = 1'b1;
								next_state = p6_1HOT_ENCODING;
							end
					end

				p15_1HOT_ENCODING: // 11'b00010000000: //
					begin
						if (e_Ro_MINUSa_TB_sync)
							begin
								e_Ro_MINUSa = 1'b1;
								next_state = p10_1HOT_ENCODING;
							end
					end

				p3_1HOT_ENCODING: // 11'b00100000000: //
					begin
						if (Ri_PLUS__TB_sync)
							begin
								next_state = p0_1HOT_ENCODING;
							end
					end

				p4_1HOT_ENCODING: // 11'b01000000000: //
					begin
						if (Ai_PLUS__TB_sync)
							begin
								next_state = p7_1HOT_ENCODING;
							end
					end

				p6_1HOT_ENCODING: // 11'b10000000000: //
					begin
						if (Ai_MINUS_)
							begin
								next_state = p8_1HOT_ENCODING;
							end
					end

				default:
						begin
							next_state = 11'dx;
						end
			endcase
		end
endmodule

module fsm_mealy_synth_03 (
	clk,
	reset,
	Ri_MINUS_, Ri_MINUS__p2_FSM1_TB,
	Ai_PLUS_, Ai_PLUS__p4_FSM1_TB, Ai_PLUS__p4_FSM2_TB,
	Ai_PLUSa_, Ai_PLUSa__p9_FSM1_TB, Ai_PLUSa__p9_FSM2_TB,
	Ai_MINUSa_,
	e_x_MINUS, e_x_MINUS_p12_FSM1_TB, e_x_MINUS_p12_FSM2_TB,
	e_Ro_PLUSa, e_Ro_PLUSa_p1_FSM1_TB, e_Ro_PLUSa_p8_FSM2_TB,
	e_Ao_PLUS, e_Ao_PLUS_p5_FSM1_TB,
	e_Ro_PLUS, e_Ro_PLUS_p0_FSM1_TB, e_Ro_PLUS_p0_FSM2_TB,
	e_x_PLUS, e_x_PLUS_p7_FSM1_TB, e_x_PLUS_p7_FSM2_TB,
	e_Ro_MINUS, e_Ro_MINUS_p14_FSM1_TB, e_Ro_MINUS_p14_FSM2_TB,
	e_Ro_MINUSa, e_Ro_MINUSa_p15_FSM1_TB, e_Ro_MINUSa_p15_FSM2_TB,
	p7,
	p9,
	p12,
	p13,
	p1,
	p14,
	p2,
	p15,
	p4,
	p5
);

	// Regular Synchronous FSM input Signals //
	input clk;
	input reset;

	// Regular input Signals //
	input Ri_MINUS_;
	input Ai_PLUS_;
	input Ai_PLUSa_;
	input Ai_MINUSa_;
	// Transition Barrier Inputs for input Signals //
	input Ri_MINUS__p2_FSM1_TB;
	input Ai_PLUS__p4_FSM1_TB, Ai_PLUS__p4_FSM2_TB;
	input Ai_PLUSa__p9_FSM1_TB, Ai_PLUSa__p9_FSM2_TB;

	// Regular output Signals //
	output e_x_MINUS;
	output e_Ro_PLUSa;
	output e_Ao_PLUS;
	output e_Ro_PLUS;
	output e_x_PLUS;
	output e_Ro_MINUS;
	output e_Ro_MINUSa;
	// Transition Barrier outputs for output Signals //
	input e_x_MINUS_p12_FSM1_TB, e_x_MINUS_p12_FSM2_TB;
	input e_Ro_PLUSa_p1_FSM1_TB, e_Ro_PLUSa_p8_FSM2_TB;
	input e_Ao_PLUS_p5_FSM1_TB;
	input e_Ro_PLUS_p0_FSM1_TB, e_Ro_PLUS_p0_FSM2_TB;
	input e_x_PLUS_p7_FSM1_TB, e_x_PLUS_p7_FSM2_TB;
	input e_Ro_MINUS_p14_FSM1_TB, e_Ro_MINUS_p14_FSM2_TB;
	input e_Ro_MINUSa_p15_FSM1_TB, e_Ro_MINUSa_p15_FSM2_TB;

	// FSMs' Synchronisation output Signals //
	output p7;
	output p9;
	output p12;
	output p13;
	output p1;
	output p14;
	output p2;
	output p15;
	output p4;
	output p5;

	reg e_x_MINUS;
	reg e_Ro_PLUSa;
	reg e_Ao_PLUS;
	reg e_Ro_PLUS;
	reg e_x_PLUS;
	reg e_Ro_MINUS;
	reg e_Ro_MINUSa;
	wire p7;
	wire p9;
	wire p12;
	wire p13;
	wire p1;
	wire p14;
	wire p2;
	wire p15;
	wire p4;
	wire p5;

	wire Ri_MINUS__TB_sync;
	wire Ai_PLUS__TB_sync;
	wire Ai_PLUSa__TB_sync;
	wire e_x_MINUS_TB_sync;
	wire e_Ro_PLUSa_TB_sync;
	wire e_Ao_PLUS_TB_sync;
	wire e_Ro_PLUS_TB_sync;
	wire e_x_PLUS_TB_sync;
	wire e_Ro_MINUS_TB_sync;
	wire e_Ro_MINUSa_TB_sync;
	assign Ri_MINUS__TB_sync = Ri_MINUS_ & Ri_MINUS__p2_FSM1_TB;
	assign Ai_PLUS__TB_sync = Ai_PLUS_ & Ai_PLUS__p4_FSM1_TB & Ai_PLUS__p4_FSM2_TB;
	assign Ai_PLUSa__TB_sync = Ai_PLUSa_ & Ai_PLUSa__p9_FSM1_TB & Ai_PLUSa__p9_FSM2_TB;
	assign e_x_MINUS_TB_sync = e_x_MINUS_p12_FSM1_TB & e_x_MINUS_p12_FSM2_TB;
	assign e_Ro_PLUSa_TB_sync = e_Ro_PLUSa_p1_FSM1_TB & e_Ro_PLUSa_p8_FSM2_TB;
	assign e_Ao_PLUS_TB_sync = e_Ao_PLUS_p5_FSM1_TB;
	assign e_Ro_PLUS_TB_sync = e_Ro_PLUS_p0_FSM1_TB & e_Ro_PLUS_p0_FSM2_TB;
	assign e_x_PLUS_TB_sync = e_x_PLUS_p7_FSM1_TB & e_x_PLUS_p7_FSM2_TB;
	assign e_Ro_MINUS_TB_sync = e_Ro_MINUS_p14_FSM1_TB & e_Ro_MINUS_p14_FSM2_TB;
	assign e_Ro_MINUSa_TB_sync = e_Ro_MINUSa_p15_FSM1_TB & e_Ro_MINUSa_p15_FSM2_TB;

	parameter p7_1HOT_ENCODING = 11'd1; // 11'b00000000001 //
	parameter p11_1HOT_ENCODING = 11'd2; // 11'b00000000010 //
	parameter p9_1HOT_ENCODING = 11'd4; // 11'b00000000100 //
	parameter p12_1HOT_ENCODING = 11'd8; // 11'b00000001000 //
	parameter p13_1HOT_ENCODING = 11'd16; // 11'b00000010000 //
	parameter p1_1HOT_ENCODING = 11'd32; // 11'b00000100000 //
	parameter p14_1HOT_ENCODING = 11'd64; // 11'b00001000000 //
	parameter p2_1HOT_ENCODING = 11'd128; // 11'b00010000000 //
	parameter p15_1HOT_ENCODING = 11'd256; // 11'b00100000000 //
	parameter p4_1HOT_ENCODING = 11'd512; // 11'b01000000000 //
	parameter p5_1HOT_ENCODING = 11'd1024; // 11'b10000000000 //

	reg [10 : 0]	state;
	reg [10 : 0]	next_state;

	always @(posedge clk)
		begin
			if (reset)
				begin
						state <= p13_1HOT_ENCODING;
				end
			else
				begin
						state <= next_state;
				end
		end

	assign p7 = (state == p7_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p9 = (state == p9_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p12 = (state == p12_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p13 = (state == p13_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p1 = (state == p1_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p14 = (state == p14_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p2 = (state == p2_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p15 = (state == p15_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p4 = (state == p4_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p5 = (state == p5_1HOT_ENCODING) ? 1'b1 : 1'b0;

	always @(state or Ri_MINUS__TB_sync or Ai_PLUS__TB_sync or Ai_PLUSa__TB_sync or Ai_MINUSa_ or e_x_MINUS_TB_sync or e_Ro_PLUSa_TB_sync or e_Ao_PLUS_TB_sync or e_Ro_PLUS_TB_sync or e_x_PLUS_TB_sync or e_Ro_MINUS_TB_sync or e_Ro_MINUSa_TB_sync)
		begin
			// MEALY FSMs - Blocking Operations //
			next_state = state;

			e_x_MINUS = 1'b0;
			e_Ro_PLUSa = 1'b0;
			e_Ao_PLUS = 1'b0;
			e_Ro_PLUS = 1'b0;
			e_x_PLUS = 1'b0;
			e_Ro_MINUS = 1'b0;
			e_Ro_MINUSa = 1'b0;

			case (state)
				p7_1HOT_ENCODING: // 11'b00000000001: //
					begin
						if (e_x_PLUS_TB_sync)
							begin
								e_x_PLUS = 1'b1;
								next_state = p14_1HOT_ENCODING;
							end
					end

				p11_1HOT_ENCODING: // 11'b00000000010: //
					begin
						if (Ai_MINUSa_)
							begin
								next_state = p13_1HOT_ENCODING;
							end
					end

				p9_1HOT_ENCODING: // 11'b00000000100: //
					begin
						if (Ai_PLUSa__TB_sync)
							begin
								next_state = p12_1HOT_ENCODING;
							end
					end

				p12_1HOT_ENCODING: // 11'b00000001000: //
					begin
						if (e_x_MINUS_TB_sync)
							begin
								e_x_MINUS = 1'b1;
								next_state = p15_1HOT_ENCODING;
							end
					end

				p13_1HOT_ENCODING: // 11'b00000010000: //
					begin
						if (e_Ro_PLUS_TB_sync)
							begin
								e_Ro_PLUS = 1'b1;
								next_state = p4_1HOT_ENCODING;
							end
					end

				p1_1HOT_ENCODING: // 11'b00000100000: //
					begin
						if (e_Ro_PLUSa_TB_sync)
							begin
								e_Ro_PLUSa = 1'b1;
								next_state = p9_1HOT_ENCODING;
							end
					end

				p14_1HOT_ENCODING: // 11'b00001000000: //
					begin
						if (e_Ro_MINUS_TB_sync)
							begin
								e_Ro_MINUS = 1'b1;
								next_state = p5_1HOT_ENCODING;
							end
					end

				p2_1HOT_ENCODING: // 11'b00010000000: //
					begin
						if (Ri_MINUS__TB_sync)
							begin
								next_state = p1_1HOT_ENCODING;
							end
					end

				p15_1HOT_ENCODING: // 11'b00100000000: //
					begin
						if (e_Ro_MINUSa_TB_sync)
							begin
								e_Ro_MINUSa = 1'b1;
								next_state = p11_1HOT_ENCODING;
							end
					end

				p4_1HOT_ENCODING: // 11'b01000000000: //
					begin
						if (Ai_PLUS__TB_sync)
							begin
								next_state = p7_1HOT_ENCODING;
							end
					end

				p5_1HOT_ENCODING: // 11'b10000000000: //
					begin
						if (e_Ao_PLUS_TB_sync)
							begin
								e_Ao_PLUS = 1'b1;
								next_state = p2_1HOT_ENCODING;
							end
					end

				default:
						begin
							next_state = 11'dx;
						end
			endcase
		end
endmodule

