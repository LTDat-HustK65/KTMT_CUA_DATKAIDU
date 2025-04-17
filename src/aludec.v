module aludec (
    input opd5,
    input [2:0] funct3,
    input funct7b5,
    input [1:0] ALUOP,
    output reg [3:0] ALUControl
);
    wire RtypeSub;
    assign RtypeSub = funct7b5 & opd5; // TRUE for R-type sub instructions
    always @(*) begin
        case (ALUOP)
            2'b00: ALUControl = 4'b0000; // addi, lw, sw, beq, jalr
            2'b01: ALUControl = 4'b0001; // slti, sltiu
            default: case (funct3)
                3'b000: if (RtypeSub) ALUControl = 4'b0001; // sub
                        else ALUControl = 4'b0000; // add, addi
                3'b001: ALUControl = 4'b0100; // sll, slli
                3'b010: ALUControl = 4'b0101; // slt, slti
                3'b011: ALUControl = 4'b1000; // sltu, sltiu
                3'b100: ALUControl = 4'b0100; // xor, xori
                3'b101: if (~funct7b5) ALUControl = 4'b0111; // srl, srli
                        else ALUControl = 4'b1111; // sra, srai
                3'b110: ALUControl = 4'b0011; // or, ori
                3'b111: ALUControl = 4'b0010; // and, andi
                default: ALUControl = 4'bxxxx; // undefined
            endcase
        endcase
    end
endmodule