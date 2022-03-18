onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+strips_mclk_mmcm -L xpm -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.strips_mclk_mmcm xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {strips_mclk_mmcm.udo}

run -all

endsim

quit -force
