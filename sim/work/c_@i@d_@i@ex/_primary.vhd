library verilog;
use verilog.vl_types.all;
entity c_ID_IEx is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        clear           : in     vl_logic;
        RegWriteD       : in     vl_logic;
        MemWriteD       : in     vl_logic;
        ALUSrcAD        : in     vl_logic;
        BranchD         : in     vl_logic;
        JumpD           : in     vl_logic;
        ALUSrcBD        : in     vl_logic_vector(1 downto 0);
        ResultSrcD      : in     vl_logic_vector(1 downto 0);
        ALUControlD     : in     vl_logic_vector(3 downto 0);
        RegWriteE       : out    vl_logic;
        MemWriteE       : out    vl_logic;
        ALUSrcAE        : out    vl_logic;
        BranchE         : out    vl_logic;
        JumpE           : out    vl_logic;
        ALUSrcBE        : out    vl_logic_vector(1 downto 0);
        ResultSrcE      : out    vl_logic_vector(1 downto 0);
        ALUControlE     : out    vl_logic_vector(3 downto 0)
    );
end c_ID_IEx;
