/* This module is used to let the add_suber to enable
Xuhui Gong	21-09-11
*/
module ADD_SUB_EN(EN,op_code);
	
	input [4:0] op_code;
	output EN;
	
	// Define the op[4:1]
	wire op1, op2, op3, op4;
	
	// Not gate
	not not1(op1, op_code[1]);
	not not2(op2, op_code[2]);
	not not3(op3, op_code[3]);
	not not4(op4, op_code[4]);	
	
	// Define the NAND input
	
	wire [4:1] NAND_in;
	
	// Assign the wires
   assign NAND_in[1] = op1;
   assign NAND_in[2] = op2;
   assign NAND_in[3] = op3;
   assign NAND_in[4] = op4;
	
	// Define the NAND
	AND_Gate_4 NAND_4(EN, NAND_in);
		
endmodule