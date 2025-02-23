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


module CSA64(
    output [63:0] sum,
    output c_out,
    input [63:0] a, b,
    input c_in
);
    // Carry chain between blocks (15 intermediate carries for 16 blocks)
    wire [14:0] carry;
    
    // Lower 4 bits: use RCA4
    RCA4 rca0 (.sum(sum[3:0]),  .c_out(carry[0]), .a(a[3:0]),  .b(b[3:0]),  .c_in(c_in));
    
    // Next 15 blocks: use 4-bit CSA blocks
    CSA_Block csab1  (.sum(sum[7:4]),  .c_out(carry[1]),  .a(a[7:4]),  .b(b[7:4]),  .c_in(carry[0]));
    CSA_Block csab2  (.sum(sum[11:8]), .c_out(carry[2]),  .a(a[11:8]), .b(b[11:8]), .c_in(carry[1]));
    CSA_Block csab3  (.sum(sum[15:12]), .c_out(carry[3]),  .a(a[15:12]), .b(b[15:12]), .c_in(carry[2]));
    CSA_Block csab4  (.sum(sum[19:16]), .c_out(carry[4]),  .a(a[19:16]), .b(b[19:16]), .c_in(carry[3]));
    CSA_Block csab5  (.sum(sum[23:20]), .c_out(carry[5]),  .a(a[23:20]), .b(b[23:20]), .c_in(carry[4]));
    CSA_Block csab6  (.sum(sum[27:24]), .c_out(carry[6]),  .a(a[27:24]), .b(b[27:24]), .c_in(carry[5]));
    CSA_Block csab7  (.sum(sum[31:28]), .c_out(carry[7]),  .a(a[31:28]), .b(b[31:28]), .c_in(carry[6]));
    CSA_Block csab8  (.sum(sum[35:32]), .c_out(carry[8]),  .a(a[35:32]), .b(b[35:32]), .c_in(carry[7]));
    CSA_Block csab9  (.sum(sum[39:36]), .c_out(carry[9]),  .a(a[39:36]), .b(b[39:36]), .c_in(carry[8]));
    CSA_Block csab10 (.sum(sum[43:40]), .c_out(carry[10]), .a(a[43:40]), .b(b[43:40]), .c_in(carry[9]));
    CSA_Block csab11 (.sum(sum[47:44]), .c_out(carry[11]), .a(a[47:44]), .b(b[47:44]), .c_in(carry[10]));
    CSA_Block csab12 (.sum(sum[51:48]), .c_out(carry[12]), .a(a[51:48]), .b(b[51:48]), .c_in(carry[11]));
    CSA_Block csab13 (.sum(sum[55:52]), .c_out(carry[13]), .a(a[55:52]), .b(b[55:52]), .c_in(carry[12]));
    CSA_Block csab14 (.sum(sum[59:56]), .c_out(carry[14]), .a(a[59:56]), .b(b[59:56]), .c_in(carry[13]));
    CSA_Block csab15 (.sum(sum[63:60]), .c_out(c_out),     .a(a[63:60]), .b(b[63:60]), .c_in(carry[14]));
    
endmodule