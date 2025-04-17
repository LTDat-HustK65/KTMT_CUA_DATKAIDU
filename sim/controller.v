module controller (
    input clk, reset,
    input [6:0] op,
    input [2:0] funct3,
    input funct7b5,
    input ZeroE, SignE, FlushE,

    output ResultSrcE0,
    output [1:0] ResultSrcW,
    output MemWriteM, RegWriteM, RegWriteW,
    output PCJalSrcE, PCSrcE, ALUSrcAE,
    output [1:0] ALUSrcBE,
    output [2:0] ImmSrcD,
    output [3:0] ALUControlE
);
    wire [1:0] ALUOpD;
    wire [1:0] ResultSrcD, ResultSrcE, ResultSrcM;
    wire [3:0] ALUControlD;
    wire BranchD, MemWriteD, JumpD, BranchE, MemWriteE, JumpE;
    wire ZeroOp, ALUSrcAD, RegWriteD, RegWriteE;
    wire [1:0] ALUSrcBD;
    wire SignOp;
    wire BranchOp;

    maindec md(
        .op(op),
        .ResultSrc(ResultSrcD),
        .MemWrite(MemWriteD),
        .Branch(BranchD),
        .ALUSrcA(ALUSrcAD),
        .ALUSrcB(ALUSrcBD),
        .RegWrite(RegWriteD),
        .Jump(JumpD),
        .ImmSrc(ImmSrcD),
        .ALUOp(ALUOpD)
    );

    aludec ad(
        .opd5(op[5]),
        .funct3(funct3),
        .funct7b5(funct7b5),
        .ALUOP(ALUOpD),
        .ALUControl(ALUControlD)
    );

    c_ID_IEx c_pipreg0(
        .clk(clk),
        .reset(reset),
        .clear(FlushE),
        .RegWriteD(RegWriteD),
        .MemWriteD(MemWriteD),
        .JumpD(JumpD),
        .BranchD(BranchD),
        .ALUSrcAD(ALUSrcAD),
        .ALUSrcBD(ALUSrcBD),
        .ResultSrcD(ResultSrcD),
        .ALUControlD(ALUControlD),
        
        .RegWriteE(RegWriteE),
        .MemWriteE(MemWriteE),
        .JumpE(JumpE),
        .BranchE(BranchE),
        .ALUSrcAE(ALUSrcAE),
        .ALUSrcBE(ALUSrcBE),
        .ResultSrcE(ResultSrcE),
        .ALUControlE(ALUControlE)
    );

    assign ResultSrcE0 = ResultSrcE[0];

    c_IEx_IM c_pipreg1(
        .clk(clk),
        .reset(reset),
        .RegWriteE(RegWriteE),
        .MemWriteE(MemWriteE),
        .ResultSrcE(ResultSrcE),
        .RegWriteM(RegWriteM),
        .MemWriteM(MemWriteM),
        .ResultSrcM(ResultSrcM)
    );

    c_IM_IW c_pipreg2(
        .clk(clk),
        .reset(reset),
        .RegWriteM(RegWriteM),
        .ResultSrcM(ResultSrcM),
        .RegWriteW(RegWriteW),
        .ResultSrcW(ResultSrcW)
    );

    assign ZeroOP = ZeroE ^ funct3[0];
    assign SignOp = SignE ^ funct3[0];
    
    assign BranchOp = funct3[2] ? SignOp : ZeroOp;
    assign PCSrcE = (BranchE & BranchOp) | JumpE;
    assign PCJalSrcE = (op == 7'b1101111) ? 1 : 0; // jal instruction
endmodule