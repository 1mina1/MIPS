// FILE NAME: Control_Unit.v
// TYPE: module
// DEPARTMENT: communication and electronics department
// AUTHOR: Mina Hanna
// AUTHOR EMAIL: mina.hannaone@gmail.com
//------------------------------------------------
// Release history
// VERSION DATE AUTHOR DESCRIPTION
// 1.0 10/7/2022 Mina Hanna final version
//------------------------------------------------
// KEYWORDS: control unit, controller, mips
//------------------------------------------------
// PURPOSE: the control unit of the 32 bit mips\
///////////////defining input and output ports//////////
module Control_Unit (
  input     wire     [5:0]      ControlUnit_Opcode,
  input     wire     [5:0]      ControlUnit_Funct,
  output    wire                ControlUnit_MemtoReg,
  output    wire                ControlUnit_MemWrite,
  output    wire                ControlUnit_Branch,
  output    wire                ControlUnit_ALUSrc,
  output    wire                ControlUnit_RegDst,
  output    wire                ControlUnit_RegWrite,
  output    wire                ControlUnit_Jump,
  output    wire     [2:0]      ControlUnit_ALUControl);
  
  wire    [1:0]    ALUOp;
  /////////////////Designs instantiations////////////////
  Main_Decoder U_Main_Decoder (
  .MainDecoder_Opcode(ControlUnit_Opcode),
  .MainDecoder_MemtoReg(ControlUnit_MemtoReg),
  .MainDecoder_MemWrite(ControlUnit_MemWrite),
  .MainDecoder_Branch(ControlUnit_Branch),
  .MainDecoder_ALUSrc(ControlUnit_ALUSrc),
  .MainDecoder_RegDst(ControlUnit_RegDst),
  .MainDecoder_RegWrite(ControlUnit_RegWrite),
  .MainDecoder_Jump(ControlUnit_Jump),
  .MainDecoder_ALUOp(ALUOp));
  
  ALU_Decoder U_ALU_Decoder (
  .Decoder_ALUOp(ALUOp),
  .Decoder_Funct(ControlUnit_Funct),
  .Decoder_Control(ControlUnit_ALUControl));
  
endmodule