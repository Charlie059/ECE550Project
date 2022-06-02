module zero_extension(T, T_32);
	input[26:0] T;
	output [31:0] T_32;
	assign T_32[31:0] = {{5{1'b0}}, T[26:0]};
endmodule

