// Chris Kenyon and Brandon Nguyen
// From solutions

module controlunit (input [5:0] opcode,
					output reg RegDst, 
					output reg Jump, 
					output reg Branch, 
					output reg MemRead,
					output reg MemToReg, 
					output reg MemWrite, 
					output reg ALUSrc, 
					output reg RegWrite,
					output reg[1:0] ALUop 
				);
// These cases and outputs are taken from figure 4.22, P&H                   
always @ (opcode) 
begin
    {RegDst, ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, Jump, ALUop} = 10'b0000000000;
    case (opcode)
		6'b000000 : 
			begin // ALU r-type, others are 0 by default
				RegDst = 1;
				RegWrite = 1;
				ALUop = 2'b10;
			end
		6'b001000 : 
			begin // addi instruction
				ALUSrc = 1;
				RegWrite = 1;
			end
		6'b100011:
			begin // lw
				ALUSrc = 1;
				MemToReg = 1;
				RegWrite = 1;
				MemRead = 1;
			end
		6'b101011: 
			begin // sw
				ALUSrc <= 1;
				MemWrite <= 1;       
			end
		6'b000100: 
			begin // beq, ALU will do subtraction
				Branch <= 1;
				ALUop <= 2'b01;
			end
		6'b000010: 
			begin // j
				Jump <= 1;
				// all else is don't-care
			end
    endcase
end

endmodule