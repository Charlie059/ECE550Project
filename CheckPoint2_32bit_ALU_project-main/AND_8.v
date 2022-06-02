/* This file is 8 AND
Xuhui Gong	21-09-11
*/
module AND_8(out, in);
	
	input [7:0] in;
	output  out;
	wire out1_1, out1_2, out1_3, out1_4, out2_1, out2_2;
	
	and and1_1(out1_1, in[0], in[1]);
	and and1_2(out1_2, in[2], in[3]);
	and and1_3(out1_3, in[4], in[5]);
	and and1_4(out1_4, in[6], in[7]);
	
	and and2_1(out2_1, out1_1, out1_2);
	and and2_2(out2_2, out1_3, out1_4);
	
	and and3_1(out, out2_1, out2_2);


endmodule
