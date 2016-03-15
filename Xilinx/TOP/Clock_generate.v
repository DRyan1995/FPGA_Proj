`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:41:28 12/23/2015 
// Design Name: 
// Module Name:    Clock_generate 
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
module Clock_generate(
					input clk_100M,
					output reg clk_50M_1,
					output reg clk_50M_2
    );

    reg counter ;

    always @(posedge clk_100M)
    	begin
    		counter <= counter + 1;
    		if(counter)
    			begin
    				clk_50M_1 <= 1'b0;
    				clk_50M_2 <= 1'b0;
    			end
    		else 
    			begin
    				clk_50M_1 <= 1'b1;
    				clk_50M_2 <= 1'b1;
    			end


    	end



endmodule
