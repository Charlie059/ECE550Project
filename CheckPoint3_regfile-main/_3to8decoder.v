/* This file is 3 to 8 decoder with enable
Xuhui Gong
21/10/4
*/
module _3to8decoder(out, ctrl, Enable);

   input [2:0] ctrl;
	input Enable;
   output [7:0] out;

	
	wire not_ctrl_0;
	wire not_ctrl_1;
	wire not_ctrl_2;

	not not_0(not_ctrl_0, ctrl[0]);	
	not not_1(not_ctrl_1, ctrl[1]);
	not not_2(not_ctrl_2, ctrl[2]);


	
	AND_4 AND0(out[0], not_ctrl_0, not_ctrl_1, not_ctrl_2, Enable);
	AND_4 AND1(out[1], ctrl[0], not_ctrl_1, not_ctrl_2, Enable);	
	AND_4 AND2(out[2], not_ctrl_0, ctrl[1], not_ctrl_2, Enable);		
	AND_4 AND3(out[3], ctrl[0], ctrl[1], not_ctrl_2, Enable);
	AND_4 AND4(out[4], not_ctrl_0, not_ctrl_1, ctrl[2], Enable);	
	AND_4 AND5(out[5], ctrl[0], not_ctrl_1, ctrl[2], Enable);		
	AND_4 AND6(out[6], not_ctrl_0, ctrl[1], ctrl[2], Enable);		
	AND_4 AND7(out[7], ctrl[0], ctrl[1], ctrl[2], Enable);			
	

endmodule