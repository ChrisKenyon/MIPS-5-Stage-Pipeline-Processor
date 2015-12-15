// Chris Kenyon and Brandon Nguyen
// CPU Test bench

`timescale 1ns / 100ps

module CPU_tb;
  reg clk, reset;
  wire[31:0] instruction, dataOut, dataIn, instructionAddress, dataAddress;
  wire MemRead, MemWrite;
    
reg signed [31:0] min;
reg signed [31:0] max;

Memory memory(instructionAddress, instruction, dataAddress, dataIn, MemRead, MemWrite, dataOut);  
CPU cpu(reset, instructionAddress, instruction, dataAddress, dataIn, MemRead, MemWrite, dataOut, clk);
real cycles;
initial begin
  cycles = 0;
  reset = 0;
  #1
  clk = 0;
  reset = 1;
  #5
  reset = 0;
end

always begin
  #10 clk = !clk;
  cycles = cycles+0.5;
 	if(instruction == 8'hFC00000)
	    reset = 1;
end
  always #20 $display("\n\n--------------------CYCLE %d--------------------\n", cycles);
  always #20 $display("$0: %d\t$at: %d", cpu.regFile.regFile[0], cpu.regFile.regFile[1]);
  //always #20 $display("$v0: %d $v1: %d", cpu.regFile.regFile[2], cpu.regFile.regFile[3]);
  //always #20 $display("$a0: %d $a1: %d", cpu.regFile.regFile[4], cpu.regFile.regFile[5]);
  //always #20 $display("$a2: %d $a3: %d", cpu.regFile.regFile[6], cpu.regFile.regFile[7]);
  always #20 $display("$t0: %d\t$t1: %d", cpu.regFile.regFile[8], cpu.regFile.regFile[9]);
  always #20 $display("$t2: %d\t$t3: %d", cpu.regFile.regFile[10], cpu.regFile.regFile[11]);
  always #20 $display("$t4: %d\t$t5: %d", cpu.regFile.regFile[12], cpu.regFile.regFile[13]);
  always #20 $display("$t6: %d\t$t7: %d", cpu.regFile.regFile[14], cpu.regFile.regFile[15]);
  always #20 $display("$s0: %d\t$s1: %d", cpu.regFile.regFile[16], cpu.regFile.regFile[17]);
  always #20 $display("$s2: %d\t$s3: %d", cpu.regFile.regFile[18], cpu.regFile.regFile[19]);
  //always #20 $display("$s4: %d $s5: %d", cpu.regFile.regFile[20], cpu.regFile.regFile[21]);
  //always #20 $display("$s6: %d $s7: %d", cpu.regFile.regFile[22], cpu.regFile.regFile[23]);
  //always #20 $display("$t8: %d $t9: %d", cpu.regFile.regFile[24], cpu.regFile.regFile[25]);
  //always #20 $display("$k0: %d $k1: %d", cpu.regFile.regFile[26], cpu.regFile.regFile[27]);
  //always #20 $display("$gp: %d $sp: %d", cpu.regFile.regFile[28], cpu.regFile.regFile[29]);
  //always #20 $display("$s8: %d $ra: %d", cpu.regFile.regFile[30], cpu.regFile.regFile[31]);
  always #20 begin
       min = cpu.regFile.regFile[10]; 
       max = cpu.regFile.regFile[11];
       $display("Minimum: %d \t Maximum: %d", min, max);
  end

endmodule
