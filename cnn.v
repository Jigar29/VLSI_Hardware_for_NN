`timescale 1 ns/ 100 ns

module cnn(input a, input b, output sum, output carry);

xor(sum, a, b); 
and(carry, a, b); 

endmodule 