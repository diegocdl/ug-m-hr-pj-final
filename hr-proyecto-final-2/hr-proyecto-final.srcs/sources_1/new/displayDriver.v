`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/03/2019 07:08:09 PM
// Design Name: 
// Module Name: displayDriver
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


module displayDriver(
    input clk,
    input [15:0] num,
    input reset,
    output reg [6:0] seg,
    output reg [3:0] an
    );
    
    wire clkDiv;
    reg [2:0] cont = 0;
    wire [6:0] digito0;
    wire [6:0] digito1;
    wire [6:0] digito2;
    wire [6:0] digito3;
    
    freqDiv divisor (
        .in(clk),
        .cant(32'd100000),
        .reset(reset),
        .out(clkDiv)
    );
    
    seg7Driver seg0 (
        .num(num[3:0]),
        .seg(digito0)
    );
    
    seg7Driver seg1 (
        .num(num[7:4]),
        .seg(digito1)
    );
    
    seg7Driver seg2 (
        .num(num[11:8]),
        .seg(digito2)
    );
    seg7Driver seg3 (
        .num(num[15:12]),
        .seg(digito3)
    );
    
    always@(posedge clkDiv) begin
        case(cont)
            2'b00: begin
                seg <= digito0;
                an <= 4'b1110;
            end
            2'b01: begin
                seg <= digito1;
                an <= 4'b1101;
            end
            2'b10: begin
                seg <= digito2;
                an <= 4'b1011;
            end
            2'b11: begin
                seg <= digito3;
                an <= 4'b0111;
            end
        endcase
        cont <= cont + 1;
    end
endmodule
