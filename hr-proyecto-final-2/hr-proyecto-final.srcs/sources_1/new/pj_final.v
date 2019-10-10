`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/28/2019 04:06:52 PM
// Design Name: 
// Module Name: pj_final
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


module pj_final(
    input clk,
    input reset,
    input [15:0] sw,
    output [15:0] led,
    output [6:0] seg,
    output [3:0] an
    );
    
    reg [31:0] ticks;
    reg [31:0] ticks_elapsed = 32'd0;
    reg [31:0] displayNum = 16'd0;
    
    // Processor 0
    wire   [7:0]     DataBus0;
    wire    [7:0]    AddressBus0;
    
    wire done0;
    wire [7:0] count0;
    
    // Processor 1
    wire   [7:0]     DataBus1;
    wire    [7:0]    AddressBus1;
    
    wire done1;
    wire [7:0] count1;
    
    assign led = displayNum[31:16];
    
    displayDriver driver (
        .clk(clk),
        .num(displayNum),
        .reset(reset),
        .seg(seg),
        .an(an)
    );
    
    EightPortArrayRandom memory (
        .reset(reset),
        .DataBus0(DataBus0),
        .AddressBus0(AddressBus0),
        .DataBus1(DataBus1),
        .AddressBus1(AddressBus1)
    );
    
    
    Pico p0 (
        .clk(clk),
        .reset(reset),
        .DataBus(DataBus0),
        .startAddr(8'd0),
        .endAddr(8'd100),
        .AddressBus(AddressBus0), 
        .done(done0),
        .count(count0)
    );
    
    Pico p1 (
        .clk(clk),
        .reset(reset),
        .DataBus(DataBus1),
        .startAddr(8'd100),
        .endAddr(8'd200),
        .AddressBus(AddressBus1), 
        .done(done1),
        .count(count1)
    );
    
    always@(posedge clk) begin
        ticks <= ticks + 1;
        if (ticks_elapsed == 16'd0 && done0 && done1) begin
            ticks_elapsed <= ticks;
        end
        
        if(sw[0] == 0) begin
            displayNum[15:0] = count0 + count1;
            displayNum[15] = done0;
//            displayNum[14] = done1;
        end else begin
            displayNum = ticks_elapsed;
        end
    end
endmodule
