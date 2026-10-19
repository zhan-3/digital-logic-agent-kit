########    时钟CLK     #############
set_property -dict {PACKAGE_PIN P17 IOSTANDARD LVCMOS33} [get_ports clk]


########    串口     #############
set_property -dict {PACKAGE_PIN K5 IOSTANDARD LVCMOS33} [get_ports uart_txd]
set_property -dict {PACKAGE_PIN L6 IOSTANDARD LVCMOS33} [get_ports uart_rxd]


########    拨码开关SW      #############
set_property -dict {PACKAGE_PIN R2 IOSTANDARD LVCMOS33} [get_ports SW0]
set_property -dict {PACKAGE_PIN R3 IOSTANDARD LVCMOS33} [get_ports SW1]
set_property -dict {PACKAGE_PIN M4 IOSTANDARD LVCMOS33} [get_ports SW2]
set_property -dict {PACKAGE_PIN M3 IOSTANDARD LVCMOS33} [get_ports SW3]
set_property -dict {PACKAGE_PIN P2 IOSTANDARD LVCMOS33} [get_ports SW4]
set_property -dict {PACKAGE_PIN N4 IOSTANDARD LVCMOS33} [get_ports SW5]
set_property -dict {PACKAGE_PIN N6 IOSTANDARD LVCMOS33} [get_ports SW6]
set_property -dict {PACKAGE_PIN L4 IOSTANDARD LVCMOS33} [get_ports SW7]
set_property -dict {PACKAGE_PIN J4 IOSTANDARD LVCMOS33} [get_ports SW8]
set_property -dict {PACKAGE_PIN T3 IOSTANDARD LVCMOS33} [get_ports SW9]
set_property -dict {PACKAGE_PIN T4 IOSTANDARD LVCMOS33} [get_ports SW10]
set_property -dict {PACKAGE_PIN U3 IOSTANDARD LVCMOS33} [get_ports SW11]
set_property -dict {PACKAGE_PIN U4 IOSTANDARD LVCMOS33} [get_ports SW12]
set_property -dict {PACKAGE_PIN T5 IOSTANDARD LVCMOS33} [get_ports SW13]
set_property -dict {PACKAGE_PIN J2 IOSTANDARD LVCMOS33} [get_ports SW14]
set_property -dict {PACKAGE_PIN J5 IOSTANDARD LVCMOS33} [get_ports SW15]

########    按键      #############
set_property -dict {PACKAGE_PIN M2 IOSTANDARD LVCMOS33} [get_ports K1]
set_property -dict {PACKAGE_PIN N2 IOSTANDARD LVCMOS33} [get_ports K2]
set_property -dict {PACKAGE_PIN M1 IOSTANDARD LVCMOS33} [get_ports K3]
set_property -dict {PACKAGE_PIN L1 IOSTANDARD LVCMOS33} [get_ports K4]
set_property -dict {PACKAGE_PIN N1 IOSTANDARD LVCMOS33} [get_ports K5]
set_property -dict {PACKAGE_PIN K3 IOSTANDARD LVCMOS33} [get_ports K6]

########    LED     #############
set_property -dict {PACKAGE_PIN D4 IOSTANDARD LVCMOS33} [get_ports {led[0]}]
set_property -dict {PACKAGE_PIN C5 IOSTANDARD LVCMOS33} [get_ports {led[1]}]
set_property -dict {PACKAGE_PIN D5 IOSTANDARD LVCMOS33} [get_ports {led[2]}]
set_property -dict {PACKAGE_PIN D7 IOSTANDARD LVCMOS33} [get_ports {led[3]}]
set_property -dict {PACKAGE_PIN B7 IOSTANDARD LVCMOS33} [get_ports {led[4]}]
set_property -dict {PACKAGE_PIN C7 IOSTANDARD LVCMOS33} [get_ports {led[5]}]
set_property -dict {PACKAGE_PIN D8 IOSTANDARD LVCMOS33} [get_ports {led[6]}]
set_property -dict {PACKAGE_PIN D9 IOSTANDARD LVCMOS33} [get_ports {led[7]}]
set_property -dict {PACKAGE_PIN J3 IOSTANDARD LVCMOS33} [get_ports {led[8]}]
set_property -dict {PACKAGE_PIN H2 IOSTANDARD LVCMOS33} [get_ports {led[9]}]
set_property -dict {PACKAGE_PIN G4 IOSTANDARD LVCMOS33} [get_ports {led[10]}]
set_property -dict {PACKAGE_PIN G2 IOSTANDARD LVCMOS33} [get_ports {led[11]}]
set_property -dict {PACKAGE_PIN G3 IOSTANDARD LVCMOS33} [get_ports {led[12]}]
set_property -dict {PACKAGE_PIN G6 IOSTANDARD LVCMOS33} [get_ports {led[13]}]
set_property -dict {PACKAGE_PIN F5 IOSTANDARD LVCMOS33} [get_ports {led[14]}]
set_property -dict {PACKAGE_PIN E5 IOSTANDARD LVCMOS33} [get_ports {led[15]}]


########    数码管     #############
set_property -dict {PACKAGE_PIN R18 IOSTANDARD LVCMOS33} [get_ports A0]
set_property -dict {PACKAGE_PIN J13 IOSTANDARD LVCMOS33} [get_ports B0]
set_property -dict {PACKAGE_PIN B14 IOSTANDARD LVCMOS33} [get_ports C0]
set_property -dict {PACKAGE_PIN D13 IOSTANDARD LVCMOS33} [get_ports D0]
set_property -dict {PACKAGE_PIN C14 IOSTANDARD LVCMOS33} [get_ports E0]
set_property -dict {PACKAGE_PIN H6  IOSTANDARD LVCMOS33} [get_ports F0]
set_property -dict {PACKAGE_PIN K16 IOSTANDARD LVCMOS33} [get_ports G0]
set_property -dict {PACKAGE_PIN C12 IOSTANDARD LVCMOS33} [get_ports DP0]

set_property -dict {PACKAGE_PIN F6  IOSTANDARD LVCMOS33} [get_ports A1 ]
set_property -dict {PACKAGE_PIN E6  IOSTANDARD LVCMOS33} [get_ports B1 ]
set_property -dict {PACKAGE_PIN K6  IOSTANDARD LVCMOS33} [get_ports C1 ]
set_property -dict {PACKAGE_PIN H5  IOSTANDARD LVCMOS33} [get_ports D1 ]
set_property -dict {PACKAGE_PIN H4  IOSTANDARD LVCMOS33} [get_ports E1 ]
set_property -dict {PACKAGE_PIN E7 IOSTANDARD  LVCMOS33} [get_ports F1 ]
set_property -dict {PACKAGE_PIN P18 IOSTANDARD LVCMOS33} [get_ports G1 ]
set_property -dict {PACKAGE_PIN B16 IOSTANDARD LVCMOS33} [get_ports DP1]

set_property -dict {PACKAGE_PIN C9  IOSTANDARD LVCMOS33} [get_ports SEG1]  
set_property -dict {PACKAGE_PIN B9  IOSTANDARD LVCMOS33} [get_ports SEG2]
set_property -dict {PACKAGE_PIN C10 IOSTANDARD LVCMOS33} [get_ports SEG3]
set_property -dict {PACKAGE_PIN C11 IOSTANDARD LVCMOS33} [get_ports SEG4]  
set_property -dict {PACKAGE_PIN D12 IOSTANDARD LVCMOS33} [get_ports SEG5]  
set_property -dict {PACKAGE_PIN B12 IOSTANDARD LVCMOS33} [get_ports SEG6]
set_property -dict {PACKAGE_PIN B13 IOSTANDARD LVCMOS33} [get_ports SEG7]
set_property -dict {PACKAGE_PIN D10 IOSTANDARD LVCMOS33} [get_ports SEG8]


########    VGA     #############
set_property IOSTANDARD LVCMOS33 [get_ports {vga_b[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_b[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_b[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_b[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_g[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_g[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_g[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_g[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_r[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_r[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_r[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_r[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports hsync]
set_property IOSTANDARD LVCMOS33 [get_ports rst]
set_property IOSTANDARD LVCMOS33 [get_ports vsync]

set_property PACKAGE_PIN P17 [get_ports clk]
set_property PACKAGE_PIN L5 [get_ports hsync]
set_property PACKAGE_PIN R2 [get_ports rst]
set_property PACKAGE_PIN M6 [get_ports vsync]

set_property PACKAGE_PIN B17 [get_ports {vga_r[3]}]
set_property PACKAGE_PIN A18 [get_ports {vga_r[2]}]
set_property PACKAGE_PIN B18 [get_ports {vga_r[1]}]
set_property PACKAGE_PIN D17 [get_ports {vga_r[0]}]

set_property PACKAGE_PIN E17 [get_ports {vga_g[3]}]
set_property PACKAGE_PIN D18 [get_ports {vga_g[2]}]
set_property PACKAGE_PIN F18 [get_ports {vga_g[1]}]
set_property PACKAGE_PIN E18 [get_ports {vga_g[0]}]

set_property PACKAGE_PIN G18 [get_ports {vga_b[3]}]
set_property PACKAGE_PIN G17 [get_ports {vga_b[2]}]
set_property PACKAGE_PIN J18 [get_ports {vga_b[1]}]
set_property PACKAGE_PIN J17 [get_ports {vga_b[0]}]


########    音频     #############
set_property -dict {PACKAGE_PIN H16 IOSTANDARD LVCMOS33} [get_ports ADDR1/CDATA]
set_property -dict {PACKAGE_PIN G14 IOSTANDARD LVCMOS33} [get_ports SDA/COUT]
set_property -dict {PACKAGE_PIN F16 IOSTANDARD LVCMOS33} [get_ports SCL/CCLK]
set_property -dict {PACKAGE_PIN G16 IOSTANDARD LVCMOS33} [get_ports ADDR0/CLATCH]


########    USB TO PS2     #############
set_property -dict {PACKAGE_PIN N17 IOSTANDARD LVCMOS33} [get_ports PS2_CLK]
set_property -dict {PACKAGE_PIN M18 IOSTANDARD LVCMOS33} [get_ports DATA]


########    蜂      #############
set_property -dict {PACKAGE_PIN N17 IOSTANDARD LVCMOS33} [get_ports s0]






