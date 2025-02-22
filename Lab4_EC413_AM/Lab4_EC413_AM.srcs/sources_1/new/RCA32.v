`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/21/2025 08:23:53 PM
// Design Name: 
// Module Name: RCA32
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


module RCA32(
    output [31:0] sum,
    output c_out,
    input [31:0] a, b,
    input c_in
    );
    
    wire c4, c8, c12, c16, c20, c24, c28;


    // Instantiating 8 RCA4 modules to form RCA32
    RCA4 rca0  (.c_out(c4),  .sum(sum[3:0]),   .a(a[3:0]),   .b(b[3:0]),   .c_in(c_in));
    RCA4 rca1  (.c_out(c8),  .sum(sum[7:4]),   .a(a[7:4]),   .b(b[7:4]),   .c_in(c4));
    RCA4 rca2  (.c_out(c12), .sum(sum[11:8]),  .a(a[11:8]),  .b(b[11:8]),  .c_in(c8));
    RCA4 rca3  (.c_out(c16), .sum(sum[15:12]), .a(a[15:12]), .b(b[15:12]), .c_in(c12));
    RCA4 rca4  (.c_out(c20), .sum(sum[19:16]), .a(a[19:16]), .b(b[19:16]), .c_in(c16));
    RCA4 rca5  (.c_out(c24), .sum(sum[23:20]), .a(a[23:20]), .b(b[23:20]), .c_in(c20));
    RCA4 rca6  (.c_out(c28), .sum(sum[27:24]), .a(a[27:24]), .b(b[27:24]), .c_in(c24));
    RCA4 rca7  (.c_out(c_out), .sum(sum[31:28]), .a(a[31:28]), .b(b[31:28]), .c_in(c28));    
    
endmodule
