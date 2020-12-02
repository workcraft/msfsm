`timescale 1ns/1ns

module fsm_mealy_synth_01 (
	clk,
	reset,
	a_P_, a_P__p0_FSM2_TB,
	t8_, t8__p5_FSM2_TB,
	t7_, t7__p3_FSM2_TB,
	t6_, t6__p2_FSM2_TB,
	a_M_, a_M__p0_FSM2_TB,
	b_P_,
	t5_, t5__p2_FSM2_TB,
	e_out_M, e_out_M_p7_FSM2_TB,
	e_out_P, e_out_P_p6_FSM2_TB,
	p3,
	p2,
	p7,
	p6,
	p0,
	p4
);

	// Regular Synchronous FSM input Signals //
	input clk;
	input reset;

	// Regular input Signals //
	input a_P_;
	input t8_;
	input t7_;
	input t6_;
	input a_M_;
	input b_P_;
	input t5_;
	// Transition Barrier Inputs for input Signals //
	input a_P__p0_FSM2_TB;
	input t8__p5_FSM2_TB;
	input t7__p3_FSM2_TB;
	input t6__p2_FSM2_TB;
	input a_M__p0_FSM2_TB;
	input t5__p2_FSM2_TB;

	// Regular output Signals //
	output e_out_M;
	output e_out_P;
	// Transition Barrier outputs for output Signals //
	input e_out_M_p7_FSM2_TB;
	input e_out_P_p6_FSM2_TB;

	// FSMs' Synchronisation output Signals //
	output p3;
	output p2;
	output p7;
	output p6;
	output p0;
	output p4;

	reg e_out_M;
	reg e_out_P;
	wire p3;
	wire p2;
	wire p7;
	wire p6;
	wire p0;
	wire p4;

	wire a_P__TB_sync;
	wire t8__TB_sync;
	wire t7__TB_sync;
	wire t6__TB_sync;
	wire a_M__TB_sync;
	wire t5__TB_sync;
	wire e_out_M_TB_sync;
	wire e_out_P_TB_sync;
	assign a_P__TB_sync = a_P_ & a_P__p0_FSM2_TB;
	assign t8__TB_sync = t8_ & t8__p5_FSM2_TB;
	assign t7__TB_sync = t7_ & t7__p3_FSM2_TB;
	assign t6__TB_sync = t6_ & t6__p2_FSM2_TB;
	assign a_M__TB_sync = a_M_ & a_M__p0_FSM2_TB;
	assign t5__TB_sync = t5_ & t5__p2_FSM2_TB;
	assign e_out_M_TB_sync = e_out_M_p7_FSM2_TB;
	assign e_out_P_TB_sync = e_out_P_p6_FSM2_TB;

	parameter p3_1HOT_ENCODING = 7'd1; // 7'b0000001 //
	parameter p2_1HOT_ENCODING = 7'd2; // 7'b0000010 //
	parameter p7_1HOT_ENCODING = 7'd4; // 7'b0000100 //
	parameter p1_1HOT_ENCODING = 7'd8; // 7'b0001000 //
	parameter p6_1HOT_ENCODING = 7'd16; // 7'b0010000 //
	parameter p0_1HOT_ENCODING = 7'd32; // 7'b0100000 //
	parameter p4_1HOT_ENCODING = 7'd64; // 7'b1000000 //

	reg [6 : 0]	state;
	reg [6 : 0]	next_state;

	always @(posedge clk)
		begin
			if (reset)
				begin
						state <= p1_1HOT_ENCODING;
						state <= p0_1HOT_ENCODING;
				end
			else
				begin
						state <= next_state;
				end
		end

	assign p3 = (state == p3_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p2 = (state == p2_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p7 = (state == p7_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p6 = (state == p6_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p0 = (state == p0_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p4 = (state == p4_1HOT_ENCODING) ? 1'b1 : 1'b0;

	always @(state or a_P__TB_sync or t8__TB_sync or t7__TB_sync or t6__TB_sync or a_M__TB_sync or b_P_ or t5__TB_sync or e_out_M_TB_sync or e_out_P_TB_sync)
		begin
			// MEALY FSMs - Blocking Operations //
			next_state = state;

			e_out_M = 1'b0;
			e_out_P = 1'b0;

			case (state)
				p3_1HOT_ENCODING: // 7'b0000001: //
					begin
						if (t7__TB_sync)
							begin
								next_state = p6_1HOT_ENCODING;
							end
						else if (t8__TB_sync)
							begin
								next_state = p7_1HOT_ENCODING;
							end
					end

				p2_1HOT_ENCODING: // 7'b0000010: //
					begin
						if (t6__TB_sync)
							begin
								next_state = p6_1HOT_ENCODING;
							end
					end

				p7_1HOT_ENCODING: // 7'b0000100: //
					begin
						if (e_out_M_TB_sync)
							begin
								e_out_M = 1'b1;
								next_state = p1_1HOT_ENCODING;
							end
					end

				p1_1HOT_ENCODING: // 7'b0001000: //
					begin
						if (b_P_)
							begin
								next_state = p4_1HOT_ENCODING;
							end
					end

				p6_1HOT_ENCODING: // 7'b0010000: //
					begin
						if (e_out_P_TB_sync)
							begin
								e_out_P = 1'b1;
								next_state = p0_1HOT_ENCODING;
							end
					end

				p0_1HOT_ENCODING: // 7'b0100000: //
					begin
						if (a_M__TB_sync)
							begin
								next_state = p3_1HOT_ENCODING;
							end
						else if (a_P__TB_sync)
							begin
								next_state = p2_1HOT_ENCODING;
							end
					end

				p4_1HOT_ENCODING: // 7'b1000000: //
					begin
						if (t5__TB_sync)
							begin
								next_state = p6_1HOT_ENCODING;
							end
					end

				default:
						begin
							next_state = 7'dx;
						end
			endcase
		end
endmodule

module fsm_mealy_synth_02 (
	clk,
	reset,
	a_P_, a_P__p0_FSM1_TB,
	b_M_,
	t8_, t8__p3_FSM1_TB,
	t7_, t7__p3_FSM1_TB,
	t6_, t6__p2_FSM1_TB,
	a_M_, a_M__p0_FSM1_TB,
	t5_, t5__p4_FSM1_TB,
	e_out_M, e_out_M_p7_FSM1_TB,
	e_out_P, e_out_P_p6_FSM1_TB,
	p3,
	p2,
	p7,
	p6,
	p0,
	p5
);

	// Regular Synchronous FSM input Signals //
	input clk;
	input reset;

	// Regular input Signals //
	input a_P_;
	input b_M_;
	input t8_;
	input t7_;
	input t6_;
	input a_M_;
	input t5_;
	// Transition Barrier Inputs for input Signals //
	input a_P__p0_FSM1_TB;
	input t8__p3_FSM1_TB;
	input t7__p3_FSM1_TB;
	input t6__p2_FSM1_TB;
	input a_M__p0_FSM1_TB;
	input t5__p4_FSM1_TB;

	// Regular output Signals //
	output e_out_M;
	output e_out_P;
	// Transition Barrier outputs for output Signals //
	input e_out_M_p7_FSM1_TB;
	input e_out_P_p6_FSM1_TB;

	// FSMs' Synchronisation output Signals //
	output p3;
	output p2;
	output p7;
	output p6;
	output p0;
	output p5;

	reg e_out_M;
	reg e_out_P;
	wire p3;
	wire p2;
	wire p7;
	wire p6;
	wire p0;
	wire p5;

	wire a_P__TB_sync;
	wire t8__TB_sync;
	wire t7__TB_sync;
	wire t6__TB_sync;
	wire a_M__TB_sync;
	wire t5__TB_sync;
	wire e_out_M_TB_sync;
	wire e_out_P_TB_sync;
	assign a_P__TB_sync = a_P_ & a_P__p0_FSM1_TB;
	assign t8__TB_sync = t8_ & t8__p3_FSM1_TB;
	assign t7__TB_sync = t7_ & t7__p3_FSM1_TB;
	assign t6__TB_sync = t6_ & t6__p2_FSM1_TB;
	assign a_M__TB_sync = a_M_ & a_M__p0_FSM1_TB;
	assign t5__TB_sync = t5_ & t5__p4_FSM1_TB;
	assign e_out_M_TB_sync = e_out_M_p7_FSM1_TB;
	assign e_out_P_TB_sync = e_out_P_p6_FSM1_TB;

	parameter p3_1HOT_ENCODING = 7'd1; // 7'b0000001 //
	parameter p2_1HOT_ENCODING = 7'd2; // 7'b0000010 //
	parameter p7_1HOT_ENCODING = 7'd4; // 7'b0000100 //
	parameter p1_1HOT_ENCODING = 7'd8; // 7'b0001000 //
	parameter p6_1HOT_ENCODING = 7'd16; // 7'b0010000 //
	parameter p0_1HOT_ENCODING = 7'd32; // 7'b0100000 //
	parameter p5_1HOT_ENCODING = 7'd64; // 7'b1000000 //

	reg [6 : 0]	state;
	reg [6 : 0]	next_state;

	always @(posedge clk)
		begin
			if (reset)
				begin
						state <= p1_1HOT_ENCODING;
						state <= p0_1HOT_ENCODING;
				end
			else
				begin
						state <= next_state;
				end
		end

	assign p3 = (state == p3_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p2 = (state == p2_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p7 = (state == p7_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p6 = (state == p6_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p0 = (state == p0_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p5 = (state == p5_1HOT_ENCODING) ? 1'b1 : 1'b0;

	always @(state or a_P__TB_sync or b_M_ or t8__TB_sync or t7__TB_sync or t6__TB_sync or a_M__TB_sync or t5__TB_sync or e_out_M_TB_sync or e_out_P_TB_sync)
		begin
			// MEALY FSMs - Blocking Operations //
			next_state = state;

			e_out_M = 1'b0;
			e_out_P = 1'b0;

			case (state)
				p3_1HOT_ENCODING: // 7'b0000001: //
					begin
						if (t7__TB_sync)
							begin
								next_state = p6_1HOT_ENCODING;
							end
					end

				p2_1HOT_ENCODING: // 7'b0000010: //
					begin
						if (t5__TB_sync)
							begin
								next_state = p6_1HOT_ENCODING;
							end
						else if (t6__TB_sync)
							begin
								next_state = p6_1HOT_ENCODING;
							end
					end

				p7_1HOT_ENCODING: // 7'b0000100: //
					begin
						if (e_out_M_TB_sync)
							begin
								e_out_M = 1'b1;
								next_state = p0_1HOT_ENCODING;
							end
					end

				p1_1HOT_ENCODING: // 7'b0001000: //
					begin
						if (b_M_)
							begin
								next_state = p5_1HOT_ENCODING;
							end
					end

				p6_1HOT_ENCODING: // 7'b0010000: //
					begin
						if (e_out_P_TB_sync)
							begin
								e_out_P = 1'b1;
								next_state = p1_1HOT_ENCODING;
							end
					end

				p0_1HOT_ENCODING: // 7'b0100000: //
					begin
						if (a_M__TB_sync)
							begin
								next_state = p3_1HOT_ENCODING;
							end
						else if (a_P__TB_sync)
							begin
								next_state = p2_1HOT_ENCODING;
							end
					end

				p5_1HOT_ENCODING: // 7'b1000000: //
					begin
						if (t8__TB_sync)
							begin
								next_state = p7_1HOT_ENCODING;
							end
					end

				default:
						begin
							next_state = 7'dx;
						end
			endcase
		end
endmodule

