//                              -*- Mode: Verilog -*-
// Filename        : WBOPRT08.v
// Description     : Wishbone Slave 8-bit Behavorial
// Author          : Winefred Washington based on Silicore VHDL model in WISHBONE spec
// Created On      : Thu Jan 11 21:18:41 2001
// Last Modified By: .
// Last Modified On: .
// Update Count    : 0
// Status          : Unknown, Use with caution!

//        Description                   Specification
// General Description:            8-bit SLAVE output port
// Supported cycles:               SLAVE, READ/WRITE
//                                 SLAVE, BLOCK READ/WRITE
//                                 SLAVE, RMW
// Data port, size:                8-bit
// Data port, granularity          8-bit
// Data port, Max. operand size    8-bit
// Data transfer ordering:         Big endian and/or little endian
// Data transfer sequencing:       undefined
//


module WBOPRT08(ACK_O, CLK_I, DAT_I, DAT_O, RST_I, STB_I, WE_I, PRT_O);
   output               ACK_O;
   input 		CLK_I;
   input [7:0] 		DAT_I;
   output [7:0] 	DAT_O;
   input 		RST_I;
   input		STB_I;
   input		WE_I;
   output [7:0] 	PRT_O;
   
   wire 		ACK_O;
   wire [7:0] 		DAT_O;
   wire [7:0] 		PRT_O;
   reg [7:0] 		Q;

   assign 		ACK_O = STB_I;
   assign 		DAT_O = Q;
   assign 		PRT_O = Q;
   
   always @(posedge CLK_I)
     begin
	if (RST_I)
	  Q <= 8'b0000_0000;
	else if (STB_I & WE_I)
	  Q <= DAT_I;
     end
   
endmodule
