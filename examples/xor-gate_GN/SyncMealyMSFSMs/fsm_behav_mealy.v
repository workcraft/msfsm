`timescale 1ns/1ns

module fsm_mealy_behav_01 (
	clk,
	reset,
	t0_, t0__p8_FSM2_TB, t0__p8_FSM3_TB,
	a_M_, a_M__p0_FSM3_TB,
	t8_, t8__p5_FSM2_TB, t8__p3_FSM3_TB,
	t7_, t7__p4_FSM2_TB, t7__p3_FSM3_TB,
	e_out_M, e_out_M_p7_FSM2_TB, e_out_M_p7_FSM3_TB,
	p7,
	p3,
	p0,
	p8
);

	// Regular Synchronous FSM input Signals //
	input clk;
	input reset;

	// Regular input Signals //
	input t0_;
	input a_M_;
	input t8_;
	input t7_;
	// Transition Barrier Inputs for input Signals //
	input t0__p8_FSM2_TB, t0__p8_FSM3_TB;
	input a_M__p0_FSM3_TB;
	input t8__p5_FSM2_TB, t8__p3_FSM3_TB;
	input t7__p4_FSM2_TB, t7__p3_FSM3_TB;

	// Regular output Signals //
	output e_out_M;
	// Transition Barrier outputs for output Signals //
	input e_out_M_p7_FSM2_TB, e_out_M_p7_FSM3_TB;

	// FSMs' Synchronisation output Signals //
	output p7;
	output p3;
	output p0;
	output p8;

	reg e_out_M;
	wire p7;
	wire p3;
	wire p0;
	wire p8;

	wire t0__TB_sync;
	wire a_M__TB_sync;
	wire t8__TB_sync;
	wire t7__TB_sync;
	wire e_out_M_TB_sync;
	assign t0__TB_sync = t0_ & t0__p8_FSM2_TB & t0__p8_FSM3_TB;
	assign a_M__TB_sync = a_M_ & a_M__p0_FSM3_TB;
	assign t8__TB_sync = t8_ & t8__p5_FSM2_TB & t8__p3_FSM3_TB;
	assign t7__TB_sync = t7_ & t7__p4_FSM2_TB & t7__p3_FSM3_TB;
	assign e_out_M_TB_sync = e_out_M_p7_FSM2_TB & e_out_M_p7_FSM3_TB;

	parameter p7_1HOT_ENCODING = 4'd1; // 4'b0001 //
	parameter p7_1HOT_CASEX_ENCODING = 4'bxxx1; // 4'b0001 //
	parameter p3_1HOT_ENCODING = 4'd2; // 4'b0010 //
	parameter p3_1HOT_CASEX_ENCODING = 4'bxx1x; // 4'b0010 //
	parameter p0_1HOT_ENCODING = 4'd4; // 4'b0100 //
	parameter p0_1HOT_CASEX_ENCODING = 4'bx1xx; // 4'b0100 //
	parameter p8_1HOT_ENCODING = 4'd8; // 4'b1000 //
	parameter p8_1HOT_CASEX_ENCODING = 4'b1xxx; // 4'b1000 //

	reg [3 : 0]	state;
	reg [3 : 0]	next_state;

	always @(posedge clk)
		begin
			if (reset)
				begin
						// state <= p0_1HOT_ENCODING;
						state[0] <= 1'b0;
						state[1] <= 1'b0;
						state[2] <= 1'b1;
						state[3] <= 1'b0;
				end
			else
				begin
						state <= next_state;
				end
		end

	assign p7 = (state == p7_1HOT_CASEX_ENCODING) ? 1'b1 : 1'b0;
	assign p3 = (state == p3_1HOT_CASEX_ENCODING) ? 1'b1 : 1'b0;
	assign p0 = (state == p0_1HOT_CASEX_ENCODING) ? 1'b1 : 1'b0;
	assign p8 = (state == p8_1HOT_CASEX_ENCODING) ? 1'b1 : 1'b0;

	always @(state or t0__TB_sync or a_M__TB_sync or t8__TB_sync or t7__TB_sync or e_out_M_TB_sync)
		begin
			// MEALY FSMs - Blocking Operations //
			next_state = state;

			e_out_M = 1'b0;

			casex (state)
				4'bxxx1: // p7_1HOT_ENCODING: //
					begin
						if (e_out_M_TB_sync)
							begin
								e_out_M = 1'b1;
								// next_state = p8_1HOT_CASEX_ENCODING; //
								next_state[0] = 1'b0;
								next_state[3] = 1'b1;
							end
					end

				4'bxx1x: // p3_1HOT_ENCODING: //
					begin
						if (t7__TB_sync)
							begin
								// next_state = p7_1HOT_CASEX_ENCODING; //
								next_state[1] = 1'b0;
								next_state[0] = 1'b1;
							end
						else if (t8__TB_sync)
							begin
								// next_state = p7_1HOT_CASEX_ENCODING; //
								next_state[1] = 1'b0;
								next_state[0] = 1'b1;
							end
					end

				4'bx1xx: // p0_1HOT_ENCODING: //
					begin
						if (a_M__TB_sync)
							begin
								// next_state = p3_1HOT_CASEX_ENCODING; //
								next_state[2] = 1'b0;
								next_state[1] = 1'b1;
							end
					end

				4'b1xxx: // p8_1HOT_ENCODING: //
					begin
						if (t0__TB_sync)
							begin
								// next_state = p0_1HOT_CASEX_ENCODING; //
								next_state[3] = 1'b0;
								next_state[2] = 1'b1;
							end
					end

				default:
						begin
							next_state = 4'dx;
						end
			endcase
		end
endmodule

module fsm_mealy_behav_02 (
	clk,
	reset,
	b_P_,
	b_M_,
	t6_, t6__p2_FSM3_TB,
	t0_, t0__p8_FSM1_TB, t0__p8_FSM3_TB,
	t8_, t8__p3_FSM1_TB, t8__p3_FSM3_TB,
	t5_, t5__p2_FSM3_TB,
	t7_, t7__p3_FSM1_TB, t7__p3_FSM3_TB,
	e_out_P, e_out_P_p6_FSM3_TB,
	e_out_M, e_out_M_p7_FSM1_TB, e_out_M_p7_FSM3_TB,
	p7,
	p4,
	p6,
	p8,
	p5
);

	// Regular Synchronous FSM input Signals //
	input clk;
	input reset;

	// Regular input Signals //
	input b_P_;
	input b_M_;
	input t6_;
	input t0_;
	input t8_;
	input t5_;
	input t7_;
	// Transition Barrier Inputs for input Signals //
	input t6__p2_FSM3_TB;
	input t0__p8_FSM1_TB, t0__p8_FSM3_TB;
	input t8__p3_FSM1_TB, t8__p3_FSM3_TB;
	input t5__p2_FSM3_TB;
	input t7__p3_FSM1_TB, t7__p3_FSM3_TB;

	// Regular output Signals //
	output e_out_P;
	output e_out_M;
	// Transition Barrier outputs for output Signals //
	input e_out_P_p6_FSM3_TB;
	input e_out_M_p7_FSM1_TB, e_out_M_p7_FSM3_TB;

	// FSMs' Synchronisation output Signals //
	output p7;
	output p4;
	output p6;
	output p8;
	output p5;

	reg e_out_P;
	reg e_out_M;
	wire p7;
	wire p4;
	wire p6;
	wire p8;
	wire p5;

	wire t6__TB_sync;
	wire t0__TB_sync;
	wire t8__TB_sync;
	wire t5__TB_sync;
	wire t7__TB_sync;
	wire e_out_P_TB_sync;
	wire e_out_M_TB_sync;
	assign t6__TB_sync = t6_ & t6__p2_FSM3_TB;
	assign t0__TB_sync = t0_ & t0__p8_FSM1_TB & t0__p8_FSM3_TB;
	assign t8__TB_sync = t8_ & t8__p3_FSM1_TB & t8__p3_FSM3_TB;
	assign t5__TB_sync = t5_ & t5__p2_FSM3_TB;
	assign t7__TB_sync = t7_ & t7__p3_FSM1_TB & t7__p3_FSM3_TB;
	assign e_out_P_TB_sync = e_out_P_p6_FSM3_TB;
	assign e_out_M_TB_sync = e_out_M_p7_FSM1_TB & e_out_M_p7_FSM3_TB;

	parameter p7_1HOT_ENCODING = 6'd1; // 6'b000001 //
	parameter p7_1HOT_CASEX_ENCODING = 6'bxxxxx1; // 6'b000001 //
	parameter p4_1HOT_ENCODING = 6'd2; // 6'b000010 //
	parameter p4_1HOT_CASEX_ENCODING = 6'bxxxx1x; // 6'b000010 //
	parameter p1_1HOT_ENCODING = 6'd4; // 6'b000100 //
	parameter p1_1HOT_CASEX_ENCODING = 6'bxxx1xx; // 6'b000100 //
	parameter p6_1HOT_ENCODING = 6'd8; // 6'b001000 //
	parameter p6_1HOT_CASEX_ENCODING = 6'bxx1xxx; // 6'b001000 //
	parameter p8_1HOT_ENCODING = 6'd16; // 6'b010000 //
	parameter p8_1HOT_CASEX_ENCODING = 6'bx1xxxx; // 6'b010000 //
	parameter p5_1HOT_ENCODING = 6'd32; // 6'b100000 //
	parameter p5_1HOT_CASEX_ENCODING = 6'b1xxxxx; // 6'b100000 //

	reg [5 : 0]	state;
	reg [5 : 0]	next_state;

	always @(posedge clk)
		begin
			if (reset)
				begin
						// state <= p1_1HOT_ENCODING;
						state[0] <= 1'b0;
						state[1] <= 1'b0;
						state[2] <= 1'b1;
						state[3] <= 1'b0;
						state[4] <= 1'b0;
						state[5] <= 1'b0;
				end
			else
				begin
						state <= next_state;
				end
		end

	assign p7 = (state == p7_1HOT_CASEX_ENCODING) ? 1'b1 : 1'b0;
	assign p4 = (state == p4_1HOT_CASEX_ENCODING) ? 1'b1 : 1'b0;
	assign p6 = (state == p6_1HOT_CASEX_ENCODING) ? 1'b1 : 1'b0;
	assign p8 = (state == p8_1HOT_CASEX_ENCODING) ? 1'b1 : 1'b0;
	assign p5 = (state == p5_1HOT_CASEX_ENCODING) ? 1'b1 : 1'b0;

	always @(state or b_P_ or b_M_ or t6__TB_sync or t0__TB_sync or t8__TB_sync or t5__TB_sync or t7__TB_sync or e_out_P_TB_sync or e_out_M_TB_sync)
		begin
			// MEALY FSMs - Blocking Operations //
			next_state = state;

			e_out_P = 1'b0;
			e_out_M = 1'b0;

			casex (state)
				6'bxxxxx1: // p7_1HOT_ENCODING: //
					begin
						if (e_out_M_TB_sync)
							begin
								e_out_M = 1'b1;
								// next_state = p8_1HOT_CASEX_ENCODING; //
								next_state[0] = 1'b0;
								next_state[4] = 1'b1;
							end
					end

				6'bxxxx1x: // p4_1HOT_ENCODING: //
					begin
						if (t5__TB_sync)
							begin
								// next_state = p6_1HOT_CASEX_ENCODING; //
								next_state[1] = 1'b0;
								next_state[3] = 1'b1;
							end
						else if (t7__TB_sync)
							begin
								// next_state = p7_1HOT_CASEX_ENCODING; //
								next_state[1] = 1'b0;
								next_state[0] = 1'b1;
							end
					end

				6'bxxx1xx: // p1_1HOT_ENCODING: //
					begin
						if (b_M_)
							begin
								// next_state = p5_1HOT_CASEX_ENCODING; //
								next_state[2] = 1'b0;
								next_state[5] = 1'b1;
							end
						else if (b_P_)
							begin
								// next_state = p4_1HOT_CASEX_ENCODING; //
								next_state[2] = 1'b0;
								next_state[1] = 1'b1;
							end
					end

				6'bxx1xxx: // p6_1HOT_ENCODING: //
					begin
						if (e_out_P_TB_sync)
							begin
								e_out_P = 1'b1;
								// next_state = p8_1HOT_CASEX_ENCODING; //
								next_state[3] = 1'b0;
								next_state[4] = 1'b1;
							end
					end

				6'bx1xxxx: // p8_1HOT_ENCODING: //
					begin
						if (t0__TB_sync)
							begin
								// next_state = p1_1HOT_CASEX_ENCODING; //
								next_state[4] = 1'b0;
								next_state[2] = 1'b1;
							end
					end

				6'b1xxxxx: // p5_1HOT_ENCODING: //
					begin
						if (t6__TB_sync)
							begin
								// next_state = p6_1HOT_CASEX_ENCODING; //
								next_state[5] = 1'b0;
								next_state[3] = 1'b1;
							end
						else if (t8__TB_sync)
							begin
								// next_state = p7_1HOT_CASEX_ENCODING; //
								next_state[5] = 1'b0;
								next_state[0] = 1'b1;
							end
					end

				default:
						begin
							next_state = 6'dx;
						end
			endcase
		end
endmodule

module fsm_mealy_behav_03 (
	clk,
	reset,
	t6_, t6__p5_FSM2_TB,
	t0_, t0__p8_FSM1_TB, t0__p8_FSM2_TB,
	a_P_,
	a_M_, a_M__p0_FSM1_TB,
	t8_, t8__p3_FSM1_TB, t8__p5_FSM2_TB,
	t5_, t5__p4_FSM2_TB,
	t7_, t7__p3_FSM1_TB, t7__p4_FSM2_TB,
	e_out_P, e_out_P_p6_FSM2_TB,
	e_out_M, e_out_M_p7_FSM1_TB, e_out_M_p7_FSM2_TB,
	p7,
	p6,
	p3,
	p0,
	p8,
	p2
);

	// Regular Synchronous FSM input Signals //
	input clk;
	input reset;

	// Regular input Signals //
	input t6_;
	input t0_;
	input a_P_;
	input a_M_;
	input t8_;
	input t5_;
	input t7_;
	// Transition Barrier Inputs for input Signals //
	input t6__p5_FSM2_TB;
	input t0__p8_FSM1_TB, t0__p8_FSM2_TB;
	input a_M__p0_FSM1_TB;
	input t8__p3_FSM1_TB, t8__p5_FSM2_TB;
	input t5__p4_FSM2_TB;
	input t7__p3_FSM1_TB, t7__p4_FSM2_TB;

	// Regular output Signals //
	output e_out_P;
	output e_out_M;
	// Transition Barrier outputs for output Signals //
	input e_out_P_p6_FSM2_TB;
	input e_out_M_p7_FSM1_TB, e_out_M_p7_FSM2_TB;

	// FSMs' Synchronisation output Signals //
	output p7;
	output p6;
	output p3;
	output p0;
	output p8;
	output p2;

	reg e_out_P;
	reg e_out_M;
	wire p7;
	wire p6;
	wire p3;
	wire p0;
	wire p8;
	wire p2;

	wire t6__TB_sync;
	wire t0__TB_sync;
	wire a_M__TB_sync;
	wire t8__TB_sync;
	wire t5__TB_sync;
	wire t7__TB_sync;
	wire e_out_P_TB_sync;
	wire e_out_M_TB_sync;
	assign t6__TB_sync = t6_ & t6__p5_FSM2_TB;
	assign t0__TB_sync = t0_ & t0__p8_FSM1_TB & t0__p8_FSM2_TB;
	assign a_M__TB_sync = a_M_ & a_M__p0_FSM1_TB;
	assign t8__TB_sync = t8_ & t8__p3_FSM1_TB & t8__p5_FSM2_TB;
	assign t5__TB_sync = t5_ & t5__p4_FSM2_TB;
	assign t7__TB_sync = t7_ & t7__p3_FSM1_TB & t7__p4_FSM2_TB;
	assign e_out_P_TB_sync = e_out_P_p6_FSM2_TB;
	assign e_out_M_TB_sync = e_out_M_p7_FSM1_TB & e_out_M_p7_FSM2_TB;

	parameter p7_1HOT_ENCODING = 6'd1; // 6'b000001 //
	parameter p7_1HOT_CASEX_ENCODING = 6'bxxxxx1; // 6'b000001 //
	parameter p6_1HOT_ENCODING = 6'd2; // 6'b000010 //
	parameter p6_1HOT_CASEX_ENCODING = 6'bxxxx1x; // 6'b000010 //
	parameter p3_1HOT_ENCODING = 6'd4; // 6'b000100 //
	parameter p3_1HOT_CASEX_ENCODING = 6'bxxx1xx; // 6'b000100 //
	parameter p0_1HOT_ENCODING = 6'd8; // 6'b001000 //
	parameter p0_1HOT_CASEX_ENCODING = 6'bxx1xxx; // 6'b001000 //
	parameter p8_1HOT_ENCODING = 6'd16; // 6'b010000 //
	parameter p8_1HOT_CASEX_ENCODING = 6'bx1xxxx; // 6'b010000 //
	parameter p2_1HOT_ENCODING = 6'd32; // 6'b100000 //
	parameter p2_1HOT_CASEX_ENCODING = 6'b1xxxxx; // 6'b100000 //

	reg [5 : 0]	state;
	reg [5 : 0]	next_state;

	always @(posedge clk)
		begin
			if (reset)
				begin
						// state <= p0_1HOT_ENCODING;
						state[0] <= 1'b0;
						state[1] <= 1'b0;
						state[2] <= 1'b0;
						state[3] <= 1'b1;
						state[4] <= 1'b0;
						state[5] <= 1'b0;
				end
			else
				begin
						state <= next_state;
				end
		end

	assign p7 = (state == p7_1HOT_CASEX_ENCODING) ? 1'b1 : 1'b0;
	assign p6 = (state == p6_1HOT_CASEX_ENCODING) ? 1'b1 : 1'b0;
	assign p3 = (state == p3_1HOT_CASEX_ENCODING) ? 1'b1 : 1'b0;
	assign p0 = (state == p0_1HOT_CASEX_ENCODING) ? 1'b1 : 1'b0;
	assign p8 = (state == p8_1HOT_CASEX_ENCODING) ? 1'b1 : 1'b0;
	assign p2 = (state == p2_1HOT_CASEX_ENCODING) ? 1'b1 : 1'b0;

	always @(state or t6__TB_sync or t0__TB_sync or a_P_ or a_M__TB_sync or t8__TB_sync or t5__TB_sync or t7__TB_sync or e_out_P_TB_sync or e_out_M_TB_sync)
		begin
			// MEALY FSMs - Blocking Operations //
			next_state = state;

			e_out_P = 1'b0;
			e_out_M = 1'b0;

			casex (state)
				6'bxxxxx1: // p7_1HOT_ENCODING: //
					begin
						if (e_out_M_TB_sync)
							begin
								e_out_M = 1'b1;
								// next_state = p8_1HOT_CASEX_ENCODING; //
								next_state[0] = 1'b0;
								next_state[4] = 1'b1;
							end
					end

				6'bxxxx1x: // p6_1HOT_ENCODING: //
					begin
						if (e_out_P_TB_sync)
							begin
								e_out_P = 1'b1;
								// next_state = p8_1HOT_CASEX_ENCODING; //
								next_state[1] = 1'b0;
								next_state[4] = 1'b1;
							end
					end

				6'bxxx1xx: // p3_1HOT_ENCODING: //
					begin
						if (t7__TB_sync)
							begin
								// next_state = p7_1HOT_CASEX_ENCODING; //
								next_state[2] = 1'b0;
								next_state[0] = 1'b1;
							end
						else if (t8__TB_sync)
							begin
								// next_state = p7_1HOT_CASEX_ENCODING; //
								next_state[2] = 1'b0;
								next_state[0] = 1'b1;
							end
					end

				6'bxx1xxx: // p0_1HOT_ENCODING: //
					begin
						if (a_M__TB_sync)
							begin
								// next_state = p3_1HOT_CASEX_ENCODING; //
								next_state[3] = 1'b0;
								next_state[2] = 1'b1;
							end
					end
						else if (a_P_)
							begin
								// next_state = p2_1HOT_CASEX_ENCODING; //
								next_state[3] = 1'b0;
								next_state[5] = 1'b1;
							end

				6'bx1xxxx: // p8_1HOT_ENCODING: //
					begin
						if (t0__TB_sync)
							begin
								// next_state = p0_1HOT_CASEX_ENCODING; //
								next_state[4] = 1'b0;
								next_state[3] = 1'b1;
							end
					end

				6'b1xxxxx: // p2_1HOT_ENCODING: //
					begin
						if (t5__TB_sync)
							begin
								// next_state = p6_1HOT_CASEX_ENCODING; //
								next_state[5] = 1'b0;
								next_state[1] = 1'b1;
							end
						else if (t6__TB_sync)
							begin
								// next_state = p6_1HOT_CASEX_ENCODING; //
								next_state[5] = 1'b0;
								next_state[1] = 1'b1;
							end
					end

				default:
						begin
							next_state = 6'dx;
						end
			endcase
		end
endmodule

