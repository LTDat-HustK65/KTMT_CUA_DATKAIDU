vdel -all
vlib work

vlog  -work work *.v 
vsim -novopt work.testbench
add wave -position insertpoint sim:/testbench/*

run -all