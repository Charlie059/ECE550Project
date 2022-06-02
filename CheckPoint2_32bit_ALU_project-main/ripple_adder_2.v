
module ripple_adder_2(
	input [1:0]a, b,
	input c_in,
	output [1:0] s,
	output c_out);
	
	wire carry;
	
	full_adder_1 fa0(
		.a(a[0]),
		.b(b[0]),
		.c_in(c_in),
		.s(s[0]),
		.c_out(carry)
	);
	
	full_adder_1 fa1(
		.a(a[1]),
		.b(b[1]),
		.c_in(carry),
		.s(s[1]),
		.c_out(c_out)
	);
	
endmodule
