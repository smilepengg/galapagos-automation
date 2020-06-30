#Open Hardware Manager (automatic)
open_hw
connect_hw_server

#opening hardware target
open_hw_target
set_property PROGRAM.FILE {shellTop.bit} [lindex [get_hw_devices] 0]
current_hw_device [lindex [get_hw_devices] 0]

#Programming device
set_property PROGRAM.FILE {shellTop.bit} [lindex [get_hw_devices] 0]
program_hw_devices [lindex [get_hw_devices] 0]
