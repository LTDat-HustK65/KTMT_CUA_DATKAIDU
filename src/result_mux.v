module result_mux (
    input [31:0] ALUResultW, ReadDataW, PCPlusW,
    input [1:0] ResultSrcW,
    output [31:0] ResultW
);
    assign ResultW = ResultSrcW[1] ? PCPlusW : (ResultSrcW[0] ? ReadDataW : ALUResultW);
endmodule