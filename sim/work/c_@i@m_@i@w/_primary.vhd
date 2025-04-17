library verilog;
use verilog.vl_types.all;
entity c_IM_IW is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        RegWriteM       : in     vl_logic;
        ResultSrcM      : in     vl_logic_vector(1 downto 0);
        RegWriteW       : out    vl_logic;
        ResultSrcW      : out    vl_logic_vector(1 downto 0)
    );
end c_IM_IW;
