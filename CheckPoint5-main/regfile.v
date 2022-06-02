module regfile(
	clock, ctrl_writeEnable, ctrl_reset, ctrl_writeReg,
	ctrl_readRegA, ctrl_readRegB, data_writeReg, data_readRegA,
	data_readRegB,
	
	//test---------------------------------------------------------
	reg8, reg9, reg10, reg11, reg12, reg13, reg14, reg15, reg16, reg17, reg18,
	reg19, reg20, reg21, reg22, reg31
	
	//test end-----------------------------------------------------
);
	input clock, ctrl_writeEnable, ctrl_reset;
	input [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;
	input [31:0] data_writeReg;
	output [31:0] data_readRegA, data_readRegB;
	reg[31:0] registers[31:0];

	//test---------------------------------------------------------
	output[15:0]reg8, reg9, reg10, reg11, reg12, reg13, reg14, reg15, reg16, reg17, reg18,
	reg19, reg20, reg21, reg22, reg31;
	assign reg8 = registers[8][15:0];
	assign reg9 = registers[9][15:0];
	assign reg10 = registers[10][15:0];
	assign reg11 = registers[11][15:0];
	assign reg12 = registers[12][15:0];
	assign reg13 = registers[13][15:0];
	assign reg14 = registers[14][15:0];
	assign reg15 = registers[15][15:0];
	assign reg16 = registers[16][15:0];
	assign reg17 = registers[17][15:0];
	assign reg18 = registers[18][15:0];
	assign reg19 = registers[19][15:0];
	assign reg20 = registers[20][15:0];
	assign reg21 = registers[21][15:0];
	assign reg22 = registers[22][15:0];
	
	assign reg31 = registers[31][15:0];
	//test end-----------------------------------------------------
	
	
	always @(posedge clock or posedge ctrl_reset)
	
	
	begin
		if(ctrl_reset)
			begin
				integer i;
				for(i = 0; i < 32; i = i + 1)
					begin
						registers[i] = 32'd0;
					end
			end
		else
			if(ctrl_writeEnable && ctrl_writeReg != 5'd0)
				registers[ctrl_writeReg] = data_writeReg;
				
				registers[0] = 32'b0;
	end
	
	assign data_readRegA = /*ctrl_writeEnable && (ctrl_writeReg == ctrl_readRegA) ? 32'bz : */registers[ctrl_readRegA];
	assign data_readRegB = ctrl_writeEnable && (ctrl_writeReg == ctrl_readRegB) ? 32'bz : registers[ctrl_readRegB];
	
	
endmodule