// Chris Kenyon and Brandon Nguyen
// From solutions

module reg_file(
        input reset,
        input RegWrite, 
				input clk,
				input [4:0] readReg1, 
				input [4:0] readReg2, 
				input [4:0] writeReg,
				input [31:0] writeData,
				output reg [31:0] readData1, 
				output reg [31:0] readData2
);

reg [31:0] regFile [31:0];
integer i;

// added reset to hw6 solution file to clear reg file
always@(reset)begin
  for (i=0; i<32; i=i+1) 
    regFile[i] = 32'b0;
end

always@(readReg1 or readReg2 or regFile)
begin
	 readData1 <= regFile[readReg1];
	 readData2 <= regFile[readReg2];
end

always@(negedge clk) 
begin
	if(RegWrite)
		regFile[writeReg] <= writeData;
end

endmodule
