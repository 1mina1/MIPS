// FILE NAME: Sign_Extend.v
// TYPE: module
// DEPARTMENT: communication and electronics department
// AUTHOR: Mina Hanna
// AUTHOR EMAIL: mina.hannaone@gmail.com
//------------------------------------------------
// Release history
// VERSION DATE AUTHOR DESCRIPTION
// 1.0 10/7/2022 Mina Hanna final version
//------------------------------------------------
// KEYWORDS: sign extend, immediate value,mips
//------------------------------------------------
// PURPOSE: sign extend for immediate values in mips\
///////////////defining input and output ports//////////
module Sign_Extend (
  input      wire     [15:0]     SignExtend_in,
  output     wire     [31:0]     SignExtend_out);
  ////////////////combinational logic////////////////
  assign SignExtend_out = { {16{SignExtend_in[15]}} , SignExtend_in };
  
endmodule

