library verilog;
use verilog.vl_types.all;
entity c_IEx_IM is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        RegWriteE       : in     vl_logic;
        MemWriteE       : in     vl_logic;
        ResultSrcE      : in     vl_logic_vector(1 downto 0);
        RegWriteM       : out    vl_logic;
        MemWriteM       : out    vl_logic;
        ResultSrcM      : out    vl_logic_vector(1 downto 0)
    );
end c_IEx_IM;
