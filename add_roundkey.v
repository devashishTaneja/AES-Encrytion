`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.04.2020 17:05:52
// Design Name: 
// Module Name: add_roundkey
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


module add_roundkey(
    input [127:0] in,
    output [127:0] out,
    input [127:0] key
    );

    assign out = in^key ;
    
endmodule
