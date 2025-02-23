`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/21/2025 04:16:54 PM
// Design Name: 
// Module Name: tb_RCA64
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


module tb_RCA64;
  
    // Inputs
    reg [63:0] a, b;
    reg c_in;
    reg clk;

    // Outputs
    wire [63:0] sum;
    wire c_out;
    wire [63:0] sum_verify;
    wire c_out_verify;
    wire error_flag;

    // Instantiate the Unit Under Test (UUT)
    RCA64 RCA64 (
        .c_out(c_out),
        .sum(sum),
        .a(a),
        .b(b),
        .c_in(c_in)
    );

    // Instantiate the Verification Module
    Verification_64bit Verification (
        .C_out_verify(c_out_verify),
        .Sum_verify(sum_verify),
        .A(a),
        .B(b),
        .C_in(c_in)
    );

    // Assign Error Flag
    assign error_flag = (sum !== sum_verify) || (c_out !== c_out_verify);

    // Verification logic - Display errors
    always @(posedge clk) begin
        if (error_flag)
            $display("ERROR when A = %h, B = %h, C_in = %b | Expected Sum = %h, Got Sum = %h | Expected C_out = %b, Got C_out = %b",
                     a, b, c_in, sum_verify, sum, c_out_verify, c_out);
    end

    // Generate Clock Signal
    always #5 clk = ~clk;

    // Test Cases (Satisfying Lab Requirements)
    initial begin
        clk = 0;

        // Case 1: Force an overall carry-out (Expect c_out = 1)
        a = 64'hFFFFFFFFFFFFFFFF; b = 64'h0000000000000001; c_in = 1; #10;

        // Case 2a: Random large A & B input (with carry)
        a = 64'hABCDEF1234567890; b = 64'hFEDCBA9876543210; c_in = 1; #10;

        // Case 2b: Random large A & B input (without carry)
        a = 64'hFFFFFFFF00000000; b = 64'h00000000FFFFFFFF; c_in = 0; #10;

        // Case 3a: Random small A & B input (with carry)
        a = 64'h00000000000000F0; b = 64'h000000000000000F; c_in = 1; #10;

        // Case 3b: Random small A & B input (without carry)
        a = 64'h0000000000000003; b = 64'h0000000000000007; c_in = 0; #10;

        // Case 4: Random combinations
        a = 64'h1A2B3C4D5E6F7080; b = 64'h0F1E2D3C4B5A6978; c_in = 1; #10;
        a = 64'hDEADBEEFCAFE1234; b = 64'h0123456789ABCDEF; c_in = 0; #10;


        $stop;
    end

endmodule