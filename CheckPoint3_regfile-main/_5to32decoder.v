/* This file is 5 to 32 decoder
Xuhui Gong
21/10/4
*/
module _5to32decoder(out, ctrl, Enable);

   input [4:0] ctrl;
	input Enable;
   output [31:0] out;
	
	wire [3:0] en;
	_2to4decoder _2to4(en, ctrl[4:3], Enable);
	
	_3to8decoder _3to8_0(out[7:0], ctrl[2:0], en[0]);
	_3to8decoder _3to8_1(out[15:8], ctrl[2:0], en[1]);
	_3to8decoder _3to8_2(out[23:16], ctrl[2:0], en[2]);
	_3to8decoder _3to8_3(out[31:24], ctrl[2:0], en[3]);	

endmodule
