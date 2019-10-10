`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/03/2019 08:00:09 AM
// Design Name: 
// Module Name: Pico
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


module Pico(
    input clk,
    input reset,
    input [7:0] DataBus,
    input [7:0] startAddr,
    input [7:0] endAddr,
    output reg [7:0] AddressBus, 
    output reg done = 0,
    output reg [7:0] count
    );
    
///////////////////////////////////////////////////////////////////////////////////////////
// Signals
///////////////////////////////////////////////////////////////////////////////////////////
//

// Signals used to connect KCPSM6
//reg [31:0] count = 32'd0;
wire [11:0] address;
wire [17:0] instruction;
wire        bram_enable;
reg  [7:0]  in_port;
wire [7:0]  out_port;
wire [7:0]  port_id;
wire        write_strobe;
wire        k_write_strobe;
wire        read_strobe;
wire        interrupt;   
wire        interrupt_ack;
wire        kcpsm6_sleep;  
wire        kcpsm6_reset;
wire        rdl;

//
///////////////////////////////////////////////////////////////////////////////////////////
//
// Start of circuit description
//
///////////////////////////////////////////////////////////////////////////////////////////
//

    /////////////////////////////////////////////////////////////////////////////////////////
    // Instantiate KCPSM6 and connect to program ROM
    /////////////////////////////////////////////////////////////////////////////////////////
    //
    // The generics can be defined as required. In this case the 'hwbuild' value is used to 
    // define a version using the ASCII code for the desired letter. 
    //
    
    
    kcpsm6 #(
    .interrupt_vector	(12'h7FF),
    .scratch_pad_memory_size(64),
    .hwbuild		(8'h41))            // 41 hex is ASCII Character "A"
    processor (
    .address 		(address),
    .instruction 	(instruction),
    .bram_enable 	(bram_enable),
    .port_id 		(port_id),
    .write_strobe 	(write_strobe),
    .k_write_strobe 	(k_write_strobe),
    .out_port 		(out_port),
    .read_strobe 	(read_strobe),
    .in_port 		(in_port),
    .interrupt 		(interrupt),
    .interrupt_ack 	(interrupt_ack),
    .reset 		(kcpsm6_reset),
    .sleep		(kcpsm6_sleep),
    .clk 			(clk)); 
    
    // Reset connected to JTAG Loader enabled Program Memory
    
    assign kcpsm6_reset = rdl;
    
    // Unused signals tied off until required.
    // Tying to other signals used to minimise warning messages.
    
    assign kcpsm6_sleep = write_strobe && k_write_strobe;  // Always '0'
    assign interrupt = interrupt_ack;
    
    // Development Program Memory 
    //   JTAG Loader enabled for rapid code development. 
    
    count_primos #(
    .C_FAMILY		   ("7S"),  
    .C_RAM_SIZE_KWORDS	(2),  
    .C_JTAG_LOADER_ENABLE	(0))
    program_rom (
    .rdl 			(rdl),
    .enable 		(bram_enable),
    .address 		(address),
    .instruction 	(instruction),
    .clk 			(clk));

    always @ (posedge clk)
    begin
        case (port_id[1:0])
            // Read UART status at port address 00 hex
            2'b00 : in_port <= startAddr;
            2'b01 : in_port <= endAddr;
            2'b10 : in_port <= DataBus;
            // Specify don't care for all other inputs to obtain optimum implementation
            default : in_port <= 8'bXXXXXXXX ;  
        endcase;
    end
    always @ (posedge clk)
    begin
        // 'write_strobe' is used to qualify all writes to general output ports.
        if (write_strobe == 1'b1) begin
            if (port_id == 3'b00) begin
                AddressBus <= out_port;
            end
            if (port_id == 3'b01) begin
                count <= {8'b0, out_port};
            end
            if (port_id == 3'b10) begin
                done <= out_port[0];
            end
        end
    end
    
endmodule
