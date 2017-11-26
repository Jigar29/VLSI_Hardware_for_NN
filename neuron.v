module neuron(output[7:0] result, input[4:0] neuron_no, input clk); 
	wire mac_done; 
	wire[15:0] mac_result; 
	
	mac_400 mc1(mac_result, mac_done, clk, 1'b0, neuron_no, 9'b110010000 ); 
	activation act1(result, mac_done, mac_result[15:8]);						// Sigmoid Function

endmodule 