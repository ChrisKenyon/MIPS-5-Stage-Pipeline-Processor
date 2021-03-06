module EX_MEM_reg(clk, rst, X_ALUresult, X_writeData, X_writeReg, X_WB, X_M,
                            M_ALUresult, M_writeData, M_writeReg, M_WB, M_M);

  input clk, rst;
  input [31:0] X_ALUresult, X_writeData;
  input [4:0] X_writeReg;
  input [2:0] X_M;
  input [1:0] X_WB;
  output reg [31:0] M_ALUresult, M_writeData;
  output reg [4:0] M_writeReg;
  output reg [2:0] M_M;
  output reg [1:0] M_WB;
  
  always @ (negedge clk or posedge rst) begin
    if (rst)
     begin
      M_ALUresult = 0;
      M_writeData = 0;
      M_writeReg = 0;
      M_WB = 0;
      M_M = 0;
    end
    else begin
      M_ALUresult = X_ALUresult;
      M_writeData = X_writeData;
      M_writeReg = X_writeReg;
      M_WB = X_WB;
      M_M = X_M;
    end
  end
endmodule
