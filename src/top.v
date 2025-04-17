module top (
    input clk, reset, 
    output [31:0] WriteDataM,  DataAdrM, 
    output MemWriteM
);
    wire [31:0] PCF, InstrF, ReadDataM;

    riscv_pip_27 rv(
        .clk(clk),
        .reset(reset),
        .PCF(PCF),
        .InstrF(InstrF),
        .MemWriteM(MemWriteM),
        .ALUResultM(DataAdrM),
        .WriteDataM(WriteDataM),
        .ReadDataM(ReadDataM)
    );

    imem imem(
        .a(PCF),
        .rd(InstrF)
    );

    dmem dmem(
        .clk(clk),
        .we(MemWriteM),
        .a(DataAdrM),
        .wd(WriteDataM),
        .rd(ReadDataM)
    );
endmodule