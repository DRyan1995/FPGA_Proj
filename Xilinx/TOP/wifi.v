`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:33:36 12/22/2015 
// Design Name: 
// Module Name:    wifi 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module wifi(txd_in,rxd_in,txd_out,rxd_out
    );
	 output rxd_in;
	 input txd_in;
	 input rxd_out;
	 output txd_out;
	 
	 assign rxd_in=rxd_out;
	 
	 assign txd_out=txd_in;
	 


endmodule
