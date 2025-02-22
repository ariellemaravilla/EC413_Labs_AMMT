`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/21/2025 04:14:53 PM
// Design Name: 
// Module Name: CSA64
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


module CSA64(output [63:0] sum, output c_out, input [63:0] a, b, input c_in);
    wire c_mid; // Carry from lower 32-bit to upper 32-bit

    // Stage 1: Lower 32-bit Ripple Carry Adder
    RCA32 rca_lower (
        .sum(sum[31:0]),
        .c_out(c_mid),
        .a(a[31:0]),
        .b(b[31:0]),
        .c_in(c_in)
    );

    // Stage 2: Upper 32-bit Carry Select Adder Block
    CSA_Block csa_upper (
        .sum(sum[63:32]),
        .c_out(c_out),
        .a(a[63:32]),
        .b(b[63:32]),
        .c_in(c_mid)
    );
    
endmodule
