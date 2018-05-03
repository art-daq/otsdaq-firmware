<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="virtex4" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="adc_delayed_clk" />
        <signal name="XLXN_12534" />
        <signal name="XLXN_12535" />
        <signal name="XLXN_12536" />
        <signal name="XLXN_12537" />
        <signal name="XLXN_12538" />
        <signal name="XLXN_12539" />
        <signal name="XLXN_12540" />
        <signal name="XLXN_12541" />
        <signal name="adc_raw_data(71:60)" />
        <signal name="adc_raw_data(59:48)" />
        <signal name="adc_raw_data(47:36)" />
        <signal name="adc_raw_data(35:24)" />
        <signal name="adc_raw_data(23:12)" />
        <signal name="adc_delayed_data" />
        <signal name="XLXN_14590" />
        <signal name="XLXN_14591" />
        <signal name="XLXN_14594" />
        <signal name="XLXN_14595" />
        <signal name="b_data_we1" />
        <signal name="reset" />
        <signal name="rx_addr(4:0)" />
        <signal name="MASTER_CLK" />
        <signal name="psi_sample_sel" />
        <signal name="psi_sample_we" />
        <signal name="psi_debug_sample(1:0)" />
        <signal name="PSI_LEVELS_MAP" />
        <signal name="PSI_CLK90" />
        <signal name="psi_token_out" />
        <signal name="b_data_sel" />
        <signal name="b_data0(63:0)" />
        <signal name="b_data_we0" />
        <signal name="adc_data_label(3:0)" />
        <signal name="adc_burst_data(63:0)" />
        <signal name="XLXN_12570" />
        <signal name="adc_fifo_readen" />
        <signal name="adc_sample_fifo_re" />
        <signal name="psi_sample(11:0)" />
        <signal name="adc_raw_data(69:58)" />
        <signal name="XLXN_14592" />
        <signal name="b_data_we" />
        <signal name="b_data(63:0)" />
        <signal name="adc_sample_we" />
        <signal name="adc_burst_we" />
        <signal name="b_data1(28:0)" />
        <signal name="rx_data(19:10)" />
        <signal name="rx_data(29:20)" />
        <signal name="rx_data(39:30)" />
        <signal name="rx_data(49:40)" />
        <signal name="rx_data(59:50)" />
        <signal name="rx_data(9:0)" />
        <signal name="psi_sample(11:2)" />
        <signal name="XLXN_15154" />
        <signal name="b_data1(63:0)" />
        <signal name="adc_raw_data(11:0)" />
        <signal name="adc_raw_data(71:0)" />
        <signal name="adc_raw_data(69:10)" />
        <signal name="rx_data(63:0)" />
        <signal name="adc_clk" />
        <signal name="adc_data" />
        <signal name="adc_frame" />
        <port polarity="Input" name="adc_delayed_clk" />
        <port polarity="Input" name="adc_delayed_data" />
        <port polarity="Input" name="reset" />
        <port polarity="Input" name="rx_addr(4:0)" />
        <port polarity="Input" name="MASTER_CLK" />
        <port polarity="Input" name="psi_sample_sel" />
        <port polarity="Input" name="psi_debug_sample(1:0)" />
        <port polarity="Input" name="PSI_LEVELS_MAP" />
        <port polarity="Input" name="PSI_CLK90" />
        <port polarity="Input" name="psi_token_out" />
        <port polarity="Input" name="b_data_sel" />
        <port polarity="Input" name="adc_data_label(3:0)" />
        <port polarity="Output" name="b_data_we" />
        <port polarity="Output" name="b_data(63:0)" />
        <port polarity="Input" name="adc_sample_we" />
        <port polarity="Input" name="adc_burst_we" />
        <port polarity="Input" name="rx_data(63:0)" />
        <port polarity="Input" name="adc_clk" />
        <port polarity="Input" name="adc_data" />
        <port polarity="Input" name="adc_frame" />
        <blockdef name="ADC_block_2">
            <timestamp>2008-11-6T23:11:12</timestamp>
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="256" x="64" y="-192" height="320" />
            <line x2="0" y1="32" y2="32" x1="64" />
            <line x2="0" y1="96" y2="96" x1="64" />
            <line x2="384" y1="32" y2="32" x1="320" />
            <line x2="384" y1="96" y2="96" x1="320" />
            <rect width="64" x="320" y="-76" height="24" />
            <line x2="384" y1="-64" y2="-64" x1="320" />
        </blockdef>
        <blockdef name="buf">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="0" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="-64" x1="128" />
            <line x2="64" y1="-64" y2="0" x1="64" />
        </blockdef>
        <blockdef name="PsiDecoderBlock">
            <timestamp>2009-3-23T15:32:8</timestamp>
            <line x2="0" y1="-864" y2="-864" x1="64" />
            <line x2="0" y1="-800" y2="-800" x1="64" />
            <line x2="0" y1="-736" y2="-736" x1="64" />
            <line x2="0" y1="-672" y2="-672" x1="64" />
            <line x2="0" y1="-608" y2="-608" x1="64" />
            <line x2="0" y1="-544" y2="-544" x1="64" />
            <rect width="64" x="0" y="-492" height="24" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <rect width="64" x="0" y="-428" height="24" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <rect width="64" x="0" y="-364" height="24" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <rect width="64" x="0" y="-300" height="24" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <rect width="64" x="0" y="-236" height="24" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="576" y1="-928" y2="-928" x1="512" />
            <rect width="64" x="512" y="-44" height="24" />
            <line x2="576" y1="-32" y2="-32" x1="512" />
            <rect width="448" x="64" y="-960" height="1020" />
            <rect width="64" x="0" y="20" height="24" />
            <line x2="0" y1="32" y2="32" x1="64" />
        </blockdef>
        <blockdef name="psi_token_delay_blk">
            <timestamp>2009-4-21T20:22:37</timestamp>
            <rect width="256" x="64" y="-128" height="128" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
        </blockdef>
        <blockdef name="MUX64_2">
            <timestamp>2008-6-18T18:43:41</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-172" height="24" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
        </blockdef>
        <blockdef name="m2_1">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="96" y1="-64" y2="-192" x1="96" />
            <line x2="96" y1="-96" y2="-64" x1="256" />
            <line x2="256" y1="-160" y2="-96" x1="256" />
            <line x2="256" y1="-192" y2="-160" x1="96" />
            <line x2="96" y1="-32" y2="-32" x1="176" />
            <line x2="176" y1="-80" y2="-32" x1="176" />
            <line x2="96" y1="-32" y2="-32" x1="0" />
            <line x2="256" y1="-128" y2="-128" x1="320" />
            <line x2="96" y1="-96" y2="-96" x1="0" />
            <line x2="96" y1="-160" y2="-160" x1="0" />
        </blockdef>
        <blockdef name="adc_burst_data_splicer">
            <timestamp>2009-3-11T19:57:24</timestamp>
            <rect width="256" x="64" y="-128" height="128" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-108" height="24" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
        </blockdef>
        <blockdef name="burst_test_fifo64">
            <timestamp>2008-11-7T21:27:55</timestamp>
            <rect width="256" x="64" y="-384" height="384" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-352" y2="-352" x1="320" />
            <line x2="384" y1="-192" y2="-192" x1="320" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="inv">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="160" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="64" y1="0" y2="-64" x1="64" />
            <circle r="16" cx="144" cy="-32" />
        </blockdef>
        <blockdef name="fd">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <rect width="256" x="64" y="-320" height="256" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <line x2="64" y1="-128" y2="-144" x1="80" />
            <line x2="80" y1="-112" y2="-128" x1="64" />
        </blockdef>
        <blockdef name="adc_sample_fifo12">
            <timestamp>2009-3-11T20:14:40</timestamp>
            <rect width="256" x="64" y="-384" height="384" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-352" y2="-352" x1="320" />
            <line x2="384" y1="-192" y2="-192" x1="320" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <block symbolname="ADC_block_2" name="XLXI_3493">
            <blockpin signalname="adc_delayed_clk" name="DCK" />
            <blockpin signalname="XLXN_12534" name="D0_IN" />
            <blockpin signalname="XLXN_12535" name="D1_IN" />
            <blockpin signalname="XLXN_12536" name="D0" />
            <blockpin signalname="XLXN_12537" name="D1" />
            <blockpin signalname="adc_raw_data(59:48)" name="DOUT(11:0)" />
        </block>
        <block symbolname="ADC_block_2" name="XLXI_3494">
            <blockpin signalname="adc_delayed_clk" name="DCK" />
            <blockpin signalname="XLXN_12536" name="D0_IN" />
            <blockpin signalname="XLXN_12537" name="D1_IN" />
            <blockpin signalname="XLXN_12538" name="D0" />
            <blockpin signalname="XLXN_12539" name="D1" />
            <blockpin signalname="adc_raw_data(47:36)" name="DOUT(11:0)" />
        </block>
        <block symbolname="ADC_block_2" name="XLXI_3495">
            <blockpin signalname="adc_delayed_clk" name="DCK" />
            <blockpin signalname="XLXN_12538" name="D0_IN" />
            <blockpin signalname="XLXN_12539" name="D1_IN" />
            <blockpin signalname="XLXN_12540" name="D0" />
            <blockpin signalname="XLXN_12541" name="D1" />
            <blockpin signalname="adc_raw_data(35:24)" name="DOUT(11:0)" />
        </block>
        <block symbolname="ADC_block_2" name="XLXI_3496">
            <blockpin signalname="adc_delayed_clk" name="DCK" />
            <blockpin signalname="XLXN_12540" name="D0_IN" />
            <blockpin signalname="XLXN_12541" name="D1_IN" />
            <blockpin signalname="XLXN_14590" name="D0" />
            <blockpin signalname="XLXN_14591" name="D1" />
            <blockpin signalname="adc_raw_data(23:12)" name="DOUT(11:0)" />
        </block>
        <block symbolname="buf" name="XLXI_86">
            <blockpin signalname="adc_delayed_data" name="I" />
            <blockpin signalname="XLXN_14595" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_85">
            <blockpin signalname="adc_delayed_data" name="I" />
            <blockpin signalname="XLXN_14594" name="O" />
        </block>
        <block symbolname="ADC_block_2" name="XLXI_3483">
            <blockpin signalname="adc_delayed_clk" name="DCK" />
            <blockpin signalname="XLXN_14594" name="D0_IN" />
            <blockpin signalname="XLXN_14595" name="D1_IN" />
            <blockpin signalname="XLXN_12534" name="D0" />
            <blockpin signalname="XLXN_12535" name="D1" />
            <blockpin signalname="adc_raw_data(71:60)" name="DOUT(11:0)" />
        </block>
        <block symbolname="burst_test_fifo64" name="XLXI_3499">
            <blockpin signalname="MASTER_CLK" name="rd_clk" />
            <blockpin signalname="adc_fifo_readen" name="rd_en" />
            <blockpin signalname="reset" name="rst" />
            <blockpin signalname="adc_delayed_clk" name="wr_clk" />
            <blockpin signalname="adc_burst_we" name="wr_en" />
            <blockpin signalname="adc_burst_data(63:0)" name="din(63:0)" />
            <blockpin signalname="XLXN_12570" name="empty" />
            <blockpin name="full" />
            <blockpin signalname="b_data0(63:0)" name="dout(63:0)" />
        </block>
        <block symbolname="inv" name="XLXI_3503">
            <blockpin signalname="XLXN_12570" name="I" />
            <blockpin signalname="adc_fifo_readen" name="O" />
        </block>
        <block symbolname="fd" name="XLXI_3504">
            <blockpin signalname="MASTER_CLK" name="C" />
            <blockpin signalname="adc_fifo_readen" name="D" />
            <blockpin signalname="b_data_we0" name="Q" />
        </block>
        <block symbolname="inv" name="XLXI_4112">
            <blockpin signalname="XLXN_14592" name="I" />
            <blockpin signalname="adc_sample_fifo_re" name="O" />
        </block>
        <block symbolname="fd" name="XLXI_4113">
            <blockpin signalname="MASTER_CLK" name="C" />
            <blockpin signalname="adc_sample_fifo_re" name="D" />
            <blockpin signalname="psi_sample_we" name="Q" />
        </block>
        <block symbolname="adc_sample_fifo12" name="XLXI_4116">
            <blockpin signalname="MASTER_CLK" name="rd_clk" />
            <blockpin signalname="adc_sample_fifo_re" name="rd_en" />
            <blockpin signalname="reset" name="rst" />
            <blockpin signalname="adc_delayed_clk" name="wr_clk" />
            <blockpin signalname="adc_sample_we" name="wr_en" />
            <blockpin signalname="adc_raw_data(69:58)" name="din(11:0)" />
            <blockpin signalname="XLXN_14592" name="empty" />
            <blockpin name="full" />
            <blockpin signalname="psi_sample(11:0)" name="dout(11:0)" />
        </block>
        <block symbolname="PsiDecoderBlock" name="XLXI_4093">
            <blockpin signalname="psi_sample_we" name="ADC_WR_EN" />
            <blockpin signalname="MASTER_CLK" name="MASTER_CLOCK" />
            <blockpin signalname="reset" name="RESET" />
            <blockpin signalname="psi_sample_sel" name="SAMPLE_SEL" />
            <blockpin signalname="XLXN_15154" name="TOKEN_OUT" />
            <blockpin signalname="PSI_LEVELS_MAP" name="WR_EN_MEM" />
            <blockpin signalname="psi_sample(11:2)" name="ADC_DATA_IN(9:0)" />
            <blockpin signalname="rx_addr(4:0)" name="CHIP_ID_WR(4:0)" />
            <blockpin signalname="rx_data(19:10)" name="LEVEL0(9:0)" />
            <blockpin signalname="rx_data(29:20)" name="LEVEL1(9:0)" />
            <blockpin signalname="rx_data(39:30)" name="LEVEL2(9:0)" />
            <blockpin signalname="rx_data(49:40)" name="LEVEL3(9:0)" />
            <blockpin signalname="rx_data(59:50)" name="LEVEL4(9:0)" />
            <blockpin signalname="rx_data(9:0)" name="ULTRABLACK(9:0)" />
            <blockpin signalname="b_data_we1" name="DATA_OUT_WR" />
            <blockpin signalname="b_data1(28:0)" name="DATA_OUT(28:0)" />
            <blockpin signalname="psi_debug_sample(1:0)" name="DEBUG_SEL(1:0)" />
        </block>
        <block symbolname="psi_token_delay_blk" name="XLXI_4617">
            <blockpin signalname="PSI_CLK90" name="clk" />
            <blockpin signalname="psi_token_out" name="token" />
            <blockpin signalname="XLXN_15154" name="token_delay" />
        </block>
        <block symbolname="MUX64_2" name="XLXI_4088">
            <blockpin signalname="b_data_sel" name="sel" />
            <blockpin signalname="b_data0(63:0)" name="in0(63:0)" />
            <blockpin signalname="b_data1(63:0)" name="in1(63:0)" />
            <blockpin signalname="b_data(63:0)" name="muxout(63:0)" />
        </block>
        <block symbolname="m2_1" name="XLXI_4089">
            <blockpin signalname="b_data_we0" name="D0" />
            <blockpin signalname="b_data_we1" name="D1" />
            <blockpin signalname="b_data_sel" name="S0" />
            <blockpin signalname="b_data_we" name="O" />
        </block>
        <block symbolname="ADC_block_2" name="XLXI_4119">
            <blockpin signalname="adc_delayed_clk" name="DCK" />
            <blockpin signalname="XLXN_14590" name="D0_IN" />
            <blockpin signalname="XLXN_14591" name="D1_IN" />
            <blockpin name="D0" />
            <blockpin name="D1" />
            <blockpin signalname="adc_raw_data(11:0)" name="DOUT(11:0)" />
        </block>
        <block symbolname="adc_burst_data_splicer" name="XLXI_4097">
            <blockpin signalname="adc_raw_data(69:10)" name="adc_data(59:0)" />
            <blockpin signalname="adc_data_label(3:0)" name="data_label(3:0)" />
            <blockpin signalname="adc_burst_data(63:0)" name="dout(63:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="7040" height="5440">
        <branch name="adc_delayed_clk">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1696" y="4816" type="branch" />
            <wire x2="1872" y1="4816" y2="4816" x1="1696" />
            <wire x2="1984" y1="4816" y2="4816" x1="1872" />
            <wire x2="1872" y1="4704" y2="4816" x1="1872" />
            <wire x2="2432" y1="4704" y2="4704" x1="1872" />
            <wire x2="2432" y1="4704" y2="4816" x1="2432" />
            <wire x2="2528" y1="4816" y2="4816" x1="2432" />
            <wire x2="2976" y1="4704" y2="4704" x1="2432" />
            <wire x2="2976" y1="4704" y2="4816" x1="2976" />
            <wire x2="3040" y1="4816" y2="4816" x1="2976" />
            <wire x2="3488" y1="4704" y2="4704" x1="2976" />
            <wire x2="3488" y1="4704" y2="4816" x1="3488" />
            <wire x2="3536" y1="4816" y2="4816" x1="3488" />
            <wire x2="3984" y1="4704" y2="4704" x1="3488" />
            <wire x2="3984" y1="4704" y2="4816" x1="3984" />
            <wire x2="4032" y1="4816" y2="4816" x1="3984" />
            <wire x2="4480" y1="4704" y2="4704" x1="3984" />
            <wire x2="4480" y1="4704" y2="4816" x1="4480" />
            <wire x2="4528" y1="4816" y2="4816" x1="4480" />
        </branch>
        <instance x="2528" y="4976" name="XLXI_3493" orien="R0">
        </instance>
        <instance x="3040" y="4976" name="XLXI_3494" orien="R0">
        </instance>
        <instance x="3536" y="4976" name="XLXI_3495" orien="R0">
        </instance>
        <instance x="4032" y="4976" name="XLXI_3496" orien="R0">
        </instance>
        <branch name="XLXN_12534">
            <wire x2="2528" y1="5008" y2="5008" x1="2368" />
        </branch>
        <branch name="XLXN_12535">
            <wire x2="2528" y1="5072" y2="5072" x1="2368" />
        </branch>
        <branch name="XLXN_12536">
            <wire x2="3040" y1="5008" y2="5008" x1="2912" />
        </branch>
        <branch name="XLXN_12537">
            <wire x2="3040" y1="5072" y2="5072" x1="2912" />
        </branch>
        <branch name="XLXN_12538">
            <wire x2="3536" y1="5008" y2="5008" x1="3424" />
        </branch>
        <branch name="XLXN_12539">
            <wire x2="3536" y1="5072" y2="5072" x1="3424" />
        </branch>
        <branch name="XLXN_12540">
            <wire x2="4032" y1="5008" y2="5008" x1="3920" />
        </branch>
        <branch name="XLXN_12541">
            <wire x2="4032" y1="5072" y2="5072" x1="3920" />
        </branch>
        <branch name="adc_raw_data(71:60)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2480" y="4912" type="branch" />
            <wire x2="2480" y1="4912" y2="4912" x1="2368" />
        </branch>
        <branch name="adc_raw_data(59:48)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3008" y="4912" type="branch" />
            <wire x2="3008" y1="4912" y2="4912" x1="2912" />
        </branch>
        <branch name="adc_raw_data(47:36)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3520" y="4912" type="branch" />
            <wire x2="3520" y1="4912" y2="4912" x1="3424" />
        </branch>
        <branch name="adc_raw_data(35:24)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4016" y="4912" type="branch" />
            <wire x2="4016" y1="4912" y2="4912" x1="3920" />
        </branch>
        <branch name="adc_raw_data(23:12)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4512" y="4912" type="branch" />
            <wire x2="4512" y1="4912" y2="4912" x1="4416" />
        </branch>
        <instance x="1504" y="5104" name="XLXI_86" orien="R0" />
        <instance x="1504" y="5040" name="XLXI_85" orien="R0" />
        <branch name="adc_delayed_data">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1408" y="5008" type="branch" />
            <wire x2="1440" y1="5008" y2="5008" x1="1408" />
            <wire x2="1504" y1="5008" y2="5008" x1="1440" />
            <wire x2="1440" y1="5008" y2="5072" x1="1440" />
            <wire x2="1504" y1="5072" y2="5072" x1="1440" />
        </branch>
        <instance x="1984" y="4976" name="XLXI_3483" orien="R0">
        </instance>
        <branch name="XLXN_14590">
            <wire x2="4432" y1="5008" y2="5008" x1="4416" />
            <wire x2="4528" y1="5008" y2="5008" x1="4432" />
        </branch>
        <branch name="XLXN_14591">
            <wire x2="4432" y1="5072" y2="5072" x1="4416" />
            <wire x2="4528" y1="5072" y2="5072" x1="4432" />
        </branch>
        <branch name="XLXN_14594">
            <wire x2="1984" y1="5008" y2="5008" x1="1728" />
        </branch>
        <branch name="XLXN_14595">
            <wire x2="1984" y1="5072" y2="5072" x1="1728" />
        </branch>
        <instance x="1728" y="4304" name="XLXI_3499" orien="R0">
        </instance>
        <branch name="adc_delayed_clk">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1600" y="4144" type="branch" />
            <wire x2="1728" y1="4144" y2="4144" x1="1600" />
        </branch>
        <branch name="reset">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1568" y="4080" type="branch" />
            <wire x2="1728" y1="4080" y2="4080" x1="1568" />
        </branch>
        <branch name="MASTER_CLK">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1504" y="3952" type="branch" />
            <wire x2="1552" y1="3952" y2="3952" x1="1504" />
            <wire x2="1728" y1="3952" y2="3952" x1="1552" />
            <wire x2="1552" y1="3856" y2="3952" x1="1552" />
            <wire x2="2176" y1="3856" y2="3856" x1="1552" />
            <wire x2="2176" y1="3856" y2="4224" x1="2176" />
            <wire x2="2640" y1="4224" y2="4224" x1="2176" />
        </branch>
        <branch name="XLXN_12570">
            <wire x2="2304" y1="3952" y2="3952" x1="2112" />
        </branch>
        <instance x="2304" y="3984" name="XLXI_3503" orien="R0" />
        <branch name="adc_fifo_readen">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="2592" y="3952" type="branch" />
            <wire x2="2592" y1="3808" y2="3808" x1="1664" />
            <wire x2="2592" y1="3808" y2="3952" x1="2592" />
            <wire x2="2592" y1="3952" y2="4096" x1="2592" />
            <wire x2="2640" y1="4096" y2="4096" x1="2592" />
            <wire x2="1664" y1="3808" y2="4016" x1="1664" />
            <wire x2="1728" y1="4016" y2="4016" x1="1664" />
            <wire x2="2592" y1="3952" y2="3952" x1="2528" />
        </branch>
        <branch name="b_data_we0">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3072" y="4096" type="branch" />
            <wire x2="3072" y1="4096" y2="4096" x1="3024" />
        </branch>
        <branch name="b_data0(63:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2320" y="4272" type="branch" />
            <wire x2="2320" y1="4272" y2="4272" x1="2112" />
        </branch>
        <instance x="2640" y="4352" name="XLXI_3504" orien="R0" />
        <branch name="adc_burst_data(63:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1584" y="4272" type="branch" />
            <wire x2="1728" y1="4272" y2="4272" x1="1584" />
        </branch>
        <branch name="adc_delayed_clk">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1520" y="3296" type="branch" />
            <wire x2="1648" y1="3296" y2="3296" x1="1520" />
        </branch>
        <branch name="reset">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1488" y="3232" type="branch" />
            <wire x2="1648" y1="3232" y2="3232" x1="1488" />
        </branch>
        <branch name="MASTER_CLK">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1424" y="3104" type="branch" />
            <wire x2="1472" y1="3104" y2="3104" x1="1424" />
            <wire x2="1648" y1="3104" y2="3104" x1="1472" />
            <wire x2="1472" y1="3008" y2="3104" x1="1472" />
            <wire x2="2096" y1="3008" y2="3008" x1="1472" />
            <wire x2="2096" y1="3008" y2="3376" x1="2096" />
            <wire x2="2560" y1="3376" y2="3376" x1="2096" />
        </branch>
        <instance x="2224" y="3136" name="XLXI_4112" orien="R0" />
        <branch name="adc_sample_fifo_re">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="2512" y="3104" type="branch" />
            <wire x2="2512" y1="2960" y2="2960" x1="1584" />
            <wire x2="2512" y1="2960" y2="3104" x1="2512" />
            <wire x2="2512" y1="3104" y2="3248" x1="2512" />
            <wire x2="2560" y1="3248" y2="3248" x1="2512" />
            <wire x2="1584" y1="2960" y2="3168" x1="1584" />
            <wire x2="1648" y1="3168" y2="3168" x1="1584" />
            <wire x2="2512" y1="3104" y2="3104" x1="2448" />
        </branch>
        <branch name="psi_sample_we">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2992" y="3248" type="branch" />
            <wire x2="2992" y1="3248" y2="3248" x1="2944" />
        </branch>
        <branch name="psi_sample(11:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2240" y="3424" type="branch" />
            <wire x2="2240" y1="3424" y2="3424" x1="2032" />
        </branch>
        <instance x="2560" y="3504" name="XLXI_4113" orien="R0" />
        <branch name="adc_raw_data(69:58)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1552" y="3424" type="branch" />
            <wire x2="1648" y1="3424" y2="3424" x1="1552" />
        </branch>
        <instance x="1648" y="3456" name="XLXI_4116" orien="R0">
        </instance>
        <branch name="XLXN_14592">
            <wire x2="2224" y1="3104" y2="3104" x1="2032" />
        </branch>
        <branch name="b_data_we">
            <wire x2="6272" y1="304" y2="304" x1="6128" />
        </branch>
        <iomarker fontsize="28" x="6272" y="304" name="b_data_we" orien="R0" />
        <branch name="b_data(63:0)">
            <wire x2="6272" y1="352" y2="352" x1="6128" />
        </branch>
        <iomarker fontsize="28" x="6272" y="352" name="b_data(63:0)" orien="R0" />
        <branch name="adc_sample_we">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1520" y="3360" type="branch" />
            <wire x2="1648" y1="3360" y2="3360" x1="1520" />
        </branch>
        <branch name="adc_burst_we">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1600" y="4208" type="branch" />
            <wire x2="1728" y1="4208" y2="4208" x1="1600" />
        </branch>
        <branch name="b_data1(28:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3504" y="2224" type="branch" />
            <wire x2="3504" y1="2224" y2="2224" x1="3376" />
        </branch>
        <branch name="b_data_we1">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3488" y="1328" type="branch" />
            <wire x2="3488" y1="1328" y2="1328" x1="3376" />
        </branch>
        <branch name="reset">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2640" y="1520" type="branch" />
            <wire x2="2800" y1="1520" y2="1520" x1="2640" />
        </branch>
        <instance x="2800" y="2256" name="XLXI_4093" orien="R0">
        </instance>
        <branch name="rx_addr(4:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2640" y="1840" type="branch" />
            <wire x2="2800" y1="1840" y2="1840" x1="2640" />
        </branch>
        <branch name="rx_data(19:10)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2640" y="1904" type="branch" />
            <wire x2="2800" y1="1904" y2="1904" x1="2640" />
        </branch>
        <branch name="rx_data(29:20)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2640" y="1968" type="branch" />
            <wire x2="2800" y1="1968" y2="1968" x1="2640" />
        </branch>
        <branch name="rx_data(39:30)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2640" y="2032" type="branch" />
            <wire x2="2800" y1="2032" y2="2032" x1="2640" />
        </branch>
        <branch name="rx_data(49:40)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2640" y="2096" type="branch" />
            <wire x2="2800" y1="2096" y2="2096" x1="2640" />
        </branch>
        <branch name="rx_data(59:50)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2640" y="2160" type="branch" />
            <wire x2="2800" y1="2160" y2="2160" x1="2640" />
        </branch>
        <branch name="rx_data(9:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2640" y="2224" type="branch" />
            <wire x2="2800" y1="2224" y2="2224" x1="2640" />
        </branch>
        <branch name="MASTER_CLK">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2640" y="1456" type="branch" />
            <wire x2="2800" y1="1456" y2="1456" x1="2640" />
        </branch>
        <branch name="psi_sample_sel">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2640" y="1584" type="branch" />
            <wire x2="2800" y1="1584" y2="1584" x1="2640" />
        </branch>
        <branch name="psi_sample(11:2)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2640" y="1776" type="branch" />
            <wire x2="2800" y1="1776" y2="1776" x1="2640" />
        </branch>
        <branch name="psi_sample_we">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2640" y="1392" type="branch" />
            <wire x2="2800" y1="1392" y2="1392" x1="2640" />
        </branch>
        <branch name="psi_debug_sample(1:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2640" y="2288" type="branch" />
            <wire x2="2800" y1="2288" y2="2288" x1="2640" />
        </branch>
        <branch name="PSI_LEVELS_MAP">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2640" y="1712" type="branch" />
            <wire x2="2800" y1="1712" y2="1712" x1="2640" />
        </branch>
        <instance x="1888" y="1744" name="XLXI_4617" orien="R0">
        </instance>
        <branch name="XLXN_15154">
            <wire x2="2800" y1="1648" y2="1648" x1="2272" />
        </branch>
        <branch name="PSI_CLK90">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1728" y="1648" type="branch" />
            <wire x2="1888" y1="1648" y2="1648" x1="1728" />
        </branch>
        <branch name="psi_token_out">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1728" y="1712" type="branch" />
            <wire x2="1888" y1="1712" y2="1712" x1="1728" />
        </branch>
        <instance x="5104" y="736" name="XLXI_4088" orien="R0">
        </instance>
        <instance x="5104" y="464" name="XLXI_4089" orien="R0" />
        <branch name="b_data_we">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="5616" y="336" type="branch" />
            <wire x2="5616" y1="336" y2="336" x1="5424" />
        </branch>
        <branch name="b_data(63:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="5616" y="576" type="branch" />
            <wire x2="5616" y1="576" y2="576" x1="5488" />
        </branch>
        <branch name="b_data_sel">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4944" y="432" type="branch" />
            <wire x2="5104" y1="432" y2="432" x1="4944" />
        </branch>
        <branch name="b_data_sel">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4944" y="576" type="branch" />
            <wire x2="5104" y1="576" y2="576" x1="4944" />
        </branch>
        <branch name="b_data0(63:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4944" y="640" type="branch" />
            <wire x2="5104" y1="640" y2="640" x1="4944" />
        </branch>
        <branch name="b_data1(63:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4944" y="704" type="branch" />
            <wire x2="5104" y1="704" y2="704" x1="4944" />
        </branch>
        <branch name="b_data_we1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4944" y="368" type="branch" />
            <wire x2="5104" y1="368" y2="368" x1="4944" />
        </branch>
        <branch name="b_data_we0">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4944" y="304" type="branch" />
            <wire x2="5104" y1="304" y2="304" x1="4944" />
        </branch>
        <instance x="4528" y="4976" name="XLXI_4119" orien="R0">
        </instance>
        <branch name="adc_raw_data(11:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="5008" y="4912" type="branch" />
            <wire x2="5008" y1="4912" y2="4912" x1="4912" />
        </branch>
        <branch name="adc_raw_data(71:0)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="4720" y="4592" type="branch" />
            <wire x2="4720" y1="4592" y2="4592" x1="4608" />
            <wire x2="4832" y1="4592" y2="4592" x1="4720" />
        </branch>
        <instance x="4560" y="4240" name="XLXI_4097" orien="R0">
        </instance>
        <branch name="adc_data_label(3:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4432" y="4208" type="branch" />
            <wire x2="4560" y1="4208" y2="4208" x1="4432" />
        </branch>
        <branch name="adc_raw_data(69:10)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4432" y="4144" type="branch" />
            <wire x2="4560" y1="4144" y2="4144" x1="4432" />
        </branch>
        <branch name="adc_burst_data(63:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="5088" y="4144" type="branch" />
            <wire x2="5088" y1="4144" y2="4144" x1="4944" />
        </branch>
        <branch name="psi_token_out">
            <wire x2="992" y1="112" y2="112" x1="848" />
        </branch>
        <branch name="MASTER_CLK">
            <wire x2="992" y1="160" y2="160" x1="848" />
        </branch>
        <branch name="PSI_CLK90">
            <wire x2="992" y1="208" y2="208" x1="848" />
        </branch>
        <branch name="reset">
            <wire x2="992" y1="256" y2="256" x1="848" />
        </branch>
        <branch name="rx_data(63:0)">
            <wire x2="992" y1="304" y2="304" x1="848" />
        </branch>
        <iomarker fontsize="28" x="848" y="112" name="psi_token_out" orien="R180" />
        <iomarker fontsize="28" x="848" y="160" name="MASTER_CLK" orien="R180" />
        <iomarker fontsize="28" x="848" y="208" name="PSI_CLK90" orien="R180" />
        <iomarker fontsize="28" x="848" y="256" name="reset" orien="R180" />
        <iomarker fontsize="28" x="848" y="304" name="rx_data(63:0)" orien="R180" />
        <branch name="psi_sample_sel">
            <wire x2="992" y1="464" y2="464" x1="848" />
        </branch>
        <iomarker fontsize="28" x="848" y="464" name="psi_sample_sel" orien="R180" />
        <iomarker fontsize="28" x="848" y="512" name="PSI_LEVELS_MAP" orien="R180" />
        <branch name="PSI_LEVELS_MAP">
            <wire x2="992" y1="512" y2="512" x1="848" />
        </branch>
        <branch name="rx_addr(4:0)">
            <wire x2="992" y1="352" y2="352" x1="848" />
        </branch>
        <iomarker fontsize="28" x="848" y="352" name="rx_addr(4:0)" orien="R180" />
        <branch name="adc_data_label(3:0)">
            <wire x2="976" y1="704" y2="704" x1="832" />
        </branch>
        <branch name="psi_debug_sample(1:0)">
            <wire x2="976" y1="752" y2="752" x1="832" />
        </branch>
        <branch name="adc_sample_we">
            <wire x2="976" y1="896" y2="896" x1="832" />
        </branch>
        <branch name="adc_burst_we">
            <wire x2="976" y1="944" y2="944" x1="832" />
        </branch>
        <branch name="b_data_sel">
            <wire x2="976" y1="848" y2="848" x1="832" />
        </branch>
        <iomarker fontsize="28" x="832" y="704" name="adc_data_label(3:0)" orien="R180" />
        <iomarker fontsize="28" x="832" y="752" name="psi_debug_sample(1:0)" orien="R180" />
        <iomarker fontsize="28" x="832" y="896" name="adc_sample_we" orien="R180" />
        <iomarker fontsize="28" x="832" y="944" name="adc_burst_we" orien="R180" />
        <iomarker fontsize="28" x="832" y="848" name="b_data_sel" orien="R180" />
        <branch name="adc_frame">
            <wire x2="976" y1="1072" y2="1072" x1="832" />
        </branch>
        <branch name="adc_data">
            <wire x2="976" y1="1120" y2="1120" x1="832" />
        </branch>
        <iomarker fontsize="28" x="832" y="1072" name="adc_frame" orien="R180" />
        <iomarker fontsize="28" x="832" y="1120" name="adc_data" orien="R180" />
        <branch name="adc_clk">
            <wire x2="976" y1="1024" y2="1024" x1="832" />
        </branch>
        <iomarker fontsize="28" x="832" y="1024" name="adc_clk" orien="R180" />
    </sheet>
    <sheet sheetnum="2" width="7040" height="5440">
    </sheet>
</drawing>