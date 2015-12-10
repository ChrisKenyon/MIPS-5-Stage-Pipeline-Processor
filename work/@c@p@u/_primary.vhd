library verilog;
use verilog.vl_types.all;
entity CPU is
    port(
        reset           : in     vl_logic;
        PC              : out    vl_logic_vector(31 downto 0);
        instruction     : in     vl_logic_vector(31 downto 0);
        dataAddress     : out    vl_logic_vector(31 downto 0);
        dataIn          : in     vl_logic_vector(31 downto 0);
        MemRead         : out    vl_logic;
        MemWrite        : out    vl_logic;
        dataOut         : in     vl_logic_vector(31 downto 0);
        clk             : in     vl_logic
    );
end CPU;
