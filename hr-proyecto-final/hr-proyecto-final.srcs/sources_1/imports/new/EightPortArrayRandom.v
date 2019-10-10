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

module EightPortArrayRandom(
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
      Data[  0]=155;    
      Data[  1]=226;
      Data[  2]=83;    
      Data[  3]=20;
      Data[  4]=39;    
      Data[  5]=148;
      Data[  6]=79;    
      Data[  7]=194;
      Data[  8]=21;    
      Data[  9]=208;
      Data[ 10]=114;    
      Data[ 11]=29;
      Data[ 12]=241;    
      Data[ 13]=50;
      Data[ 14]=24;    
      Data[ 15]=143;
      
      Data[ 16]=5;    
      Data[ 17]=0;
      Data[ 18]=187;    
      Data[ 19]=71;
      Data[ 20]=155;    
      Data[ 21]=192;
      Data[ 22]=207;    
      Data[ 23]=75;
      Data[ 24]=9;    
      Data[ 25]=240;
      Data[ 26]=108;    
      Data[ 27]=147;
      Data[ 28]=66;    
      Data[ 29]=164;
      Data[ 30]=111;    
      Data[ 31]=36;
      
      Data[ 32]=213;    
      Data[ 33]=163;
      Data[ 34]=53;    
      Data[ 35]=241;
      Data[ 36]=212;    
      Data[ 37]=124;
      Data[ 38]=68;    
      Data[ 39]=4;
      Data[ 40]=239;    
      Data[ 41]=171  ;
      Data[ 42]=79   ;    
      Data[ 43]=0;
      Data[ 44]=193 ;   
      Data[ 45]=131 ;
      Data[ 46]=188 ;    
      Data[ 47]=199 ;
      
      Data[ 48]=84  ;    
      Data[ 49]=36 ;
      Data[ 50]=156  ;      
      Data[ 51]=43 ;
      Data[ 52]=195 ;    
      Data[ 53]=133 ;
      Data[ 54]=221  ;    
      Data[ 55]=74  ;
      Data[ 56]=26 ;    
      Data[ 57]=200 ;
      Data[ 58]=220 ;    
      Data[ 59]=207  ;
      Data[ 60]=18 ;     
      Data[ 61]=185 ;
      Data[ 62]=174 ;    
      Data[ 63]=223 ;
      
      Data[ 64]=102   ;    
      Data[ 65]=4;
      Data[ 66]=65 ;    
      Data[ 67]=106 ;
      Data[ 68]=118 ;    
      Data[ 69]=129 ;
      Data[ 70]=214 ;     
      Data[ 72]=197  ;    
      Data[ 73]=94  ;
      Data[ 74]=27 ;    
      Data[ 75]=146;
      Data[ 76]=160 ;    
      Data[ 77]=244 ;
      Data[ 78]=242 ;    
      Data[ 79]=201  ;
      Data[ 80]=62 ;    
       
      Data[ 81]=179 ;
      Data[ 82]=239 ;    
      Data[ 84]=177  ;    
      Data[ 85]=51 ;
      Data[ 86]=229  ;    
      Data[ 87]=98 ;
      Data[ 88]=246  ;    
      Data[ 89]=52 ;
      Data[ 90]=229 ;     
      Data[ 91]=236  ;
      Data[ 92]=83 ;    
      Data[ 93]=205 ;
      Data[ 94]=253 ;    
      Data[ 95]=194 ;
      Data[ 96]=216  ;    
      Data[ 97]=33 ;
      
      Data[ 98]=148 ;    
      Data[ 99]=181 ;
      Data[100]=237  ;    
      Data[101]=95 ;
      Data[102]=210 ;    
      Data[103]=108 ;
      Data[104]=110 ;    
      Data[105]=163 ;
      Data[106]=153 ;    
      Data[107]=124 ;
      Data[108]=200 ;    
      Data[109]=141 ;
      Data[110]=242  ;    
      Data[111]=79 ;
      Data[112]=200 ;    
      Data[113]=233 ;
      
      Data[114]=146 ;    
      Data[115]=217 ;
      Data[116]=238  ;    
      Data[117]=90  ;
      Data[118]=96  ;    
      Data[119]=48  ;
      Data[120]=36 ;    
      Data[121]=247 ;
      Data[122]=208 ;    
      Data[123]=210 ;
      Data[124]=193 ;    
      Data[125]=212 ;
      Data[126]=252   ;    
      Data[127]=1;
      Data[128]=238  ;    
      Data[129]=41 ;
      
      Data[130]=143 ;    
      Data[131]=176  ;
      Data[132]=26  ;    
      Data[133]=98 ;
      Data[134]=194 ;    
      Data[135]=194 ;
      Data[136]=209  ;    
      Data[137]=62;
      Data[138]=132 ;    
      Data[139]=198 ;
      Data[140]=104 ;    
      Data[141]=234 ;
      Data[142]=121 ;    
      Data[143]=197 ;
      Data[144]=139 ;    
      Data[145]=220 ;
      
      Data[146]=85 ;    
      Data[147]=137 ;
      Data[148]=121  ;    
      Data[149]=82  ;
      Data[150]=82 ;      
      Data[151]=242 ;
      Data[152]=225 ;    
      Data[153]=202 ;
      Data[154]=221;    
      Data[155]=53 ;
      Data[156]=132  ;    
      Data[157]=87 ;
      Data[158]=251 ;    
      Data[159]=157 ;
      Data[160]=157  ;     
      Data[161]=59 ;
      
      Data[162]=9;    
      Data[163]=130 ;
      Data[164]=144 ;    
      Data[165]=122 ;
      Data[166]=108 ;    
      Data[167]=128;
      Data[168]=1;    
      Data[169]=152 ;
      Data[170]=102  ;     
      Data[171]=13;
      Data[172]=181  ;    
      Data[173]=88 ;
      Data[174]=152 ;    
      Data[175]=240  ;
      Data[176]=33 ;    
      Data[177]=110 ;
      
      Data[178]=173 ;    
      Data[179]=208  ;
      Data[180]=80  ;     
      Data[181]=48  ;
      Data[182]=66 ;    
      Data[183]=178 ;
      Data[184]=128 ;    
      Data[185]=226 ;
      Data[186]=101  ;    
      Data[187]=215  ;
      Data[188]=216  ;    
      Data[189]=205  ;
      Data[190]=136  ;     
      Data[191]=205  ;
      Data[192]=98  ;    
      Data[193]=161 ;
      
      Data[194]=217    ;    
      Data[195]=223  ;
      Data[196]=146  ;    
      Data[197]=7  ;
      Data[198]=250  ;    
      Data[199]=230  ;
      
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

