transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/My_design/lab3 {D:/My_design/lab3/ALU_1.v}
vlog -vlog01compat -work work +incdir+D:/My_design/lab3 {D:/My_design/lab3/lab3.v}

vlog -vlog01compat -work work +incdir+D:/My_design/lab3/simulation/modelsim {D:/My_design/lab3/simulation/modelsim/lab3.vt}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  lab3_vlg_tst

add wave *
view structure
view signals
run -all
