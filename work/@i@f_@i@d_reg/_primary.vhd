library verilog;
use verilog.vl_types.all;
entity IF_ID_reg is
    port(
        en              : in     vl_logic;
        instr           : in     vl_logic_vector(31 downto 0);
        pcIn            : in     vl_logic_vector(31 downto 0);
        adder_pc        : out    vl_logic_vector(31 downto 0);
        \out\           : out    vl_logic_vector(31 downto 0)
    );
end IF_ID_reg;
