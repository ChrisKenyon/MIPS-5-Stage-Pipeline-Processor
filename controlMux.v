// Chris Kenyon and Brandon Nguyen

`timescale 1ns / 1ns

module controlMux(in, select, out);
  input [9:0] in;
  input select;
  output reg [9:0] out;
  
  always @ (in or select) begin
    if (select) begin
      out <= 10'b0;  
      end
    else begin
      out <= in;
    end
  end
  
endmodule

