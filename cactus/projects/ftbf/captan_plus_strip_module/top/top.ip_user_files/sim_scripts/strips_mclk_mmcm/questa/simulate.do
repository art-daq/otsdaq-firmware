onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib strips_mclk_mmcm_opt

do {wave.do}

view wave
view structure
view signals

do {strips_mclk_mmcm.udo}

run -all

quit -force
