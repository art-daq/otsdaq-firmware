
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

hdi::project new -name dig_mac -dir "C:/Documents and Settings/uplegger/Desktop/test beam MAR 2011/CMS_TB_DUAL_MASTER_FROM_64/GEL_CAPTAN/planAhead_run_1"
hdi::project setArch -name dig_mac -arch virtex4
hdi::design setOptions -project dig_mac -top TOP_LEVEL  
hdi::param set -name project.paUcfFile -svalue "TOP_LEVEL.ucf"
hdi::floorplan new -name floorplan_1 -part xc4vlx25ff668-10 -project dig_mac
hdi::port import -project dig_mac \
    -vhdl {PsiDecoderParameters.vhd work} \
    -vhdl {buffer_12bit.vhd work} \
    -vhdl {user_addrs_mux.vhd work} \
    -vhdl {udp_data_splicer.vhd work} \
    -vhdl {State_Machine.vhd work} \
    -vhdl {Sample_Manager.vhd work} \
    -vhdl {params_package.vhd work} \
    -vhdl {or33.vhd work} \
    -vhdl {ip_checksum_calc.vhd work} \
    -vhdl {filter_data_out.vhd work} \
    -vhdl {dest_info_container.vhd work} \
    -vhdl {decipherer.vhd work} \
    -vhdl {data_out_mux.vhd work} \
    -vhdl {dataout_mux.vhd work} \
    -vhdl {create_packet.vhd work} \
    -vhdl {Comparator.vhd work} \
    -vhdl {arp_reply.vhd work} \
    -vhdl {adc_sample_fifo12.vhd work} \
    -vhdl {ADC_block_14d.vhf work} \
    -vhdl {trig_pulse_stretch.vhd work} \
    -vhdl {trig_pulse_gen.vhd work} \
    -vhdl {stack_adc_samples.vhd work} \
    -vhdl {SPI_Data_Reg.vhd work} \
    -vhdl {SPI_Addr_Dec_async.vhd work} \
    -vhdl {scin_str.vhd work} \
    -vhdl {RX_IN_LATCH.vhd work} \
    -vhdl {RAM_COMM_DEC_9.vhd work} \
    -vhdl {psi_level_mem.vhd work} \
    -vhdl {psidecoderblock_v1_0.vhd work} \
    -vhdl {MUX64_2.vhd work} \
    -vhdl {MUX16_2.vhd work} \
    -vhdl {multitrigger_tester_.vhd work} \
    -vhdl {INFO_FIFO_0.vhd work} \
    -vhdl {GEC_TX_SEQ_CTL_8.vhd work} \
    -vhdl {GEC_RX_CTL_8.vhd work} \
    -vhdl {fake_channels.vhd work} \
    -vhdl {DIG_GEC.vhd work} \
    -vhdl {delay_counter.vhd work} \
    -vhdl {DATA_FIFO_0.vhd work} \
    -vhdl {CRC_splice.vhd work} \
    -verilog {CRC_gen.v work} \
    -verilog {CRC_chk.v work} \
    -vhdl {chip_token_manager.vhd work} \
    -vhdl {burst_controller_sm.vhd work} \
    -vhdl {buffer_4x12_to_10.vhd work} \
    -vhdl {ADC_to_MCLK_domain.vhf work} \
    -vhdl {ADC_frame_counter.vhd work} \
    -vhdl {adc_delay_logic.vhd work} \
    -vhdl {adc_calibrator.vhd work} \
    -vhdl {ADC_block.vhf work} \
    -vhdl {VERSION_BLK.vhd work} \
    -vhdl {Trigger_Counter.vhd work} \
    -vhdl {token_trigger_controller.vhd work} \
    -vhdl {token_stack.vhd work} \
    -vhdl {Test_Beam_Token_Gen.vhd work} \
    -vhdl {RESET_INIT.vhf work} \
    -vhdl {psi_token_delay_blk.vhd work} \
    -vhdl {psi_command_sender.vhd work} \
    -vhdl {psi_cmd_fifo32.vhd work} \
    -vhdl {PSI_Block.vhf work} \
    -vhdl {PLAQ_ID_GEN.vhd work} \
    -vhdl {MUX64_8.vhd work} \
    -vhdl {Master_Controls_Blk.vhf work} \
    -vhdl {mask_hack.vhd work} \
    -vhdl {gigabit_ethernet_controller.vhf work} \
    -vhdl {First_In_Chain_Gen.vhd work} \
    -vhdl {External_Trigger_Handler.vhd work} \
    -vhdl {DELAY16.vhf work} \
    -vhdl {DATA_MANAGER.vhf work} \
    -vhdl {burst_traffic_controller.vhd work} \
    -vhdl {buffer_60bit.vhd work} \
    -vhdl {ADC_channel_block.vhf work} \
    -vhdl {TOP_LEVEL.vhf work}
hdi::port export -project dig_mac -file dig_mac_pa_ports.v -format verilog
hdi::pconst import -project dig_mac -floorplan floorplan_1 -file "TOP_LEVEL.ucf"
