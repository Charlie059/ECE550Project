//multiplexer
module Mux_6to3(s_0, s_1, c_0, c_1, c_in, result, c_out);
	input [1:0] s_0, s_1;
	input c_0, c_1;
	input c_in;
	
	output [1:0] result;
	output c_out;
	
	assign result = c_in ? s_1 : s_0;
	assign c_out = c_in ? c_1 : c_0;

endmodule