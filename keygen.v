`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.04.2020 11:52:12
// Design Name: 
// Module Name: keygen
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


module keygen(
    input [127:0] keyin,
    input [7:0] rcon,
    output [127:0] keyout
    );
    wire [7:0] b00,b10,b20,b30,
        b01,b11,b21,b31,b02,b12,
        b22,b32,b03,b13,b23,b33 ;
    
    wire [7:0] a00,a10,a20,a30,
        a01,a11,a21,a31,a02,a12,
        a22,a32,a03,a13,a23,a33 ;
    
    assign a00 = keyin[127:120];  
    assign a10 = keyin[119:112];
    assign a20 = keyin[111:104];
    assign a30 = keyin[103:96];
    assign a01 = keyin[95:88];
    assign a11 = keyin[87:80];
    assign a21 = keyin[79:72];
    assign a31 = keyin[71:64];
    assign a02 = keyin[63:56];
    assign a12 = keyin[55:48];
    assign a22 = keyin[47:40];
    assign a32 = keyin[39:32];       
    assign a03 = keyin[31:24];
    assign a13 = keyin[23:16];
    assign a23 = keyin[15:8];
    assign a33 = keyin[7:0];
    
    wire [7:0] arot03,arot13,arot23,arot33;
    
    sbox inst_sbox_00(keyin[23:16],arot03);
    sbox inst_sbox_10(keyin[15:8],arot13);
    sbox inst_sbox_20(keyin[7:0],arot23);
    sbox inst_sbox_30(keyin[31:24],arot33);
    
    assign b00 = a00 ^ arot03 ^ rcon;
    assign b10 = a10 ^ arot13 ;
    assign b20 = a20 ^ arot23 ;
    assign b30 = a30 ^ arot33 ;
    
    assign b01 = a01 ^ b00 ;
    assign b11 = a11 ^ b10 ;
    assign b21 = a21 ^ b20 ;
    assign b31 = a31 ^ b30 ;
    
    assign b02 = a02 ^ b01 ;
    assign b12 = a12 ^ b11 ;
    assign b22 = a22 ^ b21 ;
    assign b32 = a32 ^ b31 ;
    
    assign b03 = a03 ^ b02 ;
    assign b13 = a13 ^ b12 ;
    assign b23 = a23 ^ b22 ;
    assign b33 = a33 ^ b32 ;


    assign keyout[127:120] = b00;
    assign keyout[119:112] = b10;
    assign keyout[111:104] = b20;  
    assign keyout[103:96] = b30;  
    
    assign keyout[95:88] = b01; 
    assign keyout[87:80] = b11; 
    assign keyout[79:72] = b21; 
    assign keyout[71:64] = b31;
    
    assign keyout[63:56] = b02; 
    assign keyout[55:48] = b12; 
    assign keyout[47:40] = b22; 
    assign keyout[39:32] = b32; 
    
    assign keyout[31:24] = b03;
    assign keyout[23:16] = b13; 
    assign keyout[15:8] = b23; 
    assign keyout[7:0] = b33; 

endmodule
