// Chris Kenyon and Brandon Nguyen
// Sign Extender

module signextender(in,out);
  input[15:0] in;
  output [31:0] out;
  reg [31:0] out;
  always@(in) begin
    // 16 of in[15] to extend the sign
    // plus the rest of in set to out
    out <= { {16{in[15]}}, in[15:0]};
  end
endmodule