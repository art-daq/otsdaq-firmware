
set_property PACKAGE_PIN Y26 [get_ports FLASH_CLK]
set_property IOSTANDARD LVCMOS33 [get_ports FLASH_CLK]

set_property PACKAGE_PIN V28 [get_ports ram_io_0]
set_property IOSTANDARD LVCMOS33 [get_ports ram_io_0]
set_property PACKAGE_PIN V29 [get_ports ram_io_1]
set_property IOSTANDARD LVCMOS33 [get_ports ram_io_1]
set_property PACKAGE_PIN V26 [get_ports ram_io_2]
set_property IOSTANDARD LVCMOS33 [get_ports ram_io_2]
set_property PACKAGE_PIN V27 [get_ports ram_io_3]
set_property IOSTANDARD LVCMOS33 [get_ports ram_io_3]

set_property PACKAGE_PIN Y27 [get_ports ram_chip_select]
set_property IOSTANDARD LVCMOS33 [get_ports ram_chip_select]
set_property PACKAGE_PIN V34 [get_ports spi_reset]
set_property IOSTANDARD LVCMOS33 [get_ports spi_reset]

create_clock -period 25.000 -name FLASH_CLK [get_ports FLASH_CLK]


set_false_path -from [get_clocks PHY_RXCLK] -to [get_clocks FLASH_CLK]
set_false_path -from [get_clocks FLASH_CLK] -to [get_clocks PHY_RXCLK]


