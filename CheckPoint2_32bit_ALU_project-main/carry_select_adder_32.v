module carry_select_adder_32(a, b, c_in, s, c_out_31, c_in_31);
	input [31:0] a, b;
	input c_in;
	
	output [31:0] s;
	output c_out_31, c_in_31;
	
	wire [15:0]s_1, s_0;
	wire c_15, c_1, c_0;
	wire last_cin_0, last_cin_1;
	wire [3:0]useless;
	
	//15-0 bit:
	carry_select_adder_16 csa_16_1(
		.a(a[15:0]),
		.b(b[15:0]),
		.c_in(c_in),
		.s(s[15:0]),
		.c_out(c_15),
		.last_cin_0(useless[0]), 
		.last_cin_1(useless[1])
	);
	
	//31-16 bit:
		carry_select_adder_16 csa0_16_2(
		.a(a[31:16]),
		.b(b[31:16]),
		.c_in(1'b0),
		.s(s_0[15:0]),
		.c_out(c_0),
		.last_cin_0(last_cin_0), 
		.last_cin_1(useless[2])
	);
	
		carry_select_adder_16 csa1_16_2(
		.a(a[31:16]),
		.b(b[31:16]),
		.c_in(1'b1),
		.s(s_1[15:0]),
		.c_out(c_1),
		.last_cin_0(useless[3]), 
		.last_cin_1(last_cin_1)
	);
	
	Mux_36to18 mux_36to18(
		.s_0(s_0[15:0]), 
		.s_1(s_1[15:0]), 
		.c_out31_0(c_0), 
		.c_out31_1(c_1), 
		.c_in31_0(last_cin_0), 
		.c_in31_1(last_cin_1), 
		.c_in(c_15), 
		.result(s[31:16]),
		.c_out31(c_out_31), 
		.c_in31(c_in_31)
	);
	
	//
	
endmodule











