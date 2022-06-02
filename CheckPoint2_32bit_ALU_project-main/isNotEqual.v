/* This file is give the Information Signals (Out): isNotEqual
Xuhui Gong	21-09-11
*/
module isNotEqual(isNotEqual_out, EN, result, op_code);
	
	input[31:0] result;
	input[4:0] op_code;
	input EN;
	output isNotEqual_out;
	wire or_out, r1;
	
	OR_32 or_32(or_out, result); // OR 32 bit input
	
	and and1(r1, or_out, op_code[0]);
	and and2(isNotEqual_out, EN, r1);	
	
	

endmodule