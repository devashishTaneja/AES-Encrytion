`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.04.2020 01:57:38
// Design Name: 
// Module Name: round
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


module round(
    input [127:0] in,
    output [127:0] out,
    input [127:0] keyin,
    output [127:0] keyout,
    input [7:0] rcon
    );
    
    keygen inst_keygen(keyin,rcon,keyout);
    
    wire [127:0] out_sb,out_sr,out_mx,out_ms;
    sub_bytes inst_sub_bytes(in, out_sb);
    shiftrows inst_shiftrows(out_sb, out_sr);
    mix_columns inst_mix_columns(out_sr, out_mx);

    assign out_ms = (rcon==8'h36) ? out_sr : out_mx;
    
    add_roundkey inst_add_roundkey(out_ms , out, keyout);
    

endmodule
