module mul_tb();

  reg[7:0] multiplicand, multiplier; 
  reg clk; 
  wire[15:0] result; 
  mult m1(result, clk, multiplicand, multiplier);
  
endmodule 