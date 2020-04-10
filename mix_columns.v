`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.04.2020 18:33:45
// Design Name: 
// Module Name: mix_columns
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


module mix_columns(
    input [127:0] in,
    output reg [127:0] out
    );
        
        wire [7:0] arr00,arr01,arr02,arr03,arr10,arr11,arr12,
            arr13,arr20,arr21,arr22,arr23,arr30,arr31,arr32,arr33;
        
        function [7:0] mult;
            input [7:0] num1,num2,num3,num4;
            mult = num1 ^ num2 ^ (num3<<1) ^ (num3[7] * 8'h1b) ^  (num4<<1) ^ (num4[7] * 8'h1b) ^ num4 ;
        endfunction
            
        assign arr00 = in[127:120];  
        assign arr10 = in[119:112];
        assign arr20 = in[111:104];
        assign arr30 = in[103:96];
        assign arr01 = in[95:88];
        assign arr11 =  in[87:80];
        assign arr21 =  in[79:72];
        assign arr31 =  in[71:64];
        assign arr02 =  in[63:56];
        assign arr12 = in[55:48];
        assign arr22 = in[47:40];
        assign arr32 = in[39:32];       
        assign arr03 = in[31:24];
        assign arr13 = in[23:16];
        assign arr23 = in[15:8];
        assign arr33 = in[7:0];
        
        always@(*)
            begin
                begin
                    out[127:120] <= mult(arr20,arr30,arr00,arr10);  
                    out[119:112] <= mult(arr00,arr30,arr10,arr20);  
                    out[111:104] <= mult(arr00,arr10,arr20,arr30);  
                    out[103:96] <= mult(arr10,arr20,arr30,arr00);  
                    
                    out[95:88] <= mult(arr21,arr31,arr01,arr11); 
                    out[87:80] <= mult(arr01,arr31,arr11,arr21); 
                    out[79:72] <= mult(arr01,arr11,arr21,arr31); 
                    out[71:64] <= mult(arr11,arr21,arr31,arr01);
                    
                    out[63:56] <= mult(arr22,arr32,arr02,arr12); 
                    out[55:48] <= mult(arr02,arr32,arr12,arr22); 
                    out[47:40] <= mult(arr02,arr12,arr22,arr32); 
                    out[39:32] <= mult(arr12,arr22,arr32,arr02); 
                    
                    out[31:24] <= mult(arr23,arr33,arr03,arr13);
                    out[23:16] <= mult(arr03,arr33,arr13,arr23); 
                    out[15:8] <= mult(arr03,arr13,arr23,arr33); 
                    out[7:0] <= mult(arr13,arr23,arr33,arr03); 
                end
            end
        
endmodule


