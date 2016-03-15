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