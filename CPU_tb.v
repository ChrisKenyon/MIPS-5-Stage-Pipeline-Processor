// Chris Kenyon and Brandon Nguyen
// CPU Test bench

`timescale 1ns / 100ps

module CPU_tb;
  reg clk, reset;
  wire[31:0] instruction, dataOut, dataIn, instructionAddress, dataAddress;
  wire MemRead, MemWrite;
  
Memory memory(instructionAddress, instruction, dataAddress, dataIn, MemRead, MemWrite, dataOut);  
CPU cpu(reset, instructionAddress, instruction, dataAddress, dataIn, MemRead, MemWrite, dataOut, clk);

initial begin
  clk = 0;
  reset = 1;
  #5
  reset = 0;
end

always
  #10 clk = !clk;

endmodule
