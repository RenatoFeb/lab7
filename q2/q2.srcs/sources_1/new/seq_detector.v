`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/01/2024 07:02:30 PM
// Design Name: 
// Module Name: seq_detector
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

module seq_detector(
   input P1,clk,reset, output reg z
);

parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;
reg [1:0] PS,NS;

always@(posedge clk or posedge reset)
   begin
       if(reset)
           PS <= S0;
       else 
           PS <= NS;
   end

always@(PS or P1)
   begin
       case(PS)
           S0 : begin
 
               if (P1)
                   NS = S1;
               else
                   NS = S0;
               end
           S1 : begin
               if (P1)
                   NS = S2;
               else
                   NS = S1;
               end
           S2 : begin
               if (!P1)
                   NS = S3;
               else
                   NS = S0;
               end
           S3 : begin
               if (!P1)
                   NS = S0;
               else
                   NS = S0;
               end
       endcase
   end

always @ (PS)
begin
   case(PS)
       S0 : z = 0;
       S1 : z = 0;
       S2 : z = 0;
       S3 : z = 1;
   endcase
end

endmodule