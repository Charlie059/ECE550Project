/* This file is defined the Arithmetic Operator with add and sub functions
Xuhui Gong	21-09-11
*/
module ArithmeticOperator(data_result, isNotEqual, isLessThan, overflow, data_operandA, data_operandB, ctrl_ALUopcode);
	
   input [31:0] data_operandA, data_operandB;
   input [4:0] ctrl_ALUopcode;

   output [31:0] data_result;
   output isNotEqual, isLessThan, overflow;
	
	wire EN; // Define the Enable wire
	ADD_SUB_EN add_sub_en(EN,ctrl_ALUopcode); // Using Op code to enable the Arithmetic Operator
	
	wire [31:0] _data_operandB_; 
   ADD_SUB_OP add_sub_op(_data_operandB_, data_operandB, ctrl_ALUopcode); // Using Op code to determine add or sub
	
	// Define the output of CSA 32 (Without passing EN)
	wire [31:0] _data_result_;
	wire c_out_31, c_in_31; 
	
	carry_select_adder_32 csa_32(data_operandA, _data_operandB_, ctrl_ALUopcode[0], _data_result_, c_out_31, c_in_31); // 32 bit CSA
	
	assign data_result = EN ? _data_result_:0; // Define the result with EN

	wire _overflow_; // Define Overflow without EN
	overflow of(_overflow_, c_out_31, c_in_31);
	and overflow_EN(overflow, _overflow_, EN); // Define the result with EN	

	isNotEqual _isNotEqual_(isNotEqual, EN, _data_result_, ctrl_ALUopcode); // Define the isNotEqual wire

	isLessThan islessthan(isLessThan, EN, _data_result_, _overflow_, ctrl_ALUopcode); // Define the isLessThan wire


	

endmodule


