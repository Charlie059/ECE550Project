/* This is defined as tristate buffer
Xuhui Gong
21/10/4
*/

module tristate_32(buffer_output, in, buffer_select);
   
	input [31:0]in;
	input buffer_select;
	output [31:0]buffer_output;
	
	genvar i;
	
	generate
	for (i=0; i < 32; i = i+1)  begin : t
				tristate t(buffer_output[i], in[i], buffer_select);
	end
	endgenerate
	

	



endmodule


