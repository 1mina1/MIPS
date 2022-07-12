// FILE NAME: Instruction_memory.v
// TYPE: module
// DEPARTMENT: communication and electronics department
// AUTHOR: Mina Hanna
// AUTHOR EMAIL: mina.hannaone@gmail.com
//------------------------------------------------
// Release history
// VERSION DATE AUTHOR DESCRIPTION
// 1.0 10/7/2022 Mina Hanna final version
//------------------------------------------------
// KEYWORDS: instruction memory, ROM ,memory
//------------------------------------------------
// PURPOSE: this is the instruction memory for the 32 bit mips\
///////////inputs and outputs ports declaration//////////////
module Instruction_memory #( parameter WIDTH = 32, parameter DEPTH =100 ) (
  input    wire    [WIDTH-1:0]    InstructionMemory_PC,
  output   wire    [WIDTH-1:0]    InstructionMemory_OUT);
  
  reg    [WIDTH-1:0]   Imem    [DEPTH-1:0];
  
  initial $readmemh("Instructions.txt",Imem);
  
  assign   InstructionMemory_OUT = (InstructionMemory_PC < (WIDTH/8)*DEPTH)?(Imem[InstructionMemory_PC>>2]):'b0;
endmodule