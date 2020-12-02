`timescale 1ns/1ns

module fsm_mealy_synth_01 (
	clk,
	reset,
	t0_, t0__p0_FSM2_TB, t0__p1_FSM3_TB,
	t1_, t1__p0_FSM2_TB, t1__p1_FSM3_TB,
	t6_, t6__p7_FSM2_TB, t6__p6_FSM3_TB,
	t2_, t2__p2_FSM3_TB,
	t4_, t4__p4_FSM3_TB,
	p2,
	p4,
	p0,
	p6
);

	// Regular Synchronous FSM input Signals //
	input clk;
	input reset;

	// Regular input Signals //
	input t0_;
	input t1_;
	input t6_;
	input t2_;
	input t4_;
	// Transition Barrier Inputs for input Signals //
	input t0__p0_FSM2_TB, t0__p1_FSM3_TB;
	input t1__p0_FSM2_TB, t1__p1_FSM3_TB;
	input t6__p7_FSM2_TB, t6__p6_FSM3_TB;
	input t2__p2_FSM3_TB;
	input t4__p4_FSM3_TB;

	// Regular output Signals //
	// === EMPTY! === //
	// Transition Barrier outputs for output Signals //
	// === EMPTY! === //

	// FSMs' Synchronisation output Signals //
	output p2;
	output p4;
	output p0;
	output p6;

	wire p2;
	wire p4;
	wire p0;
	wire p6;

	wire t0__TB_sync;
	wire t1__TB_sync;
	wire t6__TB_sync;
	wire t2__TB_sync;
	wire t4__TB_sync;
	assign t0__TB_sync = t0_ & t0__p0_FSM2_TB & t0__p1_FSM3_TB;
	assign t1__TB_sync = t1_ & t1__p0_FSM2_TB & t1__p1_FSM3_TB;
	assign t6__TB_sync = t6_ & t6__p7_FSM2_TB & t6__p6_FSM3_TB;
	assign t2__TB_sync = t2_ & t2__p2_FSM3_TB;
	assign t4__TB_sync = t4_ & t4__p4_FSM3_TB;

	parameter p2_1HOT_ENCODING = 4'd1; // 4'b0001 //
	parameter p4_1HOT_ENCODING = 4'd2; // 4'b0010 //
	parameter p0_1HOT_ENCODING = 4'd4; // 4'b0100 //
	parameter p6_1HOT_ENCODING = 4'd8; // 4'b1000 //

	reg [3 : 0]	state;
	reg [3 : 0]	next_state;

	always @(posedge clk)
		begin
			if (reset)
				begin
						state <= p0_1HOT_ENCODING;
				end
			else
				begin
						state <= next_state;
				end
		end

	assign p2 = (state == p2_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p4 = (state == p4_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p0 = (state == p0_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p6 = (state == p6_1HOT_ENCODING) ? 1'b1 : 1'b0;

	always @(state or t0__TB_sync or t1__TB_sync or t6__TB_sync or t2__TB_sync or t4__TB_sync)
		begin
			// MEALY FSMs - Blocking Operations //
			next_state = state;

			// Empty output Events! //

			case (state)
				p2_1HOT_ENCODING: // 4'b0001: //
					begin
						if (t2__TB_sync)
							begin
								next_state = p6_1HOT_ENCODING;
							end
					end

				p4_1HOT_ENCODING: // 4'b0010: //
					begin
						if (t4__TB_sync)
							begin
								next_state = p6_1HOT_ENCODING;
							end
					end

				p0_1HOT_ENCODING: // 4'b0100: //
					begin
						if (t0__TB_sync)
							begin
								next_state = p2_1HOT_ENCODING;
							end
						else if (t1__TB_sync)
							begin
								next_state = p4_1HOT_ENCODING;
							end
					end

				p6_1HOT_ENCODING: // 4'b1000: //
					begin
						if (t6__TB_sync)
							begin
								next_state = p0_1HOT_ENCODING;
							end
					end

				default:
						begin
							next_state = 4'dx;
						end
			endcase
		end
endmodule

module fsm_mealy_synth_02 (
	clk,
	reset,
	t0_, t0__p0_FSM1_TB, t0__p1_FSM3_TB,
	t5_,
	t1_, t1__p0_FSM1_TB, t1__p1_FSM3_TB,
	t6_, t6__p6_FSM1_TB, t6__p6_FSM3_TB,
	t3_,
	p7,
	p0
);

	// Regular Synchronous FSM input Signals //
	input clk;
	input reset;

	// Regular input Signals //
	input t0_;
	input t5_;
	input t1_;
	input t6_;
	input t3_;
	// Transition Barrier Inputs for input Signals //
	input t0__p0_FSM1_TB, t0__p1_FSM3_TB;
	input t1__p0_FSM1_TB, t1__p1_FSM3_TB;
	input t6__p6_FSM1_TB, t6__p6_FSM3_TB;

	// Regular output Signals //
	// === EMPTY! === //
	// Transition Barrier outputs for output Signals //
	// === EMPTY! === //

	// FSMs' Synchronisation output Signals //
	output p7;
	output p0;

	wire p7;
	wire p0;

	wire t0__TB_sync;
	wire t1__TB_sync;
	wire t6__TB_sync;
	assign t0__TB_sync = t0_ & t0__p0_FSM1_TB & t0__p1_FSM3_TB;
	assign t1__TB_sync = t1_ & t1__p0_FSM1_TB & t1__p1_FSM3_TB;
	assign t6__TB_sync = t6_ & t6__p6_FSM1_TB & t6__p6_FSM3_TB;

	parameter p7_1HOT_ENCODING = 4'd1; // 4'b0001 //
	parameter p3_1HOT_ENCODING = 4'd2; // 4'b0010 //
	parameter p5_1HOT_ENCODING = 4'd4; // 4'b0100 //
	parameter p0_1HOT_ENCODING = 4'd8; // 4'b1000 //

	reg [3 : 0]	state;
	reg [3 : 0]	next_state;

	always @(posedge clk)
		begin
			if (reset)
				begin
						state <= p0_1HOT_ENCODING;
				end
			else
				begin
						state <= next_state;
				end
		end

	assign p7 = (state == p7_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p0 = (state == p0_1HOT_ENCODING) ? 1'b1 : 1'b0;

	always @(state or t0__TB_sync or t5_ or t1__TB_sync or t6__TB_sync or t3_)
		begin
			// MEALY FSMs - Blocking Operations //
			next_state = state;

			// Empty output Events! //

			case (state)
				p7_1HOT_ENCODING: // 4'b0001: //
					begin
						if (t6__TB_sync)
							begin
								next_state = p0_1HOT_ENCODING;
							end
					end

				p3_1HOT_ENCODING: // 4'b0010: //
					begin
						if (t3_)
							begin
								next_state = p7_1HOT_ENCODING;
							end
					end

				p5_1HOT_ENCODING: // 4'b0100: //
					begin
						if (t5_)
							begin
								next_state = p7_1HOT_ENCODING;
							end
					end

				p0_1HOT_ENCODING: // 4'b1000: //
					begin
						if (t0__TB_sync)
							begin
								next_state = p3_1HOT_ENCODING;
							end
						else if (t1__TB_sync)
							begin
								next_state = p5_1HOT_ENCODING;
							end
					end

				default:
						begin
							next_state = 4'dx;
						end
			endcase
		end
endmodule

module fsm_mealy_synth_03 (
	clk,
	reset,
	t0_, t0__p0_FSM1_TB, t0__p0_FSM2_TB,
	t1_, t1__p0_FSM1_TB, t1__p0_FSM2_TB,
	t6_, t6__p6_FSM1_TB, t6__p7_FSM2_TB,
	t2_, t2__p2_FSM1_TB,
	t4_, t4__p4_FSM1_TB,
	p2,
	p4,
	p6,
	p1
);

	// Regular Synchronous FSM input Signals //
	input clk;
	input reset;

	// Regular input Signals //
	input t0_;
	input t1_;
	input t6_;
	input t2_;
	input t4_;
	// Transition Barrier Inputs for input Signals //
	input t0__p0_FSM1_TB, t0__p0_FSM2_TB;
	input t1__p0_FSM1_TB, t1__p0_FSM2_TB;
	input t6__p6_FSM1_TB, t6__p7_FSM2_TB;
	input t2__p2_FSM1_TB;
	input t4__p4_FSM1_TB;

	// Regular output Signals //
	// === EMPTY! === //
	// Transition Barrier outputs for output Signals //
	// === EMPTY! === //

	// FSMs' Synchronisation output Signals //
	output p2;
	output p4;
	output p6;
	output p1;

	wire p2;
	wire p4;
	wire p6;
	wire p1;

	wire t0__TB_sync;
	wire t1__TB_sync;
	wire t6__TB_sync;
	wire t2__TB_sync;
	wire t4__TB_sync;
	assign t0__TB_sync = t0_ & t0__p0_FSM1_TB & t0__p0_FSM2_TB;
	assign t1__TB_sync = t1_ & t1__p0_FSM1_TB & t1__p0_FSM2_TB;
	assign t6__TB_sync = t6_ & t6__p6_FSM1_TB & t6__p7_FSM2_TB;
	assign t2__TB_sync = t2_ & t2__p2_FSM1_TB;
	assign t4__TB_sync = t4_ & t4__p4_FSM1_TB;

	parameter p2_1HOT_ENCODING = 4'd1; // 4'b0001 //
	parameter p4_1HOT_ENCODING = 4'd2; // 4'b0010 //
	parameter p6_1HOT_ENCODING = 4'd4; // 4'b0100 //
	parameter p1_1HOT_ENCODING = 4'd8; // 4'b1000 //

	reg [3 : 0]	state;
	reg [3 : 0]	next_state;

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

	assign p2 = (state == p2_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p4 = (state == p4_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p6 = (state == p6_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p1 = (state == p1_1HOT_ENCODING) ? 1'b1 : 1'b0;

	always @(state or t0__TB_sync or t1__TB_sync or t6__TB_sync or t2__TB_sync or t4__TB_sync)
		begin
			// MEALY FSMs - Blocking Operations //
			next_state = state;

			// Empty output Events! //

			case (state)
				p2_1HOT_ENCODING: // 4'b0001: //
					begin
						if (t2__TB_sync)
							begin
								next_state = p6_1HOT_ENCODING;
							end
					end

				p4_1HOT_ENCODING: // 4'b0010: //
					begin
						if (t4__TB_sync)
							begin
								next_state = p6_1HOT_ENCODING;
							end
					end

				p6_1HOT_ENCODING: // 4'b0100: //
					begin
						if (t6__TB_sync)
							begin
								next_state = p1_1HOT_ENCODING;
							end
					end

				p1_1HOT_ENCODING: // 4'b1000: //
					begin
						if (t0__TB_sync)
							begin
								next_state = p2_1HOT_ENCODING;
							end
						else if (t1__TB_sync)
							begin
								next_state = p4_1HOT_ENCODING;
							end
					end

				default:
						begin
							next_state = 4'dx;
						end
			endcase
		end
endmodule

