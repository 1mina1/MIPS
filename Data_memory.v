// FILE NAME: Data_memory.v
// TYPE: module
// DEPARTMENT: communication and electronics department
// AUTHOR: Mina Hanna
// AUTHOR EMAIL: mina.hannaone@gmail.com
//------------------------------------------------
// Release history
// VERSION DATE AUTHOR DESCRIPTION
// 1.0 10/7/2022 Mina Hanna final version
//------------------------------------------------
// KEYWORDS: Data memory, RAM
//------------------------------------------------
// PURPOSE: this is the Data memory for the 32 bit mips\
///////////inputs and outputs ports declaration//////////////
module Data_memory #( parameter WIDTH = 32, parameter DEPTH =100) (
  input    wire    [WIDTH-1:0]    DataMemory_A,
  input    wire    [WIDTH-1:0]    DataMemory_WD,
  input    wire                   DataMemory_WE,
  input    wire                   DataMemory_CLK,
  input    wire                   DataMemory_RST,
  output   wire    [WIDTH-1:0]    DataMemory_RD,
  output   wire    [WIDTH-1:0]    test);
  
  reg    [WIDTH-1:0]    Dmem    [DEPTH-1:0];
  integer               i;
  //////////////////sequentional block/////////////////
  always@(posedge DataMemory_CLK or negedge DataMemory_RST)
  begin
    if(!DataMemory_RST)
      begin
        for(i=0;i<DEPTH;i=i+1)
          Dmem[i] <= 'b0;
      end
    else if(DataMemory_WE)
      Dmem[DataMemory_A] <= DataMemory_WD;
  end
  //////////////////combinational logic///////////////
  assign DataMemory_RD = Dmem[DataMemory_A];
  assign test = Dmem[84];
endmodule