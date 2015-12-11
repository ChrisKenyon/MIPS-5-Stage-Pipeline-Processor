library verilog;
use verilog.vl_types.all;
entity forwarding_unit is
    port(
        rst             : in     vl_logic;
        D_rs            : in     vl_logic_vector(4 downto 0);
        D_rt            : in     vl_logic_vector(4 downto 0);
        X_rs            : in     vl_logic_vector(4 downto 0);
        X_rt            : in     vl_logic_vector(4 downto 0);
        M_writeReg      : in     vl_logic_vector(4 downto 0);
        W_writeReg      : in     vl_logic_vector(4 downto 0);
        M_WB            : in     vl_logic_vector(1 downto 0);
        W_WB            : in     vl_logic_vector(1 downto 0);
        fwdA_D          : out    vl_logic_vector(1 downto 0);
        fwdB_D          : out    vl_logic_vector(1 downto 0);
        fwdA_X          : out    vl_logic_vector(1 downto 0);
        fwdB_X          : out    vl_logic_vector(1 downto 0)
    );
end forwarding_unit;
