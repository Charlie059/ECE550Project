

module ripple_adder_5(
	input [4:0]a, b,
	input c_in,
	output [4:0] s,
	output c_out, last_cin
	);
	
	wire carry;
	
	ripple_adder_4 rca4_0(
		.a(a[3:0]),
		.b(b[3:0]),
		.c_in(c_in),
		.s(s[3:0]),
		.c_out(carry)
	);
	
	full_adder_1 fa1(
		.a(a[4]),
		.b(b[4]),
		.c_in(carry),
		.s(s[4]),
		.c_out(c_out)
	);
	
	assign last_cin = carry;
	
endmodule