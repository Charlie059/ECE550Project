/* This module is 32 bits SRA

Please note that we declear [32:0] data_in_ is not an error
The 32nd bit of data_in_ is a copy of the 31st bit of data_in.

Xuhui Gong	21-09-19

*/
module SRA_32(data_out, data_in, shift_ctrl);
	
	input [31:0] data_in; 
	input [4:0] shift_ctrl;
	output [31:0] data_out;

	wire [31:0] out_1, out_2, out_3, out_4, out_5; // Define the first and second layer of MUX's output
	wire [32:0] data_in_; // add a dulpilcated of b32(NOT AN ERROR)
	

	// Assign and add sign bit wire
	genvar n;
	generate
		for (n = 0; n < 32; n = n + 1) begin: assign_data
			assign data_in_[n] = data_in[n];
		end
	endgenerate
	
	assign data_in_[32] = data_in[31];
	
	
/* Build the first MUX layer */
	genvar i_1;
	generate
		for (i_1 = 0; i_1 < 32; i_1 = i_1 + 1) begin: shift_1
			MUX_2to1 mux(out_1[i_1], data_in_[i_1], data_in_[i_1+1], shift_ctrl[0]);
		end
	endgenerate
	
	
	
/* Build the 2's MUX layer */
	
	genvar i_2; // build the gap 2 mux
	generate
		for (i_2 = 0; i_2 < 30; i_2 = i_2 + 1) begin: shift_2
			MUX_2to1 mux(out_2[i_2], out_1[i_2], out_1[i_2+2],  shift_ctrl[1]);
		end
	endgenerate
	
	
	// build the gap 1 mux which connect to the b32
	
	genvar i_3;
	generate
		for (i_3 = 30; i_3 < 32; i_3 = i_3 + 1) begin: shift_2_top
			MUX_2to1 mux(out_2[i_3], out_1[i_3], data_in_[32],  shift_ctrl[1]);
		end
	endgenerate
	
	
	
/* Build the 3's MUX layer */
	

	
	genvar i_4; // build the gap 4 mux
	generate
		for (i_4 = 0; i_4 < 28; i_4 = i_4 + 1) begin: shift_4
			MUX_2to1 mux(out_3[i_4], out_2[i_4], out_2[i_4+4],  shift_ctrl[2]);
		end
	endgenerate
	

	// build the gap 1 mux which connect to the b32
	
	genvar i_5;
	generate
		for (i_5 = 28; i_5 < 32; i_5 = i_5 + 1) begin: shift_4_top
			MUX_2to1 mux(out_3[i_5], out_2[i_5], data_in_[32],  shift_ctrl[2]);
		end
	endgenerate


	

/* Build the 4's MUX layer */
	

	
	genvar i_6; // build the gap 8 mux
	generate
		for (i_6 = 0; i_6 < 24; i_6 = i_6 + 1) begin: shift_8
			MUX_2to1 mux(out_4[i_6], out_3[i_6], out_3[i_6+8],  shift_ctrl[3]);
		end
	endgenerate
	

	// build the gap 1 mux which connect to the b32
	
	genvar i_7;
	generate
		for (i_7 = 24; i_7 < 32; i_7 = i_7 + 1) begin: shift_8_top
			MUX_2to1 mux(out_4[i_7], out_3[i_7], data_in_[32],  shift_ctrl[3]);
		end
	endgenerate



/* Build the 5's MUX layer */
	

	
	genvar i_8; // build the gap 16 mux
	generate
		for (i_8 = 0; i_8 < 16; i_8 = i_8 + 1) begin: shift_16
			MUX_2to1 mux(out_5[i_8], out_4[i_8], out_4[i_8+16],  shift_ctrl[4]);
		end
	endgenerate
	

	// build the gap 1 mux which connect to the b32
	
	genvar i_9;
	generate
		for (i_9 = 16; i_9 < 32; i_9 = i_9 + 1) begin: shift_16_top
			MUX_2to1 mux(out_5[i_9], out_4[i_9], data_in_[32],  shift_ctrl[4]);
		end
	endgenerate
	
	
	
	// return the output
	assign data_out = out_5;
	
		
endmodule








