// FILE NAME: Data_Path.v
// TYPE: module
// DEPARTMENT: communication and electronics department
// AUTHOR: Mina Hanna
// AUTHOR EMAIL: mina.hannaone@gmail.com
//------------------------------------------------
// Release history
// VERSION DATE AUTHOR DESCRIPTION
// 1.0 10/7/2022 Mina Hanna final version
//------------------------------------------------
// KEYWORDS: data path, mips 
//------------------------------------------------
// PURPOSE: this the data path for the 32 bit mips containing every module excep the control unit and the data and instruction memory\
///////////////defining input and output ports//////////
module Data_Path (
  input    wire    [31:0]    DataPath_Instr,
  input    wire    [31:0]    DataPath_ReadData,
  input    wire    [2:0]     DataPath_ALUControl,
  input    wire              DataPath_MemtoReg,
  input    wire              DataPath_MemWrite,
  input    wire              DataPath_PCSrc,
  input    wire              DataPath_ALUSrc,
  input    wire              DataPath_RegDst,
  input    wire              DataPath_RegWrite,
  input    wire              DataPath_Jump,
  input    wire              DataPath_CLK,
  input    wire              DataPath_RST,
  output   wire    [31:0]    DataPath_ALUOUT,
  output   wire    [31:0]    DataPath_WriteData,
  output   wire              DataPath_Zero,
  output   wire    [31:0]    DataPath_PC);
  
  wire    [31:0]    srca;
  wire    [31:0]    srcb;
  wire    [31:0]    SignImm;
  wire    [31:0]    RESULT;
  wire    [31:0]    PCDASH;
  wire    [31:0]    PCDASH2;
  wire    [31:0]    PCPLUS4;
  wire    [31:0]    PCBRANCH;
  wire    [31:0]    SignImmSLT;
  wire    [27:0]    InstrSLT;
  wire    [4:0]     WriteReg;
  //////////////////////design instantiations///////////////////
  Register_File #(.ADDR_Nbits(5) , .DEPTH(100)) U0_Register_File (//register file
  .RegisterFile_A1(DataPath_Instr[25:21]),
  .RegisterFile_A2(DataPath_Instr[20:16]),
  .RegisterFile_A3(WriteReg),
  .RegisterFile_WD3(RESULT),
  .RegisterFile_WE3(DataPath_RegWrite),
  .RegisterFile_CLK(DataPath_CLK),
  .RegisterFile_RST(DataPath_RST),
  .RegisterFile_RD1(srca),
  .RegisterFile_RD2(DataPath_WriteData));
  
  Sign_Extend U0_Sign_Extend (
  .SignExtend_in(DataPath_Instr[15:0]),
  .SignExtend_out(SignImm));
  
  ALU #(.WIDTH(32)) U0_ALU (
  .ALU_srca(srca),
  .ALU_srcb(srcb),
  .Control(DataPath_ALUControl),
  .ALU_out(DataPath_ALUOUT),
  .ALU_Zero(DataPath_Zero));
  
  ProgramCounter U0_ProgramCounter (
  .PC_IN(PCDASH),
  .PC_RST(DataPath_RST),
  .PC_CLK(DataPath_CLK),
  .PC_OUT(DataPath_PC));
  
  Adder #(.WIDTH(32)) U0_ADDER (
  .Adder_IN1(DataPath_PC),
  .Adder_IN2(32'd4),
  .Adder_OUT(PCPLUS4));
  
  Adder #(.WIDTH(32)) U1_ADDER (
  .Adder_IN1(SignImmSLT),
  .Adder_IN2(PCPLUS4),
  .Adder_OUT(PCBRANCH));
  
  MUX #(.WIDTH(32)) U0_MUX (//for alu srcb
  .MUX_IN1(DataPath_WriteData),
  .MUX_IN2(SignImm),
  .MUX_SelectionBit(DataPath_ALUSrc),
  .MUX_OUT(srcb));
  
  MUX #(.WIDTH(5)) U1_MUX (// for use in A3 in register file
  .MUX_IN1(DataPath_Instr[20:16]),
  .MUX_IN2(DataPath_Instr[15:11]),
  .MUX_SelectionBit(DataPath_RegDst),
  .MUX_OUT(WriteReg));
  
  MUX #(.WIDTH(32)) U2_MUX (// to choose between alu result or reading data
  .MUX_IN1(DataPath_ALUOUT),
  .MUX_IN2(DataPath_ReadData),
  .MUX_SelectionBit(DataPath_MemtoReg),
  .MUX_OUT(RESULT));
  
  MUX #(.WIDTH(32)) U3_MUX (// used at pc to branch if equal or not
  .MUX_IN1(PCPLUS4),
  .MUX_IN2(PCBRANCH),
  .MUX_SelectionBit(DataPath_PCSrc),
  .MUX_OUT(PCDASH2));
  
  MUX #(.WIDTH(32)) U4_MUX (// used at pc to jump or not
  .MUX_IN1(PCDASH2),
  .MUX_IN2({ PCPLUS4[31:28] , InstrSLT }),
  .MUX_SelectionBit(DataPath_Jump),
  .MUX_OUT(PCDASH));
  
  Shift_LeftTwice #(.WIDTH(32)) U0_Shift_LeftTwice (
  .SLT_in(SignImm),
  .SLT_out(SignImmSLT));
  
  Shift_LeftTwice #(.WIDTH(26)) U1_Shift_LeftTwice (
  .SLT_in(DataPath_Instr[25:0]),
  .SLT_out(InstrSLT));
endmodule
