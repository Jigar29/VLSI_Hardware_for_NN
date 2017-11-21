module adder16(output[15:0] result, input clk, input[15:0] x, input[15:0] y); 
	parameter start = 4'b0000, s0 = 4'b0001, s1 = 4'b0010, s2 = 4'b0011, s3 =4'b0100, s4 = 4'b0101, s5 = 4'b0110, s6 = 4'b0111, s7 = 4'b1000, s8 = 4'b1001, s9 = 4'b1010, s10 = 4'b1011, s11= 4'b1100, s12 = 4'b1101, s14 = 4'b1110, stop = 4'b1111;
	parameter BIT_WIDTH = 16; 
	
	reg[BIT_WIDTH:0] temp_sum;
	reg[BIT_WIDTH-1:0] final_sum;
	reg ov, carry; 
	
	reg[3:0] pre_st = start, nxt_st = start; 
	reg overflow, cout;
	
	assign result = final_sum; 
	
	always@(posedge clk)begin
		if(pre_st == start) begin 
			temp_sum <= 0;
			pre_st <= s0;
			nxt_st <= s0; 
		end
		else begin
			if(pre_st == stop)
				final_sum = temp_sum[BIT_WIDTH-1:0]; 
			pre_st<=nxt_st;	
		end 
	end 
	
	always @(*) begin 
		case(pre_st)
			s0: begin 
					{ov, temp_sum[BIT_WIDTH-2:0]} = x[BIT_WIDTH -2:0] + y[BIT_WIDTH -2:0];
					temp_sum[BIT_WIDTH:BIT_WIDTH-1] = x[BIT_WIDTH-1] + y[BIT_WIDTH-1] + ov; 
					nxt_st = s1; 
				end 
			s1: begin
					carry = temp_sum[BIT_WIDTH]; 
					nxt_st = s2; 
				end
			s2: begin
					case({carry, ov})
						2'b00:  begin 
									temp_sum = temp_sum;
								end
						2'b01: 	begin 
									temp_sum[BIT_WIDTH-1:0] = 16'b0111111111111111; 
								end
						2'b10: 	begin 
									temp_sum[BIT_WIDTH-1] = 1'b1; 
								end 
						2'b11:  begin 
						      temp_sum = temp_sum;
								end
						default: temp_sum[BIT_WIDTH-1:0] = 0; 
					endcase
					nxt_st<= stop; 
				end
			default: nxt_st <= stop; 
		endcase
	
	end 
	
endmodule 