// FILE NAME: ALU.v
// TYPE: module
// DEPARTMENT: communication and electronics department
// AUTHOR: Mina Hanna
// AUTHOR EMAIL: mina.hannaone@gmail.com
//------------------------------------------------
// Release history
// VERSION DATE AUTHOR DESCRIPTION
// 1.0 10/7/2022 Mina Hanna final version
//------------------------------------------------
// KEYWORDS: ALU, arithmetic logic unit, 32 bits alu
//------------------------------------------------
// PURPOSE: ALU for the 32 bit mips\
///////////////defining input and output ports//////////
module ALU #( parameter WIDTH = 32)(
  input    wire    [WIDTH-1:0]    ALU_srca,
  input    wire    [WIDTH-1:0]    ALU_srcb,
  input    wire    [2:0]          Control,
  output   reg     [WIDTH-1:0]    ALU_out,
  output   wire                   ALU_Zero);
  
  ///////////////ALU combinational logic//////////
  always@(*)
  begin
    case(Control)
        3'b000: begin
                 ALU_out = ALU_srca & ALU_srcb;
                end
        3'b001: begin
                 ALU_out = ALU_srca | ALU_srcb;
                end
        3'b010: begin
                 ALU_out = ALU_srca + ALU_srcb;
                end
        3'b100: begin
                 ALU_out = ALU_srca - ALU_srcb;
                end
        3'b101: begin
                 ALU_out = ALU_srca * ALU_srcb;
                end
        3'b110: begin
                 if(ALU_srca < ALU_srcb)
                   begin
                     ALU_out = 'b1;
                   end
                 else
                     ALU_out = 'b0;
                end
        default: begin
                  ALU_out = 'b0;
                end
      endcase
  end

assign ALU_Zero = ~(|ALU_out);
endmodule