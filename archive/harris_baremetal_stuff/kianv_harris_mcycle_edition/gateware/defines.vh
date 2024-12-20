/*
 *  kianv harris multicycle RISC-V rv32im
 *
 *  copyright (c) 2022 hirosh dabui <hirosh@dabui.de>
 *
 *  permission to use, copy, modify, and/or distribute this software for any
 *  purpose with or without fee is hereby granted, provided that the above
 *  copyright notice and this permission notice appear in all copies.
 *
 *  the software is provided "as is" and the author disclaims all warranties
 *  with regard to this software including all implied warranties of
 *  merchantability and fitness. in no event shall the author be liable for
 *  any special, direct, indirect, or consequential damages or any damages
 *  whatsoever resulting from loss of use, data or profits, whether in an
 *  action of contract, negligence or other tortious action, arising out of
 *  or in connection with the use or performance of this software.
 *
 */
`ifndef KIANV_SOC
`define KIANV_SOC

/////////////////////////////////
// Hardware register
`define FB_ADDR0          32'h 10_000_000
`define FB_ADDR1         (32'h 10_000_000 + 8192*4)
`define UART_TX_ADDR      32'h 30_000_000
`define UART_READY_ADDR   32'h 30_000_000
`define VIDEOENABLE_ADDR  32'h 30_000_008
`define VIDEO_ADDR        32'h 30_000_008
`define VIDEO_RAW_ADDR    32'h 30_000_00C
`define CPU_FREQ_REG_ADDR 32'h 30_000_010
`define GPIO_DIR_ADDR     32'h 30_000_014
`define GPIO_PULLUP_ADDR  32'h 30_000_018
`define GPIO_OUTPUT_ADDR  32'h 30_000_01C
`define GPIO_INPUT_ADDR   32'h 30_000_020
`define FRAME_BUFFER_CTRL 32'h 30_000_024
`define LED8X4_FB_ADDR    32'h 30_000_028
`define DMA_SRC           32'h 30_000_02C
`define DMA_DST           32'h 30_000_030
`define DMA_LEN           32'h 30_000_034
`define DMA_CTRL          32'h 30_000_038
/////////////////////////////////
`define BAUDRATE          115200

`define GPIO_NR 8  // 0->32


`ifdef ULX3S
`define RV32M
`define CSR
//`define CYCLE_BASED_SHIFTER
`define DMA_CONTROLLER
`define LED_ULX3S
`define ECP5
`define GPIO
`define UART_TX
`define DDR_HDMI_TRANSFER 1'b 1
`define HDMI_VIDEO_FB
`endif

`ifdef COLORLIGHT_I5_I9
`define DMA_CONTROLLER
`define RV32M
`define CSR
//`define CYCLE_BASED_SHIFTER

`define ECP5
`define GPIO
`define OLED_SD1331
`define DDR_HDMI_TRANSFER 1'b 1
//`define HDMI_VIDEO_FB
`define UART_TX
`endif

`ifdef NEXYSA7
`define RV32M
`define CSR
`define FAKE_MULTIPLIER
`define CPU_HALT 1'b 1
`define PC_OUT
`define DDR_HDMI_TRANSFER 1'b 0
`define SPI_NOR_PRESCALER_ENABLE
`define SPI_NOR_PRESCALER_DIVIDER 7
//`define OLED_SD1331
`define HDMI_VIDEO_FB
`define GPIO
`define UART_TX
`define DMA_CONTROLLER

`elsif ARTY7
`define RV32M
`define CSR

`define FAKE_MULTIPLIER
`define SPI_NOR_PRESCALER_ENABLE
`define SPI_NOR_PRESCALER_DIVIDER 7
//`define OLED_SD1331
`define HDMI_VIDEO_FB
`define GPIO
`define DDR_HDMI_TRANSFER 1'b 1
`define GPIO
`define UART_TX
`define SPI_NOR_PRESCALER_ENABLE
`define SPI_NOR_PRESCALER_DIVIDER 7
//`define OLED_SD1331
`define GPIO
`define DMA_CONTROLLER
`elsif NEXYS_VIDEO
`define RV32M
`define CSR
//`define CYCLE_BASED_SHIFTER

`define FAKE_MULTIPLIER
`define DDR_HDMI_TRANSFER 1'b 1
`define SPI_NOR_PRESCALER_ENABLE
`define SPI_NOR_PRESCALER_DIVIDER 7
`define UART_TX
//`define OLED_SD1331
`define HDMI_VIDEO_FB
`define GPIO
`define DMA_CONTROLLER

`elsif CMODA7
`define RV32M
`define CSR

`define FAKE_MULTIPLIER
`define SPI_NOR_PRESCALER_ENABLE
`define SPI_NOR_PRESCALER_DIVIDER 7
//`define OLED_SD1331
`define HDMI_VIDEO_FB
`define DDR_HDMI_TRANSFER 1'b 0
`define GPIO
`define UART_TX
`define SPI_NOR_PRESCALER_ENABLE
`define SPI_NOR_PRESCALER_DIVIDER 7
`define DMA_CONTROLLER

`elsif NEXYS_VIDEO
`define RV32M
`define CSR
//`define CYCLE_BASED_SHIFTER

`define FAKE_MULTIPLIER
`define DDR_HDMI_TRANSFER 1'b 1
`define SPI_NOR_PRESCALER_ENABLE
`define SPI_NOR_PRESCALER_DIVIDER 7
`define UART_TX
//`define OLED_SD1331
`define HDMI_VIDEO_FB
`define GPIO
`define DMA_CONTROLLER

`elsif GENESYS2
`define RV32M
`define CSR
//`define CYCLE_BASED_SHIFTER
`define FAKE_MULTIPLIER
`define DDR_HDMI_TRANSFER 1'b 1
`define SPI_NOR_PRESCALER_ENABLE
`define SPI_NOR_PRESCALER_DIVIDER 7
`define UART_TX
//`define OLED_SD1331
`define HDMI_VIDEO_FB
`define GPIO
`define DMA_CONTROLLER
`endif

`ifdef ICESTICK
`undef RV32M
`undef CSR
`define CYCLE_BASED_SHIFTER
`define OLED_SD1331
//`define UART_TX
`endif

`ifdef FIREANT
//`define FAKE_MULTIPLIER
//`define RV32M
//`define CSR
`define CYCLE_BASED_SHIFTER
//`define OLED_SD1331
`define UART_TX
`endif

`ifdef ICEBREAKER
`define DMA_CONTROLLER
`define RV32M
`define CSR
//`define CYCLE_BASED_SHIFTER
`define OLED_SD1331
`define SPRAM
`define GPIO
`endif

`ifdef ICEFUN
//`define PC_OUT
`define RV32M
`define CSR
//`define CYCLE_BASED_SHIFTER
`define OLED_SD1331
`define LED_MATRIX8X4_FB
`define GPIO
`endif

`ifdef SIM
`define RV32M
`define CSR
//`define CYCLE_BASED_SHIFTER
`define UART_TX
`define BRAM_FIRMWARE
`endif


`ifdef KROETE
`define SYSTEM_CLK        30_000_000

`elsif ICEBREAKER
`define SYSTEM_CLK        19_000_000

`elsif ICESTICK
`define SYSTEM_CLK        35_000_000

`elsif FIREANT
`define SYSTEM_CLK        25_000_000

`elsif ICEFUN
`define SYSTEM_CLK        30_000_000

`elsif ECP5
`define SYSTEM_CLK        70_000_000
`elsif ARTIX7
`ifdef ARTY7
`define SYSTEM_CLK        180_000_000
`elsif NEXYSA7
`define SYSTEM_CLK        130_000_000
`elsif NEXYS_VIDEO
`define SYSTEM_CLK        180_000_000
`elsif GENESYS2
//`define SYSTEM_CLK        150_000_000
`define SYSTEM_CLK        200_000_000
`elsif CMODA7
`define SYSTEM_CLK        107_142_860
`elsif WUKONG
`define SYSTEM_CLK        175_000_000
`endif
`else
`define SYSTEM_CLK        25_000_000
`endif

`define SYSTEM_CLK_MHZ    (`SYSTEM_CLK / 1_000_000)

// sim stuff
`define DISABLE_WAVE      1'b0
`define SHOW_REGISTER_SET 1'b0
`define DUMP_MEMORY       1'b1


// features
`define IOMEM_INTERFACING

//`define IOMEM_INTERFACING_EXTERNAL
//`ifdef ECP5
//`define FAKE_MULTIPLIER
//`define HDMI_VIDEO_FB
//`define OLED_SD1331
//`define PSRAM_MEMORY_32MB
//`endif

// offset for simulation only
`define SPI_NOR_MEM_ADDR_START    32'h 20_000_000

`ifdef KROETE
`define SPI_MEMORY_OFFSET         (135*1024)
`define SPI_NOR_MEM_ADDR_END      ((`SPI_NOR_MEM_ADDR_START) + (1024*256))
`elsif ICEFUN
`define SPI_MEMORY_OFFSET         (256*1024)
`define SPI_NOR_MEM_ADDR_END      ((`SPI_NOR_MEM_ADDR_START) + (32'h C0000))
`elsif ARTIX7

`ifdef ARTY7
`define SPI_MEMORY_OFFSET         (1024*1024*4)
`define SPI_NOR_MEM_ADDR_END      ((`SPI_NOR_MEM_ADDR_START) + (16*1024*1024))
`elsif NEXYSA7
`define SPI_MEMORY_OFFSET         (1024*1024*4)
`define SPI_NOR_MEM_ADDR_END      ((`SPI_NOR_MEM_ADDR_START) + (16*1024*1024))
`elsif NEXYS_VIDEO
`define SPI_MEMORY_OFFSET         (1024*1024*10)
`define SPI_NOR_MEM_ADDR_END      ((`SPI_NOR_MEM_ADDR_START) + (32*1024*1024))
`elsif GENESYS2
`define SPI_MEMORY_OFFSET         (1024*1024*28)
`define SPI_NOR_MEM_ADDR_END      ((`SPI_NOR_MEM_ADDR_START) + (32*1024*1024))
`elsif CMODA7
`define SPI_MEMORY_OFFSET         ('h300000)
`define SPI_NOR_MEM_ADDR_END      ((`SPI_NOR_MEM_ADDR_START) + (4*1024*1024))
`endif

`else /* 1M */
`define SPI_MEMORY_OFFSET         (1024*1024)
`define SPI_NOR_MEM_ADDR_END      ((`SPI_NOR_MEM_ADDR_START) + (16*1024*1024))
`endif

// PSRAM
`ifdef ECP5
//`define PSRAM_CACHE
  //
`define CACHE_LINES (64)
`define PSRAM_MEM_ADDR_START      32'h 40_000_000
`define PSRAM_MEM_ADDR_END        ((`PSRAM_MEM_ADDR_START) + (32*1024*1024))
`define PSRAM_QUAD_MODE           1'b1
`define PSRAM_DEBUG_LA            1'b1
`undef PSRAM_DEBUG_LA
`endif

// SPRAM
`ifdef SPRAM
`define SPRAM_SIZE                (1024*128)
`define SPRAM_MEM_ADDR_START      32'h 10_000_000
`define SPRAM_MEM_ADDR_END        ((`SPRAM_MEM_ADDR_START) + (`SPRAM_SIZE))
`endif

`define BRAM_FIRMWARE
`undef BRAM_FIRMWARE

`ifdef BRAM_FIRMWARE

`define RESET_ADDR        0
`define FIRMWARE_BRAM     "./firmware/firmware.hex"
`define FIRMWARE_SPI      ""
//`define BRAM_WORDS        (1024*2)
`define BRAM_WORDS        ('h10_000)
//`define BRAM_WORDS        (1024)
`else

`define RESET_ADDR        (`SPI_NOR_MEM_ADDR_START + `SPI_MEMORY_OFFSET)
`define FIRMWARE_BRAM     ""
`define FIRMWARE_SPI      "./firmware/firmware.hex"
// word = 32 bits
`ifdef ECP5
`define BRAM_WORDS        (1024*16)
`elsif ARTIX7
`define BRAM_WORDS        (1024*16)
`elsif ICESTICK
`define BRAM_WORDS        (1024)
`elsif FIREANT
`define BRAM_WORDS        (256)
`else
`define BRAM_WORDS        (1024*2)
`endif
`endif

`endif  // KIANV_SOC
