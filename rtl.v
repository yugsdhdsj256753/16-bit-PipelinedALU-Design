module alu16_pipelined(
    input clk,
    input rst,
    input [15:0] A,
    input [15:0] B,
    input [3:0] ALU_Sel,

    output reg [15:0] Result,
    output reg Carry
);

//=========================
// Stage-1 Pipeline Registers
//=========================

reg [15:0] A_reg, B_reg;
reg [3:0] ALU_reg;

//=========================
// Combinational ALU
//=========================

reg [15:0] alu_result;
reg alu_carry;
reg [16:0] temp;

always @(*) begin

    alu_result = 16'd0;
    alu_carry  = 1'b0;
    temp       = 17'd0;

    case(ALU_reg)

        4'b0000: begin
            temp = A_reg + B_reg;
            alu_result = temp[15:0];
            alu_carry  = temp[16];
        end

        4'b0001: begin
            temp = A_reg - B_reg;
            alu_result = temp[15:0];
            alu_carry  = temp[16];
        end

        4'b0010: alu_result = A_reg & B_reg;

        4'b0011: alu_result = A_reg | B_reg;

        4'b0100: alu_result = A_reg ^ B_reg;

        4'b0101: alu_result = ~(A_reg | B_reg);

        4'b0110: alu_result = ~(A_reg & B_reg);

        4'b0111: alu_result = ~(A_reg ^ B_reg);

        4'b1000: alu_result = A_reg << 1;

        4'b1001: alu_result = A_reg >> 1;

        4'b1010: alu_result = (A_reg < B_reg) ? 16'd1 : 16'd0;

        4'b1011: alu_result = (A_reg == B_reg) ? 16'd1 : 16'd0;

        default: begin
            alu_result = 16'd0;
            alu_carry  = 1'b0;
        end

    endcase

end

//=========================
// Stage-1 Register
//=========================

always @(posedge clk or posedge rst)
begin
    if(rst)
    begin
        A_reg <= 16'd0;
        B_reg <= 16'd0;
        ALU_reg <= 4'd0;
    end
    else
    begin
        A_reg <= A;
        B_reg <= B;
        ALU_reg <= ALU_Sel;
    end
end

//=========================
// Stage-2 Register
//=========================

always @(posedge clk or posedge rst)
begin
    if(rst)
    begin
        Result <= 16'd0;
        Carry <= 1'b0;
    end
    else
    begin
        Result <= alu_result;
        Carry <= alu_carry;
    end
end

endmodule
