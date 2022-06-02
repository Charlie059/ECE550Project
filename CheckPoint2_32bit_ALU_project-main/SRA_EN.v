/* This module is SRA Enabler

Xuhui Gong	21-09-19

*/
module SRA_EN(EN,ctrl_ALUopcode);
	
	input [4:0] ctrl_ALUopcode; 
	output EN;
	
	//assign out = select ? B : A;

	
	// Define the op[4:1]
	wire  op0, op1, op2, op3, op4;
	
	// Not gate otherwise no change
	assign op0 =  ctrl_ALUopcode[0];
	not not1(op1, ctrl_ALUopcode[1]);
	assign op2 =  ctrl_ALUopcode[2];
	not not3(op3, ctrl_ALUopcode[3]);
	not not4(op4, ctrl_ALUopcode[4]);	
	

	

	
	// Define the and
	and and_5(EN, op0, op1, op2, op3, op4);
	
	

endmodule