<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="virtex4" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="adc_delayed_data" />
        <signal name="adc_delayed_clk" />
        <signal name="adc_sample(11:0)" />
        <port polarity="Input" name="adc_delayed_data" />
        <port polarity="Input" name="adc_delayed_clk" />
        <port polarity="Output" name="adc_sample(11:0)" />
        <blockdef name="ADC_block_14d">
            <timestamp>2013-9-23T16:24:6</timestamp>
            <rect width="64" x="320" y="84" height="24" />
            <line x2="384" y1="96" y2="96" x1="320" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="256" x="64" y="-192" height="320" />
        </blockdef>
        <block symbolname="ADC_block_14d" name="XLXI_5007">
            <blockpin signalname="adc_delayed_clk" name="DCK" />
            <blockpin signalname="adc_delayed_data" name="D0_IN" />
            <blockpin signalname="adc_sample(11:0)" name="sample(11:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="7040" height="5440">
        <iomarker fontsize="28" x="1120" y="2528" name="adc_delayed_data" orien="R180" />
        <branch name="adc_delayed_data">
            <wire x2="1344" y1="2528" y2="2528" x1="1120" />
        </branch>
        <branch name="adc_delayed_clk">
            <wire x2="1344" y1="2400" y2="2400" x1="1040" />
        </branch>
        <iomarker fontsize="28" x="1040" y="2400" name="adc_delayed_clk" orien="R180" />
        <branch name="adc_sample(11:0)">
            <wire x2="1840" y1="2656" y2="2656" x1="1728" />
        </branch>
        <iomarker fontsize="28" x="1840" y="2656" name="adc_sample(11:0)" orien="R0" />
        <instance x="1344" y="2560" name="XLXI_5007" orien="R0">
        </instance>
    </sheet>
</drawing>