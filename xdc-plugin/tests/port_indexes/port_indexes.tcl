yosys -import
plugin -i design_introspection
plugin -i xdc
#Import the commands from the plugins to the tcl interpreter
yosys -import

read_verilog $::env(DESIGN_TOP).v

# -flatten is used to ensure that the output eblif has only one module.
# Some of symbiflow expects eblifs with only one module.
synth_xilinx -flatten -abc9 -nosrl -noclkbuf -nodsp

if {[info procs unknown] != ""} {
	rename unknown ""
}
proc unknown args {return "'unknown' proc command handler"}
set fp [open "port_indexes.txt" "w"]
if {[catch {invalid command} result]} {
	close $fp
	error "Command should be handled by the 'unknown' proc"
} else {
	puts $fp $result
}
#Read the design constraints
read_xdc -part_json ../xc7a35tcsg324-1.json $::env(DESIGN_TOP).xdc

if {[catch {invalid command} result]} {
	close $fp
	error "Command should be handled by the 'unknown' proc"
} else {
	puts $fp $result
}
close $fp

# Write the design in JSON format.
write_json $::env(DESIGN_TOP).json
