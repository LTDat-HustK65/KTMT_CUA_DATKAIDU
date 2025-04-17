library verilog;
use verilog.vl_types.all;
entity aludec is
    port(
        opd5            : in     vl_logic;
        funct3          : in     vl_logic_vector(2 downto 0);
        funct7b5        : in     vl_logic;
        ALUOP           : in     vl_logic_vector(1 downto 0);
        ALUControl      : out    vl_logic_vector(3 downto 0)
    );
end aludec;
