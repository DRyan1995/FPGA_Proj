module wifi_connect(txd_in,rxd_in,txd_out,rxd_out
    );
	 output rxd_in;
	 input txd_in;
	 input rxd_out;
	 output txd_out;
	 
	 assign rxd_in=rxd_out;
	 
	 assign txd_out=txd_in;
	 


endmodule
