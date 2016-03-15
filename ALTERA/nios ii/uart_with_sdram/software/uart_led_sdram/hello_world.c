#include <stdio.h>
#include <IO.h>
#include <system.h>
#include <string.h>
#include <altera_avalon_pio_regs.h>
#include <altera_avalon_uart_regs.h>

unsigned char fifo[6];
void Uart_send(unsigned char data)
{
	alt_u16 status;
	status = IORD_ALTERA_AVALON_UART_STATUS(RS232_BASE);
	while(!(status&0x0040))//waiting the tx_done
	{
		status = IORD_ALTERA_AVALON_UART_STATUS(RS232_BASE);
	}
	IOWR_ALTERA_AVALON_UART_TXDATA(RS232_BASE,data);

}
void Uart_send_n(unsigned char *ptr,unsigned char n)//send rx232
{
	for(;n>0;n--)
	{
		Uart_send(*(ptr++));

	}
}
void movefifo(unsigned char last)
{
	fifo[0]=fifo[1];
	fifo[1]=fifo[2];
	fifo[2]=fifo[3];
	fifo[3]=fifo[4];
	fifo[4]=fifo[5];
	fifo[5]=last;
}
void judge()//decoding the instructions
{
	unsigned char message[30];
	if(fifo[0]=='*'&&fifo[5]=='*')
	{
		if(fifo[1]=='L'&&fifo[2]=='E'&&fifo[3]=='D')
		{
			if(fifo[4]=='0')
			{
				puts("LED OFF!\n");
			}
			else if(fifo[4]=='1')
			{
				puts("LED HELLO!\n");
			}
			else if(fifo[4]=='2')
			{
				puts("LED ALARM!\n");
			}
		}
		else if(fifo[1]=='F'&&fifo[2]=='A'&&fifo[3]=='N')
		{
			if(fifo[4]=='0')
			{
				puts("FAN OFF!\n");
			}
			else if(fifo[4]=='1')
			{
				puts("FAN ON!\n");
			}
		}

		else if(fifo[1]=='T'&&fifo[2]=='E'&&fifo[3]=='M')
		{
			if(fifo[4]=='0')
			{
				puts("Temperature sent!!!\n");
				strcpy(message,"The Temperature is xx degree!");
				Uart_send_n(message,29);
			}
			else if(fifo[4]=='1')
			{
				puts("Humidity sent!!!\n");
				strcpy(message,"The Humidity is xx percent!");
				Uart_send_n(message,27);
			}
		}
	}

}
void Uart_ISR(void *context,alt_u32 id)//receive rx232 isr
{
	unsigned char temp;
	temp =  IORD_ALTERA_AVALON_UART_RXDATA(RS232_BASE);

	movefifo(temp);
	judge();
	//printf("%c",temp);


}
void Uart_init()
{
	IOWR_ALTERA_AVALON_UART_CONTROL(RS232_BASE,0x80);
	IOWR_ALTERA_AVALON_UART_STATUS(RS232_BASE,0x0);
	alt_irq_register(RS232_IRQ,1,Uart_ISR);

}


void led_init()
{
	unsigned int led_data;
	unsigned int i;

	//led_data = 0x01;
	//IOWR_ALTERA_AVALON_PIO_DATA(LED18_OUT_BASE,led_data);
	for(i=0;i<18;i++)
		{
			led_data = 0x01 << i;
			//led_data = 0xff;
			IOWR_ALTERA_AVALON_PIO_DATA(LED18_OUT_BASE,led_data);
			usleep(500000);
		}

}

int main()
{
  printf("System Restarted!!!\n");
  //unsigned char mydata[8];

  //strcpy(fifo,"######");

  Uart_init();

  while(1)
  {
	  //led_init();
	  Uart_send_n("Hello!\n",7);
	  usleep(5000000);
  }
  return 0;
}
