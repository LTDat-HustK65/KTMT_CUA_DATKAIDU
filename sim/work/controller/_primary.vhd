library verilog;
use verilog.vl_types.all;
entity controller is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        op              : in     vl_logic_vector(6 downto 0);
        funct3          : in     vl_logic_vector(2 downto 0);
        funct7b5        : in     vl_logic;
        ZeroE           : in     vl_logic;
        SignE           : in     vl_logic;
        FlushE          : in     vl_logic;
        ResultSrcE0     : out    vl_logic;
        ResultSrcW      : out    vl_logic_vector(1 downto 0);
        MemWriteM       : out    vl_logic;
        RegWriteM       : out    vl_logic;
        RegWriteW       : out    vl_logic;
        PCJalSrcE       : out    vl_logic;
        PCSrcE          : out    vl_logic;
        ALUSrcAE        : out    vl_logic;
        ALUSrcBE        : out    vl_logic_vector(1 downto 0);
        ImmSrcD         : out    vl_logic_vector(2 downto 0);
        ALUControlE     : out    vl_logic_vector(3 downto 0)
    );
end controller;
