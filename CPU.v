// Chris Kenyon and Brandon Nguyen
// CPU

module CPU(reset, PC, instruction, dataAddress, dataIn, MemRead, MemWrite, dataOut, clk);
	input [31:0] instruction, dataIn, dataOut;
	input clk, reset;
	output MemRead, MemWrite;
	output [31:0] PC;
	output reg[31:0] dataAddress = 0;

	always@(instruction) begin
	  // The simulation should stop when the halt instruction is loaded
	  if(instruction == 8'hFC00000)
	    $stop;
	end
  
 
  // ----------------- Fetch ----------------- //
 	wire hazardFetchWrite, hazardPCwrite, RegDst, Jump, Branch, MemtoReg, ALUsrc, RegWrite, zero;
 	wire[31:0] PCplusFourD, nextPC, PCplusFour, branchAddress, nextInstAddr, jumpAddress, extendedAndShifted;
 	wire [27:0] jumpComponent;
	wire [5:0] opcode, funct;
	assign PCplusFour = PC + 4;
	assign opcode = instruction[31:26]; 
	assign funct = instruction[5:0];
	assign branchAddress = extendedAndShifted + PCplusFour; 
  assign jumpAddress = {PCplusFour[31:28], jumpComponent};
	always@(reset) dataAddress = 0;
	   
  ProgramCounter programCounter(nextPC, clk, rst, PC);
  mux32b2_1 mux_PC(jumpAddress, nextInstAddr, Jump, nextPC);
	mux32b2_1 mux_branch(branchAddress, PCplusFour, zero&&Branch, nextInstAddr);
  leftshift2_32b shiftLeftJump(instruction[25:0], jumpComponent); // This is a size mismatch that will have the first 4 bits unknown. Inconsequential.
  IF_ID_reg IFIDreg(hazardFetchWrite, clk, rst, instruction, PCplusFour, PCplusFourD);
 	// ------------------------------------------ //
 	
 	
  // ----------------- Decode ----------------- //
 	wire [4:0] writeReg;
	wire [1:0] ALUop;
  wire [31:0] readData1, readData2, writeData, signExtend;
	reg_file regFile(reset, RegWrite, clk, instruction[25:21], instruction[20:16], writeReg, writeData, readData1, readData2);
	controlunit controlUnit(opcode, RegDst, Jump, Branch, MemRead, MemtoReg, MemWrite, ALUsrc, RegWrite, ALUop);
  signextender signExtender(instruction[15:0], signExtend);
	leftshift2_32b shiftLeftSignExtend(signExtend, extendedAndShifted);
	ID_EX_reg IDEXreg(clk, rst, 
              D_PCplusFour, D_signExtend, D_rs, D_rt, D_rd, D_readData1, D_readData2,
              D_ALUop, D_regWrite, D_MemtoReg, D_Branch, D_MemRead, D_MemWrite, D_RegDst, D_ALUsrc, D_addi,
              X_PCplusFourOut, X_signExtendOut, X_rs, X_rt, X_rd, X_readData1, X_readData2, 
              X_ALUop, X_RegWrite, X_MemtoReg, X_Branch, X_MemRead, X_MemWrite, X_RegDst, X_ALUsrc, X_addi);
  controlMux ctrlMux({RegDst, Jump, Branch, MemRead, MemToReg, MemWrite, ALUSrc, RegWrite, ALUop}); 
 	// ------------------------------------------ //
 	

  // ----------------- Execution ----------------- //
  wire [3:0] operation;
 	wire [31:0] aluInput, ALUresult;
 	// ALU
	alu alu(ALUresult, zero, operation, readData1, aluInput);
  alu_control aluControl(ALUop, funct, operation);
	mux32b2_1 mux_ALU(signExtend, readData2, ALUsrc, aluInput);	
	// --------------------------------------------- //
	
	
	
  // ----------------- Memory Access ----------------- //
  assign dataIn = readData2;
	always@(ALUresult)
	  dataAddress = ALUresult;
	// ------------------------------------------------- //
	
	
  // ----------------- Write ----------------- //	
 	mux5b2_1  mux_writeRegister(instruction[15:11], instruction[20:16], RegDst, writeReg);
	mux32b2_1 mux_writeData(dataOut, ALUresult, MemtoReg, writeData);
  // ----------------------------------------- //

  
endmodule