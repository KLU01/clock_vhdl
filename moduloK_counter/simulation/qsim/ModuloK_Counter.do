onerror {quit -f}
vlib work
vlog -work work ModuloK_Counter.vo
vlog -work work ModuloK_Counter.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.mod6_vlg_vec_tst
vcd file -direction ModuloK_Counter.msim.vcd
vcd add -internal mod6_vlg_vec_tst/*
vcd add -internal mod6_vlg_vec_tst/i1/*
add wave /*
run -all
