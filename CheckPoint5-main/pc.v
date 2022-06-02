module pc(clock, reset, en, address_in, address_out);
	input clock, reset, en;
	input[11:0] address_in;
	output[11:0] address_out;
	
   //Intialize q to 000000000000
	reg [11:0] address_out;
   initial
   begin
       address_out = 12'b0;
   end

   //Set value of q on positive edge of the clock or clear
   always @(posedge clock or posedge reset) begin
       //If clear is high, set q to 0
       if (reset) begin
           address_out <= 12'b0;
       //If enable is high, set q to the value of d
       end else if (en) begin
           address_out <= address_in;
       end
   end
endmodule