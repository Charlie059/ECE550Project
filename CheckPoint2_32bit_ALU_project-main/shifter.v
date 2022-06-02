/* This module is shifter including SRA and SLL

Xuhui Gong	21-09-19

*/
module shifter(data_out, data_in, shift_ctrl, ctrl_ALUopcode);
	
	input [31:0] data_in; 
	input [4:0] shift_ctrl, ctrl_ALUopcode;
	output [31:0] data_out;
	

	
	wire EN_SRA, EN_SLL; // Define the Enable wire
	SRA_EN sra_en(EN_SRA,ctrl_ALUopcode); // Using Op code to enable the SRA
	SLL_EN sll_en(EN_SLL,ctrl_ALUopcode); // Using Op code to enable the SLL
	
	wire [31:0] temp_out_SRA, temp_out_SLL;
	SRA_32 sra(temp_out_SRA, data_in, shift_ctrl);
	SLL_32 sll(data_in, temp_out_SLL, shift_ctrl);
	
	// only if enable is 1, then output
	wire [31:0] data_out_SRA, data_out_SLL;
	
	assign data_out_SRA = EN_SRA ? temp_out_SRA : 0;
	assign data_out_SLL = EN_SLL ? temp_out_SLL : 0;
	
	logic_or out(data_out_SRA, data_out_SLL, data_out);
	
endmodule