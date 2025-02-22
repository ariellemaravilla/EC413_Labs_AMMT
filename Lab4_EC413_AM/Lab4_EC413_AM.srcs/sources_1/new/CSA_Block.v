`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/21/2025 08:54:35 PM
// Design Name: 
// Module Name: CSA_Block
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


module CSA_Block(output [31:0] sum, output c_out, input [31:0] a, b, input c_in);
    wire [31:0] sum0, sum1; // Sums for C-in = 0 and C-in = 1
    wire c0, c1; // Carry-outs for both cases

    // Compute sum assuming C-in = 0
    RCA32 rca0 (.sum(sum0), .c_out(c0), .a(a), .b(b), .c_in(1'b0));

    // Compute sum assuming C-in = 1
    RCA32 rca1 (.sum(sum1), .c_out(c1), .a(a), .b(b), .c_in(1'b1));

    // Select the correct sum and carry using a multiplexer
    MUX mux (.sum_out(sum), .c_out(c_out), .sum0(sum0), .sum1(sum1), .c0(c0), .c1(c1), .c_in(c_in));
endmodule