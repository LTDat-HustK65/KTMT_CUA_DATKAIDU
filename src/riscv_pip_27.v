module riscv_pip_27(
    input clk, reset,
	output [31:0] PCF,
	input [31:0] InstrF,
	output MemWriteM,
	output [31:0] ALUResultM, WriteDataM,
	input [31:0] ReadDataM
);
	
    wire ALUSrcAE, RegWriteM, RegWriteW, ZeroE, SignE, PCJalSrcE, PCSrcE;
    wire [1:0] ALUSrcBE;
    wire StallD, StallF, FlushD, FlushE, ResultSrcE0;
    wire [1:0] ResultSrcW; 
    wire [2:0] ImmSrcD;
    wire [3:0] ALUControlE;
    wire [31:0] InstrD;
    wire [4:0] Rs1D, Rs2D, Rs1E, Rs2E;
    wire [4:0] RdE, RdM, RdW;
    wire [1:0] ForwardAE, ForwardBE;

    controller c(
        .clk(clk),
        .reset(reset),
        .op(InstrD[6:0]),
        .funct3(InstrD[14:12]),
        .funct7b5(InstrD[30]),
        .ZeroE(ZeroE),
        .SignE(SignE),
        .FlushE(FlushE),
        .ResultSrcE0(ResultSrcE0),
        .ResultSrcW(ResultSrcW),
        .MemWriteM(MemWriteM),
        .PCJalSrcE(PCJalSrcE),
        .PCSrcE(PCSrcE),
        .ALUSrcAE(ALUSrcAE),
        .ALUSrcBE(ALUSrcBE),
        .RegWriteM(RegWriteM),
        .RegWriteW(RegWriteW),
        .ImmSrcD(ImmSrcD),
        .ALUControlE(ALUControlE)
    );

    hazardunit h (
        .Rs1D(Rs1D),
        .Rs2D(Rs2D),
        .Rs1E(Rs1E),
        .Rs2E(Rs2E),
        .RdE(RdE),
        .RdM(RdM),
        .RdW(RdW),
        .RegWriteM(RegWriteM),
        .RegWriteW(RegWriteW),
        .ResultSrcE0(ResultSrcE0),
        .PCSrcE(PCSrcE),
        .ForwardAE(ForwardAE),
        .ForwardBE(ForwardBE),
        .StallD(StallD),
        .StallF(StallF),
        .FlushD(FlushD),
        .FlushE(FlushE)
    );

    datapath dp(
        .clk(clk),
        .reset(reset),
        .ResultSrcW(ResultSrcW),
        .PCJalSrcE(PCJalSrcE),
        .PCSrcE(PCSrcE),
        .ALUSrcAE(ALUSrcAE),
        .ALUSrcBE(ALUSrcBE),
        .RegWriteW(RegWriteW),
        .ImmSrcD(ImmSrcD),
        .ALUControlE(ALUControlE),
        .ZeroE(ZeroE),
        .SignE(SignE),
        .PCF(PCF),
        .InstrF(InstrF),
        .InstrD(InstrD),
        .ALUResultM(ALUResultM),
        .WriteDataM(WriteDataM),
        .ReadDataM(ReadDataM),
        .ForwardAE(ForwardAE),
        .ForwardBE(ForwardBE),
        .Rs1D(Rs1D),
        .Rs2D(Rs2D),
        .Rs1E(Rs1E),
        .Rs2E(Rs2E),
        .RdE(RdE),
        .RdM(RdM),
        .RdW(RdW),
        .StallD(StallD),
        .StallF(StallF),
        .FlushD(FlushD),
        .FlushE(FlushE)
    );

endmodule