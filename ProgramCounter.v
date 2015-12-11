// Chris Kenyon and Brandon Nguyen

module ProgramCounter(en, in, clk, rst, out);
  
  input [31:0] in;
  input en, clk, rst;
  output reg [31:0] out;
  
  // handle output and reset case
  always @ (negedge clk or posedge rst) begin
    if (rst)
      out <= 'h3000;
    else if (en)
      out <= in;
    else 
      out <= 0;
  end
  
endmodule


