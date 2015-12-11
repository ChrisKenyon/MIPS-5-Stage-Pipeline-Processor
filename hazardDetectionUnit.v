module hazard_detection_unit(D_instruction, X_rt, X_MemRead, hazardPCenable, hazardIFIDenable, hazardIDEXenable);
  input [31:0] D_instruction;
  input [4:0] X_rt;
  input X_MemRead;
  output reg hazardPCenable, hazardIFIDenable, hazardIDEXenable;

wire next_op;
wire next_rs;
wire next_rt;
assign next_op = D_instruction[31:26];
assign next_rs = D_instruction[25:21];
assign next_rt = D_instruction[20:16];

always@(D_instruction or X_rt or X_MemRead)
begin
  // if next operation is halt or
  // if memread and either next rs or next rt conflict with X_rt...
  if (next_op == 6'h3f ||
     (X_MemRead && 
    ((X_rt == next_rt) || (X_rt == next_rs))))
    begin
      // denotes a hazard
      hazardIDEXenable <= 1;
      hazardPCenable <= 0;
      hazardIFIDenable <= 0;      
    end
  else
    begin
      // denotes no hazard
      hazardIDEXenable <= 0;
      hazardPCenable <= 1;
      hazardIFIDenable <= 1;  
    end
end
endmodule
