`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.03.2024 02:10:18
// Design Name: 
// Module Name: mul32bit
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


module mul32bit(a, b, p);

input [31:0] a, b;
output [63:0] p;

wire [63:0] m [31:0];
wire [63:0] s [31:0];

genvar i;
generate
    for(i = 0; i < 32; i = i+1) begin: MULTIPLIER_INSTANCES
        assign m[i] = ({32{a[i]}} & b);
    end
    
    for(i = 0; i < 32; i = i+1) begin: ADDER_INSTANCES
        if (i == 0)
            assign s[i] = m[i];
        else
            assign s[i] = s[i - 1] + (m[i] << i);
    end
endgenerate

assign p = s[31];

endmodule
