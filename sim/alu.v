module alu (
    input [31:0] SrcA,
    input [31:0] SrcB,
    input [3:0] ALUControl,
    output reg [31:0] ALUResult,
    output Zero,
    output Sign
);
    wire [31:0] Sum;
    wire Overflow;

    assign Sum = SrcA + (ALUControl[0] ? ~SrcB : SrcB) + ALUControl[0];
    assign Overflow = ~(ALUControl[0] ^ SrcB[31] ^ SrcA[31]) & (SrcA[31] ^ Sum[31]) & (~ALUControl[0]);

    assign Zero = ~(|ALUResult);
    assign Sign = ALUResult[31];

    always @(*) begin
        case (ALUControl)
            4'b000x: ALUResult = Sum; // sum or difference
            4'b0010: ALUResult = SrcA & SrcB; // and
            4'b0011: ALUResult = SrcA | SrcB; // or
            4'b0100: ALUResult = SrcA << SrcB; // sll, slli
            4'b0101: ALUResult = {{30{1'b0}}, Overflow ^ Sum[31]}; // slt, slti
            4'b0110: ALUResult = SrcA ^ SrcB; // xor
            4'b0111: ALUResult = SrcA >> SrcB; // srl, srli
            4'b1000: ALUResult = ($unsigned(SrcA) < $unsigned(SrcB));
            4'b1111: ALUResult = SrcA >>> SrcB; // shift arithmetic
            default: ALUResult = 32'bx;
        endcase
    end
endmodule