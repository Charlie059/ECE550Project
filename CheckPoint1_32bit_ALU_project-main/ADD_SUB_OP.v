/* The purpose of this module is to allow the calculator 
to perform addition (00000) or subtraction (00001) instructions.
Xuhui Gong	21-09-11
*/
module ADD_SUB_OP(_operandB_, operandB, op_code);
	
	input[31:0] operandB;
	input [4:0] op_code;
	output[31:0] _operandB_;
	wire[31:0] operandB_reverse;
	
	NOT_32 not_32(operandB_reverse, operandB); // Reverse operandB
	MUX_2to1_32B mux2to1(_operandB_, operandB, operandB_reverse, op_code[0]); // MUX

endmodule