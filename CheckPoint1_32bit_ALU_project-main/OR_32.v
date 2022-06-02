
/* This file is 32 OR
Xuhui Gong	21-09-11
*/
module OR_32(out, in);
	
	input [31:0] in;
	output  out;

	wire out1_1, out1_2, out1_3, out1_4, out2_1, out2_2;
	
	// Define 4 OR-8 and 3 OR-1
	OR_8 or1_1(out1_1, in[7:0]);
	OR_8 or1_2(out1_2, in[15:8]);
	OR_8 or1_3(out1_3, in[23:16]);
	OR_8 or1_4(out1_4, in[31:24]);
	
	or or2_1(out2_1, out1_1, out1_2);
	or or2_2(out2_2, out1_3, out1_4);
	
	or or3_1(out, out2_1, out2_2);
	



endmodule