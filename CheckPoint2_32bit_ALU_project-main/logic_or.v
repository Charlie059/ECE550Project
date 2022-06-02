module logic_or (in_a, in_b, out);
	input [31:0] in_a, in_b;
	output [31:0] out;
	genvar i;
	generate
	for(i = 0; i < 32; i = i+1) begin: generate_block_identifier1
		or or_1(out[i], in_a[i], in_b[i]);
	end
	endgenerate
endmodule
