/* This module is 2 to 1 MUX (1 bit)

Xuhui Gong	21-09-19

*/
module MUX_2to1(out, A, B, select);
	
	input  A, B;
	input select;
	output  out;
	
	assign out = select ? B : A;
	

endmodule