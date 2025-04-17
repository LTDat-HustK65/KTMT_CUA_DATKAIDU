library verilog;
use verilog.vl_types.all;
entity IEx_IMem is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        ALUResultE      : in     vl_logic_vector(31 downto 0);
        WriteDataE      : in     vl_logic_vector(31 downto 0);
        RdE             : in     vl_logic_vector(4 downto 0);
        PCPlus4E        : in     vl_logic_vector(31 downto 0);
        ALUResultM      : out    vl_logic_vector(31 downto 0);
        WriteDataM      : out    vl_logic_vector(31 downto 0);
        RdM             : out    vl_logic_vector(4 downto 0);
        PCPlus4M        : out    vl_logic_vector(31 downto 0)
    );
end IEx_IMem;
