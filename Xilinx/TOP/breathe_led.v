`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:23:59 12/22/2015 
// Design Name: 
// Module Name:    breathe_led 
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
module breathe_led
(
input   clk,
input    en,
output reg[15:0]  led
);
parameter FREQUENCE=75_000_000; //���Ĭ��ֵ�ǻ���50MHZ��ϵͳʱ�����õ�,�������ô˺�����ģ���ʱ��,
         //  ������Ҫ����ֵ��Ϊ���ӵ�clk�˿��ϵ�ʵ��Ƶ��ֵ����(����ʹ�ú���һ�ε�ʱ��Ϊ2s),�������в���������Ķ�; 
         //  �����ӿ�����ٶ�,�ɼ�С��ֵ,��֮�����ֵ

parameter  WIDTH=9;
reg [WIDTH:0] state0;
reg [WIDTH-1:0] state1;

//=============================================
//����ÿ��ռ�ձȵĳ���ʱ��
//=============================================
reg [31:0] cnt0;
always @ (posedge clk)
begin
if(cnt0==(FREQUENCE/(2**WIDTH)))
  begin
   cnt0<=0;
   state0<=state0+1'b1;
  end
else
  begin
   cnt0<=cnt0+1'b1;
  end
end

//=============================================
//����ռ�ձ��������С
//=============================================
always @ (posedge clk)
begin
if(state0[WIDTH])
  state1<=state0[WIDTH-1:0];
else
  state1<=~state0[WIDTH-1:0]; 
end

//=============================================
//������state1���д�С�Ƚϵļ�����cnt1
//=============================================
wire [WIDTH-1:0] time_over;
assign time_over={WIDTH{1'b1}};
reg [WIDTH-1:0] cnt1;
always @ (posedge clk)
begin 
if(cnt1==time_over)
  begin
   cnt1<=0;
  end
else
  begin
   cnt1<=cnt1+1'b1;
  end
end

//=============================================
//������cnt1��state1���д�С�Ƚ�,��ʹled�����ռ�ձ�ʵ�ֽ���
//=============================================
always @ (posedge clk or negedge en)
if(!en)
	led<=16'b0000_0000_0000_0000;
else begin
if((cnt1)<=state1) //��ʵд��if(cnt1<=state1)����ʵ��led�Ľ����뽥��,��Ϊ����ʵ��ģ�������(�ɲο��ֻ��ϵĺ�����),
         //�ڴ�������time_over/3�����,��Ϊ��ʹled����һ��֮�󱣳�1/3ʱ���Ϩ��״̬
  led<=16'b0000_0000_0000_0000;  //led��; ���led�ߵ�ƽ��,�˴���Ϊled<=1;
else
  led<=16'b1111_1111_1111_1111;  //led��; ���led�͵�ƽ��,�˴���Ϊled<=0;
end
endmodule
