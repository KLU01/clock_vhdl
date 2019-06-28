onerror {quit -f}
vlib work
vlog -work work 3bit_BCD_Counter.vo
vlog -work work 3bit_BCD_Counter.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.BCD_Counter3_vlg_vec_tst
vcd file -direction 3bit_BCD_Counter.msim.vcd
vcd add -internal BCD_Counter3_vlg_vec_tst/*
vcd add -internal BCD_Counter3_vlg_vec_tst/i1/*
add wave /*
run -all
