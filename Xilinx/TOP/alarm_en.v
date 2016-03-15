`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:47:13 12/23/2015 
// Design Name: 
// Module Name:    alarm_en 
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
module alarm_en(

		 key_in,
		 alarm_en
    );

	input key_in;
	output alarm_en;
	
	
	assign alarm_en = key_in;

endmodule
