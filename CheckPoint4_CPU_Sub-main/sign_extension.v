module sign_extension(immediate, sx_out);
	input[16:0] immediate;
	output [31:0] sx_out;
	assign sx_out[31:0] = {{15{immediate[16]}}, immediate[16:0]};
endmodule

