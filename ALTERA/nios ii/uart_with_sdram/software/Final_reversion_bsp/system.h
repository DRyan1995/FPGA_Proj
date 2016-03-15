/*
 * system.h - SOPC Builder system and BSP software package information
 *
 * Machine generated for CPU 'nios2' in SOPC Builder design 'CORE'
 * SOPC Builder design path: D:/Proj/uart_with_sdram/CORE.sopcinfo
 *
 * Generated: Wed Dec 23 19:13:13 CST 2015
 */

/*
 * DO NOT MODIFY THIS FILE
 *
 * Changing this file will have subtle consequences
 * which will almost certainly lead to a nonfunctioning
 * system. If you do modify this file, be aware that your
 * changes will be overwritten and lost when this file
 * is generated again.
 *
 * DO NOT MODIFY THIS FILE
 */

/*
 * License Agreement
 *
 * Copyright (c) 2008
 * Altera Corporation, San Jose, California, USA.
 * All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 *
 * This agreement shall be governed in all respects by the laws of the State
 * of California and by the laws of the United States of America.
 */

#ifndef __SYSTEM_H_
#define __SYSTEM_H_

/* Include definitions from linker script generator */
#include "linker.h"


/*
 * Alarm configuration
 *
 */

#define ALARM_BASE 0x1001080
#define ALARM_BIT_CLEARING_EDGE_REGISTER 0
#define ALARM_BIT_MODIFYING_OUTPUT_REGISTER 0
#define ALARM_CAPTURE 0
#define ALARM_DATA_WIDTH 1
#define ALARM_DO_TEST_BENCH_WIRING 0
#define ALARM_DRIVEN_SIM_VALUE 0
#define ALARM_EDGE_TYPE "NONE"
#define ALARM_FREQ 100000000
#define ALARM_HAS_IN 1
#define ALARM_HAS_OUT 0
#define ALARM_HAS_TRI 0
#define ALARM_IRQ -1
#define ALARM_IRQ_INTERRUPT_CONTROLLER_ID -1
#define ALARM_IRQ_TYPE "NONE"
#define ALARM_NAME "/dev/Alarm"
#define ALARM_RESET_VALUE 0
#define ALARM_SPAN 16
#define ALARM_TYPE "altera_avalon_pio"
#define ALT_MODULE_CLASS_Alarm altera_avalon_pio


/*
 * Alarm_en configuration
 *
 */

#define ALARM_EN_BASE 0x1001070
#define ALARM_EN_BIT_CLEARING_EDGE_REGISTER 0
#define ALARM_EN_BIT_MODIFYING_OUTPUT_REGISTER 0
#define ALARM_EN_CAPTURE 0
#define ALARM_EN_DATA_WIDTH 1
#define ALARM_EN_DO_TEST_BENCH_WIRING 0
#define ALARM_EN_DRIVEN_SIM_VALUE 0
#define ALARM_EN_EDGE_TYPE "NONE"
#define ALARM_EN_FREQ 100000000
#define ALARM_EN_HAS_IN 1
#define ALARM_EN_HAS_OUT 0
#define ALARM_EN_HAS_TRI 0
#define ALARM_EN_IRQ -1
#define ALARM_EN_IRQ_INTERRUPT_CONTROLLER_ID -1
#define ALARM_EN_IRQ_TYPE "NONE"
#define ALARM_EN_NAME "/dev/Alarm_en"
#define ALARM_EN_RESET_VALUE 0
#define ALARM_EN_SPAN 16
#define ALARM_EN_TYPE "altera_avalon_pio"
#define ALT_MODULE_CLASS_Alarm_en altera_avalon_pio


/*
 * CPU configuration
 *
 */

#define ALT_CPU_ARCHITECTURE "altera_nios2_qsys"
#define ALT_CPU_BIG_ENDIAN 0
#define ALT_CPU_BREAK_ADDR 0x1000820
#define ALT_CPU_CPU_FREQ 100000000u
#define ALT_CPU_CPU_ID_SIZE 1
#define ALT_CPU_CPU_ID_VALUE 0x00000000
#define ALT_CPU_CPU_IMPLEMENTATION "fast"
#define ALT_CPU_DATA_ADDR_WIDTH 0x19
#define ALT_CPU_DCACHE_LINE_SIZE 32
#define ALT_CPU_DCACHE_LINE_SIZE_LOG2 5
#define ALT_CPU_DCACHE_SIZE 2048
#define ALT_CPU_EXCEPTION_ADDR 0x800020
#define ALT_CPU_FLUSHDA_SUPPORTED
#define ALT_CPU_FREQ 100000000
#define ALT_CPU_HARDWARE_DIVIDE_PRESENT 0
#define ALT_CPU_HARDWARE_MULTIPLY_PRESENT 1
#define ALT_CPU_HARDWARE_MULX_PRESENT 0
#define ALT_CPU_HAS_DEBUG_CORE 1
#define ALT_CPU_HAS_DEBUG_STUB
#define ALT_CPU_HAS_JMPI_INSTRUCTION
#define ALT_CPU_ICACHE_LINE_SIZE 32
#define ALT_CPU_ICACHE_LINE_SIZE_LOG2 5
#define ALT_CPU_ICACHE_SIZE 4096
#define ALT_CPU_INITDA_SUPPORTED
#define ALT_CPU_INST_ADDR_WIDTH 0x19
#define ALT_CPU_NAME "nios2"
#define ALT_CPU_NUM_OF_SHADOW_REG_SETS 0
#define ALT_CPU_RESET_ADDR 0x800000


/*
 * CPU configuration (with legacy prefix - don't use these anymore)
 *
 */

#define NIOS2_BIG_ENDIAN 0
#define NIOS2_BREAK_ADDR 0x1000820
#define NIOS2_CPU_FREQ 100000000u
#define NIOS2_CPU_ID_SIZE 1
#define NIOS2_CPU_ID_VALUE 0x00000000
#define NIOS2_CPU_IMPLEMENTATION "fast"
#define NIOS2_DATA_ADDR_WIDTH 0x19
#define NIOS2_DCACHE_LINE_SIZE 32
#define NIOS2_DCACHE_LINE_SIZE_LOG2 5
#define NIOS2_DCACHE_SIZE 2048
#define NIOS2_EXCEPTION_ADDR 0x800020
#define NIOS2_FLUSHDA_SUPPORTED
#define NIOS2_HARDWARE_DIVIDE_PRESENT 0
#define NIOS2_HARDWARE_MULTIPLY_PRESENT 1
#define NIOS2_HARDWARE_MULX_PRESENT 0
#define NIOS2_HAS_DEBUG_CORE 1
#define NIOS2_HAS_DEBUG_STUB
#define NIOS2_HAS_JMPI_INSTRUCTION
#define NIOS2_ICACHE_LINE_SIZE 32
#define NIOS2_ICACHE_LINE_SIZE_LOG2 5
#define NIOS2_ICACHE_SIZE 4096
#define NIOS2_INITDA_SUPPORTED
#define NIOS2_INST_ADDR_WIDTH 0x19
#define NIOS2_NUM_OF_SHADOW_REG_SETS 0
#define NIOS2_RESET_ADDR 0x800000


/*
 * DHT11 configuration
 *
 */

#define ALT_MODULE_CLASS_DHT11 altera_avalon_uart
#define DHT11_BASE 0x1001000
#define DHT11_BAUD 115200
#define DHT11_DATA_BITS 8
#define DHT11_FIXED_BAUD 1
#define DHT11_FREQ 100000000
#define DHT11_IRQ 2
#define DHT11_IRQ_INTERRUPT_CONTROLLER_ID 0
#define DHT11_NAME "/dev/DHT11"
#define DHT11_PARITY 'N'
#define DHT11_SIM_CHAR_STREAM ""
#define DHT11_SIM_TRUE_BAUD 0
#define DHT11_SPAN 32
#define DHT11_STOP_BITS 1
#define DHT11_SYNC_REG_DEPTH 2
#define DHT11_TYPE "altera_avalon_uart"
#define DHT11_USE_CTS_RTS 0
#define DHT11_USE_EOP_REGISTER 0


/*
 * Define for each module class mastered by the CPU
 *
 */

#define __ALTERA_AVALON_JTAG_UART
#define __ALTERA_AVALON_NEW_SDRAM_CONTROLLER
#define __ALTERA_AVALON_PIO
#define __ALTERA_AVALON_SYSID_QSYS
#define __ALTERA_AVALON_UART
#define __ALTERA_NIOS2_QSYS


/*
 * FAN configuration
 *
 */

#define ALT_MODULE_CLASS_FAN altera_avalon_pio
#define FAN_BASE 0x1001050
#define FAN_BIT_CLEARING_EDGE_REGISTER 0
#define FAN_BIT_MODIFYING_OUTPUT_REGISTER 0
#define FAN_CAPTURE 0
#define FAN_DATA_WIDTH 1
#define FAN_DO_TEST_BENCH_WIRING 0
#define FAN_DRIVEN_SIM_VALUE 0
#define FAN_EDGE_TYPE "NONE"
#define FAN_FREQ 100000000
#define FAN_HAS_IN 0
#define FAN_HAS_OUT 1
#define FAN_HAS_TRI 0
#define FAN_IRQ -1
#define FAN_IRQ_INTERRUPT_CONTROLLER_ID -1
#define FAN_IRQ_TYPE "NONE"
#define FAN_NAME "/dev/FAN"
#define FAN_RESET_VALUE 1
#define FAN_SPAN 16
#define FAN_TYPE "altera_avalon_pio"


/*
 * LEDMODE configuration
 *
 */

#define ALT_MODULE_CLASS_LEDMODE altera_avalon_pio
#define LEDMODE_BASE 0x1001090
#define LEDMODE_BIT_CLEARING_EDGE_REGISTER 0
#define LEDMODE_BIT_MODIFYING_OUTPUT_REGISTER 0
#define LEDMODE_CAPTURE 0
#define LEDMODE_DATA_WIDTH 2
#define LEDMODE_DO_TEST_BENCH_WIRING 0
#define LEDMODE_DRIVEN_SIM_VALUE 0
#define LEDMODE_EDGE_TYPE "NONE"
#define LEDMODE_FREQ 100000000
#define LEDMODE_HAS_IN 0
#define LEDMODE_HAS_OUT 1
#define LEDMODE_HAS_TRI 0
#define LEDMODE_IRQ -1
#define LEDMODE_IRQ_INTERRUPT_CONTROLLER_ID -1
#define LEDMODE_IRQ_TYPE "NONE"
#define LEDMODE_NAME "/dev/LEDMODE"
#define LEDMODE_RESET_VALUE 0
#define LEDMODE_SPAN 16
#define LEDMODE_TYPE "altera_avalon_pio"


/*
 * MP3 configuration
 *
 */

#define ALT_MODULE_CLASS_MP3 altera_avalon_pio
#define MP3_BASE 0x1001040
#define MP3_BIT_CLEARING_EDGE_REGISTER 0
#define MP3_BIT_MODIFYING_OUTPUT_REGISTER 0
#define MP3_CAPTURE 0
#define MP3_DATA_WIDTH 1
#define MP3_DO_TEST_BENCH_WIRING 0
#define MP3_DRIVEN_SIM_VALUE 0
#define MP3_EDGE_TYPE "NONE"
#define MP3_FREQ 100000000
#define MP3_HAS_IN 0
#define MP3_HAS_OUT 1
#define MP3_HAS_TRI 0
#define MP3_IRQ -1
#define MP3_IRQ_INTERRUPT_CONTROLLER_ID -1
#define MP3_IRQ_TYPE "NONE"
#define MP3_NAME "/dev/MP3"
#define MP3_RESET_VALUE 1
#define MP3_SPAN 16
#define MP3_TYPE "altera_avalon_pio"


/*
 * RS232 configuration
 *
 */

#define ALT_MODULE_CLASS_RS232 altera_avalon_uart
#define RS232_BASE 0x1001020
#define RS232_BAUD 115200
#define RS232_DATA_BITS 8
#define RS232_FIXED_BAUD 1
#define RS232_FREQ 100000000
#define RS232_IRQ 0
#define RS232_IRQ_INTERRUPT_CONTROLLER_ID 0
#define RS232_NAME "/dev/RS232"
#define RS232_PARITY 'N'
#define RS232_SIM_CHAR_STREAM ""
#define RS232_SIM_TRUE_BAUD 0
#define RS232_SPAN 32
#define RS232_STOP_BITS 1
#define RS232_SYNC_REG_DEPTH 2
#define RS232_TYPE "altera_avalon_uart"
#define RS232_USE_CTS_RTS 0
#define RS232_USE_EOP_REGISTER 0


/*
 * Sigtap configuration
 *
 */

#define ALT_MODULE_CLASS_Sigtap altera_avalon_pio
#define SIGTAP_BASE 0x10010a0
#define SIGTAP_BIT_CLEARING_EDGE_REGISTER 0
#define SIGTAP_BIT_MODIFYING_OUTPUT_REGISTER 0
#define SIGTAP_CAPTURE 0
#define SIGTAP_DATA_WIDTH 1
#define SIGTAP_DO_TEST_BENCH_WIRING 0
#define SIGTAP_DRIVEN_SIM_VALUE 0
#define SIGTAP_EDGE_TYPE "NONE"
#define SIGTAP_FREQ 100000000
#define SIGTAP_HAS_IN 1
#define SIGTAP_HAS_OUT 0
#define SIGTAP_HAS_TRI 0
#define SIGTAP_IRQ -1
#define SIGTAP_IRQ_INTERRUPT_CONTROLLER_ID -1
#define SIGTAP_IRQ_TYPE "NONE"
#define SIGTAP_NAME "/dev/Sigtap"
#define SIGTAP_RESET_VALUE 0
#define SIGTAP_SPAN 16
#define SIGTAP_TYPE "altera_avalon_pio"


/*
 * System configuration
 *
 */

#define ALT_DEVICE_FAMILY "Cyclone II"
#define ALT_ENHANCED_INTERRUPT_API_PRESENT
#define ALT_IRQ_BASE NULL
#define ALT_LOG_PORT "/dev/null"
#define ALT_LOG_PORT_BASE 0x0
#define ALT_LOG_PORT_DEV null
#define ALT_LOG_PORT_TYPE ""
#define ALT_NUM_EXTERNAL_INTERRUPT_CONTROLLERS 0
#define ALT_NUM_INTERNAL_INTERRUPT_CONTROLLERS 1
#define ALT_NUM_INTERRUPT_CONTROLLERS 1
#define ALT_STDERR "/dev/jtag_uart"
#define ALT_STDERR_BASE 0x10010c0
#define ALT_STDERR_DEV jtag_uart
#define ALT_STDERR_IS_JTAG_UART
#define ALT_STDERR_PRESENT
#define ALT_STDERR_TYPE "altera_avalon_jtag_uart"
#define ALT_STDIN "/dev/jtag_uart"
#define ALT_STDIN_BASE 0x10010c0
#define ALT_STDIN_DEV jtag_uart
#define ALT_STDIN_IS_JTAG_UART
#define ALT_STDIN_PRESENT
#define ALT_STDIN_TYPE "altera_avalon_jtag_uart"
#define ALT_STDOUT "/dev/jtag_uart"
#define ALT_STDOUT_BASE 0x10010c0
#define ALT_STDOUT_DEV jtag_uart
#define ALT_STDOUT_IS_JTAG_UART
#define ALT_STDOUT_PRESENT
#define ALT_STDOUT_TYPE "altera_avalon_jtag_uart"
#define ALT_SYSTEM_NAME "CORE"


/*
 * breathe_led configuration
 *
 */

#define ALT_MODULE_CLASS_breathe_led altera_avalon_pio
#define BREATHE_LED_BASE 0x1001060
#define BREATHE_LED_BIT_CLEARING_EDGE_REGISTER 0
#define BREATHE_LED_BIT_MODIFYING_OUTPUT_REGISTER 0
#define BREATHE_LED_CAPTURE 0
#define BREATHE_LED_DATA_WIDTH 1
#define BREATHE_LED_DO_TEST_BENCH_WIRING 0
#define BREATHE_LED_DRIVEN_SIM_VALUE 0
#define BREATHE_LED_EDGE_TYPE "NONE"
#define BREATHE_LED_FREQ 100000000
#define BREATHE_LED_HAS_IN 0
#define BREATHE_LED_HAS_OUT 1
#define BREATHE_LED_HAS_TRI 0
#define BREATHE_LED_IRQ -1
#define BREATHE_LED_IRQ_INTERRUPT_CONTROLLER_ID -1
#define BREATHE_LED_IRQ_TYPE "NONE"
#define BREATHE_LED_NAME "/dev/breathe_led"
#define BREATHE_LED_RESET_VALUE 0
#define BREATHE_LED_SPAN 16
#define BREATHE_LED_TYPE "altera_avalon_pio"


/*
 * hal configuration
 *
 */

#define ALT_MAX_FD 32
#define ALT_SYS_CLK none
#define ALT_TIMESTAMP_CLK none


/*
 * jtag_uart configuration
 *
 */

#define ALT_MODULE_CLASS_jtag_uart altera_avalon_jtag_uart
#define JTAG_UART_BASE 0x10010c0
#define JTAG_UART_IRQ 1
#define JTAG_UART_IRQ_INTERRUPT_CONTROLLER_ID 0
#define JTAG_UART_NAME "/dev/jtag_uart"
#define JTAG_UART_READ_DEPTH 64
#define JTAG_UART_READ_THRESHOLD 8
#define JTAG_UART_SPAN 8
#define JTAG_UART_TYPE "altera_avalon_jtag_uart"
#define JTAG_UART_WRITE_DEPTH 64
#define JTAG_UART_WRITE_THRESHOLD 8


/*
 * sdram_controller configuration
 *
 */

#define ALT_MODULE_CLASS_sdram_controller altera_avalon_new_sdram_controller
#define SDRAM_CONTROLLER_BASE 0x800000
#define SDRAM_CONTROLLER_CAS_LATENCY 3
#define SDRAM_CONTROLLER_CONTENTS_INFO
#define SDRAM_CONTROLLER_INIT_NOP_DELAY 0.0
#define SDRAM_CONTROLLER_INIT_REFRESH_COMMANDS 2
#define SDRAM_CONTROLLER_IRQ -1
#define SDRAM_CONTROLLER_IRQ_INTERRUPT_CONTROLLER_ID -1
#define SDRAM_CONTROLLER_IS_INITIALIZED 1
#define SDRAM_CONTROLLER_NAME "/dev/sdram_controller"
#define SDRAM_CONTROLLER_POWERUP_DELAY 100.0
#define SDRAM_CONTROLLER_REFRESH_PERIOD 15.625
#define SDRAM_CONTROLLER_REGISTER_DATA_IN 1
#define SDRAM_CONTROLLER_SDRAM_ADDR_WIDTH 0x16
#define SDRAM_CONTROLLER_SDRAM_BANK_WIDTH 2
#define SDRAM_CONTROLLER_SDRAM_COL_WIDTH 8
#define SDRAM_CONTROLLER_SDRAM_DATA_WIDTH 16
#define SDRAM_CONTROLLER_SDRAM_NUM_BANKS 4
#define SDRAM_CONTROLLER_SDRAM_NUM_CHIPSELECTS 1
#define SDRAM_CONTROLLER_SDRAM_ROW_WIDTH 12
#define SDRAM_CONTROLLER_SHARED_DATA 0
#define SDRAM_CONTROLLER_SIM_MODEL_BASE 0
#define SDRAM_CONTROLLER_SPAN 8388608
#define SDRAM_CONTROLLER_STARVATION_INDICATOR 0
#define SDRAM_CONTROLLER_TRISTATE_BRIDGE_SLAVE ""
#define SDRAM_CONTROLLER_TYPE "altera_avalon_new_sdram_controller"
#define SDRAM_CONTROLLER_T_AC 5.5
#define SDRAM_CONTROLLER_T_MRD 3
#define SDRAM_CONTROLLER_T_RCD 20.0
#define SDRAM_CONTROLLER_T_RFC 70.0
#define SDRAM_CONTROLLER_T_RP 20.0
#define SDRAM_CONTROLLER_T_WR 14.0


/*
 * sysid configuration
 *
 */

#define ALT_MODULE_CLASS_sysid altera_avalon_sysid_qsys
#define SYSID_BASE 0x10010b8
#define SYSID_ID 0
#define SYSID_IRQ -1
#define SYSID_IRQ_INTERRUPT_CONTROLLER_ID -1
#define SYSID_NAME "/dev/sysid"
#define SYSID_SPAN 8
#define SYSID_TIMESTAMP 1450868559
#define SYSID_TYPE "altera_avalon_sysid_qsys"

#endif /* __SYSTEM_H_ */
