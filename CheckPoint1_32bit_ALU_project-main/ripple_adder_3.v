
module ripple_adder_3(
	input [2:0]a, b,
	input c_in,
	output [2:0] s,
	output c_out);
	
	wire carry;
	
	full_adder_1 fa0(
		.a(a[0]),
		.b(b[0]),
		.c_in(c_in),
		.s(s[0]),
		.c_out(carry)
	);
	
	ripple_adder_2 rca2_0(
		.a(a[2:1]),
		.b(b[2:1]),
		.c_in(carry),
		.s(s[2:1]),
		.c_out(c_out)
	);
	
endmodule
