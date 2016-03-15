module LED_BUFFER(
				clk,//50MHZ clock
				rst,
				mode,
				led_out,
				buffer_out
	);


	input clk;
	input rst;
	input [1:0]mode;//00:off 01:welcome 11:alarm
	output [17:0]led_out;
	output buffer_out;

	reg [17:0]led_out;
	reg buffer_out;

	reg [26:0]counter;

	parameter TIME_100ms = 27'd5_000_000;
	always @(posedge clk or negedge rst) begin
		if (!rst) 
		begin
			counter <= 27'd0;
			buffer_out <= 1'b0;
			if(mode == 2'b01)
			begin
				led_out <= 1'b1;

			end
				
			else begin
				led_out <= 18'b0;
			end
		end
		else if (counter == TIME_100ms) 
		begin
			if(mode == 2'b00)
				begin
					led_out <= 18'b0;
					buffer_out <= 1'b0;
				end
			else if (mode == 2'b01) 
			begin
				led_out <= led_out + 11'd1000;
				buffer_out <= ~buffer_out;
			end
			else 
			begin
				led_out <= ~led_out;
				buffer_out <= 1'b1;
			end
			counter <= 27'd0;
		end
		else 
			counter <= counter + 1'b1;
	end





endmodule