library verilog;
use verilog.vl_types.all;
entity hazard_detection_unit is
    port(
        D_instruction   : in     vl_logic_vector(31 downto 0);
        X_rt            : in     vl_logic_vector(4 downto 0);
        X_MemRead       : in     vl_logic;
        hazardPCenable  : out    vl_logic;
        hazardIFIDenable: out    vl_logic;
        hazardIDEXenable: out    vl_logic
    );
end hazard_detection_unit;
