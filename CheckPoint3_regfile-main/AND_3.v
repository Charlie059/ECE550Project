/* This file is AND_3
Xuhui Gong	21-09-11
*/
module AND_3(out, A, B, C);
	
	input A, B, C;
	output out;
	wire and1_out;
	
	and and1(and1_out, A, B);
	and and2(out, and1_out, C);	

endmodule