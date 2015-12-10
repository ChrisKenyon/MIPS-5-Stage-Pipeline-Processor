// Chris Kenyon and Brandon Nguyen

// Forwarding Unit

`timescale 1ns / 1ns

module ForwardingUnit(rst, D_rs, D_rt, X_rd, M_rd, X_regWrite, M_regWrite, fwd1, fwd2);
   input [4:0] D_rs, D_rt, X_rd, M_rd;
   input rst, X_regWrite, M_regWrite;
   output reg [1:0] fwd1, fwd2;
      
  always@(posedge rst)
  begin
     fwd1 = 2'b00;
     fwd2 = 2'b00;
  end
   
   always @ (D_rs or D_rt or X_rd or M_rd or X_regWrite or M_regWrite)
     begin
       if ((X_rd == D_rs) && (X_rd != 5'b0) && X_regWrite)
         begin
           fwd1 <= 2'b10;
         end
       else if (M_regWrite && (M_rd != 5'b0) && (M_rd == D_rs))
         begin
           fwd1 <= 2'b01;
         end
       else
         begin
           fwd1 <= 2'b00;
         end
       
       if (X_regWrite && (X_rd != 5'b0) && (X_rd == D_rt))
         begin
           fwd2 <= 2'b10;
         end
       else if ((M_rd == D_rt)&& (M_rd != 5'b0) && M_regWrite)
         begin
           fwd2 <= 2'b01;
         end
       else
         begin
           fwd2 <= 2'b00;
         end
     end
endmodule