/* This module is 32 bits NOT GATE
Xuhui Gong	21-09-11
*/



module NOT_32(out, in);
	
	input [31:0] in;
	output [31:0] out;
	
	genvar i;
	generate
		for (i = 0; i < 32; i = i + 1) begin: not_gate_32
			NOT_1 gate(out[i], in[i]);
		end
	endgenerate
	
endmodule
