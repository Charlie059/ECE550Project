module full_adder_1(a, b, c_in, s, c_out);
	input a, b, c_in;
	output s, c_out;
	wire net1, net2, net3;

	xor xor1(net1, a, b);
	xor xor2(s, net1, c_in);
	and and1(net3, a, b);
	and and2(net2, net1, c_in);
	or or1(c_out, net2, net3);
endmodule