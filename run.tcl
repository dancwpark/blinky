set project_name blinky
set project_path /home/user/Documents/fpga_projects

open_project $project_path/$project_name/$project_name.xpr

set num_jobs 12

#reset_run synth_1
#launch_runs synth_1
#wait_on_run synth_1
#
#reset_run impl_1
#launch_runs impl_1
#wait_on_run impl_1
#
#launch_runs impl_1 -to_step write_bitstream
#wait_on_run impl_1

open_hw_manager
connect_hw_server
open_hw_target
set_property PROGRAM.FILE $project_path/$project_name/$project_name.runs/impl_1/led_blink.bit [current_hw_device]
program_hw_device

close_project

