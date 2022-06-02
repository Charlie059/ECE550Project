module SLL_32(in, out, ctrl);
	input [31:0] in;
	input [4:0] ctrl;
	output [31:0] out;
	wire [31:0] x_1, x_2, x_3, x_4;
	
	genvar i;
	genvar j;
	genvar k, l;
	genvar m, n;
	genvar s, p;
	//layer 0: shift 1 bit

	mux_2to1_ mux_1(.a_0(in[0]), .b_1(1'b0), .s(ctrl[0]), .out(x_1[0]));
	generate
	for (i=0; i < 31; i = i+1)  begin : generate_block_identifier1
		mux_2to1_ mux(.a_0(in[i+1]), .b_1(in[i]), .s(ctrl[0]), .out(x_1[i+1]));
	end
	endgenerate
	//layer 1: shift 2 bits
	
	mux_2to1_ mux_2(.a_0(x_1[0]), .b_1(1'b0), .s(ctrl[1]), .out(x_2[0]));
	mux_2to1_ mux_3(.a_0(x_1[1]), .b_1(1'b0), .s(ctrl[1]), .out(x_2[1]));

	generate
	for (j=0; j < 30; j = j+1)  begin : generate_block_identifier2
		mux_2to1_ mux(.a_0(x_1[j+2]), .b_1(x_1[j]), .s(ctrl[1]), .out(x_2[j+2]));
	end
	endgenerate
	//layer 2: shift 4 bits
	
	generate
	for (k=0; k < 4; k = k+1)  begin : generate_block_identifier3
		mux_2to1_ mux(.a_0(x_2[k]), .b_1(1'b0), .s(ctrl[2]), .out(x_3[k]));
	end
	
	//32 - n bits
	for (l=0; l < 28; l = l+1)  begin : generate_block_identifier4
		mux_2to1_ mux(.a_0(x_2[l+4]), .b_1(x_2[l]), .s(ctrl[2]), .out(x_3[l+4]));
	end

	//layer 3: shift 8 bits
	
	for (m=0; m < 8; m = m+1)  begin : generate_block_identifier5
		mux_2to1_ mux(.a_0(x_3[m]), .b_1(1'b0), .s(ctrl[3]), .out(x_4[m]));
	end
	
	//32 - n bits
	for (n=0; n < 24; n = n+1)  begin : generate_block_identifier6
		mux_2to1_ mux(.a_0(x_3[n+8]), .b_1(x_3[n]), .s(ctrl[3]), .out(x_4[n+8]));
	end
	
	//layer 4: shift 16 bits

	for (s=0; s < 16; s = s+1)  begin : generate_block_identifier7
		mux_2to1_ mux(.a_0(x_4[s]), .b_1(1'b0), .s(ctrl[4]), .out(out[s]));
	end
	
	//32 - n bits
	for (p=0; p < 16; p = p+1)  begin : generate_block_identifier8
		mux_2to1_ mux(.a_0(x_4[p+16]), .b_1(x_4[p]), .s(ctrl[4]), .out(out[p+16]));
	end
	endgenerate
	
endmodule