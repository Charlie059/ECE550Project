/* This file is 2 to 4 decoder with enable
Xuhui Gong
21/10/4
*/
module _2to4decoder(out, ctrl, Enable);

   input [1:0] ctrl;
	input Enable;
   output [3:0] out;

	
	wire not_ctrl_0;
	wire not_ctrl_1;

	not not_0(not_ctrl_0, ctrl[0]);	
	not not_1(not_ctrl_1, ctrl[1]);
	
	AND_3 AND0(out[0], not_ctrl_1, not_ctrl_0, Enable);
	AND_3 AND1(out[1], not_ctrl_1, ctrl[0], Enable);	
	AND_3 AND2(out[2], ctrl[1], not_ctrl_0, Enable);		
	AND_3 AND3(out[3], ctrl[1], ctrl[0], Enable);			
	

endmodule