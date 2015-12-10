// Chris Kenyon and Brandon Nguyen

`timescale 1ns / 1ns

module IF_ID_reg(en, clk, rst, instr, pcIn, adder_pc, out);
  input en;
  input [31:0] instr, pcIn;
  output reg[31:0] out, adder_pc;  

  always @ (negedge clk)
  begin
    if(rst)
      begin
        out<= 0;
        adder_pc <=0;
      end
    else if (en)
      begin
        out <= instr;
        adder_pc <= pcIn;
      end
  end 
endmodule