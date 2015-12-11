module MEM_WB_reg(clk, rst, M_ALUresult, M_writeReg, M_readData, M_WB,
                            W_ALUresult, W_writeReg, W_readData, W_WB);

  input clk, rst;
  input [31:0] M_ALUresult, M_readData;
  input [4:0] M_writeReg;
  input [1:0] M_WB;
  output reg [31:0] W_ALUresult, W_readData;
  output reg [4:0] W_writeReg;
  output reg [1:0] W_WB;
  
  // Pass through values
  always @ (negedge clk or posedge rst) begin
    if (rst)
     begin
      W_ALUresult <= 0;
      W_readData <= 0;
      W_writeReg <= 0;
      W_WB <= 0;
    end
    else begin
      W_ALUresult <= M_ALUresult;
      W_readData <= M_readData;
      W_writeReg <= M_writeReg;
      W_WB <= M_WB;
    end
  end
endmodule
