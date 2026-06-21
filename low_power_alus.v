`timescale 1 ns / 1 ps

module low_power_alu_tb;

    // Inputs
    reg clk;
    reg enable;
    reg reset;
    reg [7:0] A;
    reg [7:0] B;
    reg [2:0] opcode;

    // Outputs
    wire [7:0] result;
    wire carry;
    wire zero;

    // Instantiate the Unit Under Test (UUT)
    low_power_alu uut (
        .clk(clk),
        .enable(enable),
        .reset(reset),
        .A(A),
        .B(B),
        .opcode(opcode),
        .result(result),
        .carry(carry),
        .zero(zero)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Stimulus
    initial begin

        // Initialize Inputs
        enable = 1;
        reset  = 1;
        A = 8'b00000000;
        B = 8'b00000000;
        opcode = 3'b000;

        // Release Reset
        #20 reset = 0;

        // Addition (25 + 10)
        #20 A = 8'd25; B = 8'd10; opcode = 3'b000;

        // Subtraction (50 - 20)
        #20 A = 8'd50; B = 8'd20; opcode = 3'b001;

        // AND
        #20 A = 8'hAA; B = 8'h0F; opcode = 3'b010;

        // OR
        #20 A = 8'hAA; B = 8'h0F; opcode = 3'b011;

        // XOR
        #20 A = 8'hAA; B = 8'h0F; opcode = 3'b100;

        // NOT
        #20 A = 8'h55; opcode = 3'b101;

        // Shift Left
        #20 A = 8'h0F; opcode = 3'b110;

        // Shift Right
        #20 A = 8'hF0; opcode = 3'b111;

        // Disable clock gating
        #20 enable = 0;

        // Enable again
        #40 enable = 1;

        #100;
        $stop;

    end

endmodule
