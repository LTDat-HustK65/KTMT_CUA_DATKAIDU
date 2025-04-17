library verilog;
use verilog.vl_types.all;
entity datapath is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        ResultSrcW      : in     vl_logic_vector(1 downto 0);
        PCJalSrcE       : in     vl_logic;
        PCSrcE          : in     vl_logic;
        ALUSrcAE        : in     vl_logic;
        ALUSrcBE        : in     vl_logic_vector(1 downto 0);
        RegWriteW       : in     vl_logic;
        ImmSrcD         : in     vl_logic_vector(2 downto 0);
        ALUControlE     : in     vl_logic_vector(3 downto 0);
        ZeroE           : out    vl_logic;
        SignE           : out    vl_logic;
        PCF             : out    vl_logic_vector(31 downto 0);
        InstrF          : in     vl_logic_vector(31 downto 0);
        InstrD          : out    vl_logic_vector(31 downto 0);
        ALUResultM      : out    vl_logic_vector(31 downto 0);
        WriteDataM      : out    vl_logic_vector(31 downto 0);
        ReadDataM       : in     vl_logic_vector(31 downto 0);
        ForwardAE       : in     vl_logic_vector(1 downto 0);
        ForwardBE       : in     vl_logic_vector(1 downto 0);
        Rs1D            : out    vl_logic_vector(4 downto 0);
        Rs2D            : out    vl_logic_vector(4 downto 0);
        Rs1E            : out    vl_logic_vector(4 downto 0);
        Rs2E            : out    vl_logic_vector(4 downto 0);
        RdE             : out    vl_logic_vector(4 downto 0);
        RdM             : out    vl_logic_vector(4 downto 0);
        RdW             : out    vl_logic_vector(4 downto 0);
        StallD          : in     vl_logic;
        StallF          : in     vl_logic;
        FlushD          : in     vl_logic;
        FlushE          : in     vl_logic
    );
end datapath;
