// FILE NAME: ALU_Decoder.v
// TYPE: module
// DEPARTMENT: communication and electronics department
// AUTHOR: Mina Hanna
// AUTHOR EMAIL: mina.hannaone@gmail.com
//------------------------------------------------
// Release history
// VERSION DATE AUTHOR DESCRIPTION
// 1.0 10/7/2022 Mina Hanna final version
//------------------------------------------------
// KEYWORDS: ALU decoder, arithmetic control unit, 32 bits alu controller
//------------------------------------------------
// PURPOSE: ALU Decoder enabled by the main decoder for the 32 bit mips\
///////////////defining input and output ports//////////
module ALU_Decoder (
  input     wire     [1:0]     Decoder_ALUOp,
  input     wire     [5:0]     Decoder_Funct,
  output    reg      [2:0]     Decoder_Control);
////////////////////combinational logic/////////////////  
  always@(*)
  begin
    case(Decoder_ALUOp)
      2'b00            : begin
                          Decoder_Control = 3'b010;
                         end
      2'b01            : begin
                          Decoder_Control = 3'b100;
                         end
      2'b10            : begin
                          case(Decoder_Funct)
                            6'b100000 : begin
                                         Decoder_Control = 3'b010;
                                        end
                            6'b100010 : begin
                                         Decoder_Control = 3'b100;
                                        end
                            6'b100100 : begin
                                         Decoder_Control = 3'b000;
                                        end
                            6'b100101 : begin
                                         Decoder_Control = 3'b001;
                                        end
                            6'b101010 : begin
                                         Decoder_Control = 3'b110;
                                        end
                            6'b011100 : begin
                                         Decoder_Control = 3'b101;
                                        end
                            default   : begin
                                         Decoder_Control = 3'b010;
                                        end
                          endcase
                         end
      default          : begin
                          Decoder_Control = 3'b010;
                         end
    endcase
  end
endmodule