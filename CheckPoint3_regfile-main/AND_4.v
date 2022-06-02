/* This file is AND_4
Xuhui Gong	21-10-04
*/
module AND_4(out, A, B, C, D);
	
	input A, B, C, D;
	output out;
	wire and1_out, and2_out;
	
	and and1(and1_out, A, B);
	and and2(and2_out, C, D);	
	and and3(out, and1_out, and2_out);		

endmodule