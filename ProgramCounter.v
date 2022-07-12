// FILE NAME: ProgramCounter.v
// TYPE: module
// DEPARTMENT: communication and electronics department
// AUTHOR: Mina Hanna
// AUTHOR EMAIL: mina.hannaone@gmail.com
//------------------------------------------------
// Release history
// VERSION DATE AUTHOR DESCRIPTION
// 1.0 10/7/2022 Mina Hanna final version
//------------------------------------------------
// KEYWORDS: PC,program counter
//------------------------------------------------
// PURPOSE: program counter for the 32 bit mips\
///////////////defining input and output ports//////////
module ProgramCounter (
  input    wire    [31:0]    PC_IN,
  input    wire              PC_RST,
  input    wire              PC_CLK,
  output   reg     [31:0]    PC_OUT);
  
  ///////////////PC sequential logic/////////////
  
  always@(posedge PC_CLK or negedge PC_RST)
  begin
    if(!PC_RST)
      begin
        PC_OUT <= 32'b0 ;
      end
    else
      begin
        PC_OUT <= PC_IN ;
      end
  end
  
endmodule