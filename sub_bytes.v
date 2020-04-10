`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.04.2020 00:35:16
// Design Name: 
// Module Name: sub_bytes
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


module sub_bytes(
    input [127:0] in,
    output [127:0] out
    );
    wire [7:0] sub [0:15];
    
    genvar i;
    generate
        for(i=0;i<16;i=i+1)
            begin
                sbox inst_sbox(in[(127-8*i):(120-8*i)],sub[i]);
            end
    endgenerate
    
    
    genvar j;
    generate
        for(j=0;j<16;j=j+1)
            begin
                assign out[(127-8*j):(120-8*j)] = sub[j];
            end
    endgenerate

endmodule

