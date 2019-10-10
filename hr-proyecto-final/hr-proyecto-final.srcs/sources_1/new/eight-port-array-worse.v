`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/05/2019 04:53:39 PM
// Design Name: 
// Module Name: eight-port-array-worse
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


`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:        Universidad Galileo
// Engineer:       Eduardo Corpeno
// 
// Create Date:    09:01:49 11/21/2010 
// Design Name:    
// Module Name:    EightPortArray 
// Project Name:   EightCore PicoBaze
// Target Devices: 
// Tool versions:  
// Description:    FPGA Class 2016
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module EightPortArrayWorse(
    output [7:0] DataBus0,
    output [7:0] DataBus1,
    output [7:0] DataBus2,
    output [7:0] DataBus3,
    output [7:0] DataBus4,
    output [7:0] DataBus5,
    output [7:0] DataBus6,
    output [7:0] DataBus7,
    input [7:0] AddressBus0,
    input [7:0] AddressBus1,
    input [7:0] AddressBus2,
    input [7:0] AddressBus3,
    input [7:0] AddressBus4,
    input [7:0] AddressBus5,
    input [7:0] AddressBus6,
    input [7:0] AddressBus7,
    input reset
    );

  reg [7:0] Data[255:0];

  assign DataBus0=Data[AddressBus0];
  assign DataBus1=Data[AddressBus1];
  assign DataBus2=Data[AddressBus2];
  assign DataBus3=Data[AddressBus3];
  assign DataBus4=Data[AddressBus4];
  assign DataBus5=Data[AddressBus5];
  assign DataBus6=Data[AddressBus6];
  assign DataBus7=Data[AddressBus7];	 
	 
 
  always @ reset
  if (reset==0)
    begin
      Data[  0]=251;    
      Data[  1]=251;
      Data[  2]=251;    
      Data[  3]=251;
      Data[  4]=251;    
      Data[  5]=251;
      Data[  6]=251;    
      Data[  7]=251;
      Data[  8]=251;    
      Data[  9]=251;
      Data[ 10]=251;    
      Data[ 11]=251;
      Data[ 12]=251;    
      Data[ 13]=251;
      Data[ 14]=251;    
      Data[ 15]=251;
      Data[ 16]=251;    
      Data[ 17]=251;
      Data[ 18]=251;    
      Data[ 19]=251;
      Data[ 20]=251;    
      Data[ 21]=251;
      Data[ 22]=251;    
      Data[ 23]=251;
      Data[ 24]=251;    
      Data[ 25]=251;
      Data[ 26]=251;    
      Data[ 27]=251;
      Data[ 28]=251;    
      Data[ 29]=251;
      Data[ 30]=251;    
      Data[ 31]=251;
      Data[ 32]=251;    
      Data[ 33]=251;
      Data[ 34]=251;    
      Data[ 35]=251;
      Data[ 36]=251;    
      Data[ 37]=251;
      Data[ 38]=251;    
      Data[ 39]=251;
      Data[ 40]=251;    
      Data[ 41]=251;
      Data[ 42]=251;    
      Data[ 43]=251;
      Data[ 44]=251;    
      Data[ 45]=251;
      Data[ 46]=251;    
      Data[ 47]=251;
      Data[ 48]=251;    
      Data[ 49]=251;
      Data[ 50]=251;      
      Data[ 51]=251;
      Data[ 52]=251;    
      Data[ 53]=251;
      Data[ 54]=251;    
      Data[ 55]=251;
      Data[ 56]=251;    
      Data[ 57]=251;
      Data[ 58]=251;    
      Data[ 59]=251;
      Data[ 60]=251;     
      Data[ 61]=251;
      Data[ 62]=251;    
      Data[ 63]=251;
      Data[ 64]=251;    
      Data[ 65]=251;
      Data[ 66]=251;    
      Data[ 67]=251;
      Data[ 68]=251;    
      Data[ 69]=251;
      Data[ 70]=251;     
      Data[ 71]=251;
      Data[ 72]=251;    
      Data[ 73]=251;
      Data[ 74]=251;    
      Data[ 75]=251;
      Data[ 76]=251;    
      Data[ 77]=251;
      Data[ 78]=251;    
      Data[ 79]=251;
      Data[ 80]=251;     
      Data[ 81]=251;
      Data[ 82]=251;    
      Data[ 83]=251;
      Data[ 84]=251;    
      Data[ 85]=251;
      Data[ 86]=251;    
      Data[ 87]=251;
      Data[ 88]=251;    
      Data[ 89]=251;
      Data[ 90]=251;     
      Data[ 91]=251;
      Data[ 92]=251;    
      Data[ 93]=251;
      Data[ 94]=251;    
      Data[ 95]=251;
      Data[ 96]=251;    
      Data[ 97]=251;
      Data[ 98]=251;    
      Data[ 99]=251;
      Data[100]=251;    
      Data[101]=251;
      Data[102]=251;    
      Data[103]=251;
      Data[104]=251;    
      Data[105]=251;
      Data[106]=251;    
      Data[107]=251;
      Data[108]=251;    
      Data[109]=251;
      Data[110]=251;    
      Data[111]=251;
      Data[112]=251;    
      Data[113]=251;
      Data[114]=251;    
      Data[115]=251;
      Data[116]=251;    
      Data[117]=251;
      Data[118]=251;    
      Data[119]=251;
      Data[120]=251;    
      Data[121]=251;
      Data[122]=251;    
      Data[123]=251;
      Data[124]=251;    
      Data[125]=251;
      Data[126]=251;    
      Data[127]=251;
      Data[128]=251;    
      Data[129]=251;
      Data[130]=251;    
      Data[131]=251;
      Data[132]=251;    
      Data[133]=251;
      Data[134]=251;    
      Data[135]=251;
      Data[136]=251;    
      Data[137]=251;
      Data[138]=251;    
      Data[139]=251;
      Data[140]=251;    
      Data[141]=251;
      Data[142]=251;    
      Data[143]=251;
      Data[144]=251;    
      Data[145]=251;
      Data[146]=251;    
      Data[147]=251;
      Data[148]=251;    
      Data[149]=251;
      Data[150]=251;      
      Data[151]=251;
      Data[152]=251;    
      Data[153]=251;
      Data[154]=251;    
      Data[155]=251;
      Data[156]=251;    
      Data[157]=251;
      Data[158]=251;    
      Data[159]=251;
      Data[160]=251;     
      Data[161]=251;
      Data[162]=251;    
      Data[163]=251;
      Data[164]=251;    
      Data[165]=251;
      Data[166]=251;    
      Data[167]=251;
      Data[168]=251;    
      Data[169]=251;
      Data[170]=251;     
      Data[171]=251;
      Data[172]=251;    
      Data[173]=251;
      Data[174]=251;    
      Data[175]=251;
      Data[176]=251;    
      Data[177]=251;
      Data[178]=251;    
      Data[179]=251;
      Data[180]=251;     
      Data[181]=251;
      Data[182]=251;    
      Data[183]=251;
      Data[184]=251;    
      Data[185]=251;
      Data[186]=251;    
      Data[187]=251;
      Data[188]=251;    
      Data[189]=251;
      Data[190]=251;     
      Data[191]=251;
      Data[192]=251;    
      Data[193]=251;
      Data[194]=251;    
      Data[195]=251;
      Data[196]=251;    
      Data[197]=251;
      Data[198]=251;    
      Data[199]=251;
      Data[200]=3;
      Data[201]=5;
      Data[202]=7;    
      Data[203]=11;
      Data[204]=13;    
      Data[205]=17;
      Data[206]=19;    
      Data[207]=23;
      Data[208]=29;    
      Data[209]=31;
      Data[210]=37;    
      Data[211]=41;
      Data[212]=43;    
      Data[213]=47;
      Data[214]=53;    
      Data[215]=59;
      Data[216]=61;    
      Data[217]=67;
      Data[218]=71;    
      Data[219]=73;
      Data[220]=79;    
      Data[221]=83;
      Data[222]=89;    
      Data[223]=97;
      Data[224]=101;    
      Data[225]=103;
      Data[226]=107;    
      Data[227]=109;
      Data[228]=113;    
      Data[229]=127;
      Data[230]=131;    
      Data[231]=137;
      Data[232]=139;    
      Data[233]=149;
      Data[234]=151;    
      Data[235]=157;
      Data[236]=163;    
      Data[237]=167;
      Data[238]=173;    
      Data[239]=179;
      Data[240]=181;    
      Data[241]=191;
      Data[242]=193;    
      Data[243]=197;
      Data[244]=199;    
      Data[245]=211;
      Data[246]=223;    
      Data[247]=227;
      Data[248]=229;    
      Data[249]=233;
      Data[250]=239;      
      Data[251]=241;
      Data[252]=251;    
      Data[253]=0;
      Data[254]=0;    
      Data[255]=0;
    end
endmodule

