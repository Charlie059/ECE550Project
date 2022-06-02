
/* This file is 32 AND
Xuhui Gong	21-09-11
*/
module AND_32(out, in);
	
	input [32:0] in;
	output  out;

	wire out1_1, out1_2, out1_3, out1_4, out2_1, out2_2;
	
	// Define 4 AND-8 and 3 AND-1
	AND_8 AND1_1(out1_1, in[7:0]);
	AND_8 AND1_2(out1_2, in[15:8]);
	AND_8 AND1_3(out1_3, in[23:16]);
	AND_8 AND1_4(out1_4, in[31:24]);
	
	AND AND2_1(out2_1, out1_1, out1_2);
	AND AND2_2(out2_2, out1_3, out1_4);
	
	AND AND3_1(out, out2_1, out2_2);
	



endmodule