// FILE NAME: Shift_LeftTwice.v
// TYPE: module
// DEPARTMENT: communication and electronics department
// AUTHOR: Mina Hanna
// AUTHOR EMAIL: mina.hannaone@gmail.com
//------------------------------------------------
// Release history
// VERSION DATE AUTHOR DESCRIPTION
// 1.0 10/7/2022 Mina Hanna final version
//------------------------------------------------
// KEYWORDS: shift left twice, multiply by 4
//------------------------------------------------
// PURPOSE: parameterized shift left twice as we need two versions in mips\
///////////////defining input and output ports//////////
module Shift_LeftTwice #(parameter WIDTH =25)(
  input      wire     [WIDTH-1:0]                           SLT_in,
  output     wire     [((WIDTH+2)>32?32:(WIDTH+2))-1:0]     SLT_out);
  
  assign SLT_out = SLT_in<<2;
  
endmodule