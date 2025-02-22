`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/21/2025 04:16:54 PM
// Design Name: 
// Module Name: tb_CSA64
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


module tb_CSA64;

// Inputs
    reg [63:0] a, b;
    reg c_in;

    // Outputs
    wire [63:0] sum;
    wire c_out;

    // Reference Model for Verification
    reg [63:0] expected_sum;
    reg expected_c_out;

    // Instantiate the CSA 64-bit module
    CSA64 uut (
        .sum(sum),
        .c_out(c_out),
        .a(a),
        .b(b),
        .c_in(c_in)
    );

    // Timing Control
    `define TIME_DELAY #5  // Artificial delay

    // Testbench Initialization
    initial begin
        $dumpfile("CSA_64bit_tb.vcd");  // Generates waveform file
        $dumpvars(0, tb_CSA64);     // Captures all variables

        $monitor("Time=%0t | A=%h B=%h C_in=%b | Sum=%h C_out=%b | Expected Sum=%h Expected C_out=%b",
                  $time, a, b, c_in, sum, c_out, expected_sum, expected_c_out);

        // Test Case 1: Small numbers with no carry-in
        a = 64'h0000000000000001; b = 64'h0000000000000001; c_in = 0;
        expected_sum = a + b + c_in;
        expected_c_out = (expected_sum < a); // Carry occurs if sum overflows
        `TIME_DELAY;

        // Test Case 2: Large numbers with carry-in
        a = 64'hFFFFFFFFFFFFFFFF; b = 64'h0000000000000001; c_in = 1;
        expected_sum = a + b + c_in;
        expected_c_out = (expected_sum < a);
        `TIME_DELAY;

        // Test Case 3: Large numbers both near overflow
        a = 64'hFFFFFFFFFFFFFFFF; b = 64'hFFFFFFFFFFFFFFFF; c_in = 1;
        expected_sum = a + b + c_in;
        expected_c_out = (expected_sum < a);
        `TIME_DELAY;

        // Test Case 4: Random large numbers
        a = 64'h123456789ABCDEF0; b = 64'h0FEDCBA987654321; c_in = 0;
        expected_sum = a + b + c_in;
        expected_c_out = (expected_sum < a);
        `TIME_DELAY;

        // Test Case 5: Small numbers with carry-in
        a = 64'h0000000000000003; b = 64'h0000000000000004; c_in = 1;
        expected_sum = a + b + c_in;
        expected_c_out = (expected_sum < a);
        `TIME_DELAY;

        // Test Case 6: Random values with carry-in
        a = 64'h1A2B3C4D5E6F7081; b = 64'h1029384756576879; c_in = 1;
        expected_sum = a + b + c_in;
        expected_c_out = (expected_sum < a);
        `TIME_DELAY;

        // Final Message
        $display("All test cases completed successfully!");
        $finish;
    end

    // Verification Logic: Compares Expected and Actual Results
    always @(sum, c_out) begin
        if (sum !== expected_sum || c_out !== expected_c_out) begin
            $display("ERROR: Mismatch at time %0t: Expected Sum=%h, Got Sum=%h | Expected Carry=%b, Got Carry=%b",
                      $time, expected_sum, sum, expected_c_out, c_out);
        end
    end
endmodule
	

