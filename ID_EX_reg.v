// Chris Kenyon and Brandon Nguyen


`timescale 1ns / 1ns

module ID_EX_reg(clk, rst, hazardIDEXflush,
              D_PCplusFour, D_signExtend, D_rs, D_rt, D_rd, D_readData1, D_readData2,
              D_ALUop, D_RegWrite, D_MemtoReg, D_Branch, D_MemRead, D_MemWrite, D_RegDst, D_ALUsrc, D_zero, D_funct,
              X_PCplusFour, X_signExtend, X_rs, X_rt, X_rd, X_readData1, X_readData2, 
              X_WB, X_M, X_EX, X_zero, X_funct);
  
  input [31:0] D_PCplusFour, D_readData1, D_readData2, D_signExtend;
  input [5:0] D_funct;
  input [4:0] D_rs, D_rt, D_rd;
  input [1:0] D_ALUop;
  input hazardIDEXflush, D_RegWrite, D_MemtoReg, D_Branch, D_MemRead, D_MemWrite, D_RegDst, D_ALUsrc, D_zero;
  input clk, rst;
  output reg [31:0] X_PCplusFour, X_readData1, X_readData2, X_signExtend;
  output reg [5:0] X_funct;
  output reg [4:0] X_rs, X_rt, X_rd;
  output reg [3:0] X_EX;
  output reg [2:0] X_M;
  output reg [1:0] X_WB;
  output reg X_zero;
 
 // using hazard bit replaces the need for a mux to set the WB, M, and EX to 0
  always @ (negedge clk or posedge rst) begin
    if (rst || hazardIDEXflush)
      begin
      X_PCplusFour <= 0;
      X_readData1 <= 0;
      X_readData2 <= 0;
      X_signExtend <= 0;
      X_rs <= 0;
      X_rt <= 0;
      X_rd <= 0;
      X_zero <= 0;
      X_funct <= 0;
      
      X_WB <= 0;
      X_M <= 0;
      X_EX <= 0;  
    end
    else
      begin
        X_PCplusFour <= D_PCplusFour;
        X_readData1 <= D_readData1;
        X_readData2 <= D_readData2;
        X_signExtend <= D_signExtend;
        X_rs <= D_rs;
        X_rt <= D_rt;
        X_rd <= D_rd;
        X_zero <= D_zero;
        X_funct <= D_funct;
        
        X_WB <= {D_MemtoReg, D_RegWrite};
        X_M <= {D_Branch, D_MemRead, D_MemWrite};
        X_EX <= {D_RegDst, D_ALUop, D_ALUsrc};
      end   
  end
endmodule

