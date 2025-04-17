library verilog;
use verilog.vl_types.all;
entity IF_ID is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        clear           : in     vl_logic;
        enable          : in     vl_logic;
        InstrF          : in     vl_logic_vector(31 downto 0);
        PCF             : in     vl_logic_vector(31 downto 0);
        PCPlus4F        : in     vl_logic_vector(31 downto 0);
        InstrD          : out    vl_logic_vector(31 downto 0);
        PCD             : out    vl_logic_vector(31 downto 0);
        PCPlus4D        : out    vl_logic_vector(31 downto 0)
    );
end IF_ID;
