library verilog;
use verilog.vl_types.all;
entity leftshift2 is
    port(
        clk             : in     vl_logic;
        \in\            : in     vl_logic_vector(25 downto 0);
        \out\           : out    vl_logic_vector(27 downto 0)
    );
end leftshift2;
