// Chris Kenyon and Brandon Nguyen

`timescale 1ns / 1ns

module IF_ID_reg(en, clk, rst, instr, D_instr, PCPlusFour, D_PCPlusFour);
  input en, rst, clk;
  input [31:0] instr, PCPlusFour;
  output reg[31:0] D_instr, D_PCPlusFour;

  always @ (negedge clk)
  begin
    if(rst)
      begin
        D_instr <= 0;
        D_PCPlusFour <=0;
      end
    else if (en)
      begin
        D_instr <= instr;
        D_PCPlusFour <= PCPlusFour;
      end
  end 
endmodule