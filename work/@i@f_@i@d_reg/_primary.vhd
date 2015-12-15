library verilog;
use verilog.vl_types.all;
entity IF_ID_reg is
    port(
        en              : in     vl_logic;
        flush           : in     vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        instr           : in     vl_logic_vector(31 downto 0);
        D_instr         : out    vl_logic_vector(31 downto 0);
        PCPlusFour      : in     vl_logic_vector(31 downto 0);
        D_PCPlusFour    : out    vl_logic_vector(31 downto 0)
    );
end IF_ID_reg;
