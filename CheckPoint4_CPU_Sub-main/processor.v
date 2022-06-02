/**
 * READ THIS DESCRIPTION!
 *
 * The processor takes in several inputs from a skeleton file.
 *
 * Inputs
 * clock: this is the clock for your processor at 50 MHz
 * reset: we should be able to assert a reset to start your pc from 0 (sync or
 * async is fine)
 *
 * Imem: input data from imem
 * Dmem: input data from dmem
 * Regfile: input data from regfile
 *
 * Outputs
 * Imem: output control signals to interface with imem
 * Dmem: output control signals and data to interface with dmem
 * Regfile: output control signals and data to interface with regfile
 *
 * Notes
 *
 * Ultimately, your processor will be tested by subsituting a master skeleton, imem, dmem, so the
 * testbench can see which controls signal you active when. Therefore, there needs to be a way to
 * "inject" imem, dmem, and regfile interfaces from some external controller module. The skeleton
 * file acts as a small wrapper around your processor for this purpose.
 *
 * You will need to figure out how to instantiate two memory elements, called
 * "syncram," in Quartus: one for imem and one for dmem. Each should take in a
 * 12-bit address and allow for storing a 32-bit value at each address. Each
 * should have a single clock.
 *
 * Each memory element should have a corresponding .mif file that initializes
 * the memory element to certain value on start up. These should be named
 * imem.mif and dmem.mif respectively.
 *
 * Importantly, these .mif files should be placed at the top level, i.e. there
 * should be an imem.mif and a dmem.mif at the same level as process.v. You
 * should figure out how to point your generated imem.v and dmem.v files at
 * these MIF files.
 *
 * imem
 * Inputs:  12-bit address, 1-bit clock enable, and a clock
 * Outputs: 32-bit instruction
 *
 * dmem
 * Inputs:  12-bit address, 1-bit clock, 32-bit data, 1-bit write enable
 * Outputs: 32-bit data at the given address
 *
 */
module processor(
    // Control signals
    clock,                          // I: The master clock
    reset,                          // I: A reset signal

    // Imem
    address_imem,                   // O: The address of the data to get from imem
    q_imem,                         // I: The data from imem

    // Dmem
    address_dmem,                   // O: The address of the data to get or put from/to dmem
    data,                           // O: The data to write to dmem
    wren,                           // O: Write enable for dmem
    q_dmem,                         // I: The data from dmem

    // Regfile
    ctrl_writeEnable,               // O: Write enable for regfile
    ctrl_writeReg,                  // O: Register to write to in regfile
    ctrl_readRegA,                  // O: Register to read from port A of regfile
    ctrl_readRegB,                  // O: Register to read from port B of regfile
    data_writeReg,                  // O: Data to write to for regfile
    data_readRegA,                  // I: Data from port A of regfile
    data_readRegB                   // I: Data from port B of regfile
);
    // Control signals
    input clock, reset;
		//output imem_clock, dmem_clock, processor_clock, regfile_clock;
    // Imem
    output [11:0] address_imem;
    input [31:0] q_imem;

    // Dmem
    output [11:0] address_dmem;
    output [31:0] data;
    output wren;
    input [31:0] q_dmem;

    // Regfile
    output ctrl_writeEnable;
    output [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;
    output [31:0] data_writeReg;
    input [31:0] data_readRegA, data_readRegB;

    /* YOUR CODE STARTS HERE */
	//wires:
		//PC:
	wire [11:0]pc_in;
	wire [11:0]pc_out;
	
		//register file
	wire [4:0] rd, rs, rt, shamt, Opcode, ALUop;
	reg [4:0]ctrl_rt;
	wire [16:0] Immediate;
	wire[31:0]sx_data;
	
		//ctrl flow:
	wire writeEn; //Rwe
	wire [4: 0]ctrl_ALU_opcode; //preALUopcode
	wire is_Overflow;
	wire [4: 0]ctrl_WriteReg;//ctrl_writeReg
	wire ctrl_ALUinB; //ALUinB
	wire [31:0]ctrl_exception; //exception
		//ALU
	wire [31:0]alu_result; //data_result
	wire [31:0]real_operandB; //data_operandB
	wire alu_isNotEqual; //isNotEqual
	wire alu_isLessThan; //isLessThan
		//D-Mem

	wire [31:0] q_dmem_wire; //q_dmem;
	
	wire [11:0] Address_dmem_wire; //address_dmem;
	wire [31:0] Data_dmem_wire; //data;
	wire Dwe_wire; //wren;
	
		//Rwd
	wire Rwd;
		//processor_data_write:
	reg [31:0] processor_data_write;
	//Assign:
	//regfile
	assign Opcode = q_imem[31:27];
	assign rd = q_imem[26:22];
	assign rs = q_imem[21:17];
	assign rt = q_imem[16:12];
	assign Immediate = q_imem[16:0];
	assign shamt = q_imem[11:7];
	assign ALUop = q_imem[6:2];
	

	//initialization
	//assign is_Overflow = 1'b0;
	//assign ctrl_WriteReg = rd;

	//Mux3: ctrl_Rt: rd vs rt
	always@(*)begin
		if (Opcode == 5'b00111)
			ctrl_rt <= rd;
		//addi or (sll or sra) or lw
		else if(Opcode == 5'b00101 ||(Opcode == 5'b00000 &&(ALUop == 5'b00100 
		|| ALUop == 5'b00101))||(Opcode == 5'b01000))
			ctrl_rt <= 5'bz;
		else
			ctrl_rt <= rt;
	end 
	
	//regfile_read:
	assign ctrl_writeEnable = writeEn;
	assign ctrl_readRegA = rs;
	assign ctrl_readRegB = ctrl_rt;
	
	//PC
	pc my_pc1(.clock(clock), .reset(reset), .en(1'b1), .address_in(pc_in), .address_out(pc_out));
	assign pc_in = pc_out + 12'b1;
	//imem
	assign address_imem = pc_out;
	
	//dmem:
	
	assign Data_dmem_wire = data_readRegB;
	assign data = Data_dmem_wire;
	assign Address_dmem_wire = alu_result[11:0]; //processor_data_write
	assign address_dmem = Address_dmem_wire;
	assign q_dmem_wire = q_dmem;
	
	
	//control_flow:
	Control_flow my_control(.opcode(Opcode), .ALUopcode(ALUop), .Rd(rd), .isOverflow(is_Overflow), 
	.Rwe(writeEn), .ctrl_writeReg(ctrl_WriteReg), .ALUinB(ctrl_ALUinB), .preALUopcode(ctrl_ALU_opcode), 
	.exception(ctrl_exception), .Dwe_wire(Dwe_wire), .Rwd(Rwd));
	
	assign wren=Dwe_wire;
	//output ctrl_writeEnable;
	
	//sign extention
	sign_extension my_SE(.immediate(Immediate ), .sx_out(sx_data));
	//Mux1:data_readRegB vs sx_data
	assign real_operandB = ctrl_ALUinB? sx_data: data_readRegB;
	
	//Alu:
	alu myALU(.data_operandA(data_readRegA), .data_operandB(real_operandB), .ctrl_ALUopcode(ctrl_ALU_opcode),
			.ctrl_shiftamt(shamt), .data_result(alu_result), .isNotEqual(alu_isNotEqual), .isLessThan(alu_isLessThan)
			, .overflow(is_Overflow));
	
	//Mux2: ctrl_exception vs alu_result

	always@(*)begin
		//overflow and (add or addi or sub)
		if (is_Overflow && ((Opcode == 5'b00000 && ALUop == 5'b00000) ||(Opcode == 5'b00000 && ALUop == 5'b00001) 
		|| (Opcode == 5'b00101)))
			processor_data_write <= ctrl_exception;
		else
			processor_data_write <= alu_result;
	end 
	
	
	//regfile_write:
	assign ctrl_writeReg = ctrl_WriteReg;
	assign data_writeReg = Rwd?q_dmem_wire:processor_data_write;
	
endmodule
