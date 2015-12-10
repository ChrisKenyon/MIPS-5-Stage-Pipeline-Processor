// Chris Kenyon and Brandon Nguyen
// input should be instruction

module leftshift2(clk, in, out);
  input clk;
  input [25:0] in;
  output [27:0] out;
  reg [27:0] out;
  
  always @(posedge clk)
  begin
    out = (in << 2);
  end
endmodule