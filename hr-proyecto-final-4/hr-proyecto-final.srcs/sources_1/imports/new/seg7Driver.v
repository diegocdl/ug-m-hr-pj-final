`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2019 05:57:04 PM
// Design Name: 
// Module Name: seg7Driver
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

module seg7Driver(
  input [3:0] num,
  output [6:0] seg
  );

  reg a;
  reg b;
  reg c;
  reg d;
  reg e;
  reg f;
  reg g;
  assign seg = {g, f, e, d, c, b, a};
  always@(num) begin
    a = 1; b = 1; c = 1; d = 1; e = 1; f = 1; g = 1;
    case(num)
      4'd0: 
        begin a = 0; b = 0; c = 0; d = 0; e = 0; f = 0; end
      4'd1: begin b = 0; c = 0; end
      4'd2: begin a = 0; b = 0; d = 0; e = 0; g = 0; end
      4'd3: begin a = 0; b = 0; c = 0; d = 0; g = 0; end
      4'd4: begin b = 0; c = 0; f = 0; g = 0; end
      4'd5: begin a = 0; c = 0; d = 0; f = 0; g = 0; end
      4'd6: begin a = 0; c = 0; d = 0; e = 0; f = 0; g = 0; end
      4'd7: begin a = 0; b = 0; c = 0; end
      4'd8: begin a = 0; b = 0; c = 0; d = 0; e = 0; f = 0; g = 0; end
      4'd9: begin a = 0; b = 0; c = 0; f = 0; g = 0; end
      4'd10: begin a = 0; b = 0; c = 0; e = 0; f = 0; g = 0; end
      4'd11: begin c = 0; d = 0; e = 0; f = 0; g = 0; end
      4'd12: begin a = 0; d = 0; e = 0; f = 0; end
      4'd13: begin b = 0; c = 0; d = 0; e = 0; g = 0; end
      4'd14: begin a = 0; d = 0; e = 0; f = 0; g = 0; end
      4'd15: begin a = 0; e = 0; f = 0; g = 0; end
    endcase
  end
endmodule
