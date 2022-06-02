module mux_2to1_(a_0, b_1,  s, out);
	input a_0,b_1;
	input s;
	wire int_out;
	output out;

	assign out=(s)?b_1:a_0;

endmodule