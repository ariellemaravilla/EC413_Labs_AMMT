`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/24/2025 01:47:10 PM
// Design Name: 
// Module Name: verification_timed64
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


module verification_timed64(C_out_verify, Sum_verify, A, B, C_in);
    input [63:0] A, B;
    input C_in;
    output reg [63:0] Sum_verify;
    output reg C_out_verify;

    // Introduce a small delay to simulate gate propagation
    always @(A or B or C_in) begin
        #1 Sum_verify = A + B + C_in;  // 1ns delay to simulate addition delay
        #1 C_out_verify = (Sum_verify[63] == 1'b1); // Carry-out calculation
    end
endmodule
