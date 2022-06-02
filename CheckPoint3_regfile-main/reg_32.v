module reg_32(in, out, clk, en, clr);
   
   //Inputs
	input[31:0]in;
	
   input clk, en, clr;

   //Output
   output[31:0] out;
	
	genvar i;
	
	generate //q, d, clk, en, clr
	for (i=0; i < 32; i = i+1)  begin : generate_block_identifier1
		dffe_ref dffe1(.q(out[i]), .d(in[i]), .clk(clk), .en(en), .clr(clr));
	end
	endgenerate
endmodule
