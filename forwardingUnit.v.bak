// Chris Kenyon and Brandon Nguyen

`timescale 1ns / 1ns

module forwarding_unit(rst, D_rs, D_rt, X_rs, X_rt, M_writeReg, W_writeReg, M_WB, W_WB, fwdA_D, fwdB_D, fwdA_X, fwdB_X);
   input rst;
   input [4:0] D_rs, D_rt, X_rs, X_rt, M_writeReg, W_writeReg;
   input [1:0] M_WB, W_WB;
   output reg [1:0] fwdA_D, fwdB_D, fwdA_X, fwdB_X;
      
  always@(posedge rst)
  begin
     fwdA_D = 2'b00;
     fwdB_D = 2'b00;
     fwdA_X = 2'b00;
     fwdB_X = 2'b00;
  end
  
  wire M_RW, W_RW;
  assign M_RW = M_WB[0];
  assign W_RW = W_WB[0];
   
  always @ (X_rs or X_rt or M_RW or W_RW)
     begin
       fwdA_D = ( (D_rs != 5'b0) && (D_rs == M_writeReg) && M_RW );
       fwdB_D = ( (D_rt != 5'b0) && (D_rt == M_writeReg) && M_RW );     
       
       fwdA_X = 0; fwdB_X = 0;
       if (M_RW && (M_writeReg!=5'b0) && (M_writeReg == X_rs))
        fwdA_X <= 2'b10; 
       else if (W_RW && (W_writeReg!=5'b0) && (W_writeReg == X_rs))
        fwdA_X <= 2'b01;
        
       if (M_RW && (M_writeReg!=5'b0) && (M_writeReg == X_rt))
        fwdB_X <= 2'b10;
       else if (W_RW && (W_writeReg!=5'b0) && (W_writeReg == X_rt))
        fwdB_X <= 2'b01; 
        
               
     end
endmodule