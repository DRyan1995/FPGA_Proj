`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:16:02 12/23/2015 
// Design Name: 
// Module Name:    wifi_inout 
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
module wifi_inout(txd_in,rxd_in,txd_out,rxd_out
    );
	 inout rxd_in;
	 inout txd_in;
	 inout rxd_out;
	 inout txd_out;
	 
	 assign rxd_in=rxd_out;
	 
	 assign txd_out=txd_in;
	 


endmodule
