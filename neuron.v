module neuron(output[7:0] result, input clk); 
	
	wire mac_done; 
	wire[15:0] mac_result; 
	
	mac mc1(mac_result, mac_done, clk, reset, 9'b110010000 ); 
	activation act1(result, mac_done, mac_result[15:8]);

endmodule 