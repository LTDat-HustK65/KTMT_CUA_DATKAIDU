module imem(
    input [31:0] a,
    output [31:0] rd
);
				
reg [7:0] RAM[128:0]; // 128 x 8 = byte addressable memory with 128 locations

assign rd = {RAM[a + 3], RAM[a + 2], RAM[a + 1], RAM[a + 0]};

// follow little-endian: LSB corresponds to lowest order memory address
initial 
	begin
		// Instruction: 00f00093
		RAM[0] = 8'h93;
		RAM[1] = 8'h00;
		RAM[2] = 8'hf0;
		RAM[3] = 8'h00;
		// Instruction: 01600113
		RAM[4] = 8'h13;
		RAM[5] = 8'h01;
		RAM[6] = 8'h60;
		RAM[7] = 8'h01;
		// Instruction: 002081b3
		RAM[8] = 8'hb3;
		RAM[9] = 8'h81;
		RAM[10] = 8'h20;
		RAM[11] = 8'h00;
		// Instruction: 0021e233
		RAM[12] = 8'h33;
		RAM[13] = 8'he2;
		RAM[14] = 8'h21;
		RAM[15] = 8'h00;
		// Instruction: 0041c2b3
		RAM[16] = 8'hb3;
		RAM[17] = 8'hc2;
		RAM[18] = 8'h41;
		RAM[19] = 8'h00;
		// Instruction: 00428333
		RAM[20] = 8'h33;
		RAM[21] = 8'h83;
		RAM[22] = 8'h42;
		RAM[23] = 8'h00;
		// Instruction: 02628863
		RAM[24] = 8'h63;
		RAM[25] = 8'h88;
		RAM[26] = 8'h62;
		RAM[27] = 8'h02;
		// Instruction: 0041a233
		RAM[28] = 8'h33;
		RAM[29] = 8'ha2;
		RAM[30] = 8'h41;
		RAM[31] = 8'h00;
		// Instruction: 00020463
		RAM[32] = 8'h63;
		RAM[33] = 8'h04;
		RAM[34] = 8'h02;
		RAM[35] = 8'h00;
		// Instruction: 00000313
		RAM[36] = 8'h13;
		RAM[37] = 8'h03;
		RAM[38] = 8'h00;
		RAM[39] = 8'h00;
		// Instruction: 0032a233
		RAM[40] = 8'h33;
		RAM[41] = 8'ha2;
		RAM[42] = 8'h32;
		RAM[43] = 8'h00;
		// Instruction: 00520333
		RAM[44] = 8'h33;
		RAM[45] = 8'h03;
		RAM[46] = 8'h52;
		RAM[47] = 8'h00;
		// Instruction: 40118133
		RAM[48] = 8'h33;
		RAM[49] = 8'h81;
		RAM[50] = 8'h11;
		RAM[51] = 8'h40;
		// Instruction: 0411aa23
		RAM[52] = 8'h23;
		RAM[53] = 8'haa;
		RAM[54] = 8'h11;
		RAM[55] = 8'h04;
		// Instruction: 0541a083
		RAM[56] = 8'h83;
		RAM[57] = 8'ha0;
		RAM[58] = 8'h41;
		RAM[59] = 8'h05;
		// Instruction: 00008093
		RAM[60] = 8'h93;
		RAM[61] = 8'h80;
		RAM[62] = 8'h00;
		RAM[63] = 8'h00;
		// Instruction: 003103b3
		RAM[64] = 8'hb3;
		RAM[65] = 8'h03;
		RAM[66] = 8'h31;
		RAM[67] = 8'h00;
		// Instruction: 004001ef
		RAM[68] = 8'hef;
		RAM[69] = 8'h01;
		RAM[70] = 8'h40;
		RAM[71] = 8'h00;
		// Instruction: 00910133
		RAM[72] = 8'h33;
		RAM[73] = 8'h01;
		RAM[74] = 8'h91;
		RAM[75] = 8'h00;
		// Instruction: 00100213
		RAM[76] = 8'h13;
		RAM[77] = 8'h02;
		RAM[78] = 8'h10;
		RAM[79] = 8'h00;
		// Instruction: 00108063
		RAM[80] = 8'h63;
		RAM[81] = 8'h80;
		RAM[82] = 8'h10;
		RAM[83] = 8'h00;






	end



	//$readmemh("riscvtest.txt",RAM);
	//assign rd = RAM[a[31:2]]; // word aligned
endmodule