module c_IM_IW (
    input clk, reset,
    input RegWriteM,
    input [1:0] ResultSrcM,
    output reg RegWriteW,
    output reg [1:0] ResultSrcW
);
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            RegWriteW <= 0;
            ResultSrcW <= 0;
        end else begin
            RegWriteW <= RegWriteM;
            ResultSrcW <= ResultSrcM;
        end
    end
endmodule