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
    input restart,
    input [15:0] sw,
    output reg [15:0] led
    );
    
    //
///////////////////////////////////////////////////////////////////////////////////////////
// Signals
///////////////////////////////////////////////////////////////////////////////////////////
//

// Signals used to create internal 200MHz clock from 200MHz differential clock

//wire        clk200;
//wire        clk;

// Signal used to specify the clock frequency in megahertz.

//wire [7:0]  clock_frequency_in_MHz; 

// Signals used to connect KCPSM6
reg [31:0] count = 32'd0;
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
wire   [7:0]     DataBus0;
reg    [7:0]    AddressBus0;

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
    .C_JTAG_LOADER_ENABLE	(1))
    program_rom (
    .rdl 			(rdl),
    .enable 		(bram_enable),
    .address 		(address),
    .instruction 	(instruction),
    .clk 			(clk));
    
    EightPortArray memory (
        .reset(restart),
        .DataBus0(DataBus0),
        .AddressBus0(AddressBus0)
    );
    
    
    always @ (posedge clk)
    begin
        case (port_id[1:0])
            // Read UART status at port address 00 hex
            2'b00 : in_port <= 8'd0;
            2'b01 : in_port <= 8'd25;
            2'b10 : in_port <= DataBus0;
            // Specify don't care for all other inputs to obtain optimum implementation
            default : in_port <= 8'bXXXXXXXX ;  
        endcase;
    end
    always @ (posedge clk)
    begin
        // 'write_strobe' is used to qualify all writes to general output ports.
        if (write_strobe == 1'b1) begin
            if (port_id == 3'b0) begin
                AddressBus0 <= out_port;
            end
            if (port_id == 3'b1) begin
                led <= {8'b0, out_port};
            end
        end
    end
endmodule
