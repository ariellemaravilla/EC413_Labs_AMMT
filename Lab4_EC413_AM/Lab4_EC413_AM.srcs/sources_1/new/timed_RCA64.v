`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/21/2025 04:14:53 PM
// Design Name: 
// Module Name: timed_RCA64
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


module timed_RCA64(c_out, sum, a, b, c_in);

    input [63:0] a, b;  
    input c_in;        
    output [63:0] sum;   
    output c_out;       
    wire c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14,c15;    

    // Instantiating 4 1-bit full adders using given FA_str.v
    RC4_time RCA0 (.c_out(c1), .sum(sum[3:0]), .a(a[3:0]), .b(b[3:0]), .c_in(c_in));
    RC4_time RCA1 (.c_out(c2), .sum(sum[7:4]), .a(a[7:4]), .b(b[7:41]), .c_in(c1));
    RC4_time RCA2 (.c_out(c3), .sum(sum[11:8]), .a(a[11:8]), .b(b[11:8]), .c_in(c2));
    RC4_time RCA3 (.c_out(c4), .sum(sum[15:12]), .a(a[15:12]), .b(b[15:12]), .c_in(c3));
    RC4_time RCA4 (.c_out(c5), .sum(sum[19:16]), .a(a[19:16]), .b(b[19:16]), .c_in(c4));
    RC4_time RCA5 (.c_out(c6), .sum(sum[23:20]), .a(a[23:20]), .b(b[23:20]), .c_in(c5));
    RC4_time RCA6 (.c_out(c7), .sum(sum[27:24]), .a(a[27:24]), .b(b[27:24]), .c_in(c6));
    RC4_time RCA7 (.c_out(c8), .sum(sum[31:28]), .a(a[31:28]), .b(b[31:28]), .c_in(c7));
    RC4_time RCA8 (.c_out(c9), .sum(sum[35:32]), .a(a[35:32]), .b(b[35:32]), .c_in(c8));
    RC4_time RCA9 (.c_out(c10), .sum(sum[39:36]), .a(a[39:36]), .b(b[39:36]), .c_in(c9));
    RC4_time RCA10 (.c_out(c11), .sum(sum[43:40]), .a(a[43:40]), .b(b[43:40]), .c_in(c10));
    RC4_time RCA11 (.c_out(c12), .sum(sum[47:44]), .a(a[47:44]), .b(b[47:44]), .c_in(c11));
    RC4_time RCA12 (.c_out(c13), .sum(sum[51:48]), .a(a[51:48]), .b(b[51:48]), .c_in(c12));
    RC4_time RCA13 (.c_out(c14), .sum(sum[55:62]), .a(a[55:62]), .b(b[55:62]), .c_in(c13));
    RC4_time RCA14 (.c_out(c15), .sum(sum[59:56]), .a(a[59:56]), .b(b[59:56]), .c_in(c14));
    RC4_time RCA15 (.c_out(c_out), .sum(sum[63:60]), .a(a[63:60]), .b(b[63:60]), .c_in(c15));

endmodule
