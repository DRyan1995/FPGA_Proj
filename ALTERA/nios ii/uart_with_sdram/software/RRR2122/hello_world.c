#include <stdio.h>
#include <IO.h>
#include <system.h>
#include <string.h>
#include <altera_avalon_pio_regs.h>
#include <altera_avalon_uart_regs.h>

unsigned char fifo[6];
unsigned int ringbell;
unsigned int alarm;
unsigned int alarm_en;
unsigned int tem0;
unsigned int tem1;
unsigned int temflag;
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
    Uart_send(*ptr);
    ptr++;

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
        IOWR_ALTERA_AVALON_PIO_DATA(BREATHE_LED_BASE,0x00);
      }
      else if(fifo[4]=='1')
      {
        puts("LED HELLO!\n");
        IOWR_ALTERA_AVALON_PIO_DATA(BREATHE_LED_BASE,0x01);
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
        IOWR_ALTERA_AVALON_PIO_DATA(FAN_BASE,0x01);
      }
      else if(fifo[4]=='1')
      {
        puts("FAN ON!\n");
        IOWR_ALTERA_AVALON_PIO_DATA(FAN_BASE,0x00);
      }
    }

    else if(fifo[1]=='T'&&fifo[2]=='E'&&fifo[3]=='M')
    {
      unsigned int ttt;
      if(tem0>tem1)
      {
        ttt = tem1;
        tem1 = tem0;
        tem0 = ttt;
      }
      if(fifo[4]=='0')
      {
        puts("Temperature sent!!!\n");
        //strcpy(message,"The Temperature is xx degree!");

        sprintf(message,"The Temperature is %d degree!",tem0);
        Uart_send_n("AT+CIPSEND=0,29",15);
          Uart_send(0x0d);
          Uart_send(0x0a);

          usleep(1000000);//100ms

        Uart_send_n(message,29);
          Uart_send(0x0d);
          Uart_send(0x0a);
      }
      else if(fifo[4]=='1')
      {
        puts("Humidity sent!!!\n");
        //strcpy(message,"The Humidity is xx percent!");
        sprintf(message,"The Humidity is %d percent!",tem1);
        //Uart_send_n(message,27);
        Uart_send_n("AT+CIPSEND=0,27",15);
          Uart_send(0x0d);
          Uart_send(0x0a);

          usleep(1000000);//100ms

        Uart_send_n(message,27);
          Uart_send(0x0d);
          Uart_send(0x0a);
      }
    }
  }

}

void wifi_init()
{

  usleep(3000000);//3s

  Uart_send_n("AT+RST",6);
  Uart_send(0x0d);
    Uart_send(0x0a);
  usleep(1000000);//1000ms
  Uart_send_n("AT+CIPMUX=1",11);
  Uart_send(0x0d);
  Uart_send(0x0a);
  usleep(500000);//500ms
  Uart_send_n("AT+CIPSERVER=1",14);
  Uart_send(0x0d);
  Uart_send(0x0a);
  usleep(500000);//500ms
/*
  Uart_send_n("AT+CIPSTO=3000",14);
  Uart_send(0x0d);
  Uart_send(0x0a);
  usleep(500000);//500ms

  */
}

void Uart_ISR(void *context,alt_u32 id)//receive rx232 isr
{
  unsigned char temp;
  temp =  IORD_ALTERA_AVALON_UART_RXDATA(RS232_BASE);

  movefifo(temp);
  judge();
  printf("%c",temp);
}

void Uart_init()
{
  IOWR_ALTERA_AVALON_UART_CONTROL(RS232_BASE,0x80);
  IOWR_ALTERA_AVALON_UART_STATUS(RS232_BASE,0x0);
  alt_irq_register(RS232_IRQ,0,Uart_ISR);

}
void DHT11_send(unsigned char data)
{
  alt_u16 status;
  status = IORD_ALTERA_AVALON_UART_STATUS(DHT11_BASE);
  while(!(status&0x0040))//waiting the tx_done
  {
    status = IORD_ALTERA_AVALON_UART_STATUS(DHT11_BASE);
  }
  IOWR_ALTERA_AVALON_UART_TXDATA(DHT11_BASE,data);

}
void DHT11_ISR(void *context,alt_u32 id)//receive rx232 isr
{
  unsigned char temp;
  temp =  IORD_ALTERA_AVALON_UART_RXDATA(DHT11_BASE);
 // printf("%d\n",temp);
  temflag = (++temflag)%2;
    if(temflag)
      tem0 = temp;
    else
      tem1 = temp;

   // printf("tem0=%d",tem0);
   // printf("tem1=%d",tem1);
   // putchar(10);

}

void DHT11_init()
{
  IOWR_ALTERA_AVALON_UART_CONTROL(DHT11_BASE,0x80);
  IOWR_ALTERA_AVALON_UART_STATUS(DHT11_BASE,0x0);
  alt_irq_register(DHT11_IRQ,2,DHT11_ISR);

}



/*
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
*/
void test_key()//refreshing the key val
{

  ringbell = IORD_ALTERA_AVALON_PIO_DATA(SIGTAP_BASE)&0x01;
}
void test_alarm()
{

  alarm = IORD_ALTERA_AVALON_PIO_DATA(ALARM_BASE)&0x01;
}

void test_alarm_en()
{

  alarm_en = IORD_ALTERA_AVALON_PIO_DATA(ALARM_EN_BASE)&0x01;
}
void welcome()//led welcum
{
  char message[22];
  if(ringbell == 0x01)
  {
    Uart_send_n("AT+CIPSEND=0,21",15);
    Uart_send(0x0d);
      Uart_send(0x0a);
      usleep(1000000);
    strcpy(message,"You'v Got A Visitor!!");
    Uart_send_n(message,21);
    Uart_send(0x0d);
    Uart_send(0x0a);


    IOWR_ALTERA_AVALON_PIO_DATA(LEDMODE_BASE, 0x03);
  }
  else
  {
    unsigned int status = IORD_ALTERA_AVALON_PIO_DATA(LEDMODE_BASE);
    IOWR_ALTERA_AVALON_PIO_DATA(LEDMODE_BASE, status&0x02);
  }
}

void Alarm()
{
  char message[24];
  if(alarm == 0x01&& alarm_en == 0x01)
  {
    Uart_send_n("AT+CIPSEND=0,24",15);
    Uart_send(0x0d);
      Uart_send(0x0a);
      usleep(1000000);
    strcpy(message,"Someone Has Broken In!!!");
    Uart_send_n(message,24);
    Uart_send(0x0d);
    Uart_send(0x0a);
    //puts("fuck!!\n");

    IOWR_ALTERA_AVALON_PIO_DATA(LEDMODE_BASE,0x03);
  }
  else
  {
    unsigned int status = IORD_ALTERA_AVALON_PIO_DATA(LEDMODE_BASE);
    IOWR_ALTERA_AVALON_PIO_DATA(LEDMODE_BASE, status&0x01);
    //puts("nothing!\n");

  }
}

int main()
{
  printf("System Restarted!!!\n");


  Uart_init();//Register RS232_RXD

  wifi_init();//initialize the wifi module
  DHT11_init();//Register DHT11_RXD
  temflag = 0;

  while(1)
  {
    //led_init();
   test_key();
   test_alarm();
   test_alarm_en();
    welcome();
    Alarm();
    //printf("%X\n",ringbell);
    //printf("%x",IORD_ALTERA_AVALON_PIO_DATA(MYINPUT_BASE));

    Uart_send_n("AT",2);
    Uart_send(0x0d);
    Uart_send(0x0a);
    DHT11_send(0X00);
    usleep(2000000);//2s
  }
  return 0;
}
