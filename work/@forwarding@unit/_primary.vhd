library verilog;
use verilog.vl_types.all;
entity ForwardingUnit is
    port(
        rst             : in     vl_logic;
        D_rs            : in     vl_logic_vector(4 downto 0);
        D_rt            : in     vl_logic_vector(4 downto 0);
        X_rd            : in     vl_logic_vector(4 downto 0);
        M_rd            : in     vl_logic_vector(4 downto 0);
        X_regWrite      : in     vl_logic;
        M_regWrite      : in     vl_logic;
        fwd1            : out    vl_logic_vector(1 downto 0);
        fwd2            : out    vl_logic_vector(1 downto 0)
    );
end ForwardingUnit;
