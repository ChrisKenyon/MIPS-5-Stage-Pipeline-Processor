library verilog;
use verilog.vl_types.all;
entity EX_MEM_reg is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        X_ALUresult     : in     vl_logic_vector(31 downto 0);
        X_writeData     : in     vl_logic_vector(31 downto 0);
        X_writeReg      : in     vl_logic_vector(4 downto 0);
        X_WB            : in     vl_logic_vector(1 downto 0);
        X_M             : in     vl_logic_vector(2 downto 0);
        M_ALUresult     : out    vl_logic_vector(31 downto 0);
        M_writeData     : out    vl_logic_vector(31 downto 0);
        M_writeReg      : out    vl_logic_vector(4 downto 0);
        M_WB            : out    vl_logic_vector(1 downto 0);
        M_M             : out    vl_logic_vector(2 downto 0)
    );
end EX_MEM_reg;
