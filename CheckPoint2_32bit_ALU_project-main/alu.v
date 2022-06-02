
module alu(data_operandA, data_operandB, ctrl_ALUopcode, ctrl_shiftamt, data_result, isNotEqual, isLessThan, overflow);

   input [31:0] data_operandA, data_operandB;
   input [4:0] ctrl_ALUopcode, ctrl_shiftamt;

   output [31:0] data_result;
   output isNotEqual, isLessThan, overflow;
	
	wire [31:0] temp_data_result_ArithmeticOperator, temp_data_result_shifter;
	
	ArithmeticOperator arithmeticoperator(temp_data_result_ArithmeticOperator, isNotEqual, isLessThan, overflow, data_operandA, data_operandB, ctrl_ALUopcode);
	
	shifter shifter_(temp_data_result_shifter, data_operandA, ctrl_shiftamt, ctrl_ALUopcode);
	
	logic_or out(temp_data_result_shifter, temp_data_result_ArithmeticOperator, data_result);
	
endmodule


