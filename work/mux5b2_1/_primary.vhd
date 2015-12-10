library verilog;
use verilog.vl_types.all;
entity mux5b2_1 is
    port(
        a               : in     vl_logic_vector(4 downto 0);
        b               : in     vl_logic_vector(4 downto 0);
        \select\        : in     vl_logic;
        \out\           : out    vl_logic_vector(4 downto 0)
    );
end mux5b2_1;
