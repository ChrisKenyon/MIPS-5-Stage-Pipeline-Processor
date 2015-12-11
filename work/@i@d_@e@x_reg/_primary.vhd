library verilog;
use verilog.vl_types.all;
entity ID_EX_reg is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        hazardIDEXenable: in     vl_logic;
        D_PCplusFour    : in     vl_logic_vector(31 downto 0);
        D_signExtend    : in     vl_logic_vector(31 downto 0);
        D_rs            : in     vl_logic_vector(4 downto 0);
        D_rt            : in     vl_logic_vector(4 downto 0);
        D_rd            : in     vl_logic_vector(4 downto 0);
        D_readData1     : in     vl_logic_vector(31 downto 0);
        D_readData2     : in     vl_logic_vector(31 downto 0);
        D_ALUop         : in     vl_logic_vector(1 downto 0);
        D_RegWrite      : in     vl_logic;
        D_MemtoReg      : in     vl_logic;
        D_Branch        : in     vl_logic;
        D_MemRead       : in     vl_logic;
        D_MemWrite      : in     vl_logic;
        D_RegDst        : in     vl_logic;
        D_ALUsrc        : in     vl_logic;
        D_zero          : in     vl_logic;
        D_funct         : in     vl_logic_vector(5 downto 0);
        X_PCplusFour    : out    vl_logic_vector(31 downto 0);
        X_signExtend    : out    vl_logic_vector(31 downto 0);
        X_rs            : out    vl_logic_vector(4 downto 0);
        X_rt            : out    vl_logic_vector(4 downto 0);
        X_rd            : out    vl_logic_vector(4 downto 0);
        X_readData1     : out    vl_logic_vector(31 downto 0);
        X_readData2     : out    vl_logic_vector(31 downto 0);
        X_WB            : out    vl_logic_vector(1 downto 0);
        X_M             : out    vl_logic_vector(2 downto 0);
        X_EX            : out    vl_logic_vector(3 downto 0);
        X_zero          : out    vl_logic;
        X_funct         : out    vl_logic_vector(5 downto 0)
    );
end ID_EX_reg;
