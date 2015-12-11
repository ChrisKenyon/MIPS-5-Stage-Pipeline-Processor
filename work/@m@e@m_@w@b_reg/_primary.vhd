library verilog;
use verilog.vl_types.all;
entity MEM_WB_reg is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        M_ALUresult     : in     vl_logic_vector(31 downto 0);
        M_writeReg      : in     vl_logic_vector(4 downto 0);
        M_readData      : in     vl_logic_vector(31 downto 0);
        M_WB            : in     vl_logic_vector(1 downto 0);
        W_ALUresult     : out    vl_logic_vector(31 downto 0);
        W_writeReg      : out    vl_logic_vector(4 downto 0);
        W_readData      : out    vl_logic_vector(31 downto 0);
        W_WB            : out    vl_logic_vector(1 downto 0)
    );
end MEM_WB_reg;
