module regfile (
    clock,
    ctrl_writeEnable,
    ctrl_reset, ctrl_writeReg,
    ctrl_readRegA, ctrl_readRegB, data_writeReg,
    data_readRegA, data_readRegB
);

   input clock, ctrl_writeEnable, ctrl_reset;
   input [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;
   input [31:0] data_writeReg;

   output [31:0] data_readRegA, data_readRegB;

   /* YOUR CODE HERE */

	wire [31:0] write_in;
	
	//write
	write_port write_p(.ctrl_writeReg(ctrl_writeReg), .ctrl_writeEN(ctrl_writeEnable), .out(write_in));
	
	//read output
	wire [31:0] Q [31:0]; // 32*32
	wire [31:0] decoder_out_A;
	wire [31:0] decoder_out_B;	

	
	//registers
	
	reg_32 reg0(.in(32'b0), .out(Q[0]), .clk(clock), .en(1'b0), .clr(ctrl_reset));
	
	genvar i;
	
	generate
	for (i=1; i < 32; i = i+1)  begin : generate_block_identifier3
		reg_32 reg_(.in(data_writeReg), .out(Q[i]), .clk(clock), .en(write_in[i]), .clr(ctrl_reset));
	end
	endgenerate
	
	
	//read A
	_5to32decoder _5to32_read_A(decoder_out_A, ctrl_readRegA, 1'b1);
	
	
	genvar j;
	
	generate
	for (j=0; j < 32; j = j+1)  begin : readA
			tristate_32 tA(data_readRegA, Q[j], decoder_out_A[j]);
	end
	endgenerate
	

	//read B
	_5to32decoder _5to32_read_B(decoder_out_B, ctrl_readRegB, 1'b1);
	
	
	genvar k;
	
	generate
	for (k=0; k < 32; k = k+1)  begin : readB
			tristate_32 tB(data_readRegB, Q[k], decoder_out_B[k]);
	end
	endgenerate
	
	
	

endmodule

