`timescale 1ns/1ns

`define IO_TRUE                      1
`define IO_FALSE                     0

`define TX_TASKS                     board.xilinx_pci_exp_4_lane_downstream_port.tx_usrapp
// Endpoint Sys clock clock frequency 100 MHz -> half clock -> 5000 pS
`define SYS_CLK_COR_HALF_CLK_PERIOD         5000

// Downstrean Port Sys clock clock frequency 250 MHz -> half clock -> 2000 pS
`define SYS_CLK_DSPORT_HALF_CLK_PERIOD      2000

`define RX_LOG                       0
`define TX_LOG                       1

// PCIi Express TLP Types constants
`define  PCI_EXP_MEM_READ32          7'b0000000
`define  PCI_EXP_IO_READ             7'b0000010
`define  PCI_EXP_CFG_READ0           7'b0000100
`define  PCI_EXP_COMPLETION_WO_DATA  7'b0001010
`define  PCI_EXP_MEM_READ64          7'b0100000
`define  PCI_EXP_MSG_NODATA          7'b0110xxx
`define  PCI_EXP_MEM_WRITE32         7'b1000000
`define  PCI_EXP_IO_WRITE            7'b1000010
`define  PCI_EXP_CFG_WRITE0          7'b1000100
`define  PCI_EXP_COMPLETION_DATA     7'b1001010
`define  PCI_EXP_MEM_WRITE64         7'b1100000
`define  PCI_EXP_MSG_DATA            7'b1110xxx

`define  TRN_RX_TIMEOUT              5000


/*
 *  DMA Design
 */

// DMA CSR address space (on BAR0)
`define  PCIE_DCSR                  12'h0  // Device Control Status Register
`define  PCIE_DDMACR                12'h4  // Device DMA Control Status Register
`define  PCIE_WDMATLPA              12'h8  // Write DMA TLP Address
`define  PCIE_WDMATLPS              12'h8  // Write DMA TLP Size

