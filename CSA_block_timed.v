`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/24/2025 01:12:01 PM
// Design Name: 
// Module Name: CSA_block_timed
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


module CSA_block_timed(
    output [3:0] sum,
    output c_out,
    input [3:0] a, b,
    input c_in
);
    wire [3:0] sum0, sum1; // Sums for C-in = 0 and C-in = 1
    wire c0, c1;         // Carry-outs for both cases

    // Compute sum assuming carry-in is 0
    RC4_time rca0 (.sum(sum0), .c_out(c0), .a(a), .b(b), .c_in(1'b0));

    // Compute sum assuming carry-in is 1
    RC4_time rca1 (.sum(sum1), .c_out(c1), .a(a), .b(b), .c_in(1'b1));

    // Select the correct sum and carry-out using a 4-bit multiplexer
    MUX mux (.sum_out(sum), .c_out(c_out), .sum0(sum0), .sum1(sum1), .c0(c0), .c1(c1), .c_in(c_in));

endmodule
