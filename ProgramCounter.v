// Chris Kenyon and Brandon Nguyen

module ProgramCounter(in, clk, rst, out);
  
  input [31:0] in;
  input clk, rst;
  output reg [31:0] out;
  
  // handle output and reset case
  always @ (negedge clk or posedge rst) begin
    if (rst)
      out <= 'h3000;
    else
      out <= in;
  end
  
endmodule


