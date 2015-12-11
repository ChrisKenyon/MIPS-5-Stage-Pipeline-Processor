library verilog;
use verilog.vl_types.all;
entity mux32b4_1 is
    port(
        zero            : in     vl_logic_vector(31 downto 0);
        one             : in     vl_logic_vector(31 downto 0);
        two             : in     vl_logic_vector(31 downto 0);
        three           : in     vl_logic_vector(31 downto 0);
        \select\        : in     vl_logic_vector(1 downto 0);
        \out\           : out    vl_logic_vector(31 downto 0)
    );
end mux32b4_1;
