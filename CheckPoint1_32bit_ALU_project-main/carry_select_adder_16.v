
module carry_select_adder_16(a, b, c_in, s, c_out, last_cin_0, last_cin_1);
	input [15:0] a, b;
	input c_in;
	
	output [15:0] s;
	output c_out;
	output last_cin_0;
	output last_cin_1;
	
	wire [3:0]carry;
	
	wire [3:0]c_0;
	wire [3:0]c_1;
	wire [15:0]s_0;
	wire [15:0]s_1;
	
//1-0 bit:
	ripple_adder_2 rca_1_0(
		.a(a[1:0]),
		.b(b[1:0]),
		.c_in(c_in),
		.s(s[1:0]),
		.c_out(carry[0])
	);
//3-2 bit:
	ripple_adder_2 rca0_3_2(
		.a(a[3:2]),
		.b(b[3:2]),
		.c_in(1'b0),
		.s(s_0[3:2]),
		.c_out(c_0[0])
	);
	
		ripple_adder_2 rca1_3_2(
		.a(a[3:2]),
		.b(b[3:2]),
		.c_in(1'b1),
		.s(s_1[3:2]),
		.c_out(c_1[0])
	);
	//Mux 6:3
	//assign s[3:2] = carry[0] ? s_1[3:2] : s_0[3:2];
	Mux_6to3 mux_6to3(
		.s_0(s_0[3:2]), 
		.s_1(s_1[3:2]), 
		.c_0(c_0[0]), 
		.c_1(c_1[0]), 
		.c_in(carry[0]), 
		.result(s[3:2]), 
		.c_out(carry[1])
		);
//6-4 bit:
	ripple_adder_3 rca0_6_4(
		.a(a[6:4]),
		.b(b[6:4]),
		.c_in(1'b0),
		.s(s_0[6:4]),
		.c_out(c_0[1])
	);
	
		ripple_adder_3 rca1_6_4(
		.a(a[6:4]),
		.b(b[6:4]),
		.c_in(1'b1),
		.s(s_1[6:4]),
		.c_out(c_1[1])
	);
	//Mux 8:4
	Mux_8to4 mux_8to4(
		.s_0(s_0[6:4]), 
		.s_1(s_1[6:4]), 
		.c_0(c_0[1]), 
		.c_1(c_1[1]), 
		.c_in(carry[1]), 
		.result(s[6:4]), 
		.c_out(carry[2])
		);
		
//10-7 bit:
	ripple_adder_4 rca0_10_7(
		.a(a[10:7]),
		.b(b[10:7]),
		.c_in(1'b0),
		.s(s_0[10:7]),
		.c_out(c_0[2])
	);
	
		ripple_adder_4 rca1_10_7(
		.a(a[10:7]),
		.b(b[10:7]),
		.c_in(1'b1),
		.s(s_1[10:7]),
		.c_out(c_1[2])
	);
	
	//Mux 10:5
	Mux_10to5 mux_10to5(
		.s_0(s_0[10:7]), 
		.s_1(s_1[10:7]), 
		.c_0(c_0[2]), 
		.c_1(c_1[2]), 
		.c_in(carry[2]), 
		.result(s[10:7]), 
		.c_out(carry[3])
		);
	
//15-11 bit:
		ripple_adder_5 rca0_15_11(
		.a(a[15:11]),
		.b(b[15:11]),
		.c_in(1'b0),
		.s(s_0[15:11]),
		.c_out(c_0[3]),
		.last_cin(last_cin_0)
	);
	
		ripple_adder_5 rca1_15_11(
		.a(a[15:11]),
		.b(b[15:11]),
		.c_in(1'b1),
		.s(s_1[15:11]),
		.c_out(c_1[3]),
		.last_cin(last_cin_1)
	);
	
	//Mux 12:6
	Mux_12to6 mux_12to6(
		.s_0(s_0[15:11]), 
		.s_1(s_1[15:11]), 
		.c_0(c_0[3]), 
		.c_1(c_1[3]), 
		.c_in(carry[3]), 
		.result(s[15:11]), 
		.c_out(c_out)
		);
endmodule