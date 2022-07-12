// FILE NAME: Main_Decoder.v
// TYPE: module
// DEPARTMENT: communication and electronics department
// AUTHOR: Mina Hanna
// AUTHOR EMAIL: mina.hannaone@gmail.com
//------------------------------------------------
// Release history
// VERSION DATE AUTHOR DESCRIPTION
// 1.0 10/7/2022 Mina Hanna final version
//------------------------------------------------
// KEYWORDS: main decoder, control unit
//------------------------------------------------
// PURPOSE: main decoder of the control unit of the 32 bit mips\
///////////////defining input and output ports//////////
module Main_Decoder (
  input     wire     [5:0]     MainDecoder_Opcode,
  output    reg                MainDecoder_MemtoReg,
  output    reg                MainDecoder_MemWrite,
  output    reg                MainDecoder_Branch,
  output    reg                MainDecoder_ALUSrc,
  output    reg                MainDecoder_RegDst,
  output    reg                MainDecoder_RegWrite,
  output    reg                MainDecoder_Jump,
  output    reg      [1:0]     MainDecoder_ALUOp);
  
  ////////////////combinational logic//////////////////
  always@(*)
  begin
    case(MainDecoder_Opcode)
      6'b100011 : begin//Load Word
                  MainDecoder_MemtoReg = 1'b1;
                  MainDecoder_MemWrite = 1'b0;
                  MainDecoder_Branch   = 1'b0;
                  MainDecoder_ALUSrc   = 1'b1;
                  MainDecoder_RegDst   = 1'b0;
                  MainDecoder_RegWrite = 1'b1;
                  MainDecoder_Jump     = 1'b0;
                  MainDecoder_ALUOp    = 2'b00;
                  end
      6'b101011 : begin//store WORD
                  MainDecoder_MemtoReg = 1'b1;
                  MainDecoder_MemWrite = 1'b1;
                  MainDecoder_Branch   = 1'b0;
                  MainDecoder_ALUSrc   = 1'b1;
                  MainDecoder_RegDst   = 1'b0;
                  MainDecoder_RegWrite = 1'b0;
                  MainDecoder_Jump     = 1'b0;
                  MainDecoder_ALUOp    = 2'b00;
                  end
      6'b000000 : begin//rtype
                  MainDecoder_MemtoReg = 1'b0;
                  MainDecoder_MemWrite = 1'b0;
                  MainDecoder_Branch   = 1'b0;
                  MainDecoder_ALUSrc   = 1'b0;
                  MainDecoder_RegDst   = 1'b1;
                  MainDecoder_RegWrite = 1'b1;
                  MainDecoder_Jump     = 1'b0;
                  MainDecoder_ALUOp    = 2'b10;
                  end
      6'b001000 : begin//add immediate
                  MainDecoder_MemtoReg = 1'b0;
                  MainDecoder_MemWrite = 1'b0;
                  MainDecoder_Branch   = 1'b0;
                  MainDecoder_ALUSrc   = 1'b1;
                  MainDecoder_RegDst   = 1'b0;
                  MainDecoder_RegWrite = 1'b1;
                  MainDecoder_Jump     = 1'b0;
                  MainDecoder_ALUOp    = 2'b00;
                  end
      6'b000100 : begin//branch if equal
                  MainDecoder_MemtoReg = 1'b0;
                  MainDecoder_MemWrite = 1'b0;
                  MainDecoder_Branch   = 1'b1;
                  MainDecoder_ALUSrc   = 1'b0;
                  MainDecoder_RegDst   = 1'b0;
                  MainDecoder_RegWrite = 1'b0;
                  MainDecoder_Jump     = 1'b0;
                  MainDecoder_ALUOp    = 2'b01;
                  end
      6'b000010 : begin//jump instruction
                  MainDecoder_MemtoReg = 1'b0;
                  MainDecoder_MemWrite = 1'b0;
                  MainDecoder_Branch   = 1'b0;
                  MainDecoder_ALUSrc   = 1'b0;
                  MainDecoder_RegDst   = 1'b0;
                  MainDecoder_RegWrite = 1'b0;
                  MainDecoder_Jump     = 1'b1;
                  MainDecoder_ALUOp    = 2'b00;
                  end
      default   : begin
                  MainDecoder_MemtoReg = 1'b0;
                  MainDecoder_MemWrite = 1'b0;
                  MainDecoder_Branch   = 1'b0;
                  MainDecoder_ALUSrc   = 1'b0;
                  MainDecoder_RegDst   = 1'b0;
                  MainDecoder_RegWrite = 1'b0;
                  MainDecoder_Jump     = 1'b0;
                  MainDecoder_ALUOp    = 2'b00;
                  end
    endcase
  end
endmodule