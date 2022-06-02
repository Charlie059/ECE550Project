/* This file is give the Information Signals (Out): isLessThan
Xuhui Gong	21-09-11
*/
module isLessThan(isLessThan_out, EN, result, overflow, op_code);
	
	input[31:0] result;
	input[4:0] op_code;
	input EN;
	input overflow;
	output isLessThan_out;
	
	wire xor_out;
	
	xor xor1(xor_out, result[31], overflow);
	AND_3 and_3(isLessThan_out, EN, xor_out, op_code[0]);
	
	

endmodule
