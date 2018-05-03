<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="virtex4" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="adc_sample_we" />
        <signal name="XLXN_14592" />
        <signal name="adc_raw_data(11:0)" />
        <signal name="adc_single_sample_we" />
        <signal name="adc_sample_fifo_re" />
        <signal name="MASTER_CLK" />
        <signal name="reset" />
        <signal name="adc_delayed_clk" />
        <signal name="adc_single_sample(11:0)" />
        <port polarity="Input" name="adc_sample_we" />
        <port polarity="Input" name="adc_raw_data(11:0)" />
        <port polarity="Output" name="adc_single_sample_we" />
        <port polarity="Input" name="MASTER_CLK" />
        <port polarity="Input" name="reset" />
        <port polarity="Input" name="adc_delayed_clk" />
        <port polarity="Output" name="adc_single_sample(11:0)" />
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
        <blockdef name="fd">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <rect width="256" x="64" y="-320" height="256" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <line x2="64" y1="-128" y2="-144" x1="80" />
            <line x2="80" y1="-112" y2="-128" x1="64" />
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
        <block symbolname="adc_sample_fifo12" name="ch_sample_fifo">
            <blockpin signalname="MASTER_CLK" name="rd_clk" />
            <blockpin signalname="adc_sample_fifo_re" name="rd_en" />
            <blockpin signalname="reset" name="rst" />
            <blockpin signalname="adc_delayed_clk" name="wr_clk" />
            <blockpin signalname="adc_sample_we" name="wr_en" />
            <blockpin signalname="adc_raw_data(11:0)" name="din(11:0)" />
            <blockpin signalname="XLXN_14592" name="empty" />
            <blockpin name="full" />
            <blockpin signalname="adc_single_sample(11:0)" name="dout(11:0)" />
        </block>
        <block symbolname="fd" name="XLXI_4113">
            <blockpin signalname="MASTER_CLK" name="C" />
            <blockpin signalname="adc_sample_fifo_re" name="D" />
            <blockpin signalname="adc_single_sample_we" name="Q" />
        </block>
        <block symbolname="inv" name="XLXI_4112">
            <blockpin signalname="XLXN_14592" name="I" />
            <blockpin signalname="adc_sample_fifo_re" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="7040" height="5440">
        <instance x="1584" y="2560" name="ch_sample_fifo" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial" attrname="InstName" x="20" y="-472" type="instance" />
        </instance>
        <instance x="2496" y="2608" name="XLXI_4113" orien="R0" />
        <instance x="2160" y="2240" name="XLXI_4112" orien="R0" />
        <branch name="adc_sample_we">
            <wire x2="1584" y1="2464" y2="2464" x1="1456" />
        </branch>
        <branch name="XLXN_14592">
            <wire x2="2160" y1="2208" y2="2208" x1="1968" />
        </branch>
        <branch name="adc_raw_data(11:0)">
            <wire x2="1584" y1="2528" y2="2528" x1="1488" />
        </branch>
        <branch name="adc_single_sample_we">
            <wire x2="2928" y1="2352" y2="2352" x1="2880" />
        </branch>
        <branch name="adc_sample_fifo_re">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="2448" y="2208" type="branch" />
            <wire x2="2448" y1="2064" y2="2064" x1="1520" />
            <wire x2="2448" y1="2064" y2="2208" x1="2448" />
            <wire x2="2448" y1="2208" y2="2352" x1="2448" />
            <wire x2="2496" y1="2352" y2="2352" x1="2448" />
            <wire x2="1520" y1="2064" y2="2272" x1="1520" />
            <wire x2="1584" y1="2272" y2="2272" x1="1520" />
            <wire x2="2448" y1="2208" y2="2208" x1="2384" />
        </branch>
        <branch name="MASTER_CLK">
            <wire x2="1408" y1="2208" y2="2208" x1="1360" />
            <wire x2="1584" y1="2208" y2="2208" x1="1408" />
            <wire x2="1408" y1="2112" y2="2208" x1="1408" />
            <wire x2="2032" y1="2112" y2="2112" x1="1408" />
            <wire x2="2032" y1="2112" y2="2480" x1="2032" />
            <wire x2="2496" y1="2480" y2="2480" x1="2032" />
        </branch>
        <branch name="reset">
            <wire x2="1456" y1="2336" y2="2336" x1="1424" />
            <wire x2="1584" y1="2336" y2="2336" x1="1456" />
        </branch>
        <branch name="adc_delayed_clk">
            <wire x2="1584" y1="2400" y2="2400" x1="1456" />
        </branch>
        <iomarker fontsize="28" x="1488" y="2528" name="adc_raw_data(11:0)" orien="R180" />
        <iomarker fontsize="28" x="2928" y="2352" name="adc_single_sample_we" orien="R0" />
        <iomarker fontsize="28" x="1360" y="2208" name="MASTER_CLK" orien="R180" />
        <iomarker fontsize="28" x="1424" y="2336" name="reset" orien="R180" />
        <iomarker fontsize="28" x="1456" y="2400" name="adc_delayed_clk" orien="R180" />
        <iomarker fontsize="28" x="1456" y="2464" name="adc_sample_we" orien="R180" />
        <branch name="adc_single_sample(11:0)">
            <wire x2="2048" y1="2528" y2="2528" x1="1968" />
        </branch>
        <iomarker fontsize="28" x="2048" y="2528" name="adc_single_sample(11:0)" orien="R0" />
    </sheet>
</drawing>