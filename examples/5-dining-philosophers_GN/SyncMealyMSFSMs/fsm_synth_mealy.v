`timescale 1ns/1ns

module fsm_mealy_synth_01 (
	clk,
	reset,
	t9_,
	t6_,
	t3_,
	t0_,
	t8_,
	t5_,
	t2_,
	t7_,
	t4_,
	t1_
);

	// Regular Synchronous FSM input Signals //
	input clk;
	input reset;

	// Regular input Signals //
	input t9_;
	input t6_;
	input t3_;
	input t0_;
	input t8_;
	input t5_;
	input t2_;
	input t7_;
	input t4_;
	input t1_;
	// Transition Barrier Inputs for input Signals //
	// === EMPTY! === //

	// Regular output Signals //
	// === EMPTY! === //
	// Transition Barrier outputs for output Signals //
	// === EMPTY! === //

	// FSMs' Synchronisation output Signals //
	// === EMPTY! === //



	parameter p7_1HOT_ENCODING = 10'd1; // 10'b0000000001 //
	parameter p4_1HOT_ENCODING = 10'd2; // 10'b0000000010 //
	parameter p1_1HOT_ENCODING = 10'd4; // 10'b0000000100 //
	parameter p9_1HOT_ENCODING = 10'd8; // 10'b0000001000 //
	parameter p6_1HOT_ENCODING = 10'd16; // 10'b0000010000 //
	parameter p3_1HOT_ENCODING = 10'd32; // 10'b0000100000 //
	parameter p0_1HOT_ENCODING = 10'd64; // 10'b0001000000 //
	parameter p8_1HOT_ENCODING = 10'd128; // 10'b0010000000 //
	parameter p5_1HOT_ENCODING = 10'd256; // 10'b0100000000 //
	parameter p2_1HOT_ENCODING = 10'd512; // 10'b1000000000 //

	reg [9 : 0]	state;
	reg [9 : 0]	next_state;

	always @(posedge clk)
		begin
			if (reset)
				begin
						state <= p7_1HOT_ENCODING;
						state <= p4_1HOT_ENCODING;
						state <= p1_1HOT_ENCODING;
				end
			else
				begin
						state <= next_state;
				end
		end


	always @(state or t9_ or t6_ or t3_ or t0_ or t8_ or t5_ or t2_ or t7_ or t4_ or t1_)
		begin
			// MEALY FSMs - Blocking Operations //
			next_state = state;

			// Empty output Events! //

			case (state)
				p7_1HOT_ENCODING: // 10'b0000000001: //
					begin
						if (t6_)
							begin
								next_state = p8_1HOT_ENCODING;
							end
					end

				p4_1HOT_ENCODING: // 10'b0000000010: //
					begin
						if (t5_)
							begin
								next_state = p5_1HOT_ENCODING;
							end
					end

				p1_1HOT_ENCODING: // 10'b0000000100: //
					begin
						if (t0_)
							begin
								next_state = p2_1HOT_ENCODING;
							end
					end

				p9_1HOT_ENCODING: // 10'b0000001000: //
					begin
						if (t8_)
							begin
								next_state = p0_1HOT_ENCODING;
							end
					end

				p6_1HOT_ENCODING: // 10'b0000010000: //
					begin
						if (t7_)
							begin
								next_state = p7_1HOT_ENCODING;
							end
					end

				p3_1HOT_ENCODING: // 10'b0000100000: //
					begin
						if (t2_)
							begin
								next_state = p4_1HOT_ENCODING;
							end
					end

				p0_1HOT_ENCODING: // 10'b0001000000: //
					begin
						if (t1_)
							begin
								next_state = p1_1HOT_ENCODING;
							end
					end

				p8_1HOT_ENCODING: // 10'b0010000000: //
					begin
						if (t9_)
							begin
								next_state = p9_1HOT_ENCODING;
							end
					end

				p5_1HOT_ENCODING: // 10'b0100000000: //
					begin
						if (t4_)
							begin
								next_state = p6_1HOT_ENCODING;
							end
					end

				p2_1HOT_ENCODING: // 10'b1000000000: //
					begin
						if (t3_)
							begin
								next_state = p3_1HOT_ENCODING;
							end
					end

				default:
						begin
							next_state = 10'dx;
						end
			endcase
		end
endmodule

