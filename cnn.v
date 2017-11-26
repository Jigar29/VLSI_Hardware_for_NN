
module cnn(output[7:0] result, input clk);
  
  reg[7:0] reg_result[24:0]; 
  wire[7:0] wire_result[24:0];
  integer i;
  
  // 25 neurons for the first layer
  neuron n1(wire_result[0], 5'b00000, clk);
  neuron n2(wire_result[1], 5'b00001, clk);
  neuron n3(wire_result[2], 5'b00010, clk);
  neuron n4(wire_result[3], 5'b00011, clk);
  neuron n5(wire_result[4], 5'b00100, clk);
  neuron n6(wire_result[5], 5'b00101, clk);
  neuron n7(wire_result[6], 5'b00110, clk);
  neuron n8(wire_result[7], 5'b00111, clk);
  neuron n9(wire_result[8], 5'b01000, clk);
  neuron n10(wire_result[9], 5'b01001, clk);
  neuron n11(wire_result[10], 5'b01010, clk);
  neuron n12(wire_result[11], 5'b01011, clk);
  neuron n13(wire_result[12], 5'b01100, clk);
  neuron n14(wire_result[13], 5'b01101, clk);
  neuron n15(wire_result[14], 5'b01110, clk);
  neuron n16(wire_result[15], 5'b01111, clk);
  neuron n17(wire_result[16], 5'b10001, clk);
  neuron n18(wire_result[17], 5'b10010, clk);
  neuron n19(wire_result[18], 5'b10011, clk);
  neuron n20(wire_result[19], 5'b10100, clk);
  neuron n21(wire_result[20], 5'b10101, clk);
  neuron n22(wire_result[21], 5'b10110, clk);
  neuron n23(wire_result[22], 5'b10111, clk);
  neuron n24(wire_result[23], 5'b11000, clk);
  neuron n25(wire_result[24], 5'b11001, clk);
  
  always @(*) begin 
    for(i=0; i<25; i= i+1) begin 
      reg_result[i] = wire_result[i]; 
    end
  end
endmodule 