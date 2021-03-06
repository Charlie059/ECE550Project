transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/GX/Desktop/ECE550/Project1 {C:/Users/GX/Desktop/ECE550/Project1/alu.v}
vlog -vlog01compat -work work +incdir+C:/Users/GX/Desktop/ECE550/Project1 {C:/Users/GX/Desktop/ECE550/Project1/ADD_SUB_EN.v}
vlog -vlog01compat -work work +incdir+C:/Users/GX/Desktop/ECE550/Project1 {C:/Users/GX/Desktop/ECE550/Project1/ADD_SUB_OP.v}
vlog -vlog01compat -work work +incdir+C:/Users/GX/Desktop/ECE550/Project1 {C:/Users/GX/Desktop/ECE550/Project1/AND_3.v}
vlog -vlog01compat -work work +incdir+C:/Users/GX/Desktop/ECE550/Project1 {C:/Users/GX/Desktop/ECE550/Project1/AND_Gate_4.v}
vlog -vlog01compat -work work +incdir+C:/Users/GX/Desktop/ECE550/Project1 {C:/Users/GX/Desktop/ECE550/Project1/MUX_2to1_32B.v}
vlog -vlog01compat -work work +incdir+C:/Users/GX/Desktop/ECE550/Project1 {C:/Users/GX/Desktop/ECE550/Project1/NOT_1.v}
vlog -vlog01compat -work work +incdir+C:/Users/GX/Desktop/ECE550/Project1 {C:/Users/GX/Desktop/ECE550/Project1/NOT_32.v}
vlog -vlog01compat -work work +incdir+C:/Users/GX/Desktop/ECE550/Project1 {C:/Users/GX/Desktop/ECE550/Project1/OR_32.v}
vlog -vlog01compat -work work +incdir+C:/Users/GX/Desktop/ECE550/Project1 {C:/Users/GX/Desktop/ECE550/Project1/OR_8.v}
vlog -vlog01compat -work work +incdir+C:/Users/GX/Desktop/ECE550/Project1 {C:/Users/GX/Desktop/ECE550/Project1/carry_select_adder_32.v}
vlog -vlog01compat -work work +incdir+C:/Users/GX/Desktop/ECE550/Project1 {C:/Users/GX/Desktop/ECE550/Project1/isLessThan.v}
vlog -vlog01compat -work work +incdir+C:/Users/GX/Desktop/ECE550/Project1 {C:/Users/GX/Desktop/ECE550/Project1/isNotEqual.v}
vlog -vlog01compat -work work +incdir+C:/Users/GX/Desktop/ECE550/Project1 {C:/Users/GX/Desktop/ECE550/Project1/ArithmeticOperator.v}
vlog -vlog01compat -work work +incdir+C:/Users/GX/Desktop/ECE550/Project1 {C:/Users/GX/Desktop/ECE550/Project1/overflow.v}
vlog -vlog01compat -work work +incdir+C:/Users/GX/Desktop/ECE550/Project1 {C:/Users/GX/Desktop/ECE550/Project1/carry_select_adder_16.v}
vlog -vlog01compat -work work +incdir+C:/Users/GX/Desktop/ECE550/Project1 {C:/Users/GX/Desktop/ECE550/Project1/full_adder_1.v}
vlog -vlog01compat -work work +incdir+C:/Users/GX/Desktop/ECE550/Project1 {C:/Users/GX/Desktop/ECE550/Project1/ripple_adder_2.v}
vlog -vlog01compat -work work +incdir+C:/Users/GX/Desktop/ECE550/Project1 {C:/Users/GX/Desktop/ECE550/Project1/ripple_adder_3.v}
vlog -vlog01compat -work work +incdir+C:/Users/GX/Desktop/ECE550/Project1 {C:/Users/GX/Desktop/ECE550/Project1/ripple_adder_4.v}
vlog -vlog01compat -work work +incdir+C:/Users/GX/Desktop/ECE550/Project1 {C:/Users/GX/Desktop/ECE550/Project1/ripple_adder_5.v}
vlog -vlog01compat -work work +incdir+C:/Users/GX/Desktop/ECE550/Project1 {C:/Users/GX/Desktop/ECE550/Project1/Mux_6to3.v}
vlog -vlog01compat -work work +incdir+C:/Users/GX/Desktop/ECE550/Project1 {C:/Users/GX/Desktop/ECE550/Project1/Mux_8to4.v}
vlog -vlog01compat -work work +incdir+C:/Users/GX/Desktop/ECE550/Project1 {C:/Users/GX/Desktop/ECE550/Project1/Mux_10to5.v}
vlog -vlog01compat -work work +incdir+C:/Users/GX/Desktop/ECE550/Project1 {C:/Users/GX/Desktop/ECE550/Project1/Mux_12to6.v}
vlog -vlog01compat -work work +incdir+C:/Users/GX/Desktop/ECE550/Project1 {C:/Users/GX/Desktop/ECE550/Project1/Mux_36to18.v}

vlog -vlog01compat -work work +incdir+C:/Users/GX/Desktop/ECE550/Project1 {C:/Users/GX/Desktop/ECE550/Project1/alu_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  alu_tb

add wave *
view structure
view signals
run -all
