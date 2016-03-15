`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:13:39 12/22/2015 
// Design Name: 
// Module Name:    tem 
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
module tem(
                    input clk,
                    output reg sample_en,
                    input data_rdy,
                    input [7:0] temperature,
                    input [7:0] humidity,
						  
						  input TxD_busy,
						  output reg Tx_start,
						  output reg [7:0] TxD_data
                   ); 

reg [3:0] state = 0;
reg [26:0] power_up_cnt = 0; 

always @(posedge clk)               
begin                               
   case(state)                      
     0  :      begin
                  power_up_cnt <= power_up_cnt + 1;
                  if(power_up_cnt[26])      //�ȴ�1s����ʱ��	  
						  begin
						     power_up_cnt <= 0;
							  state <= 1;
						  end
					end
	  1  :	   begin
                  sample_en <= 0;
						power_up_cnt <= power_up_cnt + 1;
                  if(power_up_cnt[26])      //ÿ��1s�ɼ�һ���¡�ʪ��  
						  begin
						     power_up_cnt <= 0;
							  sample_en <= 1;
						  end
						state <= 1;  
					end
	  default:  state <= 0;	
   endcase       
end 	  


reg [2:0] send_state = 0;			
always @(posedge clk)               
begin                               	
   case(send_state)                      
     0  :      begin
	               Tx_start <= 0;
						if(data_rdy)
						  begin
						     Tx_start <= 1;
							  TxD_data  <= temperature;
							  send_state <= 1;
						  end
				   end
	  1  :      begin
	               Tx_start <= 0;				
                  send_state <= 2;
					end
	  2  :		begin			
                  send_state <= 3;
					end
	  3  :		begin
	               if(~TxD_busy)			
                     send_state <= 4;
					end			
	  4  :      begin
	               Tx_start <= 1;
						TxD_data  <= humidity;
						send_state <= 5;
					end
	  5  :      begin
	               Tx_start <= 0;				
                  send_state <= 6;
					end
	  6  :		begin			
                  send_state <= 7;
					end
	  7  :		begin
	               if(~TxD_busy)			
                     send_state <= 0;
					end
	  default:  send_state <= 0;	
   endcase       
end 




endmodule
