`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:18:45 12/22/2015 
// Design Name: 
// Module Name:    DHT11_top 
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
module   DHT11_top(                                                          
                    input clk,                                                                                      
                    inout data,
						  output TxD
                   );                                                        
 
 
 
wire [7:0] temperature;	
wire [7:0] humidity;    
wire [7:0] TxD_data; 
DHT11_opera DHT11_opera_inst(                                                
                             .clk(clk),                                      
                             .sample_en(sample_en),                          
                             .data(data),                                    
                             .data_rdy(data_rdy),                            
                             .temperature(temperature),                      
                             .humidity(humidity)                             
                            );                                               
                                                                             
                                                                             
DHT11_cmd   DHT11_cmd_inst(                                                  
                           .clk(clk),                                        
                           .sample_en(sample_en),                            
                           .data_rdy(data_rdy),                              
                           .temperature(temperature),                        
                           .humidity(humidity),                               
						                                                                 
									.TxD_busy(TxD_busy),                              
									.Tx_start(Tx_start),                              
									.TxD_data(TxD_data)                                 
                          );                                                 
                                                                             
async_send  async_send_inst(                                                 
                            .clk(clk),                                       
																									 
									 .TxD_start(Tx_start),                            
									 .TxD_data(TxD_data),                             
                            .TxD(TxD),                                       
                            .TxD_busy(TxD_busy)                              
								   );                                                



						 
						 
endmodule	
module   DHT11_cmd(
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

	

	/********************************************************
�������ݣ�ʪ������+ʪ��С�� + �¶����� + �¶�С�� + У��
          ��5*8bit���ȷ��͸�λ
�¶����̣�0--50�ȣ�ֻ��ȡ��8λ����Ϊ���Ƚ�+/-2��
ʪ�����̣�20%--90%			 
			 
*********************************************************/

module DHT11_opera(
                    input clk,
                    input sample_en,
                    inout data,
                    output reg data_rdy,
                    output [7:0] temperature,
                    output [7:0] humidity
                   ); 
 
reg sample_en_tmp1,sample_en_tmp2;                             
always @(posedge clk)                                      
begin                                                                         
   sample_en_tmp1 <=  sample_en;                               
   sample_en_tmp2 <=  sample_en_tmp1;                          
end                                                        
                                                           
wire sample_pulse = (~sample_en_tmp2) & sample_en_tmp1;    


reg data_tmp1,data_tmp2;                                    
always @(posedge clk)                                     
begin                                                     
   data_tmp1 <=  data;                                      
   data_tmp2 <=  data_tmp1;                                 
end                                                       
                                                          
wire data_pulse = (~data_tmp2) & data_tmp1;//rising edge     



////////////////////////////////////////////////////////////
reg [3:0] state = 0;
reg [26:0] power_up_cnt = 0;  //2^26 > 50e6���ʴ���1s

reg [20:0] wait_18ms_cnt = 0;//2^20*20e-9 = 21ms > 18ms
reg [11:0] wait_40us_cnt = 0;

reg [39:0] get_data;
reg [5:0] num = 0;//����5*8
reg data_reg = 1;
reg link = 0;
always @(posedge clk)               
begin                               
   case(state)                      
     0  :      begin
                  link <= 0;
                  data_reg <= 1;//���߿���ʱΪ�ߵ�ƽ
                  power_up_cnt <= power_up_cnt + 1;
                  if(power_up_cnt[26])      //�ȴ�1s����ʱ��
						//if(power_up_cnt[10]) //�����ڷ���
                    begin
                       power_up_cnt <= 0;
                       state <= 1;
                    end
               end                   
     1  :      begin               
                  data_rdy <= 0;
                  if(sample_pulse) //����ת������    
                    begin
                       wait_18ms_cnt <= 0;
                       link <= 1;
                       data_reg <= 0; //������������18ms����
                       state <= 2; 
                    end
               end
     2  :      begin                                                             
                  wait_18ms_cnt <= wait_18ms_cnt + 1;
                  if(wait_18ms_cnt[20])
                    begin
                       wait_18ms_cnt <= 0;
                       wait_40us_cnt <= 0;
                       link <= 0;      //���裬Ȼ��ȴ�Ӧ���ź�
                       data_reg <= 1;
                       state <= 3; 
                    end 
               end      
     3  :      begin                                           
                  wait_40us_cnt <= wait_40us_cnt + 1;  
                  if(wait_40us_cnt[11]) //��ʱ�ȴ�40us  
                    begin                 
                       wait_40us_cnt <= 0; 
                       state <= 4; 
                    end
               end  
     4  :      begin                                                           
                  if(data_pulse) //��Ӧ����       
                    begin                                    
                       get_data <= 40'd0;
                       num <= 0;
                       state <= 5;                           
                    end                                      
               end                                           
     5  :      begin                                    
                  if(data_pulse)   //��һλ�����е������أ���ʱ40us�����Ϊ����Ϊ0������Ϊ1                   
                    begin          //��Ϊ0��Ӧ�ĸߵ�ƽʱ��26us��1��Ӧ�ĸߵ�ƽʱ��70us                     
                       wait_40us_cnt <= 0;
                       state <= 6;                      
                    end                                 
               end
     6  :      begin                                                                          
                  wait_40us_cnt <= wait_40us_cnt + 1;     
                  if(wait_40us_cnt[11]) //��ʱ�ȴ�40us    
                    begin
                       wait_40us_cnt <= 0;
                       num <= num + 1;
                       if(data)
                          get_data <= {get_data[38:0],1'b1};                          
                       else
							     get_data <= {get_data[38:0],1'b0}; 
							  if(num == 39)
								  begin
									  num <= 0;
									  data_rdy <= 1;
									  state <= 1;  
								  end
							  else
								 state <= 5;  								 
                    end      
               end
     default:  state <= 0; 
   endcase       
end 


assign data  = link ? data_reg : 1'bz;
assign humidity    = get_data[39:32];
assign temperature = get_data[23:16];

                  

endmodule    
///////////////////////////////////////////
module async_send(
                  input			   clk,
					   input			   TxD_start,
					   input [7:0]	 TxD_data,					  
                  output reg   TxD,
					   output 		   TxD_busy	  
					  );
					 
				 
parameter Clk_Freq              = 50000000;	//50M
parameter Baud                  = 115200;  //������
parameter BaudGeneAccWidth      = 16;	
reg [BaudGeneAccWidth:0] BaudGeneAcc;	
	                                      /* ������Ϊ�˱��ⳬ��32bit������ */
wire [BaudGeneAccWidth:0] BaudGeneInc = ((Baud<<(BaudGeneAccWidth-4))+(Clk_Freq>>5))/(Clk_Freq>>4);//constant	
wire BaudTick = BaudGeneAcc[BaudGeneAccWidth];	
/**********************************************************************************************************
ʱ�Ӳ���˼�룺���Ƽ�����cnt��0��ʼ������ÿ�ε���step = 3���򾭹�4�����ھͼ�����12������10��������
0 3 6 9 12 5 8 11 4 7 10 3 6 9 12 5 8 11
0 0 0 0 1  0 0 1  0 0 1  0 0 0 1  0 0 1���ڵ���10������ߵ�ƽ
***********************************************************************************************************/

reg [3:0] state;
wire TxD_ready = (state == 0);
assign TxD_busy = ~TxD_ready;	
always @(posedge clk) 
begin
   if(TxD_busy)    
	    BaudGeneAcc <= BaudGeneAcc[BaudGeneAccWidth-1:0] + BaudGeneInc;	
	else if(TxD_start)
       BaudGeneAcc <= {BaudGeneAccWidth{1'b1}};	//Ŀ����ʹ���յ������źź󼴿���������
end	
///////////////////////////	
reg TxD_start_tmp1;
reg TxD_start_tmp2;
always @(posedge clk) 
begin
   TxD_start_tmp1 <= TxD_start;
	TxD_start_tmp2 <= TxD_start_tmp1;
end

wire TxD_start_pulse = (~TxD_start_tmp2) & TxD_start_tmp1;


reg [7:0] TxD_dataReg;
always @(posedge clk) 
begin
   if(TxD_ready & TxD_start_pulse) //TxD_ready is necessary!
	   TxD_dataReg <= TxD_data;
end

//state change part	
always @(posedge clk)
case(state)                                          
	4'd0 : if(TxD_start_pulse) state <= 4'd1;              
	4'd1 : if(BaudTick)  state <= 4'd2;                
	4'd2 : if(BaudTick)  state <= 4'd3;  // start      
	4'd3 : if(BaudTick)  state <= 4'd4;  // bit 0      
	4'd4 : if(BaudTick)  state <= 4'd5;  // bit 1      
	4'd5 : if(BaudTick)  state <= 4'd6;  // bit 2      
	4'd6 : if(BaudTick)  state <= 4'd7;  // bit 3      
	4'd7 : if(BaudTick)  state <= 4'd8;  // bit 4      
	4'd8 : if(BaudTick)  state <= 4'd9;  // bit 5      
	4'd9 : if(BaudTick)  state <= 4'd10; // bit 6      
	4'd10: if(BaudTick)  state <= 4'd11; // bit 7  	
	4'd11: if(BaudTick)  state <= 4'd0;  // stop1            
	default:             state <= 4'd0;            
endcase	                                             

//output part	
reg muxbit;	
always @(posedge clk)
case(state)                                         
	4'd0 :  muxbit <= 1'b1;                           
	4'd1 :  muxbit <= 1'b1;                           
	4'd2 :  muxbit <= 1'b0;            // start          
	4'd3 :  muxbit <= TxD_dataReg[0];  // bit 0       
	4'd4 :  muxbit <= TxD_dataReg[1];  // bit 1       
	4'd5 :  muxbit <= TxD_dataReg[2];  // bit 2       
	4'd6 :  muxbit <= TxD_dataReg[3];  // bit 3       
	4'd7 :  muxbit <= TxD_dataReg[4];  // bit 4       
	4'd8 :  muxbit <= TxD_dataReg[5];  // bit 5       
	4'd9 :  muxbit <= TxD_dataReg[6];  // bit 6       
	4'd10:  muxbit <= TxD_dataReg[7];  // bit 7       
	4'd11:  muxbit <= 1'b1;            // stop1                
	default:muxbit <= 1'b1;                           
endcase	                                   	        

		
always @(posedge clk) 
begin
  	TxD <= muxbit;
end	
	
		
endmodule 			                                           					 