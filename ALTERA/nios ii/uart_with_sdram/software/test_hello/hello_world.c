#include <stdio.h>
#include <altera_avalon_uart_regs.h>
#include <IO.h>
#include <system.h>
#include <string.h>


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
void Uart_send_n(unsigned char *ptr,unsigned char n)
{
	for(;n>0;n--)
	{
		Uart_send(*(ptr++));

	}
}
void Uart_ISR(void *context,alt_u32 id)//
{
	unsigned char temp;
	temp =  IORD_ALTERA_AVALON_UART_RXDATA(RS232_BASE);

	printf("%c",temp);
}
void Uart_init()
{
	IOWR_ALTERA_AVALON_UART_CONTROL(RS232_BASE,0x80);
	IOWR_ALTERA_AVALON_UART_STATUS(RS232_BASE,0x0);
	alt_irq_register(RS232_IRQ,1,Uart_ISR);

}

int main()
{
  printf("System Restarted!!!\n");
  //unsigned char mydata[8];

  //puts(mydata);

  Uart_init();
	  //Uart_send('h');
  while(1)
  {
   Uart_send_n("Hello!\n",7);
   usleep(500000);
  }
  return 0;
}
