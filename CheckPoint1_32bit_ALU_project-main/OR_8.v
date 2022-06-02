/* This file is 8 OR
Xuhui Gong	21-09-11
*/
module OR_8(out, in);
	
	input [7:0] in;
	output  out;
	wire out1_1, out1_2, out1_3, out1_4, out2_1, out2_2;
	
	or or1_1(out1_1, in[0], in[1]);
	or or1_2(out1_2, in[2], in[3]);
	or or1_3(out1_3, in[4], in[5]);
	or or1_4(out1_4, in[6], in[7]);
	
	or or2_1(out2_1, out1_1, out1_2);
	or or2_2(out2_2, out1_3, out1_4);
	
	or or3_1(out, out2_1, out2_2);


endmodule
