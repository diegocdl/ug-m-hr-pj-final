`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2019 04:44:58 PM
// Design Name: 
// Module Name: freqDiv
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

module freqDiv (
  input in,
  input [31:0] cant,
  input reset,
  output reg out
  );
  reg [31:0]cont;
  always@(posedge in or posedge reset) begin
    if(reset == 1) begin
        out <= 0;
        cont = 80;
    end else begin
        cont <= cont + 1;
        if(cont == cant) begin
          cont <= 32'd0;
          out <= ~out;
        end
    end
  end
endmodule

