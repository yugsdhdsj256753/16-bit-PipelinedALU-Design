`timescale 1ns/1ps

module tb_alu16_pipelined;

// Inputs
reg clk;
reg rst;
reg [15:0] A;
reg [15:0] B;
reg [3:0] ALU_Sel;

// Outputs
wire [15:0] Result;
wire Carry;

// Instantiate the ALU
alu16_pipelined uut (
    .clk(clk),
    .rst(rst),
    .A(A),
    .B(B),
    .ALU_Sel(ALU_Sel),
    .Result(Result),
    .Carry(Carry)
);

// Clock Generation (10 ns period)
always #5 clk = ~clk;

// Monitor Outputs
initial begin
    $monitor("Time=%0t | A=%d | B=%d | ALU_Sel=%b | Result=%d | Carry=%b",
              $time, A, B, ALU_Sel, Result, Carry);
end

// Test Sequence
initial begin

    // Initialize
    clk = 0;
    rst = 1;
    A = 0;
    B = 0;
    ALU_Sel = 4'b0000;

    #15;
    rst = 0;

    // Addition
    @(posedge clk);
    A = 16'd25;
    B = 16'd15;
    ALU_Sel = 4'b0000;

    // Subtraction
    @(posedge clk);
    A = 16'd40;
    B = 16'd10;
    ALU_Sel = 4'b0001;

    // AND
    @(posedge clk);
    A = 16'hAAAA;
    B = 16'h5555;
    ALU_Sel = 4'b0010;

    // OR
    @(posedge clk);
    A = 16'hAAAA;
    B = 16'h5555;
    ALU_Sel = 4'b0011;

    // XOR
    @(posedge clk);
    A = 16'hAAAA;
    B = 16'h5555;
    ALU_Sel = 4'b0100;

    // NOR
    @(posedge clk);
    A = 16'hAAAA;
    B = 16'h5555;
    ALU_Sel = 4'b0101;

    // NAND
    @(posedge clk);
    A = 16'hAAAA;
    B = 16'h5555;
    ALU_Sel = 4'b0110;

    // XNOR
    @(posedge clk);
    A = 16'hAAAA;
    B = 16'h5555;
    ALU_Sel = 4'b0111;

    // Shift Left
    @(posedge clk);
    A = 16'h000F;
    B = 16'd0;
    ALU_Sel = 4'b1000;

    // Shift Right
    @(posedge clk);
    A = 16'h00F0;
    B = 16'd0;
    ALU_Sel = 4'b1001;

    // Less Than
    @(posedge clk);
    A = 16'd10;
    B = 16'd20;
    ALU_Sel = 4'b1010;

    // Equal
    @(posedge clk);
    A = 16'd30;
    B = 16'd30;
    ALU_Sel = 4'b1011;

    // Wait for pipeline to flush
    repeat(3) @(posedge clk);

    $finish;

end

endmodule
