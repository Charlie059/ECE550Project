/* This file is defined the overflow in ADD or SUB
Xuhui Gong	21-09-11
*/
module overflow(result, c_out_31, c_in_31);
	
   input  c_out_31, c_in_31;
	output result;
	
	xor xor1(result,c_out_31,c_in_31);
		
endmodule


