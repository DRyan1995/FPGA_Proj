module breathe_led
(
input   clk,
input    en,
output reg[7:0]  led
);
parameter FREQUENCE=75_000_000; //★此默认值是基于50MHZ的系统时钟设置的,当您调用此呼吸灯模块的时候,
         //  仅仅需要将此值改为连接到clk端口上的实际频率值即可(这样使得呼吸一次的时间为2s),以下所有参数均不需改动; 
         //  如果想加快呼吸速度,可减小此值,反之增大此值

parameter  WIDTH=9;
reg [WIDTH:0] state0;
reg [WIDTH-1:0] state1;

//=============================================
//控制每个占空比的持续时间
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
//控制占空比增大与减小
//=============================================
always @ (posedge clk)
begin
if(state0[WIDTH])
  state1<=state0[WIDTH-1:0];
else
  state1<=~state0[WIDTH-1:0]; 
end

//=============================================
//生成与state1进行大小比较的计数器cnt1
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
//计数器cnt1与state1进行大小比较,以使led脉冲的占空比实现渐变
//=============================================
always @ (posedge clk or negedge en)
if(!en)
	led<=8'b0000_0000;
else begin
if((cnt1)<=state1) //其实写成if(cnt1<=state1)即可实现led的渐亮与渐灭,但为了真实的模拟呼吸灯(可参考手机上的呼吸灯),
         //在此增加了time_over/3这个量,是为了使led呼吸一次之后保持1/3时间的熄灭状态
  led<=8'b0000_0000;  //led亮; 如果led高电平亮,此处改为led<=1;
else
  led<=8'b1111_1111;  //led灭; 如果led低电平灭,此处改为led<=0;
end
endmodule