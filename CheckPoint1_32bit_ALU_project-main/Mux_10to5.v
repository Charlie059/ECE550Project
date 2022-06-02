

module Mux_10to5(s_0, s_1, c_0, c_1, c_in, result, c_out);
	input [3:0] s_0, s_1;
	input c_0, c_1;
	input c_in;
	
	output [3:0] result;
	output c_out;
	
	assign result = c_in ? s_1 : s_0;
	assign c_out = c_in ? c_1 : c_0;

endmodule