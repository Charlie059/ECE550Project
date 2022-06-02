/* This module is four input AND
Xuhui Gong	21-09-11
*/
module AND_Gate_4(out, in);
	
	input [3:0] in;
	output out;
	wire and11_out, and12_out;
	

	and and11(and11_out, in[0], in[1]);
	and and12(and12_out, in[2], in[3]);
	and and21(out, and11_out, and12_out);
	
		
endmodule