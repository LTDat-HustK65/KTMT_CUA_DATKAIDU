module testbench();
	reg clk, reset;
    wire MemWrite;
	wire [31:0] WriteData, DataAdr;

	top uut(
        .clk(clk),
        .reset(reset),
        .WriteDataM(WriteData),
        .DataAdrM(DataAdr),
        .MemWriteM(MemWrite)
    );
	
	initial begin
        clk = 0;
	end
	
	always #5 clk = ~clk;
	
	initial begin
		reset = 1;
		#100;
		reset = 0;
		$display("Simulation starts!");
		$monitor("Value of ALU = %d", DataAdr);
	end	 
	always @(posedge clk) begin
		if (MemWrite) begin
			if (DataAdr === 132 & WriteData === 32'hABCDE02E) begin
				$display("Test passed!");
				$stop;
			end
		end
	end
endmodule