module mult(output [16:0] result, input clk, input wire[7:0] multiplicand, input wire[7:0] multiplier);
		
	parameter start = 4'b0000, s0 = 4'b0001, s1 = 4'b0010, s2 = 4'b0011, s3 =4'b0100, s4 = 4'b0101, s5 = 4'b0110, s6 = 4'b0111, s7 = 4'b1000, s8 = 4'b1001, s9 = 4'b1010, s10 = 4'b1011, s11= 4'b1100, s12 = 4'b1101, s14 = 4'b1110, stop = 4'b1111;
	parameter BIT_WIDTH = 8; 
	reg[2*BIT_WIDTH -1:0] temp = 0; 
	reg[2*BIT_WIDTH:0] acc = 0;                              // accumulator deliberately taken big 
	reg[3:0] next_state = start, current_state = start;      // Be careful with the size of this register. 
	wire[2*BIT_WIDTH :0] temp_wire; 

	always @(posedge clk) begin
		if(current_state == start) begin 
			temp <= {multiplicand[3], multiplicand[3], multiplicand[3], multiplicand[3], multiplicand[3], multiplicand[3], multiplicand[3], multiplicand[3], multiplicand[BIT_WIDTH -1:0]}; 
			current_state <= s0; 
			next_state <= s0; 
		end
		else begin 
			if((next_state != s0) && (next_state != stop))
			   temp <= {temp[BIT_WIDTH -2:0], 1'b0};
			current_state <= next_state;
		 end 
	end
	
	always @(*) begin
		case(current_state)
			s0:  begin 
					if(multiplier[0] == 1) begin 
						acc = acc + temp; 
					end 
					next_state = s1; 
				 end 
			s1:  begin 
					if(multiplier[1] == 1) begin 
						acc = acc + temp; 
					end 
					next_state = s2; 
				 end 	
				 
			s2:  begin 
					if(multiplier[2] == 1) begin 
						acc = acc + temp; 
					end 
					next_state = s3; 
				 end 
				 
			s3:  begin 
					if(multiplier[3] == 1) begin 
						acc = acc + temp; 
					end 
					next_state = s4; 
				 end 
				 
			s4:  begin 
					if(multiplier[4] == 1) begin 
						acc = acc + temp; 
					end 
					next_state = s5; 
				 end 		
				 		 
			s5:  begin 
					if(multiplier[5] == 1) begin 
						acc = acc + temp; 
					end 
					next_state = s6; 
				 end 
				 
			s6:  begin 
					if(multiplier[6] == 1) begin 
						acc = acc + temp; 
					end 
					next_state = s7; 
				 end
				 
			s7:  begin 
					if(multiplier[7] == 1) begin 
						acc = acc + temp; 
					end 
					next_state = stop; 
				 end  				 
			default: next_state = stop; 
		endcase 
	end 
	
	
endmodule 
