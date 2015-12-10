// Chris Kenyon and Brandon Nguyen
// 32 bit 2 to 1 mux

module mux32b2_1 (a, b, select, out);
  input [31:0] a, b;
  input select;
  output reg [31:0] out;
  always @ (a or b or select)
  begin
    if (select == 1)
      out = a;
    else 
      out = b;
  end
endmodule