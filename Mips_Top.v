// FILE NAME: Mips_Top.v
// TYPE: module
// DEPARTMENT: communication and electronics department
// AUTHOR: Mina Hanna
// AUTHOR EMAIL: mina.hannaone@gmail.com
//------------------------------------------------
// Release history
// VERSION DATE AUTHOR DESCRIPTION
// 1.0 10/7/2022 Mina Hanna final version
//------------------------------------------------
// KEYWORDS: mips, single cycle mips 
//------------------------------------------------
// PURPOSE: this the top module of 32 bits single cycle mips\
///////////////defining input and output ports//////////
module Mips_Top (
  input     wire              CLK,
  input     wire              RST,
  output    wire    [31:0]    testOut );
  
  wire    [31:0]    PC;
  wire    [31:0]    Instr;
  wire    [31:0]    ALUOUT;
  wire    [31:0]    WriteData;
  wire    [2:0]     ALUControl;
  wire              MemtoReg;
  wire              MemWrite;
  wire              Branch;
  wire              ALUSrc;
  wire              RegDst;
  wire              RegWrite;
  wire              Jump;
  wire              Zero;
  wire    [31:0]    ReadData;
  ///////////////////design instantiations//////////////////
  Data_Path U0_Data_Path (
  .DataPath_Instr(Instr),
  .DataPath_ReadData(ReadData),
  .DataPath_ALUControl(ALUControl),
  .DataPath_MemtoReg(MemtoReg),
  .DataPath_MemWrite(MemWrite),
  .DataPath_PCSrc(Zero & Branch),
  .DataPath_ALUSrc(ALUSrc),
  .DataPath_RegDst(RegDst),
  .DataPath_RegWrite(RegWrite),
  .DataPath_Jump(Jump),
  .DataPath_CLK(CLK),
  .DataPath_RST(RST),
  .DataPath_ALUOUT(ALUOUT),
  .DataPath_WriteData(WriteData),
  .DataPath_Zero(Zero),
  .DataPath_PC(PC));
  
  Control_Unit U0_Control_Unit (
  .ControlUnit_Opcode(Instr[31:26]),
  .ControlUnit_Funct(Instr[5:0]),
  .ControlUnit_MemtoReg(MemtoReg),
  .ControlUnit_MemWrite(MemWrite),
  .ControlUnit_Branch(Branch),
  .ControlUnit_ALUSrc(ALUSrc),
  .ControlUnit_RegDst(RegDst),
  .ControlUnit_RegWrite(RegWrite),
  .ControlUnit_Jump(Jump),
  .ControlUnit_ALUControl(ALUControl));
  
  Instruction_memory #(.WIDTH(32) , .DEPTH(100)) U0_Instruction_memory (
  .InstructionMemory_PC(PC),
  .InstructionMemory_OUT(Instr));
  
  Data_memory #(.WIDTH(32) , .DEPTH(100)) U0_Data_memory (
  .DataMemory_A(ALUOUT),
  .DataMemory_WD(WriteData),
  .DataMemory_WE(MemWrite),
  .DataMemory_CLK(CLK),
  .DataMemory_RST(RST),
  .DataMemory_RD(ReadData),
  .test(testOut));
endmodule