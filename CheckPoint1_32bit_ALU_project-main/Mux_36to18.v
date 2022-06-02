


module Mux_36to18(s_0, s_1, c_out31_0, c_out31_1, c_in31_0, c_in31_1, c_in, result, c_out31, c_in31);
	input [15:0] s_0, s_1;
	input c_out31_0, c_out31_1, c_in31_0, c_in31_1, c_in;
	
	output [15:0] result;
	output c_out31, c_in31;
	
	assign result = c_in ? s_1 : s_0;
	assign c_out31 = c_in ? c_out31_1 : c_out31_0;
	assign c_in31 = c_in ? c_in31_1 : c_in31_0;

endmodule