onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+divide_ext_clk_by2 -L xpm -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.divide_ext_clk_by2 xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {divide_ext_clk_by2.udo}

run -all

endsim

quit -force
