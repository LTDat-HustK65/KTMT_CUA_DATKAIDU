library verilog;
use verilog.vl_types.all;
entity maindec is
    port(
        op              : in     vl_logic_vector(6 downto 0);
        ResultSrc       : out    vl_logic_vector(1 downto 0);
        MemWrite        : out    vl_logic;
        Branch          : out    vl_logic;
        ALUSrcA         : out    vl_logic;
        ALUSrcB         : out    vl_logic_vector(1 downto 0);
        RegWrite        : out    vl_logic;
        Jump            : out    vl_logic;
        ImmSrc          : out    vl_logic_vector(2 downto 0);
        ALUOp           : out    vl_logic_vector(1 downto 0)
    );
end maindec;
