// EECE3324 Computer Architecture
// Advanced Project
// Tim Liming

// ID/EX_ Pipeline Register

`timescale 1ns / 1ns

module ID_EX_reg(clk, rst, 
              D_PCplusFour, D_signExtend, D_rs, D_rt, D_rd, D_readData1, D_readData2,
              D_ALUop, D_regWrite, D_MemtoReg, D_Branch, D_MemRead, D_MemWrite, D_RegDst, D_ALUsrc, D_addi,
              X_PCplusFourOut, X_signExtendOut, X_rs, X_rt, X_rd, X_readData1, X_readData2, 
              X_ALUop, X_RegWrite, X_MemtoReg, X_Branch, X_MemRead, X_MemWrite, X_RegDst, X_ALUsrc, X_addi);
  
  input [31:0] D_PCplusFourOut, D_readData1, D_readData2, D_signExtend;
  input [4:0] D_rs, D_rt, D_rd;
  input [1:0] D_ALUop;
  input D_regWrite, D_MemtoReg, D_Branch, D_MemRead, D_MemWrite, D_RegDst, D_ALUsrc, D_addi;
  input clk, rst;
  output reg [31:0] X_PCplusFourOut, X_readData1, X_readData2, X_signExtendOut;
  output reg [4:0] X_rs, X_rt, X_rd;
  output reg [1:0] X_ALUop;
  output reg X_RegWrite, X_MemtoReg, X_Branch, X_MemRead, X_MemWrite, X_RegDst, X_ALUsrc, X_addi;
 
  always @ (negedge clk or posedge rst) begin
    if (!rst)
      begin
        X_PCplusFourOut <= D_PCplusFourOut;
        X_readData1 <= D_readData1;
        X_readData2 <= D_readData2;
        X_signExtendOut <= D_signExtend;
        X_rs <= D_rs;
        X_rt <= D_rt;
        X_rd <= D_rd;
        X_ALUop <= D_ALUop;
        X_RegWrite <= D_regWrite;
        X_MemtoReg <= D_MemtoReg;
        X_Branch <= D_Branch;
        X_MemRead <= D_MemRead;
        X_MemWrite <= D_MemWrite;
        X_RegDst <= D_RegDst;
        X_ALUsrc <= D_ALUsrc;
        X_addi <= D_addi;
      end
    else begin
      X_PCplusFourOut <= 0;
      X_readData1 <= 0;
      X_readData2 <= 0;
      X_signExtendOut <= 0;
      X_rs <= 0;
      X_rt <= 0;
      X_rd <= 0;
      X_ALUop <= 2'b00;
      X_RegWrite <= 0;
      X_MemtoReg <= 0;
      X_Branch <= 0;
      X_MemRead <= 0;
      X_MemWrite <= 0;
      X_RegDst <= 0;
      X_ALUsrc <= 0;
      X_addi <= 0;
    end
  end
  
endmodule

