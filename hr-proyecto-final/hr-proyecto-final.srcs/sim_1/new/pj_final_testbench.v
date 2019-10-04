`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/28/2019 04:41:36 PM
// Design Name: 
// Module Name: pj_final_testbench
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


module pj_final_testbench;
    reg clk;
    reg reset;
    reg [15:0] sw;
    wire [15:0] led;
    pj_final uut(
        .clk(clk),
        .reset(reset),
        .sw(sw),
        .led(led)
    );
    
    always begin
        clk = 0;
        forever #10 clk = ~clk;
    end
    initial begin
        reset = 1;
        #50
        reset = 0;
    end
endmodule
