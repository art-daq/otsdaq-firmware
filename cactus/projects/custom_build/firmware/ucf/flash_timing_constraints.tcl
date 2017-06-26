#Timing constraints for the flash interface

create_clock -period 25.000 -name FLASH_CLK [get_ports FLASH_CLK]

set_false_path -from [get_clocks PHY_RXCLK] -to [get_clocks FLASH_CLK]
set_false_path -from [get_clocks FLASH_CLK] -to [get_clocks PHY_RXCLK]

