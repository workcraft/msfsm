`timescale 1ns/1ns

module fsm_mealy_synth_01 (
	clk,
	reset,
	Ri_PLUS_, Ri_PLUS__p2_FSM3_TB,
	Ai_PLUS_, Ai_PLUS__p3_FSM2_TB,
	e_Ro_PLUS, e_Ro_PLUS_p6_FSM2_TB, e_Ro_PLUS_p7_FSM3_TB, e_Ro_PLUS_p6_FSM4_TB,
	e_Ro_MINUS, e_Ro_MINUS_p4_FSM2_TB, e_Ro_MINUS_p10_FSM4_TB,
	e_Ao_MINUS, e_Ao_MINUS_p1_FSM3_TB,
	p9,
	p4,
	p7,
	p3,
	p2
);

	// Regular Synchronous FSM input Signals //
	input clk;
	input reset;

	// Regular input Signals //
	input Ri_PLUS_;
	input Ai_PLUS_;
	// Transition Barrier Inputs for input Signals //
	input Ri_PLUS__p2_FSM3_TB;
	input Ai_PLUS__p3_FSM2_TB;

	// Regular output Signals //
	output e_Ro_PLUS;
	output e_Ro_MINUS;
	output e_Ao_MINUS;
	// Transition Barrier outputs for output Signals //
	input e_Ro_PLUS_p6_FSM2_TB, e_Ro_PLUS_p7_FSM3_TB, e_Ro_PLUS_p6_FSM4_TB;
	input e_Ro_MINUS_p4_FSM2_TB, e_Ro_MINUS_p10_FSM4_TB;
	input e_Ao_MINUS_p1_FSM3_TB;

	// FSMs' Synchronisation output Signals //
	output p9;
	output p4;
	output p7;
	output p3;
	output p2;

	reg e_Ro_PLUS;
	reg e_Ro_MINUS;
	reg e_Ao_MINUS;
	wire p9;
	wire p4;
	wire p7;
	wire p3;
	wire p2;

	wire Ri_PLUS__TB_sync;
	wire Ai_PLUS__TB_sync;
	wire e_Ro_PLUS_TB_sync;
	wire e_Ro_MINUS_TB_sync;
	wire e_Ao_MINUS_TB_sync;
	assign Ri_PLUS__TB_sync = Ri_PLUS_ & Ri_PLUS__p2_FSM3_TB;
	assign Ai_PLUS__TB_sync = Ai_PLUS_ & Ai_PLUS__p3_FSM2_TB;
	assign e_Ro_PLUS_TB_sync = e_Ro_PLUS_p6_FSM2_TB & e_Ro_PLUS_p7_FSM3_TB & e_Ro_PLUS_p6_FSM4_TB;
	assign e_Ro_MINUS_TB_sync = e_Ro_MINUS_p4_FSM2_TB & e_Ro_MINUS_p10_FSM4_TB;
	assign e_Ao_MINUS_TB_sync = e_Ao_MINUS_p1_FSM3_TB;

	parameter p9_1HOT_ENCODING = 5'd1; // 5'b00001 //
	parameter p4_1HOT_ENCODING = 5'd2; // 5'b00010 //
	parameter p7_1HOT_ENCODING = 5'd4; // 5'b00100 //
	parameter p3_1HOT_ENCODING = 5'd8; // 5'b01000 //
	parameter p2_1HOT_ENCODING = 5'd16; // 5'b10000 //

	reg [4 : 0]	state;
	reg [4 : 0]	next_state;

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

	assign p9 = (state == p9_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p4 = (state == p4_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p7 = (state == p7_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p3 = (state == p3_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p2 = (state == p2_1HOT_ENCODING) ? 1'b1 : 1'b0;

	always @(state or Ri_PLUS__TB_sync or Ai_PLUS__TB_sync or e_Ro_PLUS_TB_sync or e_Ro_MINUS_TB_sync or e_Ao_MINUS_TB_sync)
		begin
			// MEALY FSMs - Blocking Operations //
			next_state = state;

			e_Ro_PLUS = 1'b0;
			e_Ro_MINUS = 1'b0;
			e_Ao_MINUS = 1'b0;

			case (state)
				p9_1HOT_ENCODING: // 5'b00001: //
					begin
						if (e_Ao_MINUS_TB_sync)
							begin
								e_Ao_MINUS = 1'b1;
								next_state = p2_1HOT_ENCODING;
							end
					end

				p4_1HOT_ENCODING: // 5'b00010: //
					begin
						if (e_Ro_MINUS_TB_sync)
							begin
								e_Ro_MINUS = 1'b1;
								next_state = p9_1HOT_ENCODING;
							end
					end

				p7_1HOT_ENCODING: // 5'b00100: //
					begin
						if (e_Ro_PLUS_TB_sync)
							begin
								e_Ro_PLUS = 1'b1;
								next_state = p3_1HOT_ENCODING;
							end
					end

				p3_1HOT_ENCODING: // 5'b01000: //
					begin
						if (Ai_PLUS__TB_sync)
							begin
								next_state = p4_1HOT_ENCODING;
							end
					end

				p2_1HOT_ENCODING: // 5'b10000: //
					begin
						if (Ri_PLUS__TB_sync)
							begin
								next_state = p7_1HOT_ENCODING;
							end
					end

				default:
						begin
							next_state = 5'dx;
						end
			endcase
		end
endmodule

module fsm_mealy_synth_02 (
	clk,
	reset,
	Ai_PLUS_, Ai_PLUS__p3_FSM1_TB,
	Ai_MINUS_, Ai_MINUS__p5_FSM4_TB,
	e_Ro_PLUS, e_Ro_PLUS_p7_FSM1_TB, e_Ro_PLUS_p7_FSM3_TB, e_Ro_PLUS_p6_FSM4_TB,
	e_Ro_MINUS, e_Ro_MINUS_p4_FSM1_TB, e_Ro_MINUS_p10_FSM4_TB,
	p5,
	p4,
	p3,
	p6
);

	// Regular Synchronous FSM input Signals //
	input clk;
	input reset;

	// Regular input Signals //
	input Ai_PLUS_;
	input Ai_MINUS_;
	// Transition Barrier Inputs for input Signals //
	input Ai_PLUS__p3_FSM1_TB;
	input Ai_MINUS__p5_FSM4_TB;

	// Regular output Signals //
	output e_Ro_PLUS;
	output e_Ro_MINUS;
	// Transition Barrier outputs for output Signals //
	input e_Ro_PLUS_p7_FSM1_TB, e_Ro_PLUS_p7_FSM3_TB, e_Ro_PLUS_p6_FSM4_TB;
	input e_Ro_MINUS_p4_FSM1_TB, e_Ro_MINUS_p10_FSM4_TB;

	// FSMs' Synchronisation output Signals //
	output p5;
	output p4;
	output p3;
	output p6;

	reg e_Ro_PLUS;
	reg e_Ro_MINUS;
	wire p5;
	wire p4;
	wire p3;
	wire p6;

	wire Ai_PLUS__TB_sync;
	wire Ai_MINUS__TB_sync;
	wire e_Ro_PLUS_TB_sync;
	wire e_Ro_MINUS_TB_sync;
	assign Ai_PLUS__TB_sync = Ai_PLUS_ & Ai_PLUS__p3_FSM1_TB;
	assign Ai_MINUS__TB_sync = Ai_MINUS_ & Ai_MINUS__p5_FSM4_TB;
	assign e_Ro_PLUS_TB_sync = e_Ro_PLUS_p7_FSM1_TB & e_Ro_PLUS_p7_FSM3_TB & e_Ro_PLUS_p6_FSM4_TB;
	assign e_Ro_MINUS_TB_sync = e_Ro_MINUS_p4_FSM1_TB & e_Ro_MINUS_p10_FSM4_TB;

	parameter p5_1HOT_ENCODING = 4'd1; // 4'b0001 //
	parameter p4_1HOT_ENCODING = 4'd2; // 4'b0010 //
	parameter p3_1HOT_ENCODING = 4'd4; // 4'b0100 //
	parameter p6_1HOT_ENCODING = 4'd8; // 4'b1000 //

	reg [3 : 0]	state;
	reg [3 : 0]	next_state;

	always @(posedge clk)
		begin
			if (reset)
				begin
						state <= p6_1HOT_ENCODING;
				end
			else
				begin
						state <= next_state;
				end
		end

	assign p5 = (state == p5_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p4 = (state == p4_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p3 = (state == p3_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p6 = (state == p6_1HOT_ENCODING) ? 1'b1 : 1'b0;

	always @(state or Ai_PLUS__TB_sync or Ai_MINUS__TB_sync or e_Ro_PLUS_TB_sync or e_Ro_MINUS_TB_sync)
		begin
			// MEALY FSMs - Blocking Operations //
			next_state = state;

			e_Ro_PLUS = 1'b0;
			e_Ro_MINUS = 1'b0;

			case (state)
				p5_1HOT_ENCODING: // 4'b0001: //
					begin
						if (Ai_MINUS__TB_sync)
							begin
								next_state = p6_1HOT_ENCODING;
							end
					end

				p4_1HOT_ENCODING: // 4'b0010: //
					begin
						if (e_Ro_MINUS_TB_sync)
							begin
								e_Ro_MINUS = 1'b1;
								next_state = p5_1HOT_ENCODING;
							end
					end

				p3_1HOT_ENCODING: // 4'b0100: //
					begin
						if (Ai_PLUS__TB_sync)
							begin
								next_state = p4_1HOT_ENCODING;
							end
					end

				p6_1HOT_ENCODING: // 4'b1000: //
					begin
						if (e_Ro_PLUS_TB_sync)
							begin
								e_Ro_PLUS = 1'b1;
								next_state = p3_1HOT_ENCODING;
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
	Ri_PLUS_, Ri_PLUS__p2_FSM1_TB,
	Ri_MINUS_,
	e_Ro_PLUS, e_Ro_PLUS_p7_FSM1_TB, e_Ro_PLUS_p6_FSM2_TB, e_Ro_PLUS_p6_FSM4_TB,
	e_Ao_PLUS, e_Ao_PLUS_p8_FSM4_TB,
	e_Ao_MINUS, e_Ao_MINUS_p9_FSM1_TB,
	p1,
	p8,
	p7,
	p2
);

	// Regular Synchronous FSM input Signals //
	input clk;
	input reset;

	// Regular input Signals //
	input Ri_PLUS_;
	input Ri_MINUS_;
	// Transition Barrier Inputs for input Signals //
	input Ri_PLUS__p2_FSM1_TB;

	// Regular output Signals //
	output e_Ro_PLUS;
	output e_Ao_PLUS;
	output e_Ao_MINUS;
	// Transition Barrier outputs for output Signals //
	input e_Ro_PLUS_p7_FSM1_TB, e_Ro_PLUS_p6_FSM2_TB, e_Ro_PLUS_p6_FSM4_TB;
	input e_Ao_PLUS_p8_FSM4_TB;
	input e_Ao_MINUS_p9_FSM1_TB;

	// FSMs' Synchronisation output Signals //
	output p1;
	output p8;
	output p7;
	output p2;

	reg e_Ro_PLUS;
	reg e_Ao_PLUS;
	reg e_Ao_MINUS;
	wire p1;
	wire p8;
	wire p7;
	wire p2;

	wire Ri_PLUS__TB_sync;
	wire e_Ro_PLUS_TB_sync;
	wire e_Ao_PLUS_TB_sync;
	wire e_Ao_MINUS_TB_sync;
	assign Ri_PLUS__TB_sync = Ri_PLUS_ & Ri_PLUS__p2_FSM1_TB;
	assign e_Ro_PLUS_TB_sync = e_Ro_PLUS_p7_FSM1_TB & e_Ro_PLUS_p6_FSM2_TB & e_Ro_PLUS_p6_FSM4_TB;
	assign e_Ao_PLUS_TB_sync = e_Ao_PLUS_p8_FSM4_TB;
	assign e_Ao_MINUS_TB_sync = e_Ao_MINUS_p9_FSM1_TB;

	parameter p1_1HOT_ENCODING = 5'd1; // 5'b00001 //
	parameter p8_1HOT_ENCODING = 5'd2; // 5'b00010 //
	parameter p0_1HOT_ENCODING = 5'd4; // 5'b00100 //
	parameter p7_1HOT_ENCODING = 5'd8; // 5'b01000 //
	parameter p2_1HOT_ENCODING = 5'd16; // 5'b10000 //

	reg [4 : 0]	state;
	reg [4 : 0]	next_state;

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

	assign p1 = (state == p1_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p8 = (state == p8_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p7 = (state == p7_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p2 = (state == p2_1HOT_ENCODING) ? 1'b1 : 1'b0;

	always @(state or Ri_PLUS__TB_sync or Ri_MINUS_ or e_Ro_PLUS_TB_sync or e_Ao_PLUS_TB_sync or e_Ao_MINUS_TB_sync)
		begin
			// MEALY FSMs - Blocking Operations //
			next_state = state;

			e_Ro_PLUS = 1'b0;
			e_Ao_PLUS = 1'b0;
			e_Ao_MINUS = 1'b0;

			case (state)
				p1_1HOT_ENCODING: // 5'b00001: //
					begin
						if (e_Ao_MINUS_TB_sync)
							begin
								e_Ao_MINUS = 1'b1;
								next_state = p2_1HOT_ENCODING;
							end
					end

				p8_1HOT_ENCODING: // 5'b00010: //
					begin
						if (e_Ao_PLUS_TB_sync)
							begin
								e_Ao_PLUS = 1'b1;
								next_state = p0_1HOT_ENCODING;
							end
					end

				p0_1HOT_ENCODING: // 5'b00100: //
					begin
						if (Ri_MINUS_)
							begin
								next_state = p1_1HOT_ENCODING;
							end
					end

				p7_1HOT_ENCODING: // 5'b01000: //
					begin
						if (e_Ro_PLUS_TB_sync)
							begin
								e_Ro_PLUS = 1'b1;
								next_state = p8_1HOT_ENCODING;
							end
					end

				p2_1HOT_ENCODING: // 5'b10000: //
					begin
						if (Ri_PLUS__TB_sync)
							begin
								next_state = p7_1HOT_ENCODING;
							end
					end

				default:
						begin
							next_state = 5'dx;
						end
			endcase
		end
endmodule

module fsm_mealy_synth_04 (
	clk,
	reset,
	Ai_MINUS_, Ai_MINUS__p5_FSM2_TB,
	e_Ro_PLUS, e_Ro_PLUS_p7_FSM1_TB, e_Ro_PLUS_p6_FSM2_TB, e_Ro_PLUS_p7_FSM3_TB,
	e_Ro_MINUS, e_Ro_MINUS_p4_FSM1_TB, e_Ro_MINUS_p4_FSM2_TB,
	e_Ao_PLUS, e_Ao_PLUS_p8_FSM3_TB,
	p5,
	p8,
	p10,
	p6
);

	// Regular Synchronous FSM input Signals //
	input clk;
	input reset;

	// Regular input Signals //
	input Ai_MINUS_;
	// Transition Barrier Inputs for input Signals //
	input Ai_MINUS__p5_FSM2_TB;

	// Regular output Signals //
	output e_Ro_PLUS;
	output e_Ro_MINUS;
	output e_Ao_PLUS;
	// Transition Barrier outputs for output Signals //
	input e_Ro_PLUS_p7_FSM1_TB, e_Ro_PLUS_p6_FSM2_TB, e_Ro_PLUS_p7_FSM3_TB;
	input e_Ro_MINUS_p4_FSM1_TB, e_Ro_MINUS_p4_FSM2_TB;
	input e_Ao_PLUS_p8_FSM3_TB;

	// FSMs' Synchronisation output Signals //
	output p5;
	output p8;
	output p10;
	output p6;

	reg e_Ro_PLUS;
	reg e_Ro_MINUS;
	reg e_Ao_PLUS;
	wire p5;
	wire p8;
	wire p10;
	wire p6;

	wire Ai_MINUS__TB_sync;
	wire e_Ro_PLUS_TB_sync;
	wire e_Ro_MINUS_TB_sync;
	wire e_Ao_PLUS_TB_sync;
	assign Ai_MINUS__TB_sync = Ai_MINUS_ & Ai_MINUS__p5_FSM2_TB;
	assign e_Ro_PLUS_TB_sync = e_Ro_PLUS_p7_FSM1_TB & e_Ro_PLUS_p6_FSM2_TB & e_Ro_PLUS_p7_FSM3_TB;
	assign e_Ro_MINUS_TB_sync = e_Ro_MINUS_p4_FSM1_TB & e_Ro_MINUS_p4_FSM2_TB;
	assign e_Ao_PLUS_TB_sync = e_Ao_PLUS_p8_FSM3_TB;

	parameter p5_1HOT_ENCODING = 4'd1; // 4'b0001 //
	parameter p8_1HOT_ENCODING = 4'd2; // 4'b0010 //
	parameter p10_1HOT_ENCODING = 4'd4; // 4'b0100 //
	parameter p6_1HOT_ENCODING = 4'd8; // 4'b1000 //

	reg [3 : 0]	state;
	reg [3 : 0]	next_state;

	always @(posedge clk)
		begin
			if (reset)
				begin
						state <= p6_1HOT_ENCODING;
				end
			else
				begin
						state <= next_state;
				end
		end

	assign p5 = (state == p5_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p8 = (state == p8_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p10 = (state == p10_1HOT_ENCODING) ? 1'b1 : 1'b0;
	assign p6 = (state == p6_1HOT_ENCODING) ? 1'b1 : 1'b0;

	always @(state or Ai_MINUS__TB_sync or e_Ro_PLUS_TB_sync or e_Ro_MINUS_TB_sync or e_Ao_PLUS_TB_sync)
		begin
			// MEALY FSMs - Blocking Operations //
			next_state = state;

			e_Ro_PLUS = 1'b0;
			e_Ro_MINUS = 1'b0;
			e_Ao_PLUS = 1'b0;

			case (state)
				p5_1HOT_ENCODING: // 4'b0001: //
					begin
						if (Ai_MINUS__TB_sync)
							begin
								next_state = p6_1HOT_ENCODING;
							end
					end

				p8_1HOT_ENCODING: // 4'b0010: //
					begin
						if (e_Ao_PLUS_TB_sync)
							begin
								e_Ao_PLUS = 1'b1;
								next_state = p10_1HOT_ENCODING;
							end
					end

				p10_1HOT_ENCODING: // 4'b0100: //
					begin
						if (e_Ro_MINUS_TB_sync)
							begin
								e_Ro_MINUS = 1'b1;
								next_state = p5_1HOT_ENCODING;
							end
					end

				p6_1HOT_ENCODING: // 4'b1000: //
					begin
						if (e_Ro_PLUS_TB_sync)
							begin
								e_Ro_PLUS = 1'b1;
								next_state = p8_1HOT_ENCODING;
							end
					end

				default:
						begin
							next_state = 4'dx;
						end
			endcase
		end
endmodule

