module datapath (
    input clk, reset,
    input [1:0] ResultSrcW,
    input PCJalSrcE, PCSrcE, ALUSrcAE, 
    input [1:0] ALUSrcBE,
    input RegWriteW,
    input [2:0] ImmSrcD,
    input [3:0] ALUControlE,
    output ZeroE,
    output SignE,
    output [31:0] PCF,
    input [31:0] InstrF,
    output [31:0] InstrD,
    output [31:0] ALUResultM, WriteDataM,
    input [31:0] ReadDataM,
    input [1:0] ForwardAE, ForwardBE,
    output [4:0] Rs1D, Rs2D, Rs1E, Rs2E,
    output [4:0] RdE, RdM, RdW,
    input StallD, StallF, FlushD, FlushE
);

    wire [31:0] PCD, PCE, ALUResultE, ALUResultW, ReadDataW;
	wire [31:0] PCNextF, PCPlus4F, PCPlus4D, PCPlus4E, PCPlus4M, PCPlus4W, PCTargetE, BranJumpTargetE;
	wire [31:0] WriteDataE;
	wire [31:0] ImmExtD, ImmExtE;
	wire [31:0] SrcAEfor, SrcAE, SrcBE, RD1D, RD2D, RD1E, RD2E;
	wire [31:0] ResultW;
	wire [4:0] RdD; // destination register address
    

    // Fetch Stage
    mux2 jal_r(
        .d0(PCTargetE),
        .d1(ALUResultE),
        .s(PCJalSrcE),
        .y(BranJumpTargetE)
    );
    mux2 pcmux(
        .d0(PCPlus4F),
        .d1(BranJumpTargetE),
        .s(PCSrcE),
        .y(PCNextF)
    );
    flopenr IF(
        .clk(clk),
        .reset(reset),
        .en(~StallF),
        .d(PCNextF),
        .q(PCF)
    );
    adder pcadd4(
        .a(PCF),
        .b(32'd4),
        .y(PCPlus4F)
    );
    
    // Instruction Fetch - Decode Pipeline Register	
    IF_ID pipreg0(
        .clk(clk),
        .reset(reset),
        .clear(FlushD),
        .enable(~StallD),
        .InstrF(InstrF),
        .PCF(PCF),
        .PCPlus4F(PCPlus4F),
        .InstrD(InstrD),
        .PCD(PCD),
        .PCPlus4D(PCPlus4D)
    );
    assign Rs1D = InstrD[19:15];
    assign Rs2D = InstrD[24:20];
    regfile rf(
        .clk(clk),
        .we3(RegWriteW),
        .a1(Rs1D),
        .a2(Rs2D),
        .a3(RdW),
        .wd3(ResultW),
        .rd1(RD1D),
        .rd2(RD2D)
    );
    assign RdD = InstrD[11:7]; // destination register address
    extend ext(
        .instr(InstrD[31:7]),
        .immsrc(ImmSrcD),
        .immext(ImmExtD)
    );

    // Decode - Execute Pipeline Register
    ID_IEx pipreg1(
        .clk(clk),
        .reset(reset),
        .clear(FlushE),
        .RD1D(RD1D),
        .RD2D(RD2D),
        .PCD(PCD),
        .Rs1D(Rs1D),
        .Rs2D(Rs2D),
        .RdD(RdD),
        .ImmExtD(ImmExtD),
        .PCPlus4D(PCPlus4D),
        .RD1E(RD1E),
        .RD2E(RD2E),
        .PCE(PCE),
        .Rs1E(Rs1E),
        .Rs2E(Rs2E),
        .RdE(RdE),
        .ImmExtE(ImmExtE),
        .PCPlus4E(PCPlus4E)
    );
    mux3 forwardMuxA(
        .d0(RD1E),
        .d1(ResultW),
        .d2(ALUResultM),
        .s(ForwardAE),
        .y(SrcAEfor)
    );
    mux2 srcamux(
        .d0(SrcAEfor),
        .d1(32'b0),
        .s(ALUSrcAE),
        .y(SrcAE)
    );
    mux3 forwardMuxB(
        .d0(RD2E),
        .d1(ResultW),
        .d2(ALUResultM),
        .s(ForwardBE),
        .y(WriteDataE)
    );
    mux3 srcbmux(
        .d0(WriteDataE),
        .d1(ImmExtE),
        .d2(PCTargetE),
        .s(ALUSrcBE),
        .y(SrcBE)
    );
    adder pcaddbranch(
        .a(PCE),
        .b(ImmExtE),
        .y(PCTargetE)
    );
    alu alu(
        .SrcA(SrcAE),
        .SrcB(SrcBE),
        .ALUControl(ALUControlE),
        .ALUResult(ALUResultE),
        .Zero(ZeroE),
        .Sign(SignE)
    );

    // Execute - Memory Access Pipeline Register
    IEx_IMem pipreg2(
        .clk(clk),
        .reset(reset),
        .ALUResultE(ALUResultE),
        .WriteDataE(WriteDataE),
        .RdE(RdE),
        .PCPlus4E(PCPlus4E),
        .ALUResultM(ALUResultM),
        .WriteDataM(WriteDataM),
        .RdM(RdM),
        .PCPlus4M(PCPlus4M)
    );

    // Memory - Register Write Back Stage
    IMem_IW pipreg3(
        .clk(clk),
        .reset(reset),
        .ALUResultM(ALUResultM),
        .ReadDataM(ReadDataM),
        .RdM(RdM),
        .PCPlus4M(PCPlus4M),
        .ALUResultW(ALUResultW),
        .ReadDataW(ReadDataW),
        .RdW(RdW),
        .PCPlus4W(PCPlus4W)
    );
    mux3 resultmux(
        .d0(ALUResultW),
        .d1(ReadDataW),
        .d2(PCPlus4W),
        .s(ResultSrcW),
        .y(ResultW)
    );
endmodule