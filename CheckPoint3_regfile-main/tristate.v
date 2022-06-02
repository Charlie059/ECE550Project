/* This is defined as tristate buffer
Xuhui Gong
21/10/4
*/

module tristate(buffer_output, in, buffer_select);
   
	input in;
	input buffer_select;
	output buffer_output;
	
	assign buffer_output = buffer_select ? in : 1'bz;


endmodule


