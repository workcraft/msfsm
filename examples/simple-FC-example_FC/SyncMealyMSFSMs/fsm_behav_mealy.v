`timescale 1ns/1ns

module fsm_mealy_behav_01 (
	clk,
	reset,
	t2_,
	t1_,
	t0_, t0__p9_FSM2_TB, t0__p7_FSM3_TB, t0__p6_FSM4_TB,
	t4_,
	p3
);

	// Regular Synchronous FSM input Signals //
	input clk;
	input reset;

	// Regular input Signals //
	input t2_;
	input t1_;
	input t0_;
	input t4_;
	// Transition Barrier Inputs for input Signals //
	input t0__p9_FSM2_TB, t0__p7_FSM3_TB, t0__p6_FSM4_TB;

	// Regular output Signals //
	// === EMPTY! === //
	// Transition Barrier outputs for output Signals //
	// === EMPTY! === //

	// FSMs' Synchronisation output Signals //
	output p3;

	wire p3;

	wire t0__TB_sync;
	assign t0__TB_sync = t0_ & t0__p9_FSM2_TB & t0__p7_FSM3_TB & t0__p6_FSM4_TB;

	parameter p3_1HOT_ENCODING = 3'd1; // 3'b001 //
	parameter p3_1HOT_CASEX_ENCODING = 3'bxx1; // 3'b001 //
	parameter p2_1HOT_ENCODING = 3'd2; // 3'b010 //
	parameter p2_1HOT_CASEX_ENCODING = 3'bx1x; // 3'b010 //
	parameter p0_1HOT_ENCODING = 3'd4; // 3'b100 //
	parameter p0_1HOT_CASEX_ENCODING = 3'b1xx; // 3'b100 //

	reg [2 : 0]	state;
	reg [2 : 0]	next_state;

	always @(posedge clk)
		begin
			if (reset)
				begin
						// state <= p0_1HOT_ENCODING;
						state[0] <= 1'b0;
						state[1] <= 1'b0;
						state[2] <= 1'b1;
				end
			else
				begin
						state <= next_state;
				end
		end

	assign p3 = (state == p3_1HOT_CASEX_ENCODING) ? 1'b1 : 1'b0;

	always @(state or t2_ or t1_ or t0__TB_sync or t4_)
		begin
			// MEALY FSMs - Blocking Operations //
			next_state = state;

			// Empty output Events! //

			casex (state)
				3'bxx1: // p3_1HOT_ENCODING: //
					begin
						if (t0__TB_sync)
							begin
								// next_state = p0_1HOT_CASEX_ENCODING; //
								next_state[0] = 1'b0;
								next_state[2] = 1'b1;
							end
					end

				3'bx1x: // p2_1HOT_ENCODING: //
					begin
						if (t4_)
							begin
								// next_state = p3_1HOT_CASEX_ENCODING; //
								next_state[1] = 1'b0;
								next_state[0] = 1'b1;
							end
					end

				3'b1xx: // p0_1HOT_ENCODING: //
					begin
						if (t1_)
							begin
								// next_state = p2_1HOT_CASEX_ENCODING; //
								next_state[2] = 1'b0;
								next_state[1] = 1'b1;
							end
						else if (t2_)
							begin
								// next_state = p3_1HOT_CASEX_ENCODING; //
								next_state[2] = 1'b0;
								next_state[0] = 1'b1;
							end
					end

				default:
						begin
							next_state = 3'dx;
						end
			endcase
		end
endmodule

module fsm_mealy_behav_02 (
	clk,
	reset,
	t3_, t3__p1_FSM3_TB, t3__p1_FSM4_TB,
	t7_,
	t0_, t0__p3_FSM1_TB, t0__p7_FSM3_TB, t0__p6_FSM4_TB,
	p9,
	p1
);

	// Regular Synchronous FSM input Signals //
	input clk;
	input reset;

	// Regular input Signals //
	input t3_;
	input t7_;
	input t0_;
	// Transition Barrier Inputs for input Signals //
	input t3__p1_FSM3_TB, t3__p1_FSM4_TB;
	input t0__p3_FSM1_TB, t0__p7_FSM3_TB, t0__p6_FSM4_TB;

	// Regular output Signals //
	// === EMPTY! === //
	// Transition Barrier outputs for output Signals //
	// === EMPTY! === //

	// FSMs' Synchronisation output Signals //
	output p9;
	output p1;

	wire p9;
	wire p1;

	wire t3__TB_sync;
	wire t0__TB_sync;
	assign t3__TB_sync = t3_ & t3__p1_FSM3_TB & t3__p1_FSM4_TB;
	assign t0__TB_sync = t0_ & t0__p3_FSM1_TB & t0__p7_FSM3_TB & t0__p6_FSM4_TB;

	parameter p9_1HOT_ENCODING = 3'd1; // 3'b001 //
	parameter p9_1HOT_CASEX_ENCODING = 3'bxx1; // 3'b001 //
	parameter p8_1HOT_ENCODING = 3'd2; // 3'b010 //
	parameter p8_1HOT_CASEX_ENCODING = 3'bx1x; // 3'b010 //
	parameter p1_1HOT_ENCODING = 3'd4; // 3'b100 //
	parameter p1_1HOT_CASEX_ENCODING = 3'b1xx; // 3'b100 //

	reg [2 : 0]	state;
	reg [2 : 0]	next_state;

	always @(posedge clk)
		begin
			if (reset)
				begin
						// state <= p1_1HOT_ENCODING;
						state[0] <= 1'b0;
						state[1] <= 1'b0;
						state[2] <= 1'b1;
				end
			else
				begin
						state <= next_state;
				end
		end

	assign p9 = (state == p9_1HOT_CASEX_ENCODING) ? 1'b1 : 1'b0;
	assign p1 = (state == p1_1HOT_CASEX_ENCODING) ? 1'b1 : 1'b0;

	always @(state or t3__TB_sync or t7_ or t0__TB_sync)
		begin
			// MEALY FSMs - Blocking Operations //
			next_state = state;

			// Empty output Events! //

			casex (state)
				3'bxx1: // p9_1HOT_ENCODING: //
					begin
						if (t0__TB_sync)
							begin
								// next_state = p1_1HOT_CASEX_ENCODING; //
								next_state[0] = 1'b0;
								next_state[2] = 1'b1;
							end
					end

				3'bx1x: // p8_1HOT_ENCODING: //
					begin
						if (t7_)
							begin
								// next_state = p9_1HOT_CASEX_ENCODING; //
								next_state[1] = 1'b0;
								next_state[0] = 1'b1;
							end
					end

				3'b1xx: // p1_1HOT_ENCODING: //
					begin
						if (t3__TB_sync)
							begin
								// next_state = p8_1HOT_CASEX_ENCODING; //
								next_state[2] = 1'b0;
								next_state[1] = 1'b1;
							end
					end

				default:
						begin
							next_state = 3'dx;
						end
			endcase
		end
endmodule

module fsm_mealy_behav_03 (
	clk,
	reset,
	t3_, t3__p1_FSM2_TB, t3__p1_FSM4_TB,
	t0_, t0__p3_FSM1_TB, t0__p9_FSM2_TB, t0__p6_FSM4_TB,
	t6_,
	p1,
	p7
);

	// Regular Synchronous FSM input Signals //
	input clk;
	input reset;

	// Regular input Signals //
	input t3_;
	input t0_;
	input t6_;
	// Transition Barrier Inputs for input Signals //
	input t3__p1_FSM2_TB, t3__p1_FSM4_TB;
	input t0__p3_FSM1_TB, t0__p9_FSM2_TB, t0__p6_FSM4_TB;

	// Regular output Signals //
	// === EMPTY! === //
	// Transition Barrier outputs for output Signals //
	// === EMPTY! === //

	// FSMs' Synchronisation output Signals //
	output p1;
	output p7;

	wire p1;
	wire p7;

	wire t3__TB_sync;
	wire t0__TB_sync;
	assign t3__TB_sync = t3_ & t3__p1_FSM2_TB & t3__p1_FSM4_TB;
	assign t0__TB_sync = t0_ & t0__p3_FSM1_TB & t0__p9_FSM2_TB & t0__p6_FSM4_TB;

	parameter p1_1HOT_ENCODING = 3'd1; // 3'b001 //
	parameter p1_1HOT_CASEX_ENCODING = 3'bxx1; // 3'b001 //
	parameter p7_1HOT_ENCODING = 3'd2; // 3'b010 //
	parameter p7_1HOT_CASEX_ENCODING = 3'bx1x; // 3'b010 //
	parameter p5_1HOT_ENCODING = 3'd4; // 3'b100 //
	parameter p5_1HOT_CASEX_ENCODING = 3'b1xx; // 3'b100 //

	reg [2 : 0]	state;
	reg [2 : 0]	next_state;

	always @(posedge clk)
		begin
			if (reset)
				begin
						// state <= p1_1HOT_ENCODING;
						state[0] <= 1'b1;
						state[1] <= 1'b0;
						state[2] <= 1'b0;
				end
			else
				begin
						state <= next_state;
				end
		end

	assign p1 = (state == p1_1HOT_CASEX_ENCODING) ? 1'b1 : 1'b0;
	assign p7 = (state == p7_1HOT_CASEX_ENCODING) ? 1'b1 : 1'b0;

	always @(state or t3__TB_sync or t0__TB_sync or t6_)
		begin
			// MEALY FSMs - Blocking Operations //
			next_state = state;

			// Empty output Events! //

			casex (state)
				3'bxx1: // p1_1HOT_ENCODING: //
					begin
						if (t3__TB_sync)
							begin
								// next_state = p5_1HOT_CASEX_ENCODING; //
								next_state[0] = 1'b0;
								next_state[2] = 1'b1;
							end
					end

				3'bx1x: // p7_1HOT_ENCODING: //
					begin
						if (t0__TB_sync)
							begin
								// next_state = p1_1HOT_CASEX_ENCODING; //
								next_state[1] = 1'b0;
								next_state[0] = 1'b1;
							end
					end

				3'b1xx: // p5_1HOT_ENCODING: //
					begin
						if (t6_)
							begin
								// next_state = p7_1HOT_CASEX_ENCODING; //
								next_state[2] = 1'b0;
								next_state[1] = 1'b1;
							end
					end

				default:
						begin
							next_state = 3'dx;
						end
			endcase
		end
endmodule

module fsm_mealy_behav_04 (
	clk,
	reset,
	t3_, t3__p1_FSM2_TB, t3__p1_FSM3_TB,
	t0_, t0__p3_FSM1_TB, t0__p9_FSM2_TB, t0__p7_FSM3_TB,
	t5_,
	p1,
	p6
);

	// Regular Synchronous FSM input Signals //
	input clk;
	input reset;

	// Regular input Signals //
	input t3_;
	input t0_;
	input t5_;
	// Transition Barrier Inputs for input Signals //
	input t3__p1_FSM2_TB, t3__p1_FSM3_TB;
	input t0__p3_FSM1_TB, t0__p9_FSM2_TB, t0__p7_FSM3_TB;

	// Regular output Signals //
	// === EMPTY! === //
	// Transition Barrier outputs for output Signals //
	// === EMPTY! === //

	// FSMs' Synchronisation output Signals //
	output p1;
	output p6;

	wire p1;
	wire p6;

	wire t3__TB_sync;
	wire t0__TB_sync;
	assign t3__TB_sync = t3_ & t3__p1_FSM2_TB & t3__p1_FSM3_TB;
	assign t0__TB_sync = t0_ & t0__p3_FSM1_TB & t0__p9_FSM2_TB & t0__p7_FSM3_TB;

	parameter p1_1HOT_ENCODING = 3'd1; // 3'b001 //
	parameter p1_1HOT_CASEX_ENCODING = 3'bxx1; // 3'b001 //
	parameter p6_1HOT_ENCODING = 3'd2; // 3'b010 //
	parameter p6_1HOT_CASEX_ENCODING = 3'bx1x; // 3'b010 //
	parameter p4_1HOT_ENCODING = 3'd4; // 3'b100 //
	parameter p4_1HOT_CASEX_ENCODING = 3'b1xx; // 3'b100 //

	reg [2 : 0]	state;
	reg [2 : 0]	next_state;

	always @(posedge clk)
		begin
			if (reset)
				begin
						// state <= p1_1HOT_ENCODING;
						state[0] <= 1'b1;
						state[1] <= 1'b0;
						state[2] <= 1'b0;
				end
			else
				begin
						state <= next_state;
				end
		end

	assign p1 = (state == p1_1HOT_CASEX_ENCODING) ? 1'b1 : 1'b0;
	assign p6 = (state == p6_1HOT_CASEX_ENCODING) ? 1'b1 : 1'b0;

	always @(state or t3__TB_sync or t0__TB_sync or t5_)
		begin
			// MEALY FSMs - Blocking Operations //
			next_state = state;

			// Empty output Events! //

			casex (state)
				3'bxx1: // p1_1HOT_ENCODING: //
					begin
						if (t3__TB_sync)
							begin
								// next_state = p4_1HOT_CASEX_ENCODING; //
								next_state[0] = 1'b0;
								next_state[2] = 1'b1;
							end
					end

				3'bx1x: // p6_1HOT_ENCODING: //
					begin
						if (t0__TB_sync)
							begin
								// next_state = p1_1HOT_CASEX_ENCODING; //
								next_state[1] = 1'b0;
								next_state[0] = 1'b1;
							end
					end

				3'b1xx: // p4_1HOT_ENCODING: //
					begin
						if (t5_)
							begin
								// next_state = p6_1HOT_CASEX_ENCODING; //
								next_state[2] = 1'b0;
								next_state[1] = 1'b1;
							end
					end

				default:
						begin
							next_state = 3'dx;
						end
			endcase
		end
endmodule

