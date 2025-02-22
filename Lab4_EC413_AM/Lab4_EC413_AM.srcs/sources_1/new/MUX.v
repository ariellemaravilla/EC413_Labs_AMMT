`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/21/2025 08:33:55 PM
// Design Name: 
// Module Name: MUX
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


module MUX(output [31:0] sum_out, output c_out, input [31:0] sum0, sum1, input c0, c1, input c_in);
    assign sum_out = (c_in) ? sum1 : sum0;
    assign c_out = (c_in) ? c1 : c0;
endmodule