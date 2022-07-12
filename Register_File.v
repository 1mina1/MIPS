// FILE NAME: Register_File.v
// TYPE: module
// DEPARTMENT: communication and electronics department
// AUTHOR: Mina Hanna
// AUTHOR EMAIL: mina.hannaone@gmail.com
//------------------------------------------------
// Release history
// VERSION DATE AUTHOR DESCRIPTION
// 1.0 10/7/2022 Mina Hanna final version
//------------------------------------------------
// KEYWORDS: Register file, Register memory
//------------------------------------------------
// PURPOSE: this is the register memory for the 32 bit mips\
///////////inputs and outputs ports declaration//////////////
module Register_File #( parameter ADDR_Nbits =5 , parameter DEPTH = 100  ) (
  input    wire    [ADDR_Nbits-1:0]          RegisterFile_A1,
  input    wire    [ADDR_Nbits-1:0]          RegisterFile_A2,
  input    wire    [ADDR_Nbits-1:0]          RegisterFile_A3,
  input    wire    [2**(ADDR_Nbits)-1:0]     RegisterFile_WD3,
  input    wire                              RegisterFile_WE3,
  input    wire                              RegisterFile_CLK,
  input    wire                              RegisterFile_RST,
  output   wire    [2**(ADDR_Nbits)-1:0]     RegisterFile_RD1,
  output   wire    [2**(ADDR_Nbits)-1:0]     RegisterFile_RD2);
  
  reg    [2**(ADDR_Nbits)-1:0]    Rmem    [DEPTH-1:0];
  integer                       i;
  ////////////////////sequential block///////////////////
  always@(posedge RegisterFile_CLK or negedge RegisterFile_RST)
  begin
    if(!RegisterFile_RST)
      begin
        for(i=0;i<DEPTH;i=i+1)
        begin
          Rmem[i] <= 'b0;
        end
      end
    else if(RegisterFile_WE3)
      Rmem[RegisterFile_A3] <= RegisterFile_WD3;
  end
  ////////////////combinational logic///////////////////
  assign RegisterFile_RD1 = Rmem[RegisterFile_A1];
  assign RegisterFile_RD2 = Rmem[RegisterFile_A2];
endmodule