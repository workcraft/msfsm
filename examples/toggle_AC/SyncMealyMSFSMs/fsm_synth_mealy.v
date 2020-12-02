`timescale 1ns/1ns

module fsm_mealy_synth_01 (
	clk,
	reset,
	Ri_PLUS_, Ri_PLUS__p1_FSM2_TB, Ri_PLUS__p7_FSM3_TB, Ri_PLUS__p1_FSM4_TB, Ri_PLUS__p7_FSM5_TB, Ri_PLUS__p7_FSM6_TB, Ri_PLUS__p1_FSM7_TB,
	Ri_MINUS_, Ri_MINUS__p4_FSM2_TB, Ri_MINUS__p0_FSM3_TB, Ri_MINUS__p4_FSM4_TB, Ri_MINUS__p0_FSM5_TB, Ri_MINUS__p0_FSM6_TB, Ri_MINUS__p4_FSM7_TB,
	p0,
	p1
);

	// Regular Synchronous FSM input Signals //
	input clk;
	input reset;

	// Regular input Signals //
	input Ri_PLUS_;
	input Ri_MINUS_;
	// Transition Barrier Inputs for input Signals //
	input Ri_PLUS__p1_FSM2_TB, Ri_PLUS__p7_FSM3_TB, Ri_PLUS__p1_FSM4_TB, Ri_PLUS__p7_FSM5_TB, Ri_PLUS__p7_FSM6_TB, Ri_PLUS__p1_FSM7_TB;
	input Ri_MINUS__p4_FSM2_TB, Ri_MINUS__p0_FSM3_TB, Ri_MINUS__p4_FSM4_TB, Ri_MINUS__p0_FSM5_TB, Ri_MINUS__p0_FSM6_TB, Ri_MINUS__p4_FSM7_TB;

	// Regular output Signals //
	// === EMPTY! === //
	// Transition Barrier outputs for output Signals //
	// === EMPTY! === //

	// FSMs' Synchronisation output Signals //
	output p0;
	output p1;

	wire p0;
	wire p1;

	wire Ri_PLUS__TB_sync;
	wire Ri_MINUS__TB_sync;
	assign Ri_PLUS__TB_sync = Ri_PLUS_ & Ri_PLUS__p1_FSM2_TB & Ri_PLUS__p7_FSM3_TB & Ri_PLUS__p1_FSM4_TB & Ri_PLUS__p7_FSM5_TB & Ri_PLUS__p7_FSM6_TB & Ri_PLUS__p1_FSM7_TB;
	assign Ri_MINUS__TB_sync = Ri_MINUS_ & Ri_MINUS__p4_FSM2_TB & Ri_MINUS__p0_FSM3_TB & Ri_MINUS__p4_FSM4_TB & Ri_MINUS__p0_FSM5_TB & Ri_MINUS__p0_FSM6_TB & Ri_MINUS__p4_FSM7_TB;

	parameter p0_1HOT_ENCODING = 2'd1; // 2'b01 //
	parameter p1_1HOT_ENCODING = 2'd2; // 2'b10 //

	reg [1 : 0]	state;
	reg [1 : 0]	next_state;

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

	assign p0 = (state == p0_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p1 = (state == p1_1HOT_ENCODING) ? 1'b1 : 1'b0;

	always @(state or Ri_PLUS__TB_sync or Ri_MINUS__TB_sync)
		begin
			// MEALY FSMs - Blocking Operations //
			next_state = state;

			// Empty output Events! //

			case (state)
				p0_1HOT_ENCODING: // 2'b01: //
					begin
						if (Ri_MINUS__TB_sync)
							begin
								next_state = p1_1HOT_ENCODING;
							end
					end

				p1_1HOT_ENCODING: // 2'b10: //
					begin
						if (Ri_PLUS__TB_sync)
							begin
								next_state = p0_1HOT_ENCODING;
							end
					end

				default:
						begin
							next_state = 2'dx;
						end
			endcase
		end
endmodule

module fsm_mealy_synth_02 (
	clk,
	reset,
	Ri_PLUS_, Ri_PLUS__p1_FSM1_TB, Ri_PLUS__p7_FSM3_TB, Ri_PLUS__p1_FSM4_TB, Ri_PLUS__p7_FSM5_TB, Ri_PLUS__p7_FSM6_TB, Ri_PLUS__p1_FSM7_TB,
	Ri_MINUS_, Ri_MINUS__p0_FSM1_TB, Ri_MINUS__p0_FSM3_TB, Ri_MINUS__p4_FSM4_TB, Ri_MINUS__p0_FSM5_TB, Ri_MINUS__p0_FSM6_TB, Ri_MINUS__p4_FSM7_TB,
	e_Ro1_MINUS, e_Ro1_MINUS_p5_FSM4_TB, e_Ro1_MINUS_p2_FSM7_TB,
	e_Ro1_PLUS, e_Ro1_PLUS_p2_FSM4_TB, e_Ro1_PLUS_p9_FSM7_TB,
	p1,
	p2,
	p4
);

	// Regular Synchronous FSM input Signals //
	input clk;
	input reset;

	// Regular input Signals //
	input Ri_PLUS_;
	input Ri_MINUS_;
	// Transition Barrier Inputs for input Signals //
	input Ri_PLUS__p1_FSM1_TB, Ri_PLUS__p7_FSM3_TB, Ri_PLUS__p1_FSM4_TB, Ri_PLUS__p7_FSM5_TB, Ri_PLUS__p7_FSM6_TB, Ri_PLUS__p1_FSM7_TB;
	input Ri_MINUS__p0_FSM1_TB, Ri_MINUS__p0_FSM3_TB, Ri_MINUS__p4_FSM4_TB, Ri_MINUS__p0_FSM5_TB, Ri_MINUS__p0_FSM6_TB, Ri_MINUS__p4_FSM7_TB;

	// Regular output Signals //
	output e_Ro1_MINUS;
	output e_Ro1_PLUS;
	// Transition Barrier outputs for output Signals //
	input e_Ro1_MINUS_p5_FSM4_TB, e_Ro1_MINUS_p2_FSM7_TB;
	input e_Ro1_PLUS_p2_FSM4_TB, e_Ro1_PLUS_p9_FSM7_TB;

	// FSMs' Synchronisation output Signals //
	output p1;
	output p2;
	output p4;

	reg e_Ro1_MINUS;
	reg e_Ro1_PLUS;
	wire p1;
	wire p2;
	wire p4;

	wire Ri_PLUS__TB_sync;
	wire Ri_MINUS__TB_sync;
	wire e_Ro1_MINUS_TB_sync;
	wire e_Ro1_PLUS_TB_sync;
	assign Ri_PLUS__TB_sync = Ri_PLUS_ & Ri_PLUS__p1_FSM1_TB & Ri_PLUS__p7_FSM3_TB & Ri_PLUS__p1_FSM4_TB & Ri_PLUS__p7_FSM5_TB & Ri_PLUS__p7_FSM6_TB & Ri_PLUS__p1_FSM7_TB;
	assign Ri_MINUS__TB_sync = Ri_MINUS_ & Ri_MINUS__p0_FSM1_TB & Ri_MINUS__p0_FSM3_TB & Ri_MINUS__p4_FSM4_TB & Ri_MINUS__p0_FSM5_TB & Ri_MINUS__p0_FSM6_TB & Ri_MINUS__p4_FSM7_TB;
	assign e_Ro1_MINUS_TB_sync = e_Ro1_MINUS_p5_FSM4_TB & e_Ro1_MINUS_p2_FSM7_TB;
	assign e_Ro1_PLUS_TB_sync = e_Ro1_PLUS_p2_FSM4_TB & e_Ro1_PLUS_p9_FSM7_TB;

	parameter p1_1HOT_ENCODING = 3'd1; // 3'b001 //
	parameter p2_1HOT_ENCODING = 3'd2; // 3'b010 //
	parameter p4_1HOT_ENCODING = 3'd4; // 3'b100 //

	reg [2 : 0]	state;
	reg [2 : 0]	next_state;

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

	assign p1 = (state == p1_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p2 = (state == p2_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p4 = (state == p4_1HOT_ENCODING) ? 1'b1 : 1'b0;

	always @(state or Ri_PLUS__TB_sync or Ri_MINUS__TB_sync or e_Ro1_MINUS_TB_sync or e_Ro1_PLUS_TB_sync)
		begin
			// MEALY FSMs - Blocking Operations //
			next_state = state;

			e_Ro1_MINUS = 1'b0;
			e_Ro1_PLUS = 1'b0;

			case (state)
				p1_1HOT_ENCODING: // 3'b001: //
					begin
						if (Ri_PLUS__TB_sync)
							begin
								next_state = p2_1HOT_ENCODING;
							end
					end

				p2_1HOT_ENCODING: // 3'b010: //
					begin
						if (e_Ro1_MINUS_TB_sync)
							begin
								e_Ro1_MINUS = 1'b1;
								next_state = p4_1HOT_ENCODING;
							end
						else if (e_Ro1_PLUS_TB_sync)
							begin
								e_Ro1_PLUS = 1'b1;
								next_state = p4_1HOT_ENCODING;
							end
					end

				p4_1HOT_ENCODING: // 3'b100: //
					begin
						if (Ri_MINUS__TB_sync)
							begin
								next_state = p1_1HOT_ENCODING;
							end
					end

				default:
						begin
							next_state = 3'dx;
						end
			endcase
		end
endmodule

module fsm_mealy_synth_03 (
	clk,
	reset,
	Ri_PLUS_, Ri_PLUS__p1_FSM1_TB, Ri_PLUS__p1_FSM2_TB, Ri_PLUS__p1_FSM4_TB, Ri_PLUS__p7_FSM5_TB, Ri_PLUS__p7_FSM6_TB, Ri_PLUS__p1_FSM7_TB,
	Ri_MINUS_, Ri_MINUS__p0_FSM1_TB, Ri_MINUS__p4_FSM2_TB, Ri_MINUS__p4_FSM4_TB, Ri_MINUS__p0_FSM5_TB, Ri_MINUS__p0_FSM6_TB, Ri_MINUS__p4_FSM7_TB,
	e_Ro2_MINUS, e_Ro2_MINUS_p6_FSM5_TB, e_Ro2_MINUS_p3_FSM6_TB,
	e_Ro2_PLUS, e_Ro2_PLUS_p3_FSM5_TB, e_Ro2_PLUS_p8_FSM6_TB,
	p0,
	p3,
	p7
);

	// Regular Synchronous FSM input Signals //
	input clk;
	input reset;

	// Regular input Signals //
	input Ri_PLUS_;
	input Ri_MINUS_;
	// Transition Barrier Inputs for input Signals //
	input Ri_PLUS__p1_FSM1_TB, Ri_PLUS__p1_FSM2_TB, Ri_PLUS__p1_FSM4_TB, Ri_PLUS__p7_FSM5_TB, Ri_PLUS__p7_FSM6_TB, Ri_PLUS__p1_FSM7_TB;
	input Ri_MINUS__p0_FSM1_TB, Ri_MINUS__p4_FSM2_TB, Ri_MINUS__p4_FSM4_TB, Ri_MINUS__p0_FSM5_TB, Ri_MINUS__p0_FSM6_TB, Ri_MINUS__p4_FSM7_TB;

	// Regular output Signals //
	output e_Ro2_MINUS;
	output e_Ro2_PLUS;
	// Transition Barrier outputs for output Signals //
	input e_Ro2_MINUS_p6_FSM5_TB, e_Ro2_MINUS_p3_FSM6_TB;
	input e_Ro2_PLUS_p3_FSM5_TB, e_Ro2_PLUS_p8_FSM6_TB;

	// FSMs' Synchronisation output Signals //
	output p0;
	output p3;
	output p7;

	reg e_Ro2_MINUS;
	reg e_Ro2_PLUS;
	wire p0;
	wire p3;
	wire p7;

	wire Ri_PLUS__TB_sync;
	wire Ri_MINUS__TB_sync;
	wire e_Ro2_MINUS_TB_sync;
	wire e_Ro2_PLUS_TB_sync;
	assign Ri_PLUS__TB_sync = Ri_PLUS_ & Ri_PLUS__p1_FSM1_TB & Ri_PLUS__p1_FSM2_TB & Ri_PLUS__p1_FSM4_TB & Ri_PLUS__p7_FSM5_TB & Ri_PLUS__p7_FSM6_TB & Ri_PLUS__p1_FSM7_TB;
	assign Ri_MINUS__TB_sync = Ri_MINUS_ & Ri_MINUS__p0_FSM1_TB & Ri_MINUS__p4_FSM2_TB & Ri_MINUS__p4_FSM4_TB & Ri_MINUS__p0_FSM5_TB & Ri_MINUS__p0_FSM6_TB & Ri_MINUS__p4_FSM7_TB;
	assign e_Ro2_MINUS_TB_sync = e_Ro2_MINUS_p6_FSM5_TB & e_Ro2_MINUS_p3_FSM6_TB;
	assign e_Ro2_PLUS_TB_sync = e_Ro2_PLUS_p3_FSM5_TB & e_Ro2_PLUS_p8_FSM6_TB;

	parameter p0_1HOT_ENCODING = 3'd1; // 3'b001 //
	parameter p3_1HOT_ENCODING = 3'd2; // 3'b010 //
	parameter p7_1HOT_ENCODING = 3'd4; // 3'b100 //

	reg [2 : 0]	state;
	reg [2 : 0]	next_state;

	always @(posedge clk)
		begin
			if (reset)
				begin
						state <= p7_1HOT_ENCODING;
				end
			else
				begin
						state <= next_state;
				end
		end

	assign p0 = (state == p0_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p3 = (state == p3_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p7 = (state == p7_1HOT_ENCODING) ? 1'b1 : 1'b0;

	always @(state or Ri_PLUS__TB_sync or Ri_MINUS__TB_sync or e_Ro2_MINUS_TB_sync or e_Ro2_PLUS_TB_sync)
		begin
			// MEALY FSMs - Blocking Operations //
			next_state = state;

			e_Ro2_MINUS = 1'b0;
			e_Ro2_PLUS = 1'b0;

			case (state)
				p0_1HOT_ENCODING: // 3'b001: //
					begin
						if (Ri_MINUS__TB_sync)
							begin
								next_state = p3_1HOT_ENCODING;
							end
					end

				p3_1HOT_ENCODING: // 3'b010: //
					begin
						if (e_Ro2_MINUS_TB_sync)
							begin
								e_Ro2_MINUS = 1'b1;
								next_state = p7_1HOT_ENCODING;
							end
						else if (e_Ro2_PLUS_TB_sync)
							begin
								e_Ro2_PLUS = 1'b1;
								next_state = p7_1HOT_ENCODING;
							end
					end

				p7_1HOT_ENCODING: // 3'b100: //
					begin
						if (Ri_PLUS__TB_sync)
							begin
								next_state = p0_1HOT_ENCODING;
							end
					end

				default:
						begin
							next_state = 3'dx;
						end
			endcase
		end
endmodule

module fsm_mealy_synth_04 (
	clk,
	reset,
	Ri_PLUS_, Ri_PLUS__p1_FSM1_TB, Ri_PLUS__p1_FSM2_TB, Ri_PLUS__p7_FSM3_TB, Ri_PLUS__p7_FSM5_TB, Ri_PLUS__p7_FSM6_TB, Ri_PLUS__p1_FSM7_TB,
	Ri_MINUS_, Ri_MINUS__p0_FSM1_TB, Ri_MINUS__p4_FSM2_TB, Ri_MINUS__p0_FSM3_TB, Ri_MINUS__p0_FSM5_TB, Ri_MINUS__p0_FSM6_TB, Ri_MINUS__p4_FSM7_TB,
	e_Ro1_MINUS, e_Ro1_MINUS_p2_FSM2_TB, e_Ro1_MINUS_p2_FSM7_TB,
	e_Ro1_PLUS, e_Ro1_PLUS_p2_FSM2_TB, e_Ro1_PLUS_p9_FSM7_TB,
	p1,
	p2,
	p4,
	p5
);

	// Regular Synchronous FSM input Signals //
	input clk;
	input reset;

	// Regular input Signals //
	input Ri_PLUS_;
	input Ri_MINUS_;
	// Transition Barrier Inputs for input Signals //
	input Ri_PLUS__p1_FSM1_TB, Ri_PLUS__p1_FSM2_TB, Ri_PLUS__p7_FSM3_TB, Ri_PLUS__p7_FSM5_TB, Ri_PLUS__p7_FSM6_TB, Ri_PLUS__p1_FSM7_TB;
	input Ri_MINUS__p0_FSM1_TB, Ri_MINUS__p4_FSM2_TB, Ri_MINUS__p0_FSM3_TB, Ri_MINUS__p0_FSM5_TB, Ri_MINUS__p0_FSM6_TB, Ri_MINUS__p4_FSM7_TB;

	// Regular output Signals //
	output e_Ro1_MINUS;
	output e_Ro1_PLUS;
	// Transition Barrier outputs for output Signals //
	input e_Ro1_MINUS_p2_FSM2_TB, e_Ro1_MINUS_p2_FSM7_TB;
	input e_Ro1_PLUS_p2_FSM2_TB, e_Ro1_PLUS_p9_FSM7_TB;

	// FSMs' Synchronisation output Signals //
	output p1;
	output p2;
	output p4;
	output p5;

	reg e_Ro1_MINUS;
	reg e_Ro1_PLUS;
	wire p1;
	wire p2;
	wire p4;
	wire p5;

	wire Ri_PLUS__TB_sync;
	wire Ri_MINUS__TB_sync;
	wire e_Ro1_MINUS_TB_sync;
	wire e_Ro1_PLUS_TB_sync;
	assign Ri_PLUS__TB_sync = Ri_PLUS_ & Ri_PLUS__p1_FSM1_TB & Ri_PLUS__p1_FSM2_TB & Ri_PLUS__p7_FSM3_TB & Ri_PLUS__p7_FSM5_TB & Ri_PLUS__p7_FSM6_TB & Ri_PLUS__p1_FSM7_TB;
	assign Ri_MINUS__TB_sync = Ri_MINUS_ & Ri_MINUS__p0_FSM1_TB & Ri_MINUS__p4_FSM2_TB & Ri_MINUS__p0_FSM3_TB & Ri_MINUS__p0_FSM5_TB & Ri_MINUS__p0_FSM6_TB & Ri_MINUS__p4_FSM7_TB;
	assign e_Ro1_MINUS_TB_sync = e_Ro1_MINUS_p2_FSM2_TB & e_Ro1_MINUS_p2_FSM7_TB;
	assign e_Ro1_PLUS_TB_sync = e_Ro1_PLUS_p2_FSM2_TB & e_Ro1_PLUS_p9_FSM7_TB;

	parameter p1_1HOT_ENCODING = 4'd1; // 4'b0001 //
	parameter p2_1HOT_ENCODING = 4'd2; // 4'b0010 //
	parameter p4_1HOT_ENCODING = 4'd4; // 4'b0100 //
	parameter p5_1HOT_ENCODING = 4'd8; // 4'b1000 //

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

	assign p1 = (state == p1_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p2 = (state == p2_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p4 = (state == p4_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p5 = (state == p5_1HOT_ENCODING) ? 1'b1 : 1'b0;

	always @(state or Ri_PLUS__TB_sync or Ri_MINUS__TB_sync or e_Ro1_MINUS_TB_sync or e_Ro1_PLUS_TB_sync)
		begin
			// MEALY FSMs - Blocking Operations //
			next_state = state;

			e_Ro1_MINUS = 1'b0;
			e_Ro1_PLUS = 1'b0;

			case (state)
				p1_1HOT_ENCODING: // 4'b0001: //
					begin
						if (Ri_PLUS__TB_sync)
							begin
								next_state = p2_1HOT_ENCODING;
							end
					end

				p2_1HOT_ENCODING: // 4'b0010: //
					begin
						if (e_Ro1_PLUS_TB_sync)
							begin
								e_Ro1_PLUS = 1'b1;
								next_state = p5_1HOT_ENCODING;
							end
					end

				p4_1HOT_ENCODING: // 4'b0100: //
					begin
						if (Ri_MINUS__TB_sync)
							begin
								next_state = p1_1HOT_ENCODING;
							end
					end

				p5_1HOT_ENCODING: // 4'b1000: //
					begin
						if (e_Ro1_MINUS_TB_sync)
							begin
								e_Ro1_MINUS = 1'b1;
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

module fsm_mealy_synth_05 (
	clk,
	reset,
	Ri_PLUS_, Ri_PLUS__p1_FSM1_TB, Ri_PLUS__p1_FSM2_TB, Ri_PLUS__p7_FSM3_TB, Ri_PLUS__p1_FSM4_TB, Ri_PLUS__p7_FSM6_TB, Ri_PLUS__p1_FSM7_TB,
	Ri_MINUS_, Ri_MINUS__p0_FSM1_TB, Ri_MINUS__p4_FSM2_TB, Ri_MINUS__p0_FSM3_TB, Ri_MINUS__p4_FSM4_TB, Ri_MINUS__p0_FSM6_TB, Ri_MINUS__p4_FSM7_TB,
	e_Ro2_MINUS, e_Ro2_MINUS_p3_FSM3_TB, e_Ro2_MINUS_p3_FSM6_TB,
	e_Ro2_PLUS, e_Ro2_PLUS_p3_FSM3_TB, e_Ro2_PLUS_p8_FSM6_TB,
	p0,
	p3,
	p6,
	p7
);

	// Regular Synchronous FSM input Signals //
	input clk;
	input reset;

	// Regular input Signals //
	input Ri_PLUS_;
	input Ri_MINUS_;
	// Transition Barrier Inputs for input Signals //
	input Ri_PLUS__p1_FSM1_TB, Ri_PLUS__p1_FSM2_TB, Ri_PLUS__p7_FSM3_TB, Ri_PLUS__p1_FSM4_TB, Ri_PLUS__p7_FSM6_TB, Ri_PLUS__p1_FSM7_TB;
	input Ri_MINUS__p0_FSM1_TB, Ri_MINUS__p4_FSM2_TB, Ri_MINUS__p0_FSM3_TB, Ri_MINUS__p4_FSM4_TB, Ri_MINUS__p0_FSM6_TB, Ri_MINUS__p4_FSM7_TB;

	// Regular output Signals //
	output e_Ro2_MINUS;
	output e_Ro2_PLUS;
	// Transition Barrier outputs for output Signals //
	input e_Ro2_MINUS_p3_FSM3_TB, e_Ro2_MINUS_p3_FSM6_TB;
	input e_Ro2_PLUS_p3_FSM3_TB, e_Ro2_PLUS_p8_FSM6_TB;

	// FSMs' Synchronisation output Signals //
	output p0;
	output p3;
	output p6;
	output p7;

	reg e_Ro2_MINUS;
	reg e_Ro2_PLUS;
	wire p0;
	wire p3;
	wire p6;
	wire p7;

	wire Ri_PLUS__TB_sync;
	wire Ri_MINUS__TB_sync;
	wire e_Ro2_MINUS_TB_sync;
	wire e_Ro2_PLUS_TB_sync;
	assign Ri_PLUS__TB_sync = Ri_PLUS_ & Ri_PLUS__p1_FSM1_TB & Ri_PLUS__p1_FSM2_TB & Ri_PLUS__p7_FSM3_TB & Ri_PLUS__p1_FSM4_TB & Ri_PLUS__p7_FSM6_TB & Ri_PLUS__p1_FSM7_TB;
	assign Ri_MINUS__TB_sync = Ri_MINUS_ & Ri_MINUS__p0_FSM1_TB & Ri_MINUS__p4_FSM2_TB & Ri_MINUS__p0_FSM3_TB & Ri_MINUS__p4_FSM4_TB & Ri_MINUS__p0_FSM6_TB & Ri_MINUS__p4_FSM7_TB;
	assign e_Ro2_MINUS_TB_sync = e_Ro2_MINUS_p3_FSM3_TB & e_Ro2_MINUS_p3_FSM6_TB;
	assign e_Ro2_PLUS_TB_sync = e_Ro2_PLUS_p3_FSM3_TB & e_Ro2_PLUS_p8_FSM6_TB;

	parameter p0_1HOT_ENCODING = 4'd1; // 4'b0001 //
	parameter p3_1HOT_ENCODING = 4'd2; // 4'b0010 //
	parameter p6_1HOT_ENCODING = 4'd4; // 4'b0100 //
	parameter p7_1HOT_ENCODING = 4'd8; // 4'b1000 //

	reg [3 : 0]	state;
	reg [3 : 0]	next_state;

	always @(posedge clk)
		begin
			if (reset)
				begin
						state <= p7_1HOT_ENCODING;
				end
			else
				begin
						state <= next_state;
				end
		end

	assign p0 = (state == p0_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p3 = (state == p3_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p6 = (state == p6_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p7 = (state == p7_1HOT_ENCODING) ? 1'b1 : 1'b0;

	always @(state or Ri_PLUS__TB_sync or Ri_MINUS__TB_sync or e_Ro2_MINUS_TB_sync or e_Ro2_PLUS_TB_sync)
		begin
			// MEALY FSMs - Blocking Operations //
			next_state = state;

			e_Ro2_MINUS = 1'b0;
			e_Ro2_PLUS = 1'b0;

			case (state)
				p0_1HOT_ENCODING: // 4'b0001: //
					begin
						if (Ri_MINUS__TB_sync)
							begin
								next_state = p3_1HOT_ENCODING;
							end
					end

				p3_1HOT_ENCODING: // 4'b0010: //
					begin
						if (e_Ro2_PLUS_TB_sync)
							begin
								e_Ro2_PLUS = 1'b1;
								next_state = p6_1HOT_ENCODING;
							end
					end

				p6_1HOT_ENCODING: // 4'b0100: //
					begin
						if (e_Ro2_MINUS_TB_sync)
							begin
								e_Ro2_MINUS = 1'b1;
								next_state = p7_1HOT_ENCODING;
							end
					end

				p7_1HOT_ENCODING: // 4'b1000: //
					begin
						if (Ri_PLUS__TB_sync)
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

module fsm_mealy_synth_06 (
	clk,
	reset,
	Ri_PLUS_, Ri_PLUS__p1_FSM1_TB, Ri_PLUS__p1_FSM2_TB, Ri_PLUS__p7_FSM3_TB, Ri_PLUS__p1_FSM4_TB, Ri_PLUS__p7_FSM5_TB, Ri_PLUS__p1_FSM7_TB,
	Ri_MINUS_, Ri_MINUS__p0_FSM1_TB, Ri_MINUS__p4_FSM2_TB, Ri_MINUS__p0_FSM3_TB, Ri_MINUS__p4_FSM4_TB, Ri_MINUS__p0_FSM5_TB, Ri_MINUS__p4_FSM7_TB,
	e_Ro2_MINUS, e_Ro2_MINUS_p3_FSM3_TB, e_Ro2_MINUS_p6_FSM5_TB,
	e_Ro2_PLUS, e_Ro2_PLUS_p3_FSM3_TB, e_Ro2_PLUS_p3_FSM5_TB,
	p0,
	p3,
	p7,
	p8
);

	// Regular Synchronous FSM input Signals //
	input clk;
	input reset;

	// Regular input Signals //
	input Ri_PLUS_;
	input Ri_MINUS_;
	// Transition Barrier Inputs for input Signals //
	input Ri_PLUS__p1_FSM1_TB, Ri_PLUS__p1_FSM2_TB, Ri_PLUS__p7_FSM3_TB, Ri_PLUS__p1_FSM4_TB, Ri_PLUS__p7_FSM5_TB, Ri_PLUS__p1_FSM7_TB;
	input Ri_MINUS__p0_FSM1_TB, Ri_MINUS__p4_FSM2_TB, Ri_MINUS__p0_FSM3_TB, Ri_MINUS__p4_FSM4_TB, Ri_MINUS__p0_FSM5_TB, Ri_MINUS__p4_FSM7_TB;

	// Regular output Signals //
	output e_Ro2_MINUS;
	output e_Ro2_PLUS;
	// Transition Barrier outputs for output Signals //
	input e_Ro2_MINUS_p3_FSM3_TB, e_Ro2_MINUS_p6_FSM5_TB;
	input e_Ro2_PLUS_p3_FSM3_TB, e_Ro2_PLUS_p3_FSM5_TB;

	// FSMs' Synchronisation output Signals //
	output p0;
	output p3;
	output p7;
	output p8;

	reg e_Ro2_MINUS;
	reg e_Ro2_PLUS;
	wire p0;
	wire p3;
	wire p7;
	wire p8;

	wire Ri_PLUS__TB_sync;
	wire Ri_MINUS__TB_sync;
	wire e_Ro2_MINUS_TB_sync;
	wire e_Ro2_PLUS_TB_sync;
	assign Ri_PLUS__TB_sync = Ri_PLUS_ & Ri_PLUS__p1_FSM1_TB & Ri_PLUS__p1_FSM2_TB & Ri_PLUS__p7_FSM3_TB & Ri_PLUS__p1_FSM4_TB & Ri_PLUS__p7_FSM5_TB & Ri_PLUS__p1_FSM7_TB;
	assign Ri_MINUS__TB_sync = Ri_MINUS_ & Ri_MINUS__p0_FSM1_TB & Ri_MINUS__p4_FSM2_TB & Ri_MINUS__p0_FSM3_TB & Ri_MINUS__p4_FSM4_TB & Ri_MINUS__p0_FSM5_TB & Ri_MINUS__p4_FSM7_TB;
	assign e_Ro2_MINUS_TB_sync = e_Ro2_MINUS_p3_FSM3_TB & e_Ro2_MINUS_p6_FSM5_TB;
	assign e_Ro2_PLUS_TB_sync = e_Ro2_PLUS_p3_FSM3_TB & e_Ro2_PLUS_p3_FSM5_TB;

	parameter p0_1HOT_ENCODING = 4'd1; // 4'b0001 //
	parameter p3_1HOT_ENCODING = 4'd2; // 4'b0010 //
	parameter p7_1HOT_ENCODING = 4'd4; // 4'b0100 //
	parameter p8_1HOT_ENCODING = 4'd8; // 4'b1000 //

	reg [3 : 0]	state;
	reg [3 : 0]	next_state;

	always @(posedge clk)
		begin
			if (reset)
				begin
						state <= p7_1HOT_ENCODING;
						state <= p8_1HOT_ENCODING;
				end
			else
				begin
						state <= next_state;
				end
		end

	assign p0 = (state == p0_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p3 = (state == p3_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p7 = (state == p7_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p8 = (state == p8_1HOT_ENCODING) ? 1'b1 : 1'b0;

	always @(state or Ri_PLUS__TB_sync or Ri_MINUS__TB_sync or e_Ro2_MINUS_TB_sync or e_Ro2_PLUS_TB_sync)
		begin
			// MEALY FSMs - Blocking Operations //
			next_state = state;

			e_Ro2_MINUS = 1'b0;
			e_Ro2_PLUS = 1'b0;

			case (state)
				p0_1HOT_ENCODING: // 4'b0001: //
					begin
						if (Ri_MINUS__TB_sync)
							begin
								next_state = p3_1HOT_ENCODING;
							end
					end

				p3_1HOT_ENCODING: // 4'b0010: //
					begin
						if (e_Ro2_MINUS_TB_sync)
							begin
								e_Ro2_MINUS = 1'b1;
								next_state = p8_1HOT_ENCODING;
							end
					end

				p7_1HOT_ENCODING: // 4'b0100: //
					begin
						if (Ri_PLUS__TB_sync)
							begin
								next_state = p0_1HOT_ENCODING;
							end
					end

				p8_1HOT_ENCODING: // 4'b1000: //
					begin
						if (e_Ro2_PLUS_TB_sync)
							begin
								e_Ro2_PLUS = 1'b1;
								next_state = p7_1HOT_ENCODING;
							end
					end

				default:
						begin
							next_state = 4'dx;
						end
			endcase
		end
endmodule

module fsm_mealy_synth_07 (
	clk,
	reset,
	Ri_PLUS_, Ri_PLUS__p1_FSM1_TB, Ri_PLUS__p1_FSM2_TB, Ri_PLUS__p7_FSM3_TB, Ri_PLUS__p1_FSM4_TB, Ri_PLUS__p7_FSM5_TB, Ri_PLUS__p7_FSM6_TB,
	Ri_MINUS_, Ri_MINUS__p0_FSM1_TB, Ri_MINUS__p4_FSM2_TB, Ri_MINUS__p0_FSM3_TB, Ri_MINUS__p4_FSM4_TB, Ri_MINUS__p0_FSM5_TB, Ri_MINUS__p0_FSM6_TB,
	e_Ro1_MINUS, e_Ro1_MINUS_p2_FSM2_TB, e_Ro1_MINUS_p5_FSM4_TB,
	e_Ro1_PLUS, e_Ro1_PLUS_p2_FSM2_TB, e_Ro1_PLUS_p2_FSM4_TB,
	p1,
	p2,
	p4,
	p9
);

	// Regular Synchronous FSM input Signals //
	input clk;
	input reset;

	// Regular input Signals //
	input Ri_PLUS_;
	input Ri_MINUS_;
	// Transition Barrier Inputs for input Signals //
	input Ri_PLUS__p1_FSM1_TB, Ri_PLUS__p1_FSM2_TB, Ri_PLUS__p7_FSM3_TB, Ri_PLUS__p1_FSM4_TB, Ri_PLUS__p7_FSM5_TB, Ri_PLUS__p7_FSM6_TB;
	input Ri_MINUS__p0_FSM1_TB, Ri_MINUS__p4_FSM2_TB, Ri_MINUS__p0_FSM3_TB, Ri_MINUS__p4_FSM4_TB, Ri_MINUS__p0_FSM5_TB, Ri_MINUS__p0_FSM6_TB;

	// Regular output Signals //
	output e_Ro1_MINUS;
	output e_Ro1_PLUS;
	// Transition Barrier outputs for output Signals //
	input e_Ro1_MINUS_p2_FSM2_TB, e_Ro1_MINUS_p5_FSM4_TB;
	input e_Ro1_PLUS_p2_FSM2_TB, e_Ro1_PLUS_p2_FSM4_TB;

	// FSMs' Synchronisation output Signals //
	output p1;
	output p2;
	output p4;
	output p9;

	reg e_Ro1_MINUS;
	reg e_Ro1_PLUS;
	wire p1;
	wire p2;
	wire p4;
	wire p9;

	wire Ri_PLUS__TB_sync;
	wire Ri_MINUS__TB_sync;
	wire e_Ro1_MINUS_TB_sync;
	wire e_Ro1_PLUS_TB_sync;
	assign Ri_PLUS__TB_sync = Ri_PLUS_ & Ri_PLUS__p1_FSM1_TB & Ri_PLUS__p1_FSM2_TB & Ri_PLUS__p7_FSM3_TB & Ri_PLUS__p1_FSM4_TB & Ri_PLUS__p7_FSM5_TB & Ri_PLUS__p7_FSM6_TB;
	assign Ri_MINUS__TB_sync = Ri_MINUS_ & Ri_MINUS__p0_FSM1_TB & Ri_MINUS__p4_FSM2_TB & Ri_MINUS__p0_FSM3_TB & Ri_MINUS__p4_FSM4_TB & Ri_MINUS__p0_FSM5_TB & Ri_MINUS__p0_FSM6_TB;
	assign e_Ro1_MINUS_TB_sync = e_Ro1_MINUS_p2_FSM2_TB & e_Ro1_MINUS_p5_FSM4_TB;
	assign e_Ro1_PLUS_TB_sync = e_Ro1_PLUS_p2_FSM2_TB & e_Ro1_PLUS_p2_FSM4_TB;

	parameter p1_1HOT_ENCODING = 4'd1; // 4'b0001 //
	parameter p2_1HOT_ENCODING = 4'd2; // 4'b0010 //
	parameter p4_1HOT_ENCODING = 4'd4; // 4'b0100 //
	parameter p9_1HOT_ENCODING = 4'd8; // 4'b1000 //

	reg [3 : 0]	state;
	reg [3 : 0]	next_state;

	always @(posedge clk)
		begin
			if (reset)
				begin
						state <= p1_1HOT_ENCODING;
						state <= p9_1HOT_ENCODING;
				end
			else
				begin
						state <= next_state;
				end
		end

	assign p1 = (state == p1_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p2 = (state == p2_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p4 = (state == p4_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p9 = (state == p9_1HOT_ENCODING) ? 1'b1 : 1'b0;

	always @(state or Ri_PLUS__TB_sync or Ri_MINUS__TB_sync or e_Ro1_MINUS_TB_sync or e_Ro1_PLUS_TB_sync)
		begin
			// MEALY FSMs - Blocking Operations //
			next_state = state;

			e_Ro1_MINUS = 1'b0;
			e_Ro1_PLUS = 1'b0;

			case (state)
				p1_1HOT_ENCODING: // 4'b0001: //
					begin
						if (Ri_PLUS__TB_sync)
							begin
								next_state = p2_1HOT_ENCODING;
							end
					end

				p2_1HOT_ENCODING: // 4'b0010: //
					begin
						if (e_Ro1_MINUS_TB_sync)
							begin
								e_Ro1_MINUS = 1'b1;
								next_state = p9_1HOT_ENCODING;
							end
					end

				p4_1HOT_ENCODING: // 4'b0100: //
					begin
						if (Ri_MINUS__TB_sync)
							begin
								next_state = p1_1HOT_ENCODING;
							end
					end

				p9_1HOT_ENCODING: // 4'b1000: //
					begin
						if (e_Ro1_PLUS_TB_sync)
							begin
								e_Ro1_PLUS = 1'b1;
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

