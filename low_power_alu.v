`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:38:37 06/21/2026 
// Design Name: 
// Module Name:    low_power_alu 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module low_power_alu(
    input clk,
    input enable,
    input reset,
    input [7:0] A,
    input [7:0] B,
    input [2:0] opcode,
    output reg [7:0] result,
    output reg carry,
    output reg zero
);

wire gated_clk;

assign gated_clk = clk & enable;

always @(posedge gated_clk or posedge reset)
begin
    if(reset)
    begin
        result <= 8'b0;
        carry  <= 1'b0;
        zero   <= 1'b0;
    end

    else
    begin
        case(opcode)

            3'b000: {carry, result} <= A + B; // Add

            3'b001: {carry, result} <= A - B; // Subtract

            3'b010:
            begin
                result <= A & B;
                carry  <= 0;
            end

            3'b011:
            begin
                result <= A | B;
                carry  <= 0;
            end

            3'b100:
            begin
                result <= A ^ B;
                carry  <= 0;
            end

            3'b101:
            begin
                result <= ~A;
                carry  <= 0;
            end

            3'b110:
            begin
                result <= A << 1;
                carry  <= 0;
            end

            3'b111:
            begin
                result <= A >> 1;
                carry  <= 0;
            end

            default:
            begin
                result <= 8'b0;
                carry  <= 0;
            end

        endcase
    end
end

// Zero flag generation
always @(*)
begin
    if(result == 8'b00000000)
        zero = 1'b1;
    else
        zero = 1'b0;
end

endmodule