// FILE NAME: Mips_Top_tb.v
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
// PURPOSE: this is a testbench for the top module of 32 bits single cycle mips\
`timescale 1ns/1ns
module Mips_Top_tb ();
 ///////////////////testbench signals////////////////
 reg               CLK_tb;
 reg               RST_tb;
 wire    [31:0]    testOut_tb;
 ////////////////////initial block///////////////////////
  initial 
   begin
  // Save Waveform
   $dumpfile("Mips_Top.vcd") ;       
   $dumpvars;
  // initialization
   CLK_tb = 1'b0;
   RST_tb = 1'b0;
   #3
   RST_tb = 1'b1;
   #300
   $finish;
 end
 ///////////////////clock generation////////////////////
  always #5 CLK_tb = !CLK_tb;//for 100Mhz clock
 /////////////////// DUT Instantation ///////////////////
 Mips_Top DUT (
 .CLK(CLK_tb),
 .RST(RST_tb),
 .testOut(testOut_tb));
endmodule