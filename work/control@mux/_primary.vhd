library verilog;
use verilog.vl_types.all;
entity controlMux is
    port(
        \in\            : in     vl_logic_vector(9 downto 0);
        \select\        : in     vl_logic;
        \out\           : out    vl_logic_vector(9 downto 0)
    );
end controlMux;
