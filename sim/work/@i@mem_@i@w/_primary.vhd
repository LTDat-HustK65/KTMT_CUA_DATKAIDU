library verilog;
use verilog.vl_types.all;
entity IMem_IW is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        ALUResultM      : in     vl_logic_vector(31 downto 0);
        ReadDataM       : in     vl_logic_vector(31 downto 0);
        RdM             : in     vl_logic_vector(4 downto 0);
        PCPlus4M        : in     vl_logic_vector(31 downto 0);
        ALUResultW      : out    vl_logic_vector(31 downto 0);
        ReadDataW       : out    vl_logic_vector(31 downto 0);
        RdW             : out    vl_logic_vector(4 downto 0);
        PCPlus4W        : out    vl_logic_vector(31 downto 0)
    );
end IMem_IW;
