library verilog;
use verilog.vl_types.all;
entity ID_IEx is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        clear           : in     vl_logic;
        RD1D            : in     vl_logic_vector(31 downto 0);
        RD2D            : in     vl_logic_vector(31 downto 0);
        PCD             : in     vl_logic_vector(31 downto 0);
        Rs1D            : in     vl_logic_vector(4 downto 0);
        Rs2D            : in     vl_logic_vector(4 downto 0);
        RdD             : in     vl_logic_vector(4 downto 0);
        ImmExtD         : in     vl_logic_vector(31 downto 0);
        PCPlus4D        : in     vl_logic_vector(31 downto 0);
        RD1E            : out    vl_logic_vector(31 downto 0);
        RD2E            : out    vl_logic_vector(31 downto 0);
        PCE             : out    vl_logic_vector(31 downto 0);
        Rs1E            : out    vl_logic_vector(4 downto 0);
        Rs2E            : out    vl_logic_vector(4 downto 0);
        RdE             : out    vl_logic_vector(4 downto 0);
        ImmExtE         : out    vl_logic_vector(31 downto 0);
        PCPlus4E        : out    vl_logic_vector(31 downto 0)
    );
end ID_IEx;
