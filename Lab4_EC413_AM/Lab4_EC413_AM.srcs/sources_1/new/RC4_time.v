`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/21/2025 09:56:58 PM
// Design Name: 
// Module Name: RC4_time
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


module RC4_time(c_out, sum, a, b, c_in);

    input [3:0] a, b;  
    input c_in;        
    output [3:0] sum;   
    output c_out;       
    wire c1, c2, c3;    

    // Instantiating 4 1-bit full adders using given FA_str.v
    FA_time FA0 (.c_out(c1), .sum(sum[0]), .a(a[0]), .b(b[0]), .c_in(c_in));
    FA_time FA1 (.c_out(c2), .sum(sum[1]), .a(a[1]), .b(b[1]), .c_in(c1));
    FA_time FA2 (.c_out(c3), .sum(sum[2]), .a(a[2]), .b(b[2]), .c_in(c2));
    FA_time FA3 (.c_out(c_out), .sum(sum[3]), .a(a[3]), .b(b[3]), .c_in(c3));

endmodule