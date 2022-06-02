
module write_port(ctrl_writeReg, ctrl_writeEN, out);
	input[4:0] ctrl_writeReg;
	input ctrl_writeEN;
	output[31:0] out;
	
	wire[31:0] Intermediate;
	_5to32decoder dec1(.out(Intermediate), .ctrl(ctrl_writeReg), .Enable(1'b1));
	
	
	genvar i;
	
	generate
		for (i=1; i < 32; i = i+1)  begin : generate_block_identifier2
		assign out[i]= (ctrl_writeEN)? Intermediate[i] : (1'b0);
	end
	endgenerate

endmodule

