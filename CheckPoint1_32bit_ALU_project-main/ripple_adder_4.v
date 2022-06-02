
module ripple_adder_4(
	input [3:0]a, b,
	input c_in,
	output [3:0] s,
	output c_out);
	
	wire carry;
	
	ripple_adder_2 rca2_0(
		.a(a[1:0]),
		.b(b[1:0]),
		.c_in(c_in),
		.s(s[1:0]),
		.c_out(carry)
	);
	
	ripple_adder_2 rca2_1(
		.a(a[3:2]),
		.b(b[3:2]),
		.c_in(carry),
		.s(s[3:2]),
		.c_out(c_out)
	);
	
endmodule