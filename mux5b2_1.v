// Chris Kenyon and Brandon Nguyen
// 5 bit 2 to 1 mux

module mux5b2_1 (a, b, select, out);
  input [4:0] a, b;
  input select;
  output reg [4:0] out;
  always @ (a or b or select)
  begin
    if (select == 1)
      out = a;
    else 
      out = b;
  end
endmodule