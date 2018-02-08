<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="virtex4" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="clk_in" />
        <signal name="fast_clk" />
        <signal name="tap1" />
        <signal name="tap2" />
        <signal name="tap3" />
        <signal name="tap4" />
        <signal name="tap8" />
        <signal name="tap7" />
        <signal name="tap6" />
        <signal name="tap5" />
        <signal name="delay_add(0)" />
        <signal name="delay_add(1)" />
        <signal name="delay_add(2)" />
        <signal name="delay_add(2:0)" />
        <signal name="clk_out" />
        <signal name="XLXN_17508" />
        <signal name="clk_off" />
        <port polarity="Input" name="clk_in" />
        <port polarity="Input" name="fast_clk" />
        <port polarity="Input" name="delay_add(2:0)" />
        <port polarity="Output" name="clk_out" />
        <port polarity="Input" name="clk_off" />
        <blockdef name="fd">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <rect width="256" x="64" y="-320" height="256" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <line x2="64" y1="-128" y2="-144" x1="80" />
            <line x2="80" y1="-112" y2="-128" x1="64" />
        </blockdef>
        <blockdef name="m8_1e">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="96" y1="-224" y2="-224" x1="0" />
            <line x2="96" y1="-160" y2="-160" x1="0" />
            <line x2="96" y1="-96" y2="-96" x1="0" />
            <line x2="96" y1="-288" y2="-288" x1="0" />
            <line x2="96" y1="-352" y2="-352" x1="0" />
            <line x2="96" y1="-416" y2="-416" x1="0" />
            <line x2="96" y1="-544" y2="-544" x1="0" />
            <line x2="96" y1="-608" y2="-608" x1="0" />
            <line x2="96" y1="-672" y2="-672" x1="0" />
            <line x2="96" y1="-736" y2="-736" x1="0" />
            <line x2="96" y1="-160" y2="-160" x1="160" />
            <line x2="160" y1="-268" y2="-160" x1="160" />
            <line x2="96" y1="-224" y2="-224" x1="128" />
            <line x2="128" y1="-264" y2="-224" x1="128" />
            <line x2="96" y1="-96" y2="-96" x1="192" />
            <line x2="192" y1="-276" y2="-96" x1="192" />
            <line x2="96" y1="-32" y2="-32" x1="224" />
            <line x2="224" y1="-280" y2="-32" x1="224" />
            <line x2="256" y1="-512" y2="-512" x1="320" />
            <line x2="96" y1="-768" y2="-256" x1="96" />
            <line x2="96" y1="-704" y2="-768" x1="256" />
            <line x2="256" y1="-288" y2="-704" x1="256" />
            <line x2="256" y1="-256" y2="-288" x1="96" />
            <line x2="96" y1="-32" y2="-32" x1="0" />
            <line x2="96" y1="-480" y2="-480" x1="0" />
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
        <block symbolname="fd" name="XLXI_5666">
            <blockpin signalname="fast_clk" name="C" />
            <blockpin signalname="clk_in" name="D" />
            <blockpin signalname="tap1" name="Q" />
        </block>
        <block symbolname="fd" name="XLXI_5667">
            <blockpin signalname="fast_clk" name="C" />
            <blockpin signalname="tap1" name="D" />
            <blockpin signalname="tap2" name="Q" />
        </block>
        <block symbolname="fd" name="XLXI_5668">
            <blockpin signalname="fast_clk" name="C" />
            <blockpin signalname="tap2" name="D" />
            <blockpin signalname="tap3" name="Q" />
        </block>
        <block symbolname="fd" name="XLXI_5669">
            <blockpin signalname="fast_clk" name="C" />
            <blockpin signalname="tap3" name="D" />
            <blockpin signalname="tap4" name="Q" />
        </block>
        <block symbolname="fd" name="XLXI_5670">
            <blockpin signalname="fast_clk" name="C" />
            <blockpin signalname="tap5" name="D" />
            <blockpin signalname="tap6" name="Q" />
        </block>
        <block symbolname="fd" name="XLXI_5671">
            <blockpin signalname="fast_clk" name="C" />
            <blockpin signalname="tap6" name="D" />
            <blockpin signalname="tap7" name="Q" />
        </block>
        <block symbolname="fd" name="XLXI_5672">
            <blockpin signalname="fast_clk" name="C" />
            <blockpin signalname="tap7" name="D" />
            <blockpin signalname="tap8" name="Q" />
        </block>
        <block symbolname="m8_1e" name="XLXI_5687">
            <blockpin signalname="tap1" name="D0" />
            <blockpin signalname="tap2" name="D1" />
            <blockpin signalname="tap3" name="D2" />
            <blockpin signalname="tap4" name="D3" />
            <blockpin signalname="tap5" name="D4" />
            <blockpin signalname="tap6" name="D5" />
            <blockpin signalname="tap7" name="D6" />
            <blockpin signalname="tap8" name="D7" />
            <blockpin signalname="XLXN_17508" name="E" />
            <blockpin signalname="delay_add(0)" name="S0" />
            <blockpin signalname="delay_add(1)" name="S1" />
            <blockpin signalname="delay_add(2)" name="S2" />
            <blockpin signalname="clk_out" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_5689">
            <blockpin signalname="clk_off" name="I" />
            <blockpin signalname="XLXN_17508" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="752" y="1968" name="XLXI_5666" orien="R0" />
        <instance x="1232" y="1968" name="XLXI_5667" orien="R0" />
        <instance x="1696" y="1968" name="XLXI_5668" orien="R0" />
        <instance x="2176" y="1968" name="XLXI_5669" orien="R0" />
        <instance x="752" y="2416" name="XLXI_5670" orien="R0" />
        <instance x="1232" y="2416" name="XLXI_5671" orien="R0" />
        <instance x="1696" y="2416" name="XLXI_5672" orien="R0" />
        <branch name="clk_in">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="640" y="1712" type="branch" />
            <wire x2="752" y1="1712" y2="1712" x1="640" />
        </branch>
        <branch name="tap1">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="1168" y="1712" type="branch" />
            <wire x2="1168" y1="1712" y2="1712" x1="1136" />
            <wire x2="1232" y1="1712" y2="1712" x1="1168" />
        </branch>
        <branch name="tap2">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="1664" y="1712" type="branch" />
            <wire x2="1664" y1="1712" y2="1712" x1="1616" />
            <wire x2="1696" y1="1712" y2="1712" x1="1664" />
        </branch>
        <branch name="tap3">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="2112" y="1712" type="branch" />
            <wire x2="2112" y1="1712" y2="1712" x1="2080" />
            <wire x2="2176" y1="1712" y2="1712" x1="2112" />
        </branch>
        <branch name="tap4">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2672" y="1712" type="branch" />
            <wire x2="2672" y1="1712" y2="1712" x1="2560" />
        </branch>
        <branch name="tap8">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="2128" y="2160" type="branch" />
            <wire x2="2128" y1="2160" y2="2160" x1="2080" />
            <wire x2="2176" y1="2160" y2="2160" x1="2128" />
        </branch>
        <branch name="tap7">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="1648" y="2160" type="branch" />
            <wire x2="1648" y1="2160" y2="2160" x1="1616" />
            <wire x2="1696" y1="2160" y2="2160" x1="1648" />
        </branch>
        <branch name="tap6">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="1168" y="2160" type="branch" />
            <wire x2="1168" y1="2160" y2="2160" x1="1136" />
            <wire x2="1232" y1="2160" y2="2160" x1="1168" />
        </branch>
        <branch name="tap5">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="640" y="2160" type="branch" />
            <wire x2="752" y1="2160" y2="2160" x1="640" />
        </branch>
        <branch name="fast_clk">
            <wire x2="720" y1="1984" y2="1984" x1="368" />
            <wire x2="720" y1="1984" y2="2288" x1="720" />
            <wire x2="720" y1="2288" y2="2496" x1="720" />
            <wire x2="736" y1="2496" y2="2496" x1="720" />
            <wire x2="1200" y1="2496" y2="2496" x1="736" />
            <wire x2="1632" y1="2496" y2="2496" x1="1200" />
            <wire x2="2144" y1="2496" y2="2496" x1="1632" />
            <wire x2="736" y1="2288" y2="2288" x1="720" />
            <wire x2="752" y1="2288" y2="2288" x1="736" />
            <wire x2="1200" y1="1984" y2="1984" x1="720" />
            <wire x2="1680" y1="1984" y2="1984" x1="1200" />
            <wire x2="2144" y1="1984" y2="1984" x1="1680" />
            <wire x2="752" y1="1840" y2="1840" x1="720" />
            <wire x2="720" y1="1840" y2="1984" x1="720" />
            <wire x2="1200" y1="1840" y2="1984" x1="1200" />
            <wire x2="1232" y1="1840" y2="1840" x1="1200" />
            <wire x2="1232" y1="2288" y2="2288" x1="1200" />
            <wire x2="1200" y1="2288" y2="2496" x1="1200" />
            <wire x2="1696" y1="2288" y2="2288" x1="1632" />
            <wire x2="1632" y1="2288" y2="2496" x1="1632" />
            <wire x2="1680" y1="1840" y2="1984" x1="1680" />
            <wire x2="1696" y1="1840" y2="1840" x1="1680" />
            <wire x2="2144" y1="1840" y2="1984" x1="2144" />
            <wire x2="2176" y1="1840" y2="1840" x1="2144" />
            <wire x2="2144" y1="2288" y2="2496" x1="2144" />
        </branch>
        <iomarker fontsize="28" x="288" y="432" name="clk_in" orien="R180" />
        <branch name="delay_add(2:0)">
            <wire x2="1328" y1="1184" y2="1184" x1="1136" />
        </branch>
        <iomarker fontsize="28" x="1136" y="1184" name="delay_add(2:0)" orien="R180" />
        <branch name="clk_out">
            <wire x2="2960" y1="560" y2="560" x1="2752" />
            <wire x2="2976" y1="560" y2="560" x1="2960" />
        </branch>
        <iomarker fontsize="28" x="2976" y="560" name="clk_out" orien="R0" />
        <branch name="delay_add(2)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2336" y="976" type="branch" />
            <wire x2="2352" y1="976" y2="976" x1="2336" />
            <wire x2="2432" y1="976" y2="976" x1="2352" />
        </branch>
        <branch name="delay_add(1)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2336" y="912" type="branch" />
            <wire x2="2352" y1="912" y2="912" x1="2336" />
            <wire x2="2432" y1="912" y2="912" x1="2352" />
        </branch>
        <branch name="delay_add(0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2336" y="848" type="branch" />
            <wire x2="2352" y1="848" y2="848" x1="2336" />
            <wire x2="2432" y1="848" y2="848" x1="2352" />
        </branch>
        <branch name="tap8">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2336" y="784" type="branch" />
            <wire x2="2352" y1="784" y2="784" x1="2336" />
            <wire x2="2432" y1="784" y2="784" x1="2352" />
        </branch>
        <branch name="tap7">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2336" y="720" type="branch" />
            <wire x2="2352" y1="720" y2="720" x1="2336" />
            <wire x2="2432" y1="720" y2="720" x1="2352" />
        </branch>
        <branch name="tap6">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2336" y="656" type="branch" />
            <wire x2="2352" y1="656" y2="656" x1="2336" />
            <wire x2="2432" y1="656" y2="656" x1="2352" />
        </branch>
        <branch name="tap5">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2336" y="592" type="branch" />
            <wire x2="2352" y1="592" y2="592" x1="2336" />
            <wire x2="2432" y1="592" y2="592" x1="2352" />
        </branch>
        <branch name="tap4">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2336" y="528" type="branch" />
            <wire x2="2352" y1="528" y2="528" x1="2336" />
            <wire x2="2432" y1="528" y2="528" x1="2352" />
        </branch>
        <branch name="tap3">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2336" y="464" type="branch" />
            <wire x2="2352" y1="464" y2="464" x1="2336" />
            <wire x2="2432" y1="464" y2="464" x1="2352" />
        </branch>
        <branch name="tap2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2336" y="400" type="branch" />
            <wire x2="2352" y1="400" y2="400" x1="2336" />
            <wire x2="2432" y1="400" y2="400" x1="2352" />
        </branch>
        <branch name="tap1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2336" y="336" type="branch" />
            <wire x2="2352" y1="336" y2="336" x1="2336" />
            <wire x2="2432" y1="336" y2="336" x1="2352" />
        </branch>
        <instance x="2432" y="1072" name="XLXI_5687" orien="R0" />
        <branch name="XLXN_17508">
            <wire x2="2432" y1="1040" y2="1040" x1="2400" />
        </branch>
        <instance x="2176" y="1072" name="XLXI_5689" orien="R0" />
        <branch name="clk_off">
            <wire x2="2176" y1="1040" y2="1040" x1="2016" />
        </branch>
        <iomarker fontsize="28" x="2016" y="1040" name="clk_off" orien="R180" />
        <branch name="clk_in">
            <wire x2="352" y1="432" y2="432" x1="288" />
        </branch>
        <iomarker fontsize="28" x="368" y="1984" name="fast_clk" orien="R180" />
    </sheet>
</drawing>