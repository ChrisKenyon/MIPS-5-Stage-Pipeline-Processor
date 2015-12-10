// Chris Kenyon and Brandon Nguyen
// input should be the sign extended output

module leftshift2_32b(in, out);
  input [31:0] in;
  output reg[31:0] out;
  
  always @(in)
  	out = (in << 2); 
endmodule
