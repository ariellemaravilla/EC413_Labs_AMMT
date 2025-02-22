`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/21/2025 09:56:58 PM
// Design Name: 
// Module Name: FA_time
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


module FA_time(c_out, sum, a, b, c_in);

input	a, b, c_in;      //declare inputs a, b and c_in, 1 bit each
output	c_out, sum;      //declare outputs c_out and sum, 1 bit each

//declare wires for values being passed between different gates
wire		not_a, not_b, not_c;
wire		and1_out, and2_out, and3_out, and4_out, and5_out, and6_out, and7_out;


not	   not1		(not_a, a);
not	   not2		(not_b, b);
not	   not3		(not_c, c_in);

// get sum
AND_T_3t		and1		(and1_out, a, not_b, not_c);
AND_T_3t		and2		(and2_out, not_a, b, not_c);
AND_T_3t		and3		(and3_out, not_a, not_b, c_in);
AND_T_3t		and4		(and4_out, a, b, c_in);
OR_T_4t		or1		(sum, and1_out, and2_out, and3_out, and4_out);

AND_T_2t	and5		(and5_out, a, c_in);
AND_T_2t		and6		(and6_out, b, c_in);
AND_T_2t		and7		(and7_out, a, b);
OR_T_3t		or2		(c_out, and5_out, and6_out, and7_out);

// For Pre-Lab4 Step 4: swapped sum and c_out in OR_T4 and OR_T_3 to see error_flag


endmodule
