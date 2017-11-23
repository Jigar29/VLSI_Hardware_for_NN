
module mac(output[15:0] result, output done, input clk, input reset, input wire[7:0] inp1, input wire[7:0] inp2, input wire[7:0] inp3); 
  
  parameter start = 4'b0000, s0 = 4'b0001, s1 = 4'b0010, s2 = 4'b0011, s3 =4'b0100, s4 = 4'b0101, s5 = 4'b0110, s6 = 4'b0111, s7 = 4'b1000, s8 = 4'b1001, s9 = 4'b1010, s10 = 4'b1011, s11= 4'b1100, s12 = 4'b1101, s14 = 4'b1110, stop = 4'b1111;
  parameter ITER = 3; 
  wire[15:0] mul_result, adder_result, adder_acc_input; 
  wire[7:0] mul_input, mult_input1, mult_input2;
  wire mult_done, adder_done, adder_reset, mult_reset; 
  
  reg[15:0] final_res, temp_acc_reg = 0;
  reg[3:0] counter = 0; 
  reg[3:0] next_state = start, current_state = start;      // Be careful with the size of this register.
  reg acc_busy = 0;
  reg[7:0] mult_inp_reg; 
  
  initial begin 
	mult_inp_reg = inp1; 
  end 
  
  assign mult_input1 = mult_inp_reg;
  assign mult_input2 = 8'b00000010;
  assign adder_acc_input = temp_acc_reg;
  assign mult_reset = (acc_busy == 0)?1'b0:1'b1; 
  assign adder_reset = (mult_done == 1)?1'b0:1'b1; 
  assign done = (counter==ITER)? 1'b1:1'b0; 
  assign result = (counter==ITER)?temp_acc_reg:16'bzzzzzzzzzzzzzzz; 
    
  mult16 m1(mul_result, mult_done, mult_reset, clk, mult_input1, mult_input2); 
  adder16 a1(.result(adder_result), .done(adder_done), .clk(clk), .reset(adder_reset), .x(mul_result), .y(adder_acc_input)); 
  
  always @(posedge adder_done) begin
	temp_acc_reg = adder_result;
	acc_busy = 1'b1;

	if(counter < ITER) begin 
		counter = counter + 1;
		 if(counter != ITER)
			#5 acc_busy = 1'b0;
	end
	if(counter == 1) 
	  mult_inp_reg = inp2; 
	else if(counter == 2) 
	  mult_inp_reg = inp3; 
	
  end 

endmodule 