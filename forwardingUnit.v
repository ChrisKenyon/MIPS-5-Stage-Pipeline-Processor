// Chris Kenyon and Brandon Nguyen

`timescale 1ns / 1ns

module forwarding_unit(rst, X_rs, X_rt, M_writeReg, W_writeReg, M_WB, W_WB, fwdA, fwdB);
   input rst;
   input [4:0] X_rs, X_rt, M_writeReg, W_writeReg;
   input [1:0] M_WB, W_WB;
   output reg [1:0] fwdA, fwdB;
      
  always@(posedge rst)
  begin
     fwdA = 2'b00;
     fwdB = 2'b00;
  end
  
  wire M_RW, W_RW;
  assign M_RW = M_WB[0];
  assign W_RW = W_WB[0];
   
  always @ (X_rs or X_rt or M_RW or W_RW)
     begin
       
       fwdA = 0; fwdB = 0;
       if (M_RW && (M_writeReg!=5'b0) && (M_writeReg == X_rs))
        fwdA <= 2'b10; 
       else if (W_RW && (W_writeReg!=5'b0) && (W_writeReg == X_rs))
        fwdA <= 2'b01;
        
       if (M_RW && (M_writeReg!=5'b0) && (M_writeReg == X_rt))
        fwdB <= 2'b10;
       else if (W_RW && (W_writeReg!=5'b0) && (W_writeReg == X_rt))
        fwdB <= 2'b01;         
     end
endmodule