Advanced Project EECE 3324 Computer Architecture
Chris Kenyon and Brandon Nguyen


This simulation should be run from the project file. The project files should be altered first to reference appropriate file paths rather than the absolute paths that are present from our local machines.

Modules to be compiled are contained in files:
 alu.v
 aluCtrl.v
 controlMux.v
 CPU.v
 ctrlUnit.v
 EX_MEM_reg.v
 forwardingUnit.v
 hazardDetectionUnit.v
 ID_EX_reg.v
 IF_ID_reg.v
 leftshift2.v
 leftshift2_32b.v
 MEM_WB_reg.v
 memory.v
 mux2_1.v
 mux5b2_1.v
 mux32b2_1.v
 mux32b4_1.v
 ProgramCounter.v
 reg_32.v
 reg_file.v
 signextender.v
 * note that some of the naming conventions are different as we made modules separately

The testbench to be run is CPU_tb.v. Set the simulation to run for 3.6 us, as the 179 instructions should run for 
3580ns before reaching the HLT instruction which will stop ($stop call). If you continue the execution to the 
end (3600ns) then you will see that the system has been completely flushed.

Setting reset to 1 at the end is most likely not the desired behavior in a realistic use of this datapath, it would 
more likely spend a couple more cycles to flush out the system without resetting everything, which resets all the 
registers and control signals, but also clears the register file, which would may not be desired unless everything 
was saved to memory.

Expected register results:

R0: 0x00000000 		R1: 0x00000000
R2: 0x00000000 		R3: 0x00000000
R4: 0x00000000 		R5: 0x00000000
R6: 0x00000000 		R7: 0x00000000
R8: 0x00000028 		R9: 0x00000000
R10: 0xfffffff0 	R11: 0x00000015
R12: 0x00000015 	R13: 0x00000001
R14: 0x00000000 	R15: 0x00000000
R16: 0x00000000 	R17: 0x00000009
R18: 0x00000005 	R19: 0x00000009
R20: 0x00000000 	R21: 0x00000000
R22: 0x00000000 	R23: 0x00000000
R24: 0x00000000 	R25: 0x00000000
R26: 0x00000000 	R27: 0x00000000
R28: 0x00000000 	R29: 0x00000000
R30: 0x00000000 	R31: 0x00000000

As displayed:

# --------------------CYCLE        179--------------------
# 
# $0:          0	$at:          0
# $t0:         40	$t1:          0
# $t2: 4294967280	$t3:         21
# $t4:         21	$t5:          1
# $t6:          0	$t7:          0
# $s0:          0	$s1:          9
# $s2:          5	$s3:          9
# Minimum:         -16 	 Maximum:          21
# Break in Module CPU at C:/Users/cjken/Dropbox/Documents/School/Computer Architecture/AdvancedProject/CPU.v line 14
run -continue
# 
# 
# --------------------CYCLE        180--------------------
# 
# $0:          0	$at:          0
# $t0:          0	$t1:          0
# $t2:          0	$t3:          0
# $t4:          0	$t5:          0
# $t6:          0	$t7:          0
# $s0:          0	$s1:          0
# $s2:          0	$s3:          0
# Minimum:           0 	 Maximum:           0

