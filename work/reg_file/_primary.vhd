library verilog;
use verilog.vl_types.all;
entity reg_file is
    port(
        reset           : in     vl_logic;
        RegWrite        : in     vl_logic;
        clk             : in     vl_logic;
        readReg1        : in     vl_logic_vector(4 downto 0);
        readReg2        : in     vl_logic_vector(4 downto 0);
        writeReg        : in     vl_logic_vector(4 downto 0);
        writeData       : in     vl_logic_vector(31 downto 0);
        readData1       : out    vl_logic_vector(31 downto 0);
        readData2       : out    vl_logic_vector(31 downto 0)
    );
end reg_file;
