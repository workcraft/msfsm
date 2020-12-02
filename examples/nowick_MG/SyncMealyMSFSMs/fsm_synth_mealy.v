`timescale 1ns/1ns

module fsm_mealy_synth_01 (
	clk,
	reset,
	b_MINUS_, b_MINUS__p11_FSM2_TB, b_MINUS__p11_FSM3_TB, b_MINUS__p11_FSM4_TB, b_MINUS__p11_FSM5_TB, b_MINUS__p12_FSM6_TB,
	c_PLUS_, c_PLUS__p5_FSM2_TB, c_PLUS__p5_FSM3_TB, c_PLUS__p4_FSM4_TB, c_PLUS__p4_FSM5_TB, c_PLUS__p4_FSM6_TB,
	c_MINUS_, c_MINUS__p8_FSM2_TB, c_MINUS__p8_FSM3_TB, c_MINUS__p8_FSM4_TB, c_MINUS__p8_FSM5_TB, c_MINUS__p8_FSM6_TB,
	a_PLUS_, a_PLUS__p19_FSM2_TB, a_PLUS__p19_FSM4_TB, a_PLUS__p19_FSM6_TB,
	a_MINUS_, a_MINUS__p15_FSM2_TB, a_MINUS__p15_FSM3_TB, a_MINUS__p16_FSM4_TB, a_MINUS__p15_FSM5_TB, a_MINUS__p15_FSM6_TB,
	e_x_PLUS, e_x_PLUS_p0_FSM4_TB, e_x_PLUS_p2_FSM5_TB, e_x_PLUS_p0_FSM6_TB,
	e_q_PLUS, e_q_PLUS_p6_FSM2_TB, e_q_PLUS_p6_FSM3_TB, e_q_PLUS_p6_FSM4_TB, e_q_PLUS_p6_FSM5_TB, e_q_PLUS_p6_FSM6_TB,
	e_x_MINUS, e_x_MINUS_p7_FSM2_TB, e_x_MINUS_p7_FSM3_TB, e_x_MINUS_p7_FSM4_TB, e_x_MINUS_p7_FSM5_TB, e_x_MINUS_p7_FSM6_TB,
	e_x_MINUSa, e_x_MINUSa_p13_FSM2_TB, e_x_MINUSa_p13_FSM3_TB, e_x_MINUSa_p13_FSM5_TB, e_x_MINUSa_p13_FSM6_TB,
	e_x_PLUSa, e_x_PLUSa_p9_FSM2_TB, e_x_PLUSa_p9_FSM3_TB, e_x_PLUSa_p9_FSM4_TB, e_x_PLUSa_p9_FSM5_TB,
	e_y_MINUSa, e_y_MINUSa_p18_FSM2_TB, e_y_MINUSa_p18_FSM3_TB, e_y_MINUSa_p18_FSM4_TB, e_y_MINUSa_p18_FSM5_TB, e_y_MINUSa_p18_FSM6_TB,
	e_q_MINUS, e_q_MINUS_p17_FSM2_TB, e_q_MINUS_p17_FSM3_TB, e_q_MINUS_p17_FSM4_TB, e_q_MINUS_p17_FSM5_TB, e_q_MINUS_p17_FSM6_TB,
	p19,
	p18,
	p4,
	p17,
	p15,
	p0,
	p9,
	p13,
	p8,
	p7,
	p11,
	p6
);

	// Regular Synchronous FSM input Signals //
	input clk;
	input reset;

	// Regular input Signals //
	input b_MINUS_;
	input c_PLUS_;
	input c_MINUS_;
	input a_PLUS_;
	input a_MINUS_;
	// Transition Barrier Inputs for input Signals //
	input b_MINUS__p11_FSM2_TB, b_MINUS__p11_FSM3_TB, b_MINUS__p11_FSM4_TB, b_MINUS__p11_FSM5_TB, b_MINUS__p12_FSM6_TB;
	input c_PLUS__p5_FSM2_TB, c_PLUS__p5_FSM3_TB, c_PLUS__p4_FSM4_TB, c_PLUS__p4_FSM5_TB, c_PLUS__p4_FSM6_TB;
	input c_MINUS__p8_FSM2_TB, c_MINUS__p8_FSM3_TB, c_MINUS__p8_FSM4_TB, c_MINUS__p8_FSM5_TB, c_MINUS__p8_FSM6_TB;
	input a_PLUS__p19_FSM2_TB, a_PLUS__p19_FSM4_TB, a_PLUS__p19_FSM6_TB;
	input a_MINUS__p15_FSM2_TB, a_MINUS__p15_FSM3_TB, a_MINUS__p16_FSM4_TB, a_MINUS__p15_FSM5_TB, a_MINUS__p15_FSM6_TB;

	// Regular output Signals //
	output e_x_PLUS;
	output e_q_PLUS;
	output e_x_MINUS;
	output e_x_MINUSa;
	output e_x_PLUSa;
	output e_y_MINUSa;
	output e_q_MINUS;
	// Transition Barrier outputs for output Signals //
	input e_x_PLUS_p0_FSM4_TB, e_x_PLUS_p2_FSM5_TB, e_x_PLUS_p0_FSM6_TB;
	input e_q_PLUS_p6_FSM2_TB, e_q_PLUS_p6_FSM3_TB, e_q_PLUS_p6_FSM4_TB, e_q_PLUS_p6_FSM5_TB, e_q_PLUS_p6_FSM6_TB;
	input e_x_MINUS_p7_FSM2_TB, e_x_MINUS_p7_FSM3_TB, e_x_MINUS_p7_FSM4_TB, e_x_MINUS_p7_FSM5_TB, e_x_MINUS_p7_FSM6_TB;
	input e_x_MINUSa_p13_FSM2_TB, e_x_MINUSa_p13_FSM3_TB, e_x_MINUSa_p13_FSM5_TB, e_x_MINUSa_p13_FSM6_TB;
	input e_x_PLUSa_p9_FSM2_TB, e_x_PLUSa_p9_FSM3_TB, e_x_PLUSa_p9_FSM4_TB, e_x_PLUSa_p9_FSM5_TB;
	input e_y_MINUSa_p18_FSM2_TB, e_y_MINUSa_p18_FSM3_TB, e_y_MINUSa_p18_FSM4_TB, e_y_MINUSa_p18_FSM5_TB, e_y_MINUSa_p18_FSM6_TB;
	input e_q_MINUS_p17_FSM2_TB, e_q_MINUS_p17_FSM3_TB, e_q_MINUS_p17_FSM4_TB, e_q_MINUS_p17_FSM5_TB, e_q_MINUS_p17_FSM6_TB;

	// FSMs' Synchronisation output Signals //
	output p19;
	output p18;
	output p4;
	output p17;
	output p15;
	output p0;
	output p9;
	output p13;
	output p8;
	output p7;
	output p11;
	output p6;

	reg e_x_PLUS;
	reg e_q_PLUS;
	reg e_x_MINUS;
	reg e_x_MINUSa;
	reg e_x_PLUSa;
	reg e_y_MINUSa;
	reg e_q_MINUS;
	wire p19;
	wire p18;
	wire p4;
	wire p17;
	wire p15;
	wire p0;
	wire p9;
	wire p13;
	wire p8;
	wire p7;
	wire p11;
	wire p6;

	wire b_MINUS__TB_sync;
	wire c_PLUS__TB_sync;
	wire c_MINUS__TB_sync;
	wire a_PLUS__TB_sync;
	wire a_MINUS__TB_sync;
	wire e_x_PLUS_TB_sync;
	wire e_q_PLUS_TB_sync;
	wire e_x_MINUS_TB_sync;
	wire e_x_MINUSa_TB_sync;
	wire e_x_PLUSa_TB_sync;
	wire e_y_MINUSa_TB_sync;
	wire e_q_MINUS_TB_sync;
	assign b_MINUS__TB_sync = b_MINUS_ & b_MINUS__p11_FSM2_TB & b_MINUS__p11_FSM3_TB & b_MINUS__p11_FSM4_TB & b_MINUS__p11_FSM5_TB & b_MINUS__p12_FSM6_TB;
	assign c_PLUS__TB_sync = c_PLUS_ & c_PLUS__p5_FSM2_TB & c_PLUS__p5_FSM3_TB & c_PLUS__p4_FSM4_TB & c_PLUS__p4_FSM5_TB & c_PLUS__p4_FSM6_TB;
	assign c_MINUS__TB_sync = c_MINUS_ & c_MINUS__p8_FSM2_TB & c_MINUS__p8_FSM3_TB & c_MINUS__p8_FSM4_TB & c_MINUS__p8_FSM5_TB & c_MINUS__p8_FSM6_TB;
	assign a_PLUS__TB_sync = a_PLUS_ & a_PLUS__p19_FSM2_TB & a_PLUS__p19_FSM4_TB & a_PLUS__p19_FSM6_TB;
	assign a_MINUS__TB_sync = a_MINUS_ & a_MINUS__p15_FSM2_TB & a_MINUS__p15_FSM3_TB & a_MINUS__p16_FSM4_TB & a_MINUS__p15_FSM5_TB & a_MINUS__p15_FSM6_TB;
	assign e_x_PLUS_TB_sync = e_x_PLUS_p0_FSM4_TB & e_x_PLUS_p2_FSM5_TB & e_x_PLUS_p0_FSM6_TB;
	assign e_q_PLUS_TB_sync = e_q_PLUS_p6_FSM2_TB & e_q_PLUS_p6_FSM3_TB & e_q_PLUS_p6_FSM4_TB & e_q_PLUS_p6_FSM5_TB & e_q_PLUS_p6_FSM6_TB;
	assign e_x_MINUS_TB_sync = e_x_MINUS_p7_FSM2_TB & e_x_MINUS_p7_FSM3_TB & e_x_MINUS_p7_FSM4_TB & e_x_MINUS_p7_FSM5_TB & e_x_MINUS_p7_FSM6_TB;
	assign e_x_MINUSa_TB_sync = e_x_MINUSa_p13_FSM2_TB & e_x_MINUSa_p13_FSM3_TB & e_x_MINUSa_p13_FSM5_TB & e_x_MINUSa_p13_FSM6_TB;
	assign e_x_PLUSa_TB_sync = e_x_PLUSa_p9_FSM2_TB & e_x_PLUSa_p9_FSM3_TB & e_x_PLUSa_p9_FSM4_TB & e_x_PLUSa_p9_FSM5_TB;
	assign e_y_MINUSa_TB_sync = e_y_MINUSa_p18_FSM2_TB & e_y_MINUSa_p18_FSM3_TB & e_y_MINUSa_p18_FSM4_TB & e_y_MINUSa_p18_FSM5_TB & e_y_MINUSa_p18_FSM6_TB;
	assign e_q_MINUS_TB_sync = e_q_MINUS_p17_FSM2_TB & e_q_MINUS_p17_FSM3_TB & e_q_MINUS_p17_FSM4_TB & e_q_MINUS_p17_FSM5_TB & e_q_MINUS_p17_FSM6_TB;

	parameter p19_1HOT_ENCODING = 12'd1; // 12'b000000000001 //
	parameter p18_1HOT_ENCODING = 12'd2; // 12'b000000000010 //
	parameter p4_1HOT_ENCODING = 12'd4; // 12'b000000000100 //
	parameter p17_1HOT_ENCODING = 12'd8; // 12'b000000001000 //
	parameter p15_1HOT_ENCODING = 12'd16; // 12'b000000010000 //
	parameter p0_1HOT_ENCODING = 12'd32; // 12'b000000100000 //
	parameter p9_1HOT_ENCODING = 12'd64; // 12'b000001000000 //
	parameter p13_1HOT_ENCODING = 12'd128; // 12'b000010000000 //
	parameter p8_1HOT_ENCODING = 12'd256; // 12'b000100000000 //
	parameter p7_1HOT_ENCODING = 12'd512; // 12'b001000000000 //
	parameter p11_1HOT_ENCODING = 12'd1024; // 12'b010000000000 //
	parameter p6_1HOT_ENCODING = 12'd2048; // 12'b100000000000 //

	reg [11 : 0]	state;
	reg [11 : 0]	next_state;

	always @(posedge clk)
		begin
			if (reset)
				begin
						state <= p19_1HOT_ENCODING;
				end
			else
				begin
						state <= next_state;
				end
		end

	assign p19 = (state == p19_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p18 = (state == p18_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p4 = (state == p4_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p17 = (state == p17_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p15 = (state == p15_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p0 = (state == p0_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p9 = (state == p9_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p13 = (state == p13_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p8 = (state == p8_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p7 = (state == p7_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p11 = (state == p11_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p6 = (state == p6_1HOT_ENCODING) ? 1'b1 : 1'b0;

	always @(state or b_MINUS__TB_sync or c_PLUS__TB_sync or c_MINUS__TB_sync or a_PLUS__TB_sync or a_MINUS__TB_sync or e_x_PLUS_TB_sync or e_q_PLUS_TB_sync or e_x_MINUS_TB_sync or e_x_MINUSa_TB_sync or e_x_PLUSa_TB_sync or e_y_MINUSa_TB_sync or e_q_MINUS_TB_sync)
		begin
			// MEALY FSMs - Blocking Operations //
			next_state = state;

			e_x_PLUS = 1'b0;
			e_q_PLUS = 1'b0;
			e_x_MINUS = 1'b0;
			e_x_MINUSa = 1'b0;
			e_x_PLUSa = 1'b0;
			e_y_MINUSa = 1'b0;
			e_q_MINUS = 1'b0;

			case (state)
				p19_1HOT_ENCODING: // 12'b000000000001: //
					begin
						if (a_PLUS__TB_sync)
							begin
								next_state = p0_1HOT_ENCODING;
							end
					end

				p18_1HOT_ENCODING: // 12'b000000000010: //
					begin
						if (e_y_MINUSa_TB_sync)
							begin
								e_y_MINUSa = 1'b1;
								next_state = p19_1HOT_ENCODING;
							end
					end

				p4_1HOT_ENCODING: // 12'b000000000100: //
					begin
						if (c_PLUS__TB_sync)
							begin
								next_state = p6_1HOT_ENCODING;
							end
					end

				p17_1HOT_ENCODING: // 12'b000000001000: //
					begin
						if (e_q_MINUS_TB_sync)
							begin
								e_q_MINUS = 1'b1;
								next_state = p18_1HOT_ENCODING;
							end
					end

				p15_1HOT_ENCODING: // 12'b000000010000: //
					begin
						if (a_MINUS__TB_sync)
							begin
								next_state = p17_1HOT_ENCODING;
							end
					end

				p0_1HOT_ENCODING: // 12'b000000100000: //
					begin
						if (e_x_PLUS_TB_sync)
							begin
								e_x_PLUS = 1'b1;
								next_state = p4_1HOT_ENCODING;
							end
					end

				p9_1HOT_ENCODING: // 12'b000001000000: //
					begin
						if (e_x_PLUSa_TB_sync)
							begin
								e_x_PLUSa = 1'b1;
								next_state = p11_1HOT_ENCODING;
							end
					end

				p13_1HOT_ENCODING: // 12'b000010000000: //
					begin
						if (e_x_MINUSa_TB_sync)
							begin
								e_x_MINUSa = 1'b1;
								next_state = p15_1HOT_ENCODING;
							end
					end

				p8_1HOT_ENCODING: // 12'b000100000000: //
					begin
						if (c_MINUS__TB_sync)
							begin
								next_state = p9_1HOT_ENCODING;
							end
					end

				p7_1HOT_ENCODING: // 12'b001000000000: //
					begin
						if (e_x_MINUS_TB_sync)
							begin
								e_x_MINUS = 1'b1;
								next_state = p8_1HOT_ENCODING;
							end
					end

				p11_1HOT_ENCODING: // 12'b010000000000: //
					begin
						if (b_MINUS__TB_sync)
							begin
								next_state = p13_1HOT_ENCODING;
							end
					end

				p6_1HOT_ENCODING: // 12'b100000000000: //
					begin
						if (e_q_PLUS_TB_sync)
							begin
								e_q_PLUS = 1'b1;
								next_state = p7_1HOT_ENCODING;
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
	b_MINUS_, b_MINUS__p11_FSM1_TB, b_MINUS__p11_FSM3_TB, b_MINUS__p11_FSM4_TB, b_MINUS__p11_FSM5_TB, b_MINUS__p12_FSM6_TB,
	c_PLUS_, c_PLUS__p4_FSM1_TB, c_PLUS__p5_FSM3_TB, c_PLUS__p4_FSM4_TB, c_PLUS__p4_FSM5_TB, c_PLUS__p4_FSM6_TB,
	c_MINUS_, c_MINUS__p8_FSM1_TB, c_MINUS__p8_FSM3_TB, c_MINUS__p8_FSM4_TB, c_MINUS__p8_FSM5_TB, c_MINUS__p8_FSM6_TB,
	a_PLUS_, a_PLUS__p19_FSM1_TB, a_PLUS__p19_FSM4_TB, a_PLUS__p19_FSM6_TB,
	a_MINUS_, a_MINUS__p15_FSM1_TB, a_MINUS__p15_FSM3_TB, a_MINUS__p16_FSM4_TB, a_MINUS__p15_FSM5_TB, a_MINUS__p15_FSM6_TB,
	e_q_PLUS, e_q_PLUS_p6_FSM1_TB, e_q_PLUS_p6_FSM3_TB, e_q_PLUS_p6_FSM4_TB, e_q_PLUS_p6_FSM5_TB, e_q_PLUS_p6_FSM6_TB,
	e_x_MINUS, e_x_MINUS_p7_FSM1_TB, e_x_MINUS_p7_FSM3_TB, e_x_MINUS_p7_FSM4_TB, e_x_MINUS_p7_FSM5_TB, e_x_MINUS_p7_FSM6_TB,
	e_x_MINUSa, e_x_MINUSa_p13_FSM1_TB, e_x_MINUSa_p13_FSM3_TB, e_x_MINUSa_p13_FSM5_TB, e_x_MINUSa_p13_FSM6_TB,
	e_x_PLUSa, e_x_PLUSa_p9_FSM1_TB, e_x_PLUSa_p9_FSM3_TB, e_x_PLUSa_p9_FSM4_TB, e_x_PLUSa_p9_FSM5_TB,
	e_y_MINUSa, e_y_MINUSa_p18_FSM1_TB, e_y_MINUSa_p18_FSM3_TB, e_y_MINUSa_p18_FSM4_TB, e_y_MINUSa_p18_FSM5_TB, e_y_MINUSa_p18_FSM6_TB,
	e_y_PLUS, e_y_PLUS_p3_FSM3_TB,
	e_q_MINUS, e_q_MINUS_p17_FSM1_TB, e_q_MINUS_p17_FSM3_TB, e_q_MINUS_p17_FSM4_TB, e_q_MINUS_p17_FSM5_TB, e_q_MINUS_p17_FSM6_TB,
	p19,
	p5,
	p18,
	p17,
	p15,
	p1,
	p9,
	p13,
	p8,
	p7,
	p11,
	p6
);

	// Regular Synchronous FSM input Signals //
	input clk;
	input reset;

	// Regular input Signals //
	input b_MINUS_;
	input c_PLUS_;
	input c_MINUS_;
	input a_PLUS_;
	input a_MINUS_;
	// Transition Barrier Inputs for input Signals //
	input b_MINUS__p11_FSM1_TB, b_MINUS__p11_FSM3_TB, b_MINUS__p11_FSM4_TB, b_MINUS__p11_FSM5_TB, b_MINUS__p12_FSM6_TB;
	input c_PLUS__p4_FSM1_TB, c_PLUS__p5_FSM3_TB, c_PLUS__p4_FSM4_TB, c_PLUS__p4_FSM5_TB, c_PLUS__p4_FSM6_TB;
	input c_MINUS__p8_FSM1_TB, c_MINUS__p8_FSM3_TB, c_MINUS__p8_FSM4_TB, c_MINUS__p8_FSM5_TB, c_MINUS__p8_FSM6_TB;
	input a_PLUS__p19_FSM1_TB, a_PLUS__p19_FSM4_TB, a_PLUS__p19_FSM6_TB;
	input a_MINUS__p15_FSM1_TB, a_MINUS__p15_FSM3_TB, a_MINUS__p16_FSM4_TB, a_MINUS__p15_FSM5_TB, a_MINUS__p15_FSM6_TB;

	// Regular output Signals //
	output e_q_PLUS;
	output e_x_MINUS;
	output e_x_MINUSa;
	output e_x_PLUSa;
	output e_y_MINUSa;
	output e_y_PLUS;
	output e_q_MINUS;
	// Transition Barrier outputs for output Signals //
	input e_q_PLUS_p6_FSM1_TB, e_q_PLUS_p6_FSM3_TB, e_q_PLUS_p6_FSM4_TB, e_q_PLUS_p6_FSM5_TB, e_q_PLUS_p6_FSM6_TB;
	input e_x_MINUS_p7_FSM1_TB, e_x_MINUS_p7_FSM3_TB, e_x_MINUS_p7_FSM4_TB, e_x_MINUS_p7_FSM5_TB, e_x_MINUS_p7_FSM6_TB;
	input e_x_MINUSa_p13_FSM1_TB, e_x_MINUSa_p13_FSM3_TB, e_x_MINUSa_p13_FSM5_TB, e_x_MINUSa_p13_FSM6_TB;
	input e_x_PLUSa_p9_FSM1_TB, e_x_PLUSa_p9_FSM3_TB, e_x_PLUSa_p9_FSM4_TB, e_x_PLUSa_p9_FSM5_TB;
	input e_y_MINUSa_p18_FSM1_TB, e_y_MINUSa_p18_FSM3_TB, e_y_MINUSa_p18_FSM4_TB, e_y_MINUSa_p18_FSM5_TB, e_y_MINUSa_p18_FSM6_TB;
	input e_y_PLUS_p3_FSM3_TB;
	input e_q_MINUS_p17_FSM1_TB, e_q_MINUS_p17_FSM3_TB, e_q_MINUS_p17_FSM4_TB, e_q_MINUS_p17_FSM5_TB, e_q_MINUS_p17_FSM6_TB;

	// FSMs' Synchronisation output Signals //
	output p19;
	output p5;
	output p18;
	output p17;
	output p15;
	output p1;
	output p9;
	output p13;
	output p8;
	output p7;
	output p11;
	output p6;

	reg e_q_PLUS;
	reg e_x_MINUS;
	reg e_x_MINUSa;
	reg e_x_PLUSa;
	reg e_y_MINUSa;
	reg e_y_PLUS;
	reg e_q_MINUS;
	wire p19;
	wire p5;
	wire p18;
	wire p17;
	wire p15;
	wire p1;
	wire p9;
	wire p13;
	wire p8;
	wire p7;
	wire p11;
	wire p6;

	wire b_MINUS__TB_sync;
	wire c_PLUS__TB_sync;
	wire c_MINUS__TB_sync;
	wire a_PLUS__TB_sync;
	wire a_MINUS__TB_sync;
	wire e_q_PLUS_TB_sync;
	wire e_x_MINUS_TB_sync;
	wire e_x_MINUSa_TB_sync;
	wire e_x_PLUSa_TB_sync;
	wire e_y_MINUSa_TB_sync;
	wire e_y_PLUS_TB_sync;
	wire e_q_MINUS_TB_sync;
	assign b_MINUS__TB_sync = b_MINUS_ & b_MINUS__p11_FSM1_TB & b_MINUS__p11_FSM3_TB & b_MINUS__p11_FSM4_TB & b_MINUS__p11_FSM5_TB & b_MINUS__p12_FSM6_TB;
	assign c_PLUS__TB_sync = c_PLUS_ & c_PLUS__p4_FSM1_TB & c_PLUS__p5_FSM3_TB & c_PLUS__p4_FSM4_TB & c_PLUS__p4_FSM5_TB & c_PLUS__p4_FSM6_TB;
	assign c_MINUS__TB_sync = c_MINUS_ & c_MINUS__p8_FSM1_TB & c_MINUS__p8_FSM3_TB & c_MINUS__p8_FSM4_TB & c_MINUS__p8_FSM5_TB & c_MINUS__p8_FSM6_TB;
	assign a_PLUS__TB_sync = a_PLUS_ & a_PLUS__p19_FSM1_TB & a_PLUS__p19_FSM4_TB & a_PLUS__p19_FSM6_TB;
	assign a_MINUS__TB_sync = a_MINUS_ & a_MINUS__p15_FSM1_TB & a_MINUS__p15_FSM3_TB & a_MINUS__p16_FSM4_TB & a_MINUS__p15_FSM5_TB & a_MINUS__p15_FSM6_TB;
	assign e_q_PLUS_TB_sync = e_q_PLUS_p6_FSM1_TB & e_q_PLUS_p6_FSM3_TB & e_q_PLUS_p6_FSM4_TB & e_q_PLUS_p6_FSM5_TB & e_q_PLUS_p6_FSM6_TB;
	assign e_x_MINUS_TB_sync = e_x_MINUS_p7_FSM1_TB & e_x_MINUS_p7_FSM3_TB & e_x_MINUS_p7_FSM4_TB & e_x_MINUS_p7_FSM5_TB & e_x_MINUS_p7_FSM6_TB;
	assign e_x_MINUSa_TB_sync = e_x_MINUSa_p13_FSM1_TB & e_x_MINUSa_p13_FSM3_TB & e_x_MINUSa_p13_FSM5_TB & e_x_MINUSa_p13_FSM6_TB;
	assign e_x_PLUSa_TB_sync = e_x_PLUSa_p9_FSM1_TB & e_x_PLUSa_p9_FSM3_TB & e_x_PLUSa_p9_FSM4_TB & e_x_PLUSa_p9_FSM5_TB;
	assign e_y_MINUSa_TB_sync = e_y_MINUSa_p18_FSM1_TB & e_y_MINUSa_p18_FSM3_TB & e_y_MINUSa_p18_FSM4_TB & e_y_MINUSa_p18_FSM5_TB & e_y_MINUSa_p18_FSM6_TB;
	assign e_y_PLUS_TB_sync = e_y_PLUS_p3_FSM3_TB;
	assign e_q_MINUS_TB_sync = e_q_MINUS_p17_FSM1_TB & e_q_MINUS_p17_FSM3_TB & e_q_MINUS_p17_FSM4_TB & e_q_MINUS_p17_FSM5_TB & e_q_MINUS_p17_FSM6_TB;

	parameter p19_1HOT_ENCODING = 12'd1; // 12'b000000000001 //
	parameter p5_1HOT_ENCODING = 12'd2; // 12'b000000000010 //
	parameter p18_1HOT_ENCODING = 12'd4; // 12'b000000000100 //
	parameter p17_1HOT_ENCODING = 12'd8; // 12'b000000001000 //
	parameter p15_1HOT_ENCODING = 12'd16; // 12'b000000010000 //
	parameter p1_1HOT_ENCODING = 12'd32; // 12'b000000100000 //
	parameter p9_1HOT_ENCODING = 12'd64; // 12'b000001000000 //
	parameter p13_1HOT_ENCODING = 12'd128; // 12'b000010000000 //
	parameter p8_1HOT_ENCODING = 12'd256; // 12'b000100000000 //
	parameter p7_1HOT_ENCODING = 12'd512; // 12'b001000000000 //
	parameter p11_1HOT_ENCODING = 12'd1024; // 12'b010000000000 //
	parameter p6_1HOT_ENCODING = 12'd2048; // 12'b100000000000 //

	reg [11 : 0]	state;
	reg [11 : 0]	next_state;

	always @(posedge clk)
		begin
			if (reset)
				begin
						state <= p19_1HOT_ENCODING;
				end
			else
				begin
						state <= next_state;
				end
		end

	assign p19 = (state == p19_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p5 = (state == p5_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p18 = (state == p18_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p17 = (state == p17_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p15 = (state == p15_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p1 = (state == p1_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p9 = (state == p9_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p13 = (state == p13_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p8 = (state == p8_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p7 = (state == p7_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p11 = (state == p11_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p6 = (state == p6_1HOT_ENCODING) ? 1'b1 : 1'b0;

	always @(state or b_MINUS__TB_sync or c_PLUS__TB_sync or c_MINUS__TB_sync or a_PLUS__TB_sync or a_MINUS__TB_sync or e_q_PLUS_TB_sync or e_x_MINUS_TB_sync or e_x_MINUSa_TB_sync or e_x_PLUSa_TB_sync or e_y_MINUSa_TB_sync or e_y_PLUS_TB_sync or e_q_MINUS_TB_sync)
		begin
			// MEALY FSMs - Blocking Operations //
			next_state = state;

			e_q_PLUS = 1'b0;
			e_x_MINUS = 1'b0;
			e_x_MINUSa = 1'b0;
			e_x_PLUSa = 1'b0;
			e_y_MINUSa = 1'b0;
			e_y_PLUS = 1'b0;
			e_q_MINUS = 1'b0;

			case (state)
				p19_1HOT_ENCODING: // 12'b000000000001: //
					begin
						if (a_PLUS__TB_sync)
							begin
								next_state = p1_1HOT_ENCODING;
							end
					end

				p5_1HOT_ENCODING: // 12'b000000000010: //
					begin
						if (c_PLUS__TB_sync)
							begin
								next_state = p6_1HOT_ENCODING;
							end
					end

				p18_1HOT_ENCODING: // 12'b000000000100: //
					begin
						if (e_y_MINUSa_TB_sync)
							begin
								e_y_MINUSa = 1'b1;
								next_state = p19_1HOT_ENCODING;
							end
					end

				p17_1HOT_ENCODING: // 12'b000000001000: //
					begin
						if (e_q_MINUS_TB_sync)
							begin
								e_q_MINUS = 1'b1;
								next_state = p18_1HOT_ENCODING;
							end
					end

				p15_1HOT_ENCODING: // 12'b000000010000: //
					begin
						if (a_MINUS__TB_sync)
							begin
								next_state = p17_1HOT_ENCODING;
							end
					end

				p1_1HOT_ENCODING: // 12'b000000100000: //
					begin
						if (e_y_PLUS_TB_sync)
							begin
								e_y_PLUS = 1'b1;
								next_state = p5_1HOT_ENCODING;
							end
					end

				p9_1HOT_ENCODING: // 12'b000001000000: //
					begin
						if (e_x_PLUSa_TB_sync)
							begin
								e_x_PLUSa = 1'b1;
								next_state = p11_1HOT_ENCODING;
							end
					end

				p13_1HOT_ENCODING: // 12'b000010000000: //
					begin
						if (e_x_MINUSa_TB_sync)
							begin
								e_x_MINUSa = 1'b1;
								next_state = p15_1HOT_ENCODING;
							end
					end

				p8_1HOT_ENCODING: // 12'b000100000000: //
					begin
						if (c_MINUS__TB_sync)
							begin
								next_state = p9_1HOT_ENCODING;
							end
					end

				p7_1HOT_ENCODING: // 12'b001000000000: //
					begin
						if (e_x_MINUS_TB_sync)
							begin
								e_x_MINUS = 1'b1;
								next_state = p8_1HOT_ENCODING;
							end
					end

				p11_1HOT_ENCODING: // 12'b010000000000: //
					begin
						if (b_MINUS__TB_sync)
							begin
								next_state = p13_1HOT_ENCODING;
							end
					end

				p6_1HOT_ENCODING: // 12'b100000000000: //
					begin
						if (e_q_PLUS_TB_sync)
							begin
								e_q_PLUS = 1'b1;
								next_state = p7_1HOT_ENCODING;
							end
					end

				default:
						begin
							next_state = 12'dx;
						end
			endcase
		end
endmodule

module fsm_mealy_synth_03 (
	clk,
	reset,
	b_MINUS_, b_MINUS__p11_FSM1_TB, b_MINUS__p11_FSM2_TB, b_MINUS__p11_FSM4_TB, b_MINUS__p11_FSM5_TB, b_MINUS__p12_FSM6_TB,
	c_PLUS_, c_PLUS__p4_FSM1_TB, c_PLUS__p5_FSM2_TB, c_PLUS__p4_FSM4_TB, c_PLUS__p4_FSM5_TB, c_PLUS__p4_FSM6_TB,
	c_MINUS_, c_MINUS__p8_FSM1_TB, c_MINUS__p8_FSM2_TB, c_MINUS__p8_FSM4_TB, c_MINUS__p8_FSM5_TB, c_MINUS__p8_FSM6_TB,
	b_PLUS_, b_PLUS__p20_FSM5_TB,
	a_MINUS_, a_MINUS__p15_FSM1_TB, a_MINUS__p15_FSM2_TB, a_MINUS__p16_FSM4_TB, a_MINUS__p15_FSM5_TB, a_MINUS__p15_FSM6_TB,
	e_q_PLUS, e_q_PLUS_p6_FSM1_TB, e_q_PLUS_p6_FSM2_TB, e_q_PLUS_p6_FSM4_TB, e_q_PLUS_p6_FSM5_TB, e_q_PLUS_p6_FSM6_TB,
	e_x_MINUS, e_x_MINUS_p7_FSM1_TB, e_x_MINUS_p7_FSM2_TB, e_x_MINUS_p7_FSM4_TB, e_x_MINUS_p7_FSM5_TB, e_x_MINUS_p7_FSM6_TB,
	e_x_MINUSa, e_x_MINUSa_p13_FSM1_TB, e_x_MINUSa_p13_FSM2_TB, e_x_MINUSa_p13_FSM5_TB, e_x_MINUSa_p13_FSM6_TB,
	e_x_PLUSa, e_x_PLUSa_p9_FSM1_TB, e_x_PLUSa_p9_FSM2_TB, e_x_PLUSa_p9_FSM4_TB, e_x_PLUSa_p9_FSM5_TB,
	e_y_MINUSa, e_y_MINUSa_p18_FSM1_TB, e_y_MINUSa_p18_FSM2_TB, e_y_MINUSa_p18_FSM4_TB, e_y_MINUSa_p18_FSM5_TB, e_y_MINUSa_p18_FSM6_TB,
	e_y_PLUS, e_y_PLUS_p1_FSM2_TB,
	e_q_MINUS, e_q_MINUS_p17_FSM1_TB, e_q_MINUS_p17_FSM2_TB, e_q_MINUS_p17_FSM4_TB, e_q_MINUS_p17_FSM5_TB, e_q_MINUS_p17_FSM6_TB,
	p5,
	p18,
	p17,
	p3,
	p20,
	p15,
	p9,
	p13,
	p8,
	p7,
	p11,
	p6
);

	// Regular Synchronous FSM input Signals //
	input clk;
	input reset;

	// Regular input Signals //
	input b_MINUS_;
	input c_PLUS_;
	input c_MINUS_;
	input b_PLUS_;
	input a_MINUS_;
	// Transition Barrier Inputs for input Signals //
	input b_MINUS__p11_FSM1_TB, b_MINUS__p11_FSM2_TB, b_MINUS__p11_FSM4_TB, b_MINUS__p11_FSM5_TB, b_MINUS__p12_FSM6_TB;
	input c_PLUS__p4_FSM1_TB, c_PLUS__p5_FSM2_TB, c_PLUS__p4_FSM4_TB, c_PLUS__p4_FSM5_TB, c_PLUS__p4_FSM6_TB;
	input c_MINUS__p8_FSM1_TB, c_MINUS__p8_FSM2_TB, c_MINUS__p8_FSM4_TB, c_MINUS__p8_FSM5_TB, c_MINUS__p8_FSM6_TB;
	input b_PLUS__p20_FSM5_TB;
	input a_MINUS__p15_FSM1_TB, a_MINUS__p15_FSM2_TB, a_MINUS__p16_FSM4_TB, a_MINUS__p15_FSM5_TB, a_MINUS__p15_FSM6_TB;

	// Regular output Signals //
	output e_q_PLUS;
	output e_x_MINUS;
	output e_x_MINUSa;
	output e_x_PLUSa;
	output e_y_MINUSa;
	output e_y_PLUS;
	output e_q_MINUS;
	// Transition Barrier outputs for output Signals //
	input e_q_PLUS_p6_FSM1_TB, e_q_PLUS_p6_FSM2_TB, e_q_PLUS_p6_FSM4_TB, e_q_PLUS_p6_FSM5_TB, e_q_PLUS_p6_FSM6_TB;
	input e_x_MINUS_p7_FSM1_TB, e_x_MINUS_p7_FSM2_TB, e_x_MINUS_p7_FSM4_TB, e_x_MINUS_p7_FSM5_TB, e_x_MINUS_p7_FSM6_TB;
	input e_x_MINUSa_p13_FSM1_TB, e_x_MINUSa_p13_FSM2_TB, e_x_MINUSa_p13_FSM5_TB, e_x_MINUSa_p13_FSM6_TB;
	input e_x_PLUSa_p9_FSM1_TB, e_x_PLUSa_p9_FSM2_TB, e_x_PLUSa_p9_FSM4_TB, e_x_PLUSa_p9_FSM5_TB;
	input e_y_MINUSa_p18_FSM1_TB, e_y_MINUSa_p18_FSM2_TB, e_y_MINUSa_p18_FSM4_TB, e_y_MINUSa_p18_FSM5_TB, e_y_MINUSa_p18_FSM6_TB;
	input e_y_PLUS_p1_FSM2_TB;
	input e_q_MINUS_p17_FSM1_TB, e_q_MINUS_p17_FSM2_TB, e_q_MINUS_p17_FSM4_TB, e_q_MINUS_p17_FSM5_TB, e_q_MINUS_p17_FSM6_TB;

	// FSMs' Synchronisation output Signals //
	output p5;
	output p18;
	output p17;
	output p3;
	output p20;
	output p15;
	output p9;
	output p13;
	output p8;
	output p7;
	output p11;
	output p6;

	reg e_q_PLUS;
	reg e_x_MINUS;
	reg e_x_MINUSa;
	reg e_x_PLUSa;
	reg e_y_MINUSa;
	reg e_y_PLUS;
	reg e_q_MINUS;
	wire p5;
	wire p18;
	wire p17;
	wire p3;
	wire p20;
	wire p15;
	wire p9;
	wire p13;
	wire p8;
	wire p7;
	wire p11;
	wire p6;

	wire b_MINUS__TB_sync;
	wire c_PLUS__TB_sync;
	wire c_MINUS__TB_sync;
	wire b_PLUS__TB_sync;
	wire a_MINUS__TB_sync;
	wire e_q_PLUS_TB_sync;
	wire e_x_MINUS_TB_sync;
	wire e_x_MINUSa_TB_sync;
	wire e_x_PLUSa_TB_sync;
	wire e_y_MINUSa_TB_sync;
	wire e_y_PLUS_TB_sync;
	wire e_q_MINUS_TB_sync;
	assign b_MINUS__TB_sync = b_MINUS_ & b_MINUS__p11_FSM1_TB & b_MINUS__p11_FSM2_TB & b_MINUS__p11_FSM4_TB & b_MINUS__p11_FSM5_TB & b_MINUS__p12_FSM6_TB;
	assign c_PLUS__TB_sync = c_PLUS_ & c_PLUS__p4_FSM1_TB & c_PLUS__p5_FSM2_TB & c_PLUS__p4_FSM4_TB & c_PLUS__p4_FSM5_TB & c_PLUS__p4_FSM6_TB;
	assign c_MINUS__TB_sync = c_MINUS_ & c_MINUS__p8_FSM1_TB & c_MINUS__p8_FSM2_TB & c_MINUS__p8_FSM4_TB & c_MINUS__p8_FSM5_TB & c_MINUS__p8_FSM6_TB;
	assign b_PLUS__TB_sync = b_PLUS_ & b_PLUS__p20_FSM5_TB;
	assign a_MINUS__TB_sync = a_MINUS_ & a_MINUS__p15_FSM1_TB & a_MINUS__p15_FSM2_TB & a_MINUS__p16_FSM4_TB & a_MINUS__p15_FSM5_TB & a_MINUS__p15_FSM6_TB;
	assign e_q_PLUS_TB_sync = e_q_PLUS_p6_FSM1_TB & e_q_PLUS_p6_FSM2_TB & e_q_PLUS_p6_FSM4_TB & e_q_PLUS_p6_FSM5_TB & e_q_PLUS_p6_FSM6_TB;
	assign e_x_MINUS_TB_sync = e_x_MINUS_p7_FSM1_TB & e_x_MINUS_p7_FSM2_TB & e_x_MINUS_p7_FSM4_TB & e_x_MINUS_p7_FSM5_TB & e_x_MINUS_p7_FSM6_TB;
	assign e_x_MINUSa_TB_sync = e_x_MINUSa_p13_FSM1_TB & e_x_MINUSa_p13_FSM2_TB & e_x_MINUSa_p13_FSM5_TB & e_x_MINUSa_p13_FSM6_TB;
	assign e_x_PLUSa_TB_sync = e_x_PLUSa_p9_FSM1_TB & e_x_PLUSa_p9_FSM2_TB & e_x_PLUSa_p9_FSM4_TB & e_x_PLUSa_p9_FSM5_TB;
	assign e_y_MINUSa_TB_sync = e_y_MINUSa_p18_FSM1_TB & e_y_MINUSa_p18_FSM2_TB & e_y_MINUSa_p18_FSM4_TB & e_y_MINUSa_p18_FSM5_TB & e_y_MINUSa_p18_FSM6_TB;
	assign e_y_PLUS_TB_sync = e_y_PLUS_p1_FSM2_TB;
	assign e_q_MINUS_TB_sync = e_q_MINUS_p17_FSM1_TB & e_q_MINUS_p17_FSM2_TB & e_q_MINUS_p17_FSM4_TB & e_q_MINUS_p17_FSM5_TB & e_q_MINUS_p17_FSM6_TB;

	parameter p5_1HOT_ENCODING = 12'd1; // 12'b000000000001 //
	parameter p18_1HOT_ENCODING = 12'd2; // 12'b000000000010 //
	parameter p17_1HOT_ENCODING = 12'd4; // 12'b000000000100 //
	parameter p3_1HOT_ENCODING = 12'd8; // 12'b000000001000 //
	parameter p20_1HOT_ENCODING = 12'd16; // 12'b000000010000 //
	parameter p15_1HOT_ENCODING = 12'd32; // 12'b000000100000 //
	parameter p9_1HOT_ENCODING = 12'd64; // 12'b000001000000 //
	parameter p13_1HOT_ENCODING = 12'd128; // 12'b000010000000 //
	parameter p8_1HOT_ENCODING = 12'd256; // 12'b000100000000 //
	parameter p7_1HOT_ENCODING = 12'd512; // 12'b001000000000 //
	parameter p11_1HOT_ENCODING = 12'd1024; // 12'b010000000000 //
	parameter p6_1HOT_ENCODING = 12'd2048; // 12'b100000000000 //

	reg [11 : 0]	state;
	reg [11 : 0]	next_state;

	always @(posedge clk)
		begin
			if (reset)
				begin
						state <= p20_1HOT_ENCODING;
				end
			else
				begin
						state <= next_state;
				end
		end

	assign p5 = (state == p5_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p18 = (state == p18_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p17 = (state == p17_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p3 = (state == p3_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p20 = (state == p20_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p15 = (state == p15_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p9 = (state == p9_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p13 = (state == p13_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p8 = (state == p8_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p7 = (state == p7_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p11 = (state == p11_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p6 = (state == p6_1HOT_ENCODING) ? 1'b1 : 1'b0;

	always @(state or b_MINUS__TB_sync or c_PLUS__TB_sync or c_MINUS__TB_sync or b_PLUS__TB_sync or a_MINUS__TB_sync or e_q_PLUS_TB_sync or e_x_MINUS_TB_sync or e_x_MINUSa_TB_sync or e_x_PLUSa_TB_sync or e_y_MINUSa_TB_sync or e_y_PLUS_TB_sync or e_q_MINUS_TB_sync)
		begin
			// MEALY FSMs - Blocking Operations //
			next_state = state;

			e_q_PLUS = 1'b0;
			e_x_MINUS = 1'b0;
			e_x_MINUSa = 1'b0;
			e_x_PLUSa = 1'b0;
			e_y_MINUSa = 1'b0;
			e_y_PLUS = 1'b0;
			e_q_MINUS = 1'b0;

			case (state)
				p5_1HOT_ENCODING: // 12'b000000000001: //
					begin
						if (c_PLUS__TB_sync)
							begin
								next_state = p6_1HOT_ENCODING;
							end
					end

				p18_1HOT_ENCODING: // 12'b000000000010: //
					begin
						if (e_y_MINUSa_TB_sync)
							begin
								e_y_MINUSa = 1'b1;
								next_state = p20_1HOT_ENCODING;
							end
					end

				p17_1HOT_ENCODING: // 12'b000000000100: //
					begin
						if (e_q_MINUS_TB_sync)
							begin
								e_q_MINUS = 1'b1;
								next_state = p18_1HOT_ENCODING;
							end
					end

				p3_1HOT_ENCODING: // 12'b000000001000: //
					begin
						if (e_y_PLUS_TB_sync)
							begin
								e_y_PLUS = 1'b1;
								next_state = p5_1HOT_ENCODING;
							end
					end

				p20_1HOT_ENCODING: // 12'b000000010000: //
					begin
						if (b_PLUS__TB_sync)
							begin
								next_state = p3_1HOT_ENCODING;
							end
					end

				p15_1HOT_ENCODING: // 12'b000000100000: //
					begin
						if (a_MINUS__TB_sync)
							begin
								next_state = p17_1HOT_ENCODING;
							end
					end

				p9_1HOT_ENCODING: // 12'b000001000000: //
					begin
						if (e_x_PLUSa_TB_sync)
							begin
								e_x_PLUSa = 1'b1;
								next_state = p11_1HOT_ENCODING;
							end
					end

				p13_1HOT_ENCODING: // 12'b000010000000: //
					begin
						if (e_x_MINUSa_TB_sync)
							begin
								e_x_MINUSa = 1'b1;
								next_state = p15_1HOT_ENCODING;
							end
					end

				p8_1HOT_ENCODING: // 12'b000100000000: //
					begin
						if (c_MINUS__TB_sync)
							begin
								next_state = p9_1HOT_ENCODING;
							end
					end

				p7_1HOT_ENCODING: // 12'b001000000000: //
					begin
						if (e_x_MINUS_TB_sync)
							begin
								e_x_MINUS = 1'b1;
								next_state = p8_1HOT_ENCODING;
							end
					end

				p11_1HOT_ENCODING: // 12'b010000000000: //
					begin
						if (b_MINUS__TB_sync)
							begin
								next_state = p13_1HOT_ENCODING;
							end
					end

				p6_1HOT_ENCODING: // 12'b100000000000: //
					begin
						if (e_q_PLUS_TB_sync)
							begin
								e_q_PLUS = 1'b1;
								next_state = p7_1HOT_ENCODING;
							end
					end

				default:
						begin
							next_state = 12'dx;
						end
			endcase
		end
endmodule

module fsm_mealy_synth_04 (
	clk,
	reset,
	b_MINUS_, b_MINUS__p11_FSM1_TB, b_MINUS__p11_FSM2_TB, b_MINUS__p11_FSM3_TB, b_MINUS__p11_FSM5_TB, b_MINUS__p12_FSM6_TB,
	c_PLUS_, c_PLUS__p4_FSM1_TB, c_PLUS__p5_FSM2_TB, c_PLUS__p5_FSM3_TB, c_PLUS__p4_FSM5_TB, c_PLUS__p4_FSM6_TB,
	c_MINUS_, c_MINUS__p8_FSM1_TB, c_MINUS__p8_FSM2_TB, c_MINUS__p8_FSM3_TB, c_MINUS__p8_FSM5_TB, c_MINUS__p8_FSM6_TB,
	a_PLUS_, a_PLUS__p19_FSM1_TB, a_PLUS__p19_FSM2_TB, a_PLUS__p19_FSM6_TB,
	a_MINUS_, a_MINUS__p15_FSM1_TB, a_MINUS__p15_FSM2_TB, a_MINUS__p15_FSM3_TB, a_MINUS__p15_FSM5_TB, a_MINUS__p15_FSM6_TB,
	e_x_PLUS, e_x_PLUS_p0_FSM1_TB, e_x_PLUS_p2_FSM5_TB, e_x_PLUS_p0_FSM6_TB,
	e_q_PLUS, e_q_PLUS_p6_FSM1_TB, e_q_PLUS_p6_FSM2_TB, e_q_PLUS_p6_FSM3_TB, e_q_PLUS_p6_FSM5_TB, e_q_PLUS_p6_FSM6_TB,
	e_x_MINUS, e_x_MINUS_p7_FSM1_TB, e_x_MINUS_p7_FSM2_TB, e_x_MINUS_p7_FSM3_TB, e_x_MINUS_p7_FSM5_TB, e_x_MINUS_p7_FSM6_TB,
	e_x_PLUSa, e_x_PLUSa_p9_FSM1_TB, e_x_PLUSa_p9_FSM2_TB, e_x_PLUSa_p9_FSM3_TB, e_x_PLUSa_p9_FSM5_TB,
	e_y_MINUSa, e_y_MINUSa_p18_FSM1_TB, e_y_MINUSa_p18_FSM2_TB, e_y_MINUSa_p18_FSM3_TB, e_y_MINUSa_p18_FSM5_TB, e_y_MINUSa_p18_FSM6_TB,
	e_y_PLUSa,
	e_q_MINUS, e_q_MINUS_p17_FSM1_TB, e_q_MINUS_p17_FSM2_TB, e_q_MINUS_p17_FSM3_TB, e_q_MINUS_p17_FSM5_TB, e_q_MINUS_p17_FSM6_TB,
	p19,
	p18,
	p4,
	p17,
	p16,
	p0,
	p9,
	p8,
	p7,
	p11,
	p6
);

	// Regular Synchronous FSM input Signals //
	input clk;
	input reset;

	// Regular input Signals //
	input b_MINUS_;
	input c_PLUS_;
	input c_MINUS_;
	input a_PLUS_;
	input a_MINUS_;
	// Transition Barrier Inputs for input Signals //
	input b_MINUS__p11_FSM1_TB, b_MINUS__p11_FSM2_TB, b_MINUS__p11_FSM3_TB, b_MINUS__p11_FSM5_TB, b_MINUS__p12_FSM6_TB;
	input c_PLUS__p4_FSM1_TB, c_PLUS__p5_FSM2_TB, c_PLUS__p5_FSM3_TB, c_PLUS__p4_FSM5_TB, c_PLUS__p4_FSM6_TB;
	input c_MINUS__p8_FSM1_TB, c_MINUS__p8_FSM2_TB, c_MINUS__p8_FSM3_TB, c_MINUS__p8_FSM5_TB, c_MINUS__p8_FSM6_TB;
	input a_PLUS__p19_FSM1_TB, a_PLUS__p19_FSM2_TB, a_PLUS__p19_FSM6_TB;
	input a_MINUS__p15_FSM1_TB, a_MINUS__p15_FSM2_TB, a_MINUS__p15_FSM3_TB, a_MINUS__p15_FSM5_TB, a_MINUS__p15_FSM6_TB;

	// Regular output Signals //
	output e_x_PLUS;
	output e_q_PLUS;
	output e_x_MINUS;
	output e_x_PLUSa;
	output e_y_MINUSa;
	output e_y_PLUSa;
	output e_q_MINUS;
	// Transition Barrier outputs for output Signals //
	input e_x_PLUS_p0_FSM1_TB, e_x_PLUS_p2_FSM5_TB, e_x_PLUS_p0_FSM6_TB;
	input e_q_PLUS_p6_FSM1_TB, e_q_PLUS_p6_FSM2_TB, e_q_PLUS_p6_FSM3_TB, e_q_PLUS_p6_FSM5_TB, e_q_PLUS_p6_FSM6_TB;
	input e_x_MINUS_p7_FSM1_TB, e_x_MINUS_p7_FSM2_TB, e_x_MINUS_p7_FSM3_TB, e_x_MINUS_p7_FSM5_TB, e_x_MINUS_p7_FSM6_TB;
	input e_x_PLUSa_p9_FSM1_TB, e_x_PLUSa_p9_FSM2_TB, e_x_PLUSa_p9_FSM3_TB, e_x_PLUSa_p9_FSM5_TB;
	input e_y_MINUSa_p18_FSM1_TB, e_y_MINUSa_p18_FSM2_TB, e_y_MINUSa_p18_FSM3_TB, e_y_MINUSa_p18_FSM5_TB, e_y_MINUSa_p18_FSM6_TB;
	input e_q_MINUS_p17_FSM1_TB, e_q_MINUS_p17_FSM2_TB, e_q_MINUS_p17_FSM3_TB, e_q_MINUS_p17_FSM5_TB, e_q_MINUS_p17_FSM6_TB;

	// FSMs' Synchronisation output Signals //
	output p19;
	output p18;
	output p4;
	output p17;
	output p16;
	output p0;
	output p9;
	output p8;
	output p7;
	output p11;
	output p6;

	reg e_x_PLUS;
	reg e_q_PLUS;
	reg e_x_MINUS;
	reg e_x_PLUSa;
	reg e_y_MINUSa;
	reg e_y_PLUSa;
	reg e_q_MINUS;
	wire p19;
	wire p18;
	wire p4;
	wire p17;
	wire p16;
	wire p0;
	wire p9;
	wire p8;
	wire p7;
	wire p11;
	wire p6;

	wire b_MINUS__TB_sync;
	wire c_PLUS__TB_sync;
	wire c_MINUS__TB_sync;
	wire a_PLUS__TB_sync;
	wire a_MINUS__TB_sync;
	wire e_x_PLUS_TB_sync;
	wire e_q_PLUS_TB_sync;
	wire e_x_MINUS_TB_sync;
	wire e_x_PLUSa_TB_sync;
	wire e_y_MINUSa_TB_sync;
	wire e_q_MINUS_TB_sync;
	assign b_MINUS__TB_sync = b_MINUS_ & b_MINUS__p11_FSM1_TB & b_MINUS__p11_FSM2_TB & b_MINUS__p11_FSM3_TB & b_MINUS__p11_FSM5_TB & b_MINUS__p12_FSM6_TB;
	assign c_PLUS__TB_sync = c_PLUS_ & c_PLUS__p4_FSM1_TB & c_PLUS__p5_FSM2_TB & c_PLUS__p5_FSM3_TB & c_PLUS__p4_FSM5_TB & c_PLUS__p4_FSM6_TB;
	assign c_MINUS__TB_sync = c_MINUS_ & c_MINUS__p8_FSM1_TB & c_MINUS__p8_FSM2_TB & c_MINUS__p8_FSM3_TB & c_MINUS__p8_FSM5_TB & c_MINUS__p8_FSM6_TB;
	assign a_PLUS__TB_sync = a_PLUS_ & a_PLUS__p19_FSM1_TB & a_PLUS__p19_FSM2_TB & a_PLUS__p19_FSM6_TB;
	assign a_MINUS__TB_sync = a_MINUS_ & a_MINUS__p15_FSM1_TB & a_MINUS__p15_FSM2_TB & a_MINUS__p15_FSM3_TB & a_MINUS__p15_FSM5_TB & a_MINUS__p15_FSM6_TB;
	assign e_x_PLUS_TB_sync = e_x_PLUS_p0_FSM1_TB & e_x_PLUS_p2_FSM5_TB & e_x_PLUS_p0_FSM6_TB;
	assign e_q_PLUS_TB_sync = e_q_PLUS_p6_FSM1_TB & e_q_PLUS_p6_FSM2_TB & e_q_PLUS_p6_FSM3_TB & e_q_PLUS_p6_FSM5_TB & e_q_PLUS_p6_FSM6_TB;
	assign e_x_MINUS_TB_sync = e_x_MINUS_p7_FSM1_TB & e_x_MINUS_p7_FSM2_TB & e_x_MINUS_p7_FSM3_TB & e_x_MINUS_p7_FSM5_TB & e_x_MINUS_p7_FSM6_TB;
	assign e_x_PLUSa_TB_sync = e_x_PLUSa_p9_FSM1_TB & e_x_PLUSa_p9_FSM2_TB & e_x_PLUSa_p9_FSM3_TB & e_x_PLUSa_p9_FSM5_TB;
	assign e_y_MINUSa_TB_sync = e_y_MINUSa_p18_FSM1_TB & e_y_MINUSa_p18_FSM2_TB & e_y_MINUSa_p18_FSM3_TB & e_y_MINUSa_p18_FSM5_TB & e_y_MINUSa_p18_FSM6_TB;
	assign e_q_MINUS_TB_sync = e_q_MINUS_p17_FSM1_TB & e_q_MINUS_p17_FSM2_TB & e_q_MINUS_p17_FSM3_TB & e_q_MINUS_p17_FSM5_TB & e_q_MINUS_p17_FSM6_TB;

	parameter p19_1HOT_ENCODING = 12'd1; // 12'b000000000001 //
	parameter p18_1HOT_ENCODING = 12'd2; // 12'b000000000010 //
	parameter p4_1HOT_ENCODING = 12'd4; // 12'b000000000100 //
	parameter p17_1HOT_ENCODING = 12'd8; // 12'b000000001000 //
	parameter p16_1HOT_ENCODING = 12'd16; // 12'b000000010000 //
	parameter p14_1HOT_ENCODING = 12'd32; // 12'b000000100000 //
	parameter p0_1HOT_ENCODING = 12'd64; // 12'b000001000000 //
	parameter p9_1HOT_ENCODING = 12'd128; // 12'b000010000000 //
	parameter p8_1HOT_ENCODING = 12'd256; // 12'b000100000000 //
	parameter p7_1HOT_ENCODING = 12'd512; // 12'b001000000000 //
	parameter p11_1HOT_ENCODING = 12'd1024; // 12'b010000000000 //
	parameter p6_1HOT_ENCODING = 12'd2048; // 12'b100000000000 //

	reg [11 : 0]	state;
	reg [11 : 0]	next_state;

	always @(posedge clk)
		begin
			if (reset)
				begin
						state <= p19_1HOT_ENCODING;
				end
			else
				begin
						state <= next_state;
				end
		end

	assign p19 = (state == p19_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p18 = (state == p18_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p4 = (state == p4_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p17 = (state == p17_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p16 = (state == p16_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p0 = (state == p0_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p9 = (state == p9_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p8 = (state == p8_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p7 = (state == p7_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p11 = (state == p11_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p6 = (state == p6_1HOT_ENCODING) ? 1'b1 : 1'b0;

	always @(state or b_MINUS__TB_sync or c_PLUS__TB_sync or c_MINUS__TB_sync or a_PLUS__TB_sync or a_MINUS__TB_sync or e_x_PLUS_TB_sync or e_q_PLUS_TB_sync or e_x_MINUS_TB_sync or e_x_PLUSa_TB_sync or e_y_MINUSa_TB_sync or e_q_MINUS_TB_sync)
		begin
			// MEALY FSMs - Blocking Operations //
			next_state = state;

			e_x_PLUS = 1'b0;
			e_q_PLUS = 1'b0;
			e_x_MINUS = 1'b0;
			e_x_PLUSa = 1'b0;
			e_y_MINUSa = 1'b0;
			e_y_PLUSa = 1'b0;
			e_q_MINUS = 1'b0;

			case (state)
				p19_1HOT_ENCODING: // 12'b000000000001: //
					begin
						if (a_PLUS__TB_sync)
							begin
								next_state = p0_1HOT_ENCODING;
							end
					end

				p18_1HOT_ENCODING: // 12'b000000000010: //
					begin
						if (e_y_MINUSa_TB_sync)
							begin
								e_y_MINUSa = 1'b1;
								next_state = p19_1HOT_ENCODING;
							end
					end

				p4_1HOT_ENCODING: // 12'b000000000100: //
					begin
						if (c_PLUS__TB_sync)
							begin
								next_state = p6_1HOT_ENCODING;
							end
					end

				p17_1HOT_ENCODING: // 12'b000000001000: //
					begin
						if (e_q_MINUS_TB_sync)
							begin
								e_q_MINUS = 1'b1;
								next_state = p18_1HOT_ENCODING;
							end
					end

				p16_1HOT_ENCODING: // 12'b000000010000: //
					begin
						if (a_MINUS__TB_sync)
							begin
								next_state = p17_1HOT_ENCODING;
							end
					end

				p14_1HOT_ENCODING: // 12'b000000100000: //
					begin
								e_y_PLUSa = 1'b1;
								next_state = p16_1HOT_ENCODING;
					end

				p0_1HOT_ENCODING: // 12'b000001000000: //
					begin
						if (e_x_PLUS_TB_sync)
							begin
								e_x_PLUS = 1'b1;
								next_state = p4_1HOT_ENCODING;
							end
					end

				p9_1HOT_ENCODING: // 12'b000010000000: //
					begin
						if (e_x_PLUSa_TB_sync)
							begin
								e_x_PLUSa = 1'b1;
								next_state = p11_1HOT_ENCODING;
							end
					end

				p8_1HOT_ENCODING: // 12'b000100000000: //
					begin
						if (c_MINUS__TB_sync)
							begin
								next_state = p9_1HOT_ENCODING;
							end
					end

				p7_1HOT_ENCODING: // 12'b001000000000: //
					begin
						if (e_x_MINUS_TB_sync)
							begin
								e_x_MINUS = 1'b1;
								next_state = p8_1HOT_ENCODING;
							end
					end

				p11_1HOT_ENCODING: // 12'b010000000000: //
					begin
						if (b_MINUS__TB_sync)
							begin
								next_state = p14_1HOT_ENCODING;
							end
					end

				p6_1HOT_ENCODING: // 12'b100000000000: //
					begin
						if (e_q_PLUS_TB_sync)
							begin
								e_q_PLUS = 1'b1;
								next_state = p7_1HOT_ENCODING;
							end
					end

				default:
						begin
							next_state = 12'dx;
						end
			endcase
		end
endmodule

module fsm_mealy_synth_05 (
	clk,
	reset,
	b_MINUS_, b_MINUS__p11_FSM1_TB, b_MINUS__p11_FSM2_TB, b_MINUS__p11_FSM3_TB, b_MINUS__p11_FSM4_TB, b_MINUS__p12_FSM6_TB,
	c_PLUS_, c_PLUS__p4_FSM1_TB, c_PLUS__p5_FSM2_TB, c_PLUS__p5_FSM3_TB, c_PLUS__p4_FSM4_TB, c_PLUS__p4_FSM6_TB,
	c_MINUS_, c_MINUS__p8_FSM1_TB, c_MINUS__p8_FSM2_TB, c_MINUS__p8_FSM3_TB, c_MINUS__p8_FSM4_TB, c_MINUS__p8_FSM6_TB,
	b_PLUS_, b_PLUS__p20_FSM3_TB,
	a_MINUS_, a_MINUS__p15_FSM1_TB, a_MINUS__p15_FSM2_TB, a_MINUS__p15_FSM3_TB, a_MINUS__p16_FSM4_TB, a_MINUS__p15_FSM6_TB,
	e_x_PLUS, e_x_PLUS_p0_FSM1_TB, e_x_PLUS_p0_FSM4_TB, e_x_PLUS_p0_FSM6_TB,
	e_q_PLUS, e_q_PLUS_p6_FSM1_TB, e_q_PLUS_p6_FSM2_TB, e_q_PLUS_p6_FSM3_TB, e_q_PLUS_p6_FSM4_TB, e_q_PLUS_p6_FSM6_TB,
	e_x_MINUS, e_x_MINUS_p7_FSM1_TB, e_x_MINUS_p7_FSM2_TB, e_x_MINUS_p7_FSM3_TB, e_x_MINUS_p7_FSM4_TB, e_x_MINUS_p7_FSM6_TB,
	e_x_MINUSa, e_x_MINUSa_p13_FSM1_TB, e_x_MINUSa_p13_FSM2_TB, e_x_MINUSa_p13_FSM3_TB, e_x_MINUSa_p13_FSM6_TB,
	e_x_PLUSa, e_x_PLUSa_p9_FSM1_TB, e_x_PLUSa_p9_FSM2_TB, e_x_PLUSa_p9_FSM3_TB, e_x_PLUSa_p9_FSM4_TB,
	e_y_MINUSa, e_y_MINUSa_p18_FSM1_TB, e_y_MINUSa_p18_FSM2_TB, e_y_MINUSa_p18_FSM3_TB, e_y_MINUSa_p18_FSM4_TB, e_y_MINUSa_p18_FSM6_TB,
	e_q_MINUS, e_q_MINUS_p17_FSM1_TB, e_q_MINUS_p17_FSM2_TB, e_q_MINUS_p17_FSM3_TB, e_q_MINUS_p17_FSM4_TB, e_q_MINUS_p17_FSM6_TB,
	p18,
	p4,
	p17,
	p2,
	p20,
	p15,
	p9,
	p13,
	p8,
	p7,
	p11,
	p6
);

	// Regular Synchronous FSM input Signals //
	input clk;
	input reset;

	// Regular input Signals //
	input b_MINUS_;
	input c_PLUS_;
	input c_MINUS_;
	input b_PLUS_;
	input a_MINUS_;
	// Transition Barrier Inputs for input Signals //
	input b_MINUS__p11_FSM1_TB, b_MINUS__p11_FSM2_TB, b_MINUS__p11_FSM3_TB, b_MINUS__p11_FSM4_TB, b_MINUS__p12_FSM6_TB;
	input c_PLUS__p4_FSM1_TB, c_PLUS__p5_FSM2_TB, c_PLUS__p5_FSM3_TB, c_PLUS__p4_FSM4_TB, c_PLUS__p4_FSM6_TB;
	input c_MINUS__p8_FSM1_TB, c_MINUS__p8_FSM2_TB, c_MINUS__p8_FSM3_TB, c_MINUS__p8_FSM4_TB, c_MINUS__p8_FSM6_TB;
	input b_PLUS__p20_FSM3_TB;
	input a_MINUS__p15_FSM1_TB, a_MINUS__p15_FSM2_TB, a_MINUS__p15_FSM3_TB, a_MINUS__p16_FSM4_TB, a_MINUS__p15_FSM6_TB;

	// Regular output Signals //
	output e_x_PLUS;
	output e_q_PLUS;
	output e_x_MINUS;
	output e_x_MINUSa;
	output e_x_PLUSa;
	output e_y_MINUSa;
	output e_q_MINUS;
	// Transition Barrier outputs for output Signals //
	input e_x_PLUS_p0_FSM1_TB, e_x_PLUS_p0_FSM4_TB, e_x_PLUS_p0_FSM6_TB;
	input e_q_PLUS_p6_FSM1_TB, e_q_PLUS_p6_FSM2_TB, e_q_PLUS_p6_FSM3_TB, e_q_PLUS_p6_FSM4_TB, e_q_PLUS_p6_FSM6_TB;
	input e_x_MINUS_p7_FSM1_TB, e_x_MINUS_p7_FSM2_TB, e_x_MINUS_p7_FSM3_TB, e_x_MINUS_p7_FSM4_TB, e_x_MINUS_p7_FSM6_TB;
	input e_x_MINUSa_p13_FSM1_TB, e_x_MINUSa_p13_FSM2_TB, e_x_MINUSa_p13_FSM3_TB, e_x_MINUSa_p13_FSM6_TB;
	input e_x_PLUSa_p9_FSM1_TB, e_x_PLUSa_p9_FSM2_TB, e_x_PLUSa_p9_FSM3_TB, e_x_PLUSa_p9_FSM4_TB;
	input e_y_MINUSa_p18_FSM1_TB, e_y_MINUSa_p18_FSM2_TB, e_y_MINUSa_p18_FSM3_TB, e_y_MINUSa_p18_FSM4_TB, e_y_MINUSa_p18_FSM6_TB;
	input e_q_MINUS_p17_FSM1_TB, e_q_MINUS_p17_FSM2_TB, e_q_MINUS_p17_FSM3_TB, e_q_MINUS_p17_FSM4_TB, e_q_MINUS_p17_FSM6_TB;

	// FSMs' Synchronisation output Signals //
	output p18;
	output p4;
	output p17;
	output p2;
	output p20;
	output p15;
	output p9;
	output p13;
	output p8;
	output p7;
	output p11;
	output p6;

	reg e_x_PLUS;
	reg e_q_PLUS;
	reg e_x_MINUS;
	reg e_x_MINUSa;
	reg e_x_PLUSa;
	reg e_y_MINUSa;
	reg e_q_MINUS;
	wire p18;
	wire p4;
	wire p17;
	wire p2;
	wire p20;
	wire p15;
	wire p9;
	wire p13;
	wire p8;
	wire p7;
	wire p11;
	wire p6;

	wire b_MINUS__TB_sync;
	wire c_PLUS__TB_sync;
	wire c_MINUS__TB_sync;
	wire b_PLUS__TB_sync;
	wire a_MINUS__TB_sync;
	wire e_x_PLUS_TB_sync;
	wire e_q_PLUS_TB_sync;
	wire e_x_MINUS_TB_sync;
	wire e_x_MINUSa_TB_sync;
	wire e_x_PLUSa_TB_sync;
	wire e_y_MINUSa_TB_sync;
	wire e_q_MINUS_TB_sync;
	assign b_MINUS__TB_sync = b_MINUS_ & b_MINUS__p11_FSM1_TB & b_MINUS__p11_FSM2_TB & b_MINUS__p11_FSM3_TB & b_MINUS__p11_FSM4_TB & b_MINUS__p12_FSM6_TB;
	assign c_PLUS__TB_sync = c_PLUS_ & c_PLUS__p4_FSM1_TB & c_PLUS__p5_FSM2_TB & c_PLUS__p5_FSM3_TB & c_PLUS__p4_FSM4_TB & c_PLUS__p4_FSM6_TB;
	assign c_MINUS__TB_sync = c_MINUS_ & c_MINUS__p8_FSM1_TB & c_MINUS__p8_FSM2_TB & c_MINUS__p8_FSM3_TB & c_MINUS__p8_FSM4_TB & c_MINUS__p8_FSM6_TB;
	assign b_PLUS__TB_sync = b_PLUS_ & b_PLUS__p20_FSM3_TB;
	assign a_MINUS__TB_sync = a_MINUS_ & a_MINUS__p15_FSM1_TB & a_MINUS__p15_FSM2_TB & a_MINUS__p15_FSM3_TB & a_MINUS__p16_FSM4_TB & a_MINUS__p15_FSM6_TB;
	assign e_x_PLUS_TB_sync = e_x_PLUS_p0_FSM1_TB & e_x_PLUS_p0_FSM4_TB & e_x_PLUS_p0_FSM6_TB;
	assign e_q_PLUS_TB_sync = e_q_PLUS_p6_FSM1_TB & e_q_PLUS_p6_FSM2_TB & e_q_PLUS_p6_FSM3_TB & e_q_PLUS_p6_FSM4_TB & e_q_PLUS_p6_FSM6_TB;
	assign e_x_MINUS_TB_sync = e_x_MINUS_p7_FSM1_TB & e_x_MINUS_p7_FSM2_TB & e_x_MINUS_p7_FSM3_TB & e_x_MINUS_p7_FSM4_TB & e_x_MINUS_p7_FSM6_TB;
	assign e_x_MINUSa_TB_sync = e_x_MINUSa_p13_FSM1_TB & e_x_MINUSa_p13_FSM2_TB & e_x_MINUSa_p13_FSM3_TB & e_x_MINUSa_p13_FSM6_TB;
	assign e_x_PLUSa_TB_sync = e_x_PLUSa_p9_FSM1_TB & e_x_PLUSa_p9_FSM2_TB & e_x_PLUSa_p9_FSM3_TB & e_x_PLUSa_p9_FSM4_TB;
	assign e_y_MINUSa_TB_sync = e_y_MINUSa_p18_FSM1_TB & e_y_MINUSa_p18_FSM2_TB & e_y_MINUSa_p18_FSM3_TB & e_y_MINUSa_p18_FSM4_TB & e_y_MINUSa_p18_FSM6_TB;
	assign e_q_MINUS_TB_sync = e_q_MINUS_p17_FSM1_TB & e_q_MINUS_p17_FSM2_TB & e_q_MINUS_p17_FSM3_TB & e_q_MINUS_p17_FSM4_TB & e_q_MINUS_p17_FSM6_TB;

	parameter p18_1HOT_ENCODING = 12'd1; // 12'b000000000001 //
	parameter p4_1HOT_ENCODING = 12'd2; // 12'b000000000010 //
	parameter p17_1HOT_ENCODING = 12'd4; // 12'b000000000100 //
	parameter p2_1HOT_ENCODING = 12'd8; // 12'b000000001000 //
	parameter p20_1HOT_ENCODING = 12'd16; // 12'b000000010000 //
	parameter p15_1HOT_ENCODING = 12'd32; // 12'b000000100000 //
	parameter p9_1HOT_ENCODING = 12'd64; // 12'b000001000000 //
	parameter p13_1HOT_ENCODING = 12'd128; // 12'b000010000000 //
	parameter p8_1HOT_ENCODING = 12'd256; // 12'b000100000000 //
	parameter p7_1HOT_ENCODING = 12'd512; // 12'b001000000000 //
	parameter p11_1HOT_ENCODING = 12'd1024; // 12'b010000000000 //
	parameter p6_1HOT_ENCODING = 12'd2048; // 12'b100000000000 //

	reg [11 : 0]	state;
	reg [11 : 0]	next_state;

	always @(posedge clk)
		begin
			if (reset)
				begin
						state <= p20_1HOT_ENCODING;
				end
			else
				begin
						state <= next_state;
				end
		end

	assign p18 = (state == p18_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p4 = (state == p4_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p17 = (state == p17_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p2 = (state == p2_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p20 = (state == p20_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p15 = (state == p15_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p9 = (state == p9_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p13 = (state == p13_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p8 = (state == p8_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p7 = (state == p7_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p11 = (state == p11_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p6 = (state == p6_1HOT_ENCODING) ? 1'b1 : 1'b0;

	always @(state or b_MINUS__TB_sync or c_PLUS__TB_sync or c_MINUS__TB_sync or b_PLUS__TB_sync or a_MINUS__TB_sync or e_x_PLUS_TB_sync or e_q_PLUS_TB_sync or e_x_MINUS_TB_sync or e_x_MINUSa_TB_sync or e_x_PLUSa_TB_sync or e_y_MINUSa_TB_sync or e_q_MINUS_TB_sync)
		begin
			// MEALY FSMs - Blocking Operations //
			next_state = state;

			e_x_PLUS = 1'b0;
			e_q_PLUS = 1'b0;
			e_x_MINUS = 1'b0;
			e_x_MINUSa = 1'b0;
			e_x_PLUSa = 1'b0;
			e_y_MINUSa = 1'b0;
			e_q_MINUS = 1'b0;

			case (state)
				p18_1HOT_ENCODING: // 12'b000000000001: //
					begin
						if (e_y_MINUSa_TB_sync)
							begin
								e_y_MINUSa = 1'b1;
								next_state = p20_1HOT_ENCODING;
							end
					end

				p4_1HOT_ENCODING: // 12'b000000000010: //
					begin
						if (c_PLUS__TB_sync)
							begin
								next_state = p6_1HOT_ENCODING;
							end
					end

				p17_1HOT_ENCODING: // 12'b000000000100: //
					begin
						if (e_q_MINUS_TB_sync)
							begin
								e_q_MINUS = 1'b1;
								next_state = p18_1HOT_ENCODING;
							end
					end

				p2_1HOT_ENCODING: // 12'b000000001000: //
					begin
						if (e_x_PLUS_TB_sync)
							begin
								e_x_PLUS = 1'b1;
								next_state = p4_1HOT_ENCODING;
							end
					end

				p20_1HOT_ENCODING: // 12'b000000010000: //
					begin
						if (b_PLUS__TB_sync)
							begin
								next_state = p2_1HOT_ENCODING;
							end
					end

				p15_1HOT_ENCODING: // 12'b000000100000: //
					begin
						if (a_MINUS__TB_sync)
							begin
								next_state = p17_1HOT_ENCODING;
							end
					end

				p9_1HOT_ENCODING: // 12'b000001000000: //
					begin
						if (e_x_PLUSa_TB_sync)
							begin
								e_x_PLUSa = 1'b1;
								next_state = p11_1HOT_ENCODING;
							end
					end

				p13_1HOT_ENCODING: // 12'b000010000000: //
					begin
						if (e_x_MINUSa_TB_sync)
							begin
								e_x_MINUSa = 1'b1;
								next_state = p15_1HOT_ENCODING;
							end
					end

				p8_1HOT_ENCODING: // 12'b000100000000: //
					begin
						if (c_MINUS__TB_sync)
							begin
								next_state = p9_1HOT_ENCODING;
							end
					end

				p7_1HOT_ENCODING: // 12'b001000000000: //
					begin
						if (e_x_MINUS_TB_sync)
							begin
								e_x_MINUS = 1'b1;
								next_state = p8_1HOT_ENCODING;
							end
					end

				p11_1HOT_ENCODING: // 12'b010000000000: //
					begin
						if (b_MINUS__TB_sync)
							begin
								next_state = p13_1HOT_ENCODING;
							end
					end

				p6_1HOT_ENCODING: // 12'b100000000000: //
					begin
						if (e_q_PLUS_TB_sync)
							begin
								e_q_PLUS = 1'b1;
								next_state = p7_1HOT_ENCODING;
							end
					end

				default:
						begin
							next_state = 12'dx;
						end
			endcase
		end
endmodule

module fsm_mealy_synth_06 (
	clk,
	reset,
	b_MINUS_, b_MINUS__p11_FSM1_TB, b_MINUS__p11_FSM2_TB, b_MINUS__p11_FSM3_TB, b_MINUS__p11_FSM4_TB, b_MINUS__p11_FSM5_TB,
	c_PLUS_, c_PLUS__p4_FSM1_TB, c_PLUS__p5_FSM2_TB, c_PLUS__p5_FSM3_TB, c_PLUS__p4_FSM4_TB, c_PLUS__p4_FSM5_TB,
	c_MINUS_, c_MINUS__p8_FSM1_TB, c_MINUS__p8_FSM2_TB, c_MINUS__p8_FSM3_TB, c_MINUS__p8_FSM4_TB, c_MINUS__p8_FSM5_TB,
	a_PLUS_, a_PLUS__p19_FSM1_TB, a_PLUS__p19_FSM2_TB, a_PLUS__p19_FSM4_TB,
	a_MINUS_, a_MINUS__p15_FSM1_TB, a_MINUS__p15_FSM2_TB, a_MINUS__p15_FSM3_TB, a_MINUS__p16_FSM4_TB, a_MINUS__p15_FSM5_TB,
	e_x_PLUS, e_x_PLUS_p0_FSM1_TB, e_x_PLUS_p0_FSM4_TB, e_x_PLUS_p2_FSM5_TB,
	e_q_PLUS, e_q_PLUS_p6_FSM1_TB, e_q_PLUS_p6_FSM2_TB, e_q_PLUS_p6_FSM3_TB, e_q_PLUS_p6_FSM4_TB, e_q_PLUS_p6_FSM5_TB,
	e_x_MINUS, e_x_MINUS_p7_FSM1_TB, e_x_MINUS_p7_FSM2_TB, e_x_MINUS_p7_FSM3_TB, e_x_MINUS_p7_FSM4_TB, e_x_MINUS_p7_FSM5_TB,
	e_x_MINUSa, e_x_MINUSa_p13_FSM1_TB, e_x_MINUSa_p13_FSM2_TB, e_x_MINUSa_p13_FSM3_TB, e_x_MINUSa_p13_FSM5_TB,
	e_y_MINUS,
	e_y_MINUSa, e_y_MINUSa_p18_FSM1_TB, e_y_MINUSa_p18_FSM2_TB, e_y_MINUSa_p18_FSM3_TB, e_y_MINUSa_p18_FSM4_TB, e_y_MINUSa_p18_FSM5_TB,
	e_q_MINUS, e_q_MINUS_p17_FSM1_TB, e_q_MINUS_p17_FSM2_TB, e_q_MINUS_p17_FSM3_TB, e_q_MINUS_p17_FSM4_TB, e_q_MINUS_p17_FSM5_TB,
	p19,
	p18,
	p4,
	p17,
	p15,
	p0,
	p13,
	p8,
	p12,
	p7,
	p6
);

	// Regular Synchronous FSM input Signals //
	input clk;
	input reset;

	// Regular input Signals //
	input b_MINUS_;
	input c_PLUS_;
	input c_MINUS_;
	input a_PLUS_;
	input a_MINUS_;
	// Transition Barrier Inputs for input Signals //
	input b_MINUS__p11_FSM1_TB, b_MINUS__p11_FSM2_TB, b_MINUS__p11_FSM3_TB, b_MINUS__p11_FSM4_TB, b_MINUS__p11_FSM5_TB;
	input c_PLUS__p4_FSM1_TB, c_PLUS__p5_FSM2_TB, c_PLUS__p5_FSM3_TB, c_PLUS__p4_FSM4_TB, c_PLUS__p4_FSM5_TB;
	input c_MINUS__p8_FSM1_TB, c_MINUS__p8_FSM2_TB, c_MINUS__p8_FSM3_TB, c_MINUS__p8_FSM4_TB, c_MINUS__p8_FSM5_TB;
	input a_PLUS__p19_FSM1_TB, a_PLUS__p19_FSM2_TB, a_PLUS__p19_FSM4_TB;
	input a_MINUS__p15_FSM1_TB, a_MINUS__p15_FSM2_TB, a_MINUS__p15_FSM3_TB, a_MINUS__p16_FSM4_TB, a_MINUS__p15_FSM5_TB;

	// Regular output Signals //
	output e_x_PLUS;
	output e_q_PLUS;
	output e_x_MINUS;
	output e_x_MINUSa;
	output e_y_MINUS;
	output e_y_MINUSa;
	output e_q_MINUS;
	// Transition Barrier outputs for output Signals //
	input e_x_PLUS_p0_FSM1_TB, e_x_PLUS_p0_FSM4_TB, e_x_PLUS_p2_FSM5_TB;
	input e_q_PLUS_p6_FSM1_TB, e_q_PLUS_p6_FSM2_TB, e_q_PLUS_p6_FSM3_TB, e_q_PLUS_p6_FSM4_TB, e_q_PLUS_p6_FSM5_TB;
	input e_x_MINUS_p7_FSM1_TB, e_x_MINUS_p7_FSM2_TB, e_x_MINUS_p7_FSM3_TB, e_x_MINUS_p7_FSM4_TB, e_x_MINUS_p7_FSM5_TB;
	input e_x_MINUSa_p13_FSM1_TB, e_x_MINUSa_p13_FSM2_TB, e_x_MINUSa_p13_FSM3_TB, e_x_MINUSa_p13_FSM5_TB;
	input e_y_MINUSa_p18_FSM1_TB, e_y_MINUSa_p18_FSM2_TB, e_y_MINUSa_p18_FSM3_TB, e_y_MINUSa_p18_FSM4_TB, e_y_MINUSa_p18_FSM5_TB;
	input e_q_MINUS_p17_FSM1_TB, e_q_MINUS_p17_FSM2_TB, e_q_MINUS_p17_FSM3_TB, e_q_MINUS_p17_FSM4_TB, e_q_MINUS_p17_FSM5_TB;

	// FSMs' Synchronisation output Signals //
	output p19;
	output p18;
	output p4;
	output p17;
	output p15;
	output p0;
	output p13;
	output p8;
	output p12;
	output p7;
	output p6;

	reg e_x_PLUS;
	reg e_q_PLUS;
	reg e_x_MINUS;
	reg e_x_MINUSa;
	reg e_y_MINUS;
	reg e_y_MINUSa;
	reg e_q_MINUS;
	wire p19;
	wire p18;
	wire p4;
	wire p17;
	wire p15;
	wire p0;
	wire p13;
	wire p8;
	wire p12;
	wire p7;
	wire p6;

	wire b_MINUS__TB_sync;
	wire c_PLUS__TB_sync;
	wire c_MINUS__TB_sync;
	wire a_PLUS__TB_sync;
	wire a_MINUS__TB_sync;
	wire e_x_PLUS_TB_sync;
	wire e_q_PLUS_TB_sync;
	wire e_x_MINUS_TB_sync;
	wire e_x_MINUSa_TB_sync;
	wire e_y_MINUSa_TB_sync;
	wire e_q_MINUS_TB_sync;
	assign b_MINUS__TB_sync = b_MINUS_ & b_MINUS__p11_FSM1_TB & b_MINUS__p11_FSM2_TB & b_MINUS__p11_FSM3_TB & b_MINUS__p11_FSM4_TB & b_MINUS__p11_FSM5_TB;
	assign c_PLUS__TB_sync = c_PLUS_ & c_PLUS__p4_FSM1_TB & c_PLUS__p5_FSM2_TB & c_PLUS__p5_FSM3_TB & c_PLUS__p4_FSM4_TB & c_PLUS__p4_FSM5_TB;
	assign c_MINUS__TB_sync = c_MINUS_ & c_MINUS__p8_FSM1_TB & c_MINUS__p8_FSM2_TB & c_MINUS__p8_FSM3_TB & c_MINUS__p8_FSM4_TB & c_MINUS__p8_FSM5_TB;
	assign a_PLUS__TB_sync = a_PLUS_ & a_PLUS__p19_FSM1_TB & a_PLUS__p19_FSM2_TB & a_PLUS__p19_FSM4_TB;
	assign a_MINUS__TB_sync = a_MINUS_ & a_MINUS__p15_FSM1_TB & a_MINUS__p15_FSM2_TB & a_MINUS__p15_FSM3_TB & a_MINUS__p16_FSM4_TB & a_MINUS__p15_FSM5_TB;
	assign e_x_PLUS_TB_sync = e_x_PLUS_p0_FSM1_TB & e_x_PLUS_p0_FSM4_TB & e_x_PLUS_p2_FSM5_TB;
	assign e_q_PLUS_TB_sync = e_q_PLUS_p6_FSM1_TB & e_q_PLUS_p6_FSM2_TB & e_q_PLUS_p6_FSM3_TB & e_q_PLUS_p6_FSM4_TB & e_q_PLUS_p6_FSM5_TB;
	assign e_x_MINUS_TB_sync = e_x_MINUS_p7_FSM1_TB & e_x_MINUS_p7_FSM2_TB & e_x_MINUS_p7_FSM3_TB & e_x_MINUS_p7_FSM4_TB & e_x_MINUS_p7_FSM5_TB;
	assign e_x_MINUSa_TB_sync = e_x_MINUSa_p13_FSM1_TB & e_x_MINUSa_p13_FSM2_TB & e_x_MINUSa_p13_FSM3_TB & e_x_MINUSa_p13_FSM5_TB;
	assign e_y_MINUSa_TB_sync = e_y_MINUSa_p18_FSM1_TB & e_y_MINUSa_p18_FSM2_TB & e_y_MINUSa_p18_FSM3_TB & e_y_MINUSa_p18_FSM4_TB & e_y_MINUSa_p18_FSM5_TB;
	assign e_q_MINUS_TB_sync = e_q_MINUS_p17_FSM1_TB & e_q_MINUS_p17_FSM2_TB & e_q_MINUS_p17_FSM3_TB & e_q_MINUS_p17_FSM4_TB & e_q_MINUS_p17_FSM5_TB;

	parameter p19_1HOT_ENCODING = 12'd1; // 12'b000000000001 //
	parameter p18_1HOT_ENCODING = 12'd2; // 12'b000000000010 //
	parameter p4_1HOT_ENCODING = 12'd4; // 12'b000000000100 //
	parameter p17_1HOT_ENCODING = 12'd8; // 12'b000000001000 //
	parameter p15_1HOT_ENCODING = 12'd16; // 12'b000000010000 //
	parameter p0_1HOT_ENCODING = 12'd32; // 12'b000000100000 //
	parameter p13_1HOT_ENCODING = 12'd64; // 12'b000001000000 //
	parameter p8_1HOT_ENCODING = 12'd128; // 12'b000010000000 //
	parameter p12_1HOT_ENCODING = 12'd256; // 12'b000100000000 //
	parameter p7_1HOT_ENCODING = 12'd512; // 12'b001000000000 //
	parameter p6_1HOT_ENCODING = 12'd1024; // 12'b010000000000 //
	parameter p10_1HOT_ENCODING = 12'd2048; // 12'b100000000000 //

	reg [11 : 0]	state;
	reg [11 : 0]	next_state;

	always @(posedge clk)
		begin
			if (reset)
				begin
						state <= p19_1HOT_ENCODING;
				end
			else
				begin
						state <= next_state;
				end
		end

	assign p19 = (state == p19_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p18 = (state == p18_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p4 = (state == p4_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p17 = (state == p17_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p15 = (state == p15_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p0 = (state == p0_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p13 = (state == p13_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p8 = (state == p8_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p12 = (state == p12_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p7 = (state == p7_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p6 = (state == p6_1HOT_ENCODING) ? 1'b1 : 1'b0;

	always @(state or b_MINUS__TB_sync or c_PLUS__TB_sync or c_MINUS__TB_sync or a_PLUS__TB_sync or a_MINUS__TB_sync or e_x_PLUS_TB_sync or e_q_PLUS_TB_sync or e_x_MINUS_TB_sync or e_x_MINUSa_TB_sync or e_y_MINUSa_TB_sync or e_q_MINUS_TB_sync)
		begin
			// MEALY FSMs - Blocking Operations //
			next_state = state;

			e_x_PLUS = 1'b0;
			e_q_PLUS = 1'b0;
			e_x_MINUS = 1'b0;
			e_x_MINUSa = 1'b0;
			e_y_MINUS = 1'b0;
			e_y_MINUSa = 1'b0;
			e_q_MINUS = 1'b0;

			case (state)
				p19_1HOT_ENCODING: // 12'b000000000001: //
					begin
						if (a_PLUS__TB_sync)
							begin
								next_state = p0_1HOT_ENCODING;
							end
					end

				p18_1HOT_ENCODING: // 12'b000000000010: //
					begin
						if (e_y_MINUSa_TB_sync)
							begin
								e_y_MINUSa = 1'b1;
								next_state = p19_1HOT_ENCODING;
							end
					end

				p4_1HOT_ENCODING: // 12'b000000000100: //
					begin
						if (c_PLUS__TB_sync)
							begin
								next_state = p6_1HOT_ENCODING;
							end
					end

				p17_1HOT_ENCODING: // 12'b000000001000: //
					begin
						if (e_q_MINUS_TB_sync)
							begin
								e_q_MINUS = 1'b1;
								next_state = p18_1HOT_ENCODING;
							end
					end

				p15_1HOT_ENCODING: // 12'b000000010000: //
					begin
						if (a_MINUS__TB_sync)
							begin
								next_state = p17_1HOT_ENCODING;
							end
					end

				p0_1HOT_ENCODING: // 12'b000000100000: //
					begin
						if (e_x_PLUS_TB_sync)
							begin
								e_x_PLUS = 1'b1;
								next_state = p4_1HOT_ENCODING;
							end
					end

				p13_1HOT_ENCODING: // 12'b000001000000: //
					begin
						if (e_x_MINUSa_TB_sync)
							begin
								e_x_MINUSa = 1'b1;
								next_state = p15_1HOT_ENCODING;
							end
					end

				p8_1HOT_ENCODING: // 12'b000010000000: //
					begin
						if (c_MINUS__TB_sync)
							begin
								next_state = p10_1HOT_ENCODING;
							end
					end

				p12_1HOT_ENCODING: // 12'b000100000000: //
					begin
						if (b_MINUS__TB_sync)
							begin
								next_state = p13_1HOT_ENCODING;
							end
					end

				p7_1HOT_ENCODING: // 12'b001000000000: //
					begin
						if (e_x_MINUS_TB_sync)
							begin
								e_x_MINUS = 1'b1;
								next_state = p8_1HOT_ENCODING;
							end
					end

				p6_1HOT_ENCODING: // 12'b010000000000: //
					begin
						if (e_q_PLUS_TB_sync)
							begin
								e_q_PLUS = 1'b1;
								next_state = p7_1HOT_ENCODING;
							end
					end

				p10_1HOT_ENCODING: // 12'b100000000000: //
					begin
								e_y_MINUS = 1'b1;
								next_state = p12_1HOT_ENCODING;
					end

				default:
						begin
							next_state = 12'dx;
						end
			endcase
		end
endmodule

