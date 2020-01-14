#set_property LOC R2 [get_ports led]
set_property DRIVE I12 [get_ports {led[0]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {led[1]}]
set_property SLEW FAST [get_ports {led[1]}]
set_property IOSTANDARD SSTL135 [get_ports {led[1]}]
set_property SLEW FAST [get_ports {led[2]}]
set_property IOSTANDARD SSTL135 [get_ports {led[2]}]
set_property SLEW FAST [get_ports {led[3]}]
set_property IOSTANDARD SSTL135 [get_ports {led[3]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {out_a}]
set_property SLEW FAST [get_ports {out_a}]
set_property IOSTANDARD SSTL135 [get_ports {out_a}]
set_property SLEW FAST [get_ports {out_b[0]}]
set_property IOSTANDARD SSTL135 [get_ports {out_b[0]}]
set_property SLEW FAST [get_ports {out_b[1]}]
set_property IOSTANDARD SSTL135 [get_ports {out_b[1]}]
#set_property INTERNAL_VREF 0.600 [get_iobanks 14]
#set_property INTERNAL_VREF 0.675 [get_iobanks 15]
#set_property INTERNAL_VREF 0.750 [get_iobanks 16]
#set_property INTERNAL_VREF 0.900 [get_iobanks 34]
#set_property INTERNAL_VREF 0.900 [get_iobanks 35]

