module pc_mux (
    input [31:0] PCPlus4F, JumpTargetE,
    input PCSrcE,
    output [31:0] PCNextF
);
    assign PCNextF = PCSrcE ? JumpTargetE : PCPlus4F;
endmodule