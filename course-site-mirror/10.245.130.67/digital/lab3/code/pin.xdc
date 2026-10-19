#SW8
set_property -dict {PACKAGE_PIN J4 IOSTANDARD LVCMOS33} [get_ports en[2]] 
#SW9
set_property -dict {PACKAGE_PIN T3 IOSTANDARD LVCMOS33} [get_ports en[1]]
#SW10
set_property -dict {PACKAGE_PIN T4 IOSTANDARD LVCMOS33} [get_ports en[0]]

#SW14
set_property -dict {PACKAGE_PIN T5 IOSTANDARD LVCMOS33} [get_ports data_in[2]]
#SW15
set_property -dict {PACKAGE_PIN J2 IOSTANDARD LVCMOS33} [get_ports data_in[1]]
#SW16
set_property -dict {PACKAGE_PIN J5 IOSTANDARD LVCMOS33} [get_ports data_in[0]]

#LED1-LED8
set_property -dict {PACKAGE_PIN D4 IOSTANDARD LVCMOS33} [get_ports {data_out[7]}]
set_property -dict {PACKAGE_PIN C5 IOSTANDARD LVCMOS33} [get_ports {data_out[6]}]
set_property -dict {PACKAGE_PIN D5 IOSTANDARD LVCMOS33} [get_ports {data_out[5]}]
set_property -dict {PACKAGE_PIN D7 IOSTANDARD LVCMOS33} [get_ports {data_out[4]}]
set_property -dict {PACKAGE_PIN B7 IOSTANDARD LVCMOS33} [get_ports {data_out[3]}]
set_property -dict {PACKAGE_PIN C7 IOSTANDARD LVCMOS33} [get_ports {data_out[2]}]
set_property -dict {PACKAGE_PIN D8 IOSTANDARD LVCMOS33} [get_ports {data_out[1]}]
set_property -dict {PACKAGE_PIN D9 IOSTANDARD LVCMOS33} [get_ports {data_out[0]}]

