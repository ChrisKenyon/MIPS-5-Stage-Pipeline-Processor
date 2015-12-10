module EX_MEM_reg(clk, rst, X_ALUop, X_writeReg, X_RegWrite, X_MemtoReg, X_Branch, X_MemRead, X_MemWrite, X_RegDst, X_ALUsrc, X_addi, X_ALUresult, X_memData,
                  M_ALUresult, M_memData, M_addi, M_writeReg, M_RegWrite, M_MemtoReg, M_Branch, M_MemRead, M_MemWrite, M_zero);

  input clk, rst;
  input [31:0] X_ALUresult, X_memData, X_addi;
  input [4:0] X_writeReg;
  input X_RegWrite, X_MemtoReg, X_Branch, X_MemRead, X_MemWrite, X_zero;
  output reg M_RegWrite, M_MemtoReg, M_Branch, M_MemRead, M_MemWrite, M_zero;
  output reg [4:0] M_writeReg;
  output reg [31:0] M_ALUresult, M_memData, M_addi;
  
  // Pass through values
  always @ (negedge clk or posedge rst) begin
    if (rst) begin
      M_ALUresult <= 0;
      M_memData <= 0;
      M_addi <= 0;
      M_writeReg <= 0;
      M_RegWrite <= 0;
      M_MemtoReg <= 0;
      M_Branch <= 0;
      M_MemRead <= 0;
      M_MemWrite <= 0;
      M_zero <= 0;
    end
    else begin
      M_ALUresult <= X_ALUresult;
      M_memData <= X_memData;
      M_addi <= X_addi;
      M_writeReg <= X_writeReg;
      M_RegWrite <= X_RegWrite;
      M_MemtoReg <= X_MemtoReg;
      M_Branch <= X_Branch;
      M_MemRead <= X_MemRead;
      M_MemWrite <= X_MemWrite;
      M_zero <= X_zero;
    end
  end
endmodule