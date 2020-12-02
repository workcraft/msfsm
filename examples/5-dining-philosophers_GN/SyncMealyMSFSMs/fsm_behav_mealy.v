`timescale 1ns/1ns

module fsm_mealy_behav_01 (
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
	parameter p7_1HOT_CASEX_ENCODING = 10'bxxxxxxxxx1; // 10'b0000000001 //
	parameter p4_1HOT_ENCODING = 10'd2; // 10'b0000000010 //
	parameter p4_1HOT_CASEX_ENCODING = 10'bxxxxxxxx1x; // 10'b0000000010 //
	parameter p1_1HOT_ENCODING = 10'd4; // 10'b0000000100 //
	parameter p1_1HOT_CASEX_ENCODING = 10'bxxxxxxx1xx; // 10'b0000000100 //
	parameter p9_1HOT_ENCODING = 10'd8; // 10'b0000001000 //
	parameter p9_1HOT_CASEX_ENCODING = 10'bxxxxxx1xxx; // 10'b0000001000 //
	parameter p6_1HOT_ENCODING = 10'd16; // 10'b0000010000 //
	parameter p6_1HOT_CASEX_ENCODING = 10'bxxxxx1xxxx; // 10'b0000010000 //
	parameter p3_1HOT_ENCODING = 10'd32; // 10'b0000100000 //
	parameter p3_1HOT_CASEX_ENCODING = 10'bxxxx1xxxxx; // 10'b0000100000 //
	parameter p0_1HOT_ENCODING = 10'd64; // 10'b0001000000 //
	parameter p0_1HOT_CASEX_ENCODING = 10'bxxx1xxxxxx; // 10'b0001000000 //
	parameter p8_1HOT_ENCODING = 10'd128; // 10'b0010000000 //
	parameter p8_1HOT_CASEX_ENCODING = 10'bxx1xxxxxxx; // 10'b0010000000 //
	parameter p5_1HOT_ENCODING = 10'd256; // 10'b0100000000 //
	parameter p5_1HOT_CASEX_ENCODING = 10'bx1xxxxxxxx; // 10'b0100000000 //
	parameter p2_1HOT_ENCODING = 10'd512; // 10'b1000000000 //
	parameter p2_1HOT_CASEX_ENCODING = 10'b1xxxxxxxxx; // 10'b1000000000 //

	reg [9 : 0]	state;
	reg [9 : 0]	next_state;

	always @(posedge clk)
		begin
			if (reset)
				begin
						// state <= p7_1HOT_ENCODING;
						// state <= p4_1HOT_ENCODING;
						// state <= p1_1HOT_ENCODING;
						state[0] <= 1'b1;
						state[1] <= 1'b1;
						state[2] <= 1'b1;
						state[3] <= 1'b0;
						state[4] <= 1'b0;
						state[5] <= 1'b0;
						state[6] <= 1'b0;
						state[7] <= 1'b0;
						state[8] <= 1'b0;
						state[9] <= 1'b0;
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

			casex (state)
				10'bxxxxxxxxx1: // p7_1HOT_ENCODING: //
					begin
						if (t6_)
							begin
								// next_state = p8_1HOT_CASEX_ENCODING; //
								next_state[0] = 1'b0;
								next_state[7] = 1'b1;
							end
					end

				10'bxxxxxxxx1x: // p4_1HOT_ENCODING: //
					begin
						if (t5_)
							begin
								// next_state = p5_1HOT_CASEX_ENCODING; //
								next_state[1] = 1'b0;
								next_state[8] = 1'b1;
							end
					end

				10'bxxxxxxx1xx: // p1_1HOT_ENCODING: //
					begin
						if (t0_)
							begin
								// next_state = p2_1HOT_CASEX_ENCODING; //
								next_state[2] = 1'b0;
								next_state[9] = 1'b1;
							end
					end

				10'bxxxxxx1xxx: // p9_1HOT_ENCODING: //
					begin
						if (t8_)
							begin
								// next_state = p0_1HOT_CASEX_ENCODING; //
								next_state[3] = 1'b0;
								next_state[6] = 1'b1;
							end
					end

				10'bxxxxx1xxxx: // p6_1HOT_ENCODING: //
					begin
						if (t7_)
							begin
								// next_state = p7_1HOT_CASEX_ENCODING; //
								next_state[4] = 1'b0;
								next_state[0] = 1'b1;
							end
					end

				10'bxxxx1xxxxx: // p3_1HOT_ENCODING: //
					begin
						if (t2_)
							begin
								// next_state = p4_1HOT_CASEX_ENCODING; //
								next_state[5] = 1'b0;
								next_state[1] = 1'b1;
							end
					end

				10'bxxx1xxxxxx: // p0_1HOT_ENCODING: //
					begin
						if (t1_)
							begin
								// next_state = p1_1HOT_CASEX_ENCODING; //
								next_state[6] = 1'b0;
								next_state[2] = 1'b1;
							end
					end

				10'bxx1xxxxxxx: // p8_1HOT_ENCODING: //
					begin
						if (t9_)
							begin
								// next_state = p9_1HOT_CASEX_ENCODING; //
								next_state[7] = 1'b0;
								next_state[3] = 1'b1;
							end
					end

				10'bx1xxxxxxxx: // p5_1HOT_ENCODING: //
					begin
						if (t4_)
							begin
								// next_state = p6_1HOT_CASEX_ENCODING; //
								next_state[8] = 1'b0;
								next_state[4] = 1'b1;
							end
					end

				10'b1xxxxxxxxx: // p2_1HOT_ENCODING: //
					begin
						if (t3_)
							begin
								// next_state = p3_1HOT_CASEX_ENCODING; //
								next_state[9] = 1'b0;
								next_state[5] = 1'b1;
							end
					end

				default:
						begin
							next_state = 10'dx;
						end
			endcase
		end
endmodule

