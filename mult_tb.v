module tb_Mul ( );                          
 
wire [15:0] result;
reg clk;
reg [7:0] multiplicand; 
reg[7:0] multiplier;
 
 
mult16 mult_1 ( .result(result), .clk(clk), .multiplicand(multiplicand), .multiplier(multiplier)) ;
 
                initial begin
                  $monitor ($time," multiplicand = %b ,multiplier = %b ,result = %b", multiplicand, multiplier, result);
                end
                
                initial begin
                  //reset = 1; # 5 reset = 0;
                  multiplicand = 8'b00000010;
                  multiplier   = 8'b00000010;
                  #100
                  multiplicand = 8'b00001010;
                  multiplier   = 8'b00001010;
                  #1000 $finish;
                end
 
initial
                begin
                clk =1;
                forever #5 clk = ~clk;
                end
 
endmodule
