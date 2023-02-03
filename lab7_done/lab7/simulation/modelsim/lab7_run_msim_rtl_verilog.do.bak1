transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/My_design/lab7 {D:/My_design/lab7/seg_7.v}
vlog -vlog01compat -work work +incdir+D:/My_design/lab7 {D:/My_design/lab7/all_lights_out.v}
vlog -vlog01compat -work work +incdir+D:/My_design/lab7 {D:/My_design/lab7/ps2_keyboard.v}
vlog -vlog01compat -work work +incdir+D:/My_design/lab7 {D:/My_design/lab7/my_keyboard.v}
vlog -vlog01compat -work work +incdir+D:/My_design/lab7 {D:/My_design/lab7/lab7.v}
vlog -vlog01compat -work work +incdir+D:/My_design/lab7 {D:/My_design/lab7/key_to_ascii.v}

vlog -vlog01compat -work work +incdir+D:/My_design/lab7/simulation/modelsim {D:/My_design/lab7/simulation/modelsim/ps2_keyboard_model.vt}
vlog -vlog01compat -work work +incdir+D:/My_design/lab7/simulation/modelsim {D:/My_design/lab7/simulation/modelsim/lab7.vt}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  lab7_vlg_tst

add wave *
view structure
view signals
run -all
