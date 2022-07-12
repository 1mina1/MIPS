// FILE NAME: MUX.v
// TYPE: module
// DEPARTMENT: communication and electronics department
// AUTHOR: Mina Hanna
// AUTHOR EMAIL: mina.hannaone@gmail.com
//------------------------------------------------
// Release history
// VERSION DATE AUTHOR DESCRIPTION
// 1.0 10/7/2022 Mina Hanna final version
//------------------------------------------------
// KEYWORDS: mux, 2x1 mux
//------------------------------------------------
// PURPOSE: a 2x1 multiplexer\
///////////////defining input and output ports//////////
module MUX #(parameter WIDTH = 32) (
  input    wire    [WIDTH-1:0]    MUX_IN1,
  input    wire    [WIDTH-1:0]    MUX_IN2,
  input    wire                   MUX_SelectionBit,
  output   reg     [WIDTH-1:0]    MUX_OUT);
  
  ///////////////combinational logic//////////////
  always@(*)
  begin
    case(MUX_SelectionBit)
      1'b0    : begin
                 MUX_OUT = MUX_IN1;
                end
      1'b1    : begin
                 MUX_OUT = MUX_IN2;
                end
      default : begin
                 MUX_OUT = MUX_IN1;
                end
    endcase
  end
endmodule