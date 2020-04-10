`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.04.2020 23:32:59
// Design Name: 
// Module Name: main
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


module main(
    input [127:0] in,
    input [127:0] key,
    output [127:0] out
    );
    
    // ROUND 0
    wire [127:0] out_r0;
    add_roundkey inst_add_roundkey( in, out_r0,key);
    
    // ROUND 1-10
    wire [127:0] out_r1,out_r2,out_r3,out_r4,out_r5,out_r6,out_r7,out_r8,out_r9,out_r10;
    wire [127:0] keyout1,keyout2,keyout3,keyout4,keyout5,keyout6,keyout7,keyout8,keyout9,keyout10;
    round inst_r1(out_r0,out_r1,key,keyout1,8'h01);
    round inst_r2(out_r1,out_r2,keyout1,keyout2,8'h02);
    round inst_r3(out_r2,out_r3,keyout2,keyout3,8'h04);
    round inst_r4(out_r3,out_r4,keyout3,keyout4,8'h08);
    round inst_r5(out_r4,out_r5,keyout4,keyout5,8'h10);
    round inst_r6(out_r5,out_r6,keyout5,keyout6,8'h20);
    round inst_r7(out_r6,out_r7,keyout6,keyout7,8'h40);
    round inst_r8(out_r7,out_r8,keyout7,keyout8,8'h80);
    round inst_r9(out_r8,out_r9,keyout8,keyout9,8'h1B);
    round inst_r10(out_r9,out_r10,keyout9,keyout10,8'h36);
    
    assign out = out_r10;

endmodule
