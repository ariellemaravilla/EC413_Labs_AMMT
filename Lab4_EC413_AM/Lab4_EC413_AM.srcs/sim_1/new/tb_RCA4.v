`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/21/2025 04:16:54 PM
// Design Name: 
// Module Name: tb_RCA4
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_RCA4;

    // Inputs
    reg [3:0] a, b;
    reg c_in;
    reg clk;

    // Outputs
    wire [3:0] sum;
    wire c_out;
    wire [3:0] sum_verify;
    wire c_out_verify;
    wire error_flag;

    // Instantiate the Unit Under Test (UUT)
    RCA4 RCA4 (
        .c_out(c_out),
        .sum(sum),
        .a(a),
        .b(b),
        .c_in(c_in)
    );

    // Instantiating the 4-bit Verification Module
    Verification_4bit Verification (
        .C_out_verify(c_out_verify),
        .Sum_verify(sum_verify),
        .A(a),
        .B(b),
        .C_in(c_in)
    );

    // Assign Error Flag
    assign error_flag = (sum !== sum_verify) || (c_out !== c_out_verify);

    // Verification logic
    always @(posedge clk) begin
        if (error_flag)
            $display("ERROR when A = %b, B = %b, C_in = %b | Expected Sum = %b, Got Sum = %b | Expected C_out = %b, Got C_out = %b",
                     a, b, c_in, sum_verify, sum, c_out_verify, c_out);
    end

    // Generate Clock Signal
    always #5 clk = ~clk;

    // Test Cases (Satisfying Lab Requirements)
    initial begin
        clk = 0;

        // Case 1: Force an overall carry-out (Expect c_out = 1)
        a = 4'b1111; b = 4'b0001; c_in = 1; #10;

        // Case 2a: Random large A & B input (with carry)
        a = 4'b1011; b = 4'b1101; c_in = 1; #10;

        // Case 2b: Random large A & B input (without carry)
        a = 4'b1100; b = 4'b0011; c_in = 0; #10;

        // Case 3a: Random small A & B input (with carry)
        a = 4'b0011; b = 4'b0110; c_in = 1; #10;

        // Case 3b: Random small A & B input (without carry)
        a = 4'b0001; b = 4'b0010; c_in = 0; #10;

        // Case 4: Random combinations
        a = 4'b1001; b = 4'b0101; c_in = 1; #10;
        a = 4'b0110; b = 4'b1010; c_in = 0; #10;

        $stop;
    end

endmodule
