library verilog;
use verilog.vl_types.all;
entity riscv_pip_27 is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        PCF             : out    vl_logic_vector(31 downto 0);
        InstrF          : in     vl_logic_vector(31 downto 0);
        MemWriteM       : out    vl_logic;
        ALUResultM      : out    vl_logic_vector(31 downto 0);
        WriteDataM      : out    vl_logic_vector(31 downto 0);
        ReadDataM       : in     vl_logic_vector(31 downto 0)
    );
end riscv_pip_27;
