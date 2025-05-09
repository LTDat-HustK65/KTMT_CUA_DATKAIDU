library verilog;
use verilog.vl_types.all;
entity top is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        WriteDataM      : out    vl_logic_vector(31 downto 0);
        DataAdrM        : out    vl_logic_vector(31 downto 0);
        MemWriteM       : out    vl_logic
    );
end top;
