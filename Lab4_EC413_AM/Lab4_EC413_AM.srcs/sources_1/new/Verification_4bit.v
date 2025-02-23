`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/22/2025 10:37:05 PM
// Design Name: 
// Module Name: Verification_4bit
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


module Verification_4bit(C_out_verify, Sum_verify, A, B, C_in);
    input [3:0] A, B;
    input C_in;
    output [3:0] Sum_verify;
    output C_out_verify;
    
    assign {C_out_verify, Sum_verify} = A + B + C_in;
endmodule
