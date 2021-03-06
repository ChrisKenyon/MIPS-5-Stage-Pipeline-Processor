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
 	wire[31:0] PCplusFour, D_PCplusFour, D_instruction, nextPC, D_branchAddress, jumpAddress, D_extendedAndShifted;
 	wire [27:0] jumpComponent;
	wire [5:0] D_opcode, D_funct;
	wire [1:0] D_ALUop, PCSrc;
	wire ifidFlush, hazardPCenable, hazardIFIDenable, hazardIDEXenable, 
       D_RegDst, D_Jump, D_Branch, D_MemtoReg, D_ALUsrc, D_RegWrite, D_zero;
	assign PCplusFour = PC + 4;

	mux32b4_1 mux_pc(PCplusFour, D_branchAddress, jumpAddress, 0, PCSrc, nextPC);
  ProgramCounter programCounter(hazardPCenable, nextPC, clk, reset, PC);
  
  IF_ID_reg IFIDreg(hazardIFIDenable, ifidFlush, clk, reset, instruction, D_instruction, PCplusFour, D_PCplusFour);
 	// ------------------------------------------ //
 	
 	
  // ----------------- Decode/Register ----------------- //
  wire [31:0] D_readData1, D_readData2, D_readData1Out, D_readData2Out, D_writeData, D_signExtend, 
                                        X_readData1, X_readData2, X_signExtend, X_PCplusFour,
              M_ALUresult;
  wire [5:0] X_funct;
  wire [4:0] D_rs, D_rt, D_rd, X_rs, X_rt, X_rd, D_writeReg;
 	wire [3:0] X_EX;
	wire [2:0] X_M;
  wire [1:0] X_WB, W_WB;
  wire fwdA_D, fwdB_D;
  
  
  assign D_opcode = D_instruction[31:26];
  // For R types
  assign D_rs = D_instruction[25:21];
  assign D_rt = D_instruction[20:16];
  assign D_rd = D_instruction[15:11]; 
	assign D_funct = D_instruction[5:0];
	//
	assign D_branchAddress = D_extendedAndShifted + D_PCplusFour; 
  assign jumpAddress = {D_PCplusFour[31:28], jumpComponent};
  assign D_zero = (D_readData1Out == D_readData2Out);
  assign PCSrc = {D_Jump, D_zero&&D_Branch};
  assign ifidFlush = PCSrc[0] ||  PCSrc[1];
	always@(reset) dataAddress = 0;
	
	mux32b2_1 mux_readData1(D_readData1, M_ALUresult, fwdA_D, D_readData1Out);
	mux32b2_1 mux_readData2(D_readData2, M_ALUresult, fwdB_D, D_readData2Out);
	
	leftshift2_32b shiftLeftJump({6'b0, D_instruction[25:0]}, jumpComponent); // size mismatch is fine
	
	reg_file regFile(reset, W_WB[0], clk, D_rs, D_rt, D_writeReg, D_writeData, D_readData1, D_readData2);
	controlunit controlUnit(D_opcode, D_RegDst, D_Jump, D_Branch, D_MemRead, D_MemtoReg, D_MemWrite, D_ALUsrc, D_RegWrite, D_ALUop);
  signextender signExtender(D_instruction[15:0], D_signExtend);
	leftshift2_32b shiftLeftSignExtend(D_signExtend, D_extendedAndShifted);
	ID_EX_reg IDEXreg(clk, reset, hazardIDEXenable,
              D_PCplusFour, D_signExtend, D_rs, D_rt, D_rd, D_readData1, D_readData2, D_ALUop, D_RegWrite, D_MemtoReg, D_Branch, D_MemRead, D_MemWrite, D_RegDst, D_ALUsrc, D_zero, D_funct,
              X_PCplusFour, X_signExtend, X_rs, X_rt, X_rd, X_readData1, X_readData2, X_WB, X_M, X_EX, X_funct);
  // ----------------------------------------------- //
 	

  // ----------------- Execution ----------------- //
  wire [31:0] aluInput, writeData, aluInput2, ALUresult, M_writeData, W_writeData;
 	wire [4:0] X_writeReg, M_writeReg;
 	wire [3:0] operation;
 	wire [2:0] M_M;
  wire [1:0] M_WB, fwdA_X, fwdB_X;
 	// ALU
  mux32b4_1 mux_alu1(X_readData1, W_writeData, M_ALUresult, 0, fwdA_X, aluInput);
  mux32b4_1 mux_writeData(X_readData2, W_writeData, M_ALUresult, 0, fwdB_X, writeData);
  mux32b2_1 mux_alu2(writeData, X_signExtend, X_EX[0], aluInput2);
  
  alu_control aluControl(X_EX[2:1], X_funct, operation);
	alu alu(ALUresult, X_zero, operation, aluInput, aluInput2);
  mux5b2_1  mux_writeRegister(X_rt, X_rd, X_EX[3], X_writeReg);
	  
	EX_MEM_reg EXMEMreg(clk, reset, ALUresult, writeData, X_writeReg, X_WB, X_M,
                               M_ALUresult,M_writeData, M_writeReg, M_WB, M_M );

	// --------------------------------------------- //
	
	
	
  // ----------------- Memory Access ----------------- //
  wire [31:0] M_readData, W_ALUresult, W_readData;
  wire [4:0] W_writeReg;
  assign MemRead = M_M[1];
  assign MemWrite = M_M[0];
  assign dataIn = M_writeData;
  assign M_readData = dataOut;
	always@(M_ALUresult)
	  dataAddress = M_ALUresult;
	  
	MEM_WB_reg MEMWB_reg(clk, reset, M_ALUresult, M_writeReg, M_readData, M_WB,
                                   W_ALUresult, W_writeReg, W_readData, W_WB);
	// ------------------------------------------------- //
	
	
  // ----------------- Write/Hazard/Forwarding ----------------- //	

  mux32b2_1 mux_writeBack(W_ALUresult, W_readData, W_WB[1], W_writeData);
  assign D_writeReg = W_writeReg;
  assign D_writeData = W_writeData;
  hazard_detection_unit hazardDetect(D_instruction, X_rt, X_M[1], hazardPCenable, hazardIFIDenable, hazardIDEXenable);
  forwarding_unit forwardingUnit(reset, D_rs, D_rt, X_rs, X_rt, M_writeReg, W_writeReg, M_WB, W_WB, fwdA_D, fwdB_D, fwdA_X, fwdB_X);
 	// ----------------------------------------------------------- //

  
endmodule