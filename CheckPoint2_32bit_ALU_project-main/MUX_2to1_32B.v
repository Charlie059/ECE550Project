/* This module is 32 bits 2:1 MUX
Select 0 out A
Select 1 out B
Xuhui Gong	21-09-11
*/
module MUX_2to1_32B(out, A, B, select);
	
	input [31:0] A, B;
	input select;
	output [31:0] out;
	
	assign out = select ? B : A;
	

		
endmodule