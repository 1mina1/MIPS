// FILE NAME: Adder.v
// TYPE: module
// DEPARTMENT: communication and electronics department
// AUTHOR: Mina Hanna
// AUTHOR EMAIL: mina.hannaone@gmail.com
//------------------------------------------------
// Release history
// VERSION DATE AUTHOR DESCRIPTION
// 1.0 10/7/2022 Mina Hanna final version
//------------------------------------------------
// KEYWORDS: adder, pc adder , incrementing pc
//------------------------------------------------
// PURPOSE: adder to increment pc in the mips\
///////////////defining input and output ports//////////
module Adder #( parameter WIDTH = 32) (
  input    wire    [WIDTH-1:0]    Adder_IN1,
  input    wire    [WIDTH-1:0]    Adder_IN2,
  output   wire    [WIDTH-1:0]    Adder_OUT);
  //////////////////combinational logic///////////////
  
  assign Adder_OUT = Adder_IN1 + Adder_IN2;
endmodule
