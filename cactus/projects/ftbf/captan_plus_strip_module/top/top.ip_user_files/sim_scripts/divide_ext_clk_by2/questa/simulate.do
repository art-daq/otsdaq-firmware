onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib divide_ext_clk_by2_opt

do {wave.do}

view wave
view structure
view signals

do {divide_ext_clk_by2.udo}

run -all

quit -force
