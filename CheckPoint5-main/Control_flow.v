module Control_flow(opcode, ALUopcode, Rd, isOverflow, Rwe, ctrl_writeReg, ALUinB, preALUopcode, exception, Dwe_wire, Rwd);
	input[4:0]opcode, ALUopcode, Rd;
	input isOverflow;
	output Rwe, ALUinB;
	output[4:0] preALUopcode, ctrl_writeReg;
	output[31:0] exception;
	output Dwe_wire, Rwd;
	wire[4:0]reg_30;
	assign reg_30 = 5'b11110;
	
	reg Rwe, ALUinB;
	reg[4:0]preALUopcode, ctrl_writeReg;
	reg[31:0] exception;
	reg Rwd;
	
	always@(*)begin
		//Rwe
		
		//add(sub, and ,sll...), addi, lw, setx
		if ((opcode == 5'b00000) || (opcode == 5'b00101) || (opcode == 5'b01000) ||
		(opcode == 5'b10101)) begin
			Rwe <=  1'b1;
		end else if (opcode == 5'b00111 ||opcode == 5'b00001 || opcode == 5'b00010
		||opcode == 5'b00100 ||opcode ==5'b00110 || opcode == 5'b10110) begin//sw, j , bne, jr, blt, bex
			Rwe <= 1'b0;
		end

		//ALUinB:
		//addi, lw, sw
		if (opcode == 5'b00101 || opcode == 5'b01000 || opcode == 5'b00111) begin
			ALUinB <= 1'b1;
		end else if (opcode == 5'b00000) begin
			ALUinB <= 1'b0;
		end else begin 
			ALUinB <= 1'b0;
		end
		
		//preALUopcode:
		if (opcode == 5'b00000)
			preALUopcode <= ALUopcode;
		//bne: sub
		else if (opcode == 5'b00010)
			preALUopcode <= 5'b00001;
		else
			preALUopcode <= 5'b00000;
			
		//exception
		//add
		if (isOverflow && opcode == 5'b00000 && ALUopcode == 5'b00000)
			exception <= 32'b1;
		//sub
		else if (isOverflow && opcode == 5'b00000 && ALUopcode == 5'b00001)
			exception <= 32'b11;
		//addi
		else if (isOverflow && opcode == 5'b00101)
			exception <= 32'b10;
		else
			exception <= 32'b0;
		
		//ctrl_writeReg:
		//(isOverflow and (add or sub or addi)) or setx 
		if (isOverflow && ((opcode == 5'b00000 && ALUopcode == 5'b00000) ||(opcode == 5'b00000 && ALUopcode == 5'b00001)
		|| (opcode == 5'b00101)))
			ctrl_writeReg <= reg_30;
		else if (opcode == 5'b10101)
			ctrl_writeReg <= reg_30;
		else
			ctrl_writeReg <= Rd;
			
		//Rwd
		if (opcode == 5'b01000) //lw
			Rwd <= 1'b1;
		else //sw
			Rwd <= 1'b0;

	end
	
			//DMwe:
		assign Dwe_wire = ((opcode == 5'b00111)? 1'b1:1'b0);//opcode(sw) = 00111

endmodule


	
	
	
	