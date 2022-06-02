module bit_and_EN (EN,ctrl_ALUopcode);
	input [4:0] ctrl_ALUopcode;
	output EN;

	// Define the op[4:0]
	wire  op0, op1, op2, op3, op4;
	
	// Not gate otherwise no change
	not not0(op0, ctrl_ALUopcode[0]);
	assign op1 =  ctrl_ALUopcode[1];
	not not2(op2, ctrl_ALUopcode[2]);
	not not3(op3, ctrl_ALUopcode[3]);
	not not4(op4, ctrl_ALUopcode[4]);	
	

	
	// Define the and
	and and_5(EN, op0, op1, op2, op3, op4);
	
endmodule
