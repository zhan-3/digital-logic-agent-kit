########    拨码开关SW      #############
set_property -dict {PACKAGE_PIN R2 IOSTANDARD LVCMOS33} [get_ports a[7]]
set_property -dict {PACKAGE_PIN R3 IOSTANDARD LVCMOS33} [get_ports a[6]]
set_property -dict {PACKAGE_PIN M4 IOSTANDARD LVCMOS33} [get_ports a[5]]
set_property -dict {PACKAGE_PIN M3 IOSTANDARD LVCMOS33} [get_ports a[4]]
set_property -dict {PACKAGE_PIN P2 IOSTANDARD LVCMOS33} [get_ports a[3]]
set_property -dict {PACKAGE_PIN N4 IOSTANDARD LVCMOS33} [get_ports a[2]]
set_property -dict {PACKAGE_PIN N6 IOSTANDARD LVCMOS33} [get_ports a[1]]
set_property -dict {PACKAGE_PIN L4 IOSTANDARD LVCMOS33} [get_ports a[0]]
set_property -dict {PACKAGE_PIN J4 IOSTANDARD LVCMOS33} [get_ports b[7]]
set_property -dict {PACKAGE_PIN T3 IOSTANDARD LVCMOS33} [get_ports b[6]]
set_property -dict {PACKAGE_PIN T4 IOSTANDARD LVCMOS33} [get_ports b[5]]
set_property -dict {PACKAGE_PIN U3 IOSTANDARD LVCMOS33} [get_ports b[4]]
set_property -dict {PACKAGE_PIN U4 IOSTANDARD LVCMOS33} [get_ports b[3]]
set_property -dict {PACKAGE_PIN T5 IOSTANDARD LVCMOS33} [get_ports b[2]]
set_property -dict {PACKAGE_PIN J2 IOSTANDARD LVCMOS33} [get_ports b[1]]
set_property -dict {PACKAGE_PIN J5 IOSTANDARD LVCMOS33} [get_ports b[0]]

########    按键      #############
set_property -dict {PACKAGE_PIN M2 IOSTANDARD LVCMOS33} [get_ports add_op]
set_property -dict {PACKAGE_PIN N2 IOSTANDARD LVCMOS33} [get_ports sub_op]
set_property -dict {PACKAGE_PIN M1 IOSTANDARD LVCMOS33} [get_ports and_op]
set_property -dict {PACKAGE_PIN L1 IOSTANDARD LVCMOS33} [get_ports or_op]
set_property -dict {PACKAGE_PIN N1 IOSTANDARD LVCMOS33} [get_ports shl_op]


########    LED     #############
set_property -dict {PACKAGE_PIN D4 IOSTANDARD LVCMOS33} [get_ports {carry_out}]
set_property -dict {PACKAGE_PIN C5 IOSTANDARD LVCMOS33} [get_ports {zero}]
set_property -dict {PACKAGE_PIN J3 IOSTANDARD LVCMOS33} [get_ports {result[7]}]
set_property -dict {PACKAGE_PIN H2 IOSTANDARD LVCMOS33} [get_ports {result[6]}]
set_property -dict {PACKAGE_PIN G4 IOSTANDARD LVCMOS33} [get_ports {result[5]}]
set_property -dict {PACKAGE_PIN G2 IOSTANDARD LVCMOS33} [get_ports {result[4]}]
set_property -dict {PACKAGE_PIN G3 IOSTANDARD LVCMOS33} [get_ports {result[3]}]
set_property -dict {PACKAGE_PIN G6 IOSTANDARD LVCMOS33} [get_ports {result[2]}]
set_property -dict {PACKAGE_PIN F5 IOSTANDARD LVCMOS33} [get_ports {result[1]}]
set_property -dict {PACKAGE_PIN E5 IOSTANDARD LVCMOS33} [get_ports {result[0]}]

