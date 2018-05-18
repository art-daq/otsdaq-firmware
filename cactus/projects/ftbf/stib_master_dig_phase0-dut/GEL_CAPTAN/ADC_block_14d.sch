<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="virtex4" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="DCK" />
        <signal name="sample(11:0)" />
        <signal name="D0_IN" />
        <signal name="DOUT(15:0)" />
        <signal name="DOUT(14:3)" />
        <signal name="DOUT(1)" />
        <signal name="DOUT(0)" />
        <signal name="DOUT(2)" />
        <signal name="DOUT(3)" />
        <signal name="DOUT(4)" />
        <signal name="DOUT(6)" />
        <signal name="DOUT(8)" />
        <signal name="DOUT(10)" />
        <signal name="DOUT(5)" />
        <signal name="DOUT(11)" />
        <signal name="DOUT(7)" />
        <signal name="DOUT(9)" />
        <signal name="DOUT(12)" />
        <signal name="DOUT(13)" />
        <signal name="DOUT(15)" />
        <signal name="DOUT(14)" />
        <port polarity="Input" name="DCK" />
        <port polarity="Output" name="sample(11:0)" />
        <port polarity="Input" name="D0_IN" />
        <blockdef name="fd">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <rect width="256" x="64" y="-320" height="256" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <line x2="64" y1="-128" y2="-144" x1="80" />
            <line x2="80" y1="-112" y2="-128" x1="64" />
        </blockdef>
        <blockdef name="fd_1">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="40" y1="-128" y2="-128" x1="0" />
            <circle r="12" cx="52" cy="-128" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <rect width="256" x="64" y="-320" height="256" />
            <line x2="80" y1="-112" y2="-128" x1="64" />
            <line x2="64" y1="-128" y2="-144" x1="80" />
        </blockdef>
        <blockdef name="buffer_12bit">
            <timestamp>2009-12-5T0:51:3</timestamp>
            <rect width="256" x="64" y="-64" height="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <block symbolname="buffer_12bit" name="XLXI_258">
            <blockpin signalname="DOUT(14:3)" name="i(11:0)" />
            <blockpin signalname="sample(11:0)" name="o(11:0)" />
        </block>
        <block symbolname="fd_1" name="XLXI_256">
            <blockpin signalname="DCK" name="C" />
            <blockpin signalname="D0_IN" name="D" />
            <blockpin signalname="DOUT(15)" name="Q" />
        </block>
        <block symbolname="fd" name="XLXI_257">
            <blockpin signalname="DCK" name="C" />
            <blockpin signalname="D0_IN" name="D" />
            <blockpin signalname="DOUT(14)" name="Q" />
        </block>
        <block symbolname="fd" name="XLXI_38">
            <blockpin signalname="DCK" name="C" />
            <blockpin signalname="DOUT(2)" name="D" />
            <blockpin signalname="DOUT(0)" name="Q" />
        </block>
        <block symbolname="fd_1" name="XLXI_62">
            <blockpin signalname="DCK" name="C" />
            <blockpin signalname="DOUT(3)" name="D" />
            <blockpin signalname="DOUT(1)" name="Q" />
        </block>
        <block symbolname="fd_1" name="XLXI_61">
            <blockpin signalname="DCK" name="C" />
            <blockpin signalname="DOUT(5)" name="D" />
            <blockpin signalname="DOUT(3)" name="Q" />
        </block>
        <block symbolname="fd_1" name="XLXI_60">
            <blockpin signalname="DCK" name="C" />
            <blockpin signalname="DOUT(7)" name="D" />
            <blockpin signalname="DOUT(5)" name="Q" />
        </block>
        <block symbolname="fd_1" name="XLXI_59">
            <blockpin signalname="DCK" name="C" />
            <blockpin signalname="DOUT(9)" name="D" />
            <blockpin signalname="DOUT(7)" name="Q" />
        </block>
        <block symbolname="fd_1" name="XLXI_56">
            <blockpin signalname="DCK" name="C" />
            <blockpin signalname="DOUT(11)" name="D" />
            <blockpin signalname="DOUT(9)" name="Q" />
        </block>
        <block symbolname="fd_1" name="XLXI_55">
            <blockpin signalname="DCK" name="C" />
            <blockpin signalname="DOUT(13)" name="D" />
            <blockpin signalname="DOUT(11)" name="Q" />
        </block>
        <block symbolname="fd" name="XLXI_36">
            <blockpin signalname="DCK" name="C" />
            <blockpin signalname="DOUT(4)" name="D" />
            <blockpin signalname="DOUT(2)" name="Q" />
        </block>
        <block symbolname="fd" name="XLXI_34">
            <blockpin signalname="DCK" name="C" />
            <blockpin signalname="DOUT(6)" name="D" />
            <blockpin signalname="DOUT(4)" name="Q" />
        </block>
        <block symbolname="fd" name="XLXI_32">
            <blockpin signalname="DCK" name="C" />
            <blockpin signalname="DOUT(8)" name="D" />
            <blockpin signalname="DOUT(6)" name="Q" />
        </block>
        <block symbolname="fd" name="XLXI_30">
            <blockpin signalname="DCK" name="C" />
            <blockpin signalname="DOUT(10)" name="D" />
            <blockpin signalname="DOUT(8)" name="Q" />
        </block>
        <block symbolname="fd" name="XLXI_28">
            <blockpin signalname="DCK" name="C" />
            <blockpin signalname="DOUT(12)" name="D" />
            <blockpin signalname="DOUT(10)" name="Q" />
        </block>
        <block symbolname="fd_1" name="XLXI_273">
            <blockpin signalname="DCK" name="C" />
            <blockpin signalname="DOUT(15)" name="D" />
            <blockpin signalname="DOUT(13)" name="Q" />
        </block>
        <block symbolname="fd" name="XLXI_274">
            <blockpin signalname="DCK" name="C" />
            <blockpin signalname="DOUT(14)" name="D" />
            <blockpin signalname="DOUT(12)" name="Q" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="7040" height="5440">
        <branch name="sample(11:0)">
            <wire x2="4448" y1="2224" y2="2224" x1="3968" />
        </branch>
        <iomarker fontsize="28" x="4448" y="2224" name="sample(11:0)" orien="R0" />
        <branch name="D0_IN">
            <wire x2="592" y1="1408" y2="1408" x1="384" />
            <wire x2="592" y1="1408" y2="1760" x1="592" />
            <wire x2="880" y1="1760" y2="1760" x1="592" />
            <wire x2="880" y1="1408" y2="1408" x1="592" />
        </branch>
        <branch name="DCK">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="816" y="1536" type="branch" />
            <wire x2="816" y1="1536" y2="1536" x1="784" />
            <wire x2="880" y1="1536" y2="1536" x1="816" />
        </branch>
        <iomarker fontsize="28" x="368" y="1888" name="DCK" orien="R180" />
        <iomarker fontsize="28" x="384" y="1408" name="D0_IN" orien="R180" />
        <branch name="DCK">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="816" y="1888" type="branch" />
            <wire x2="672" y1="1888" y2="1888" x1="368" />
            <wire x2="784" y1="1888" y2="1888" x1="672" />
            <wire x2="816" y1="1888" y2="1888" x1="784" />
            <wire x2="880" y1="1888" y2="1888" x1="816" />
        </branch>
        <branch name="DOUT(15:0)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="2128" y="2336" type="branch" />
            <wire x2="2128" y1="2336" y2="2336" x1="1920" />
            <wire x2="2208" y1="2336" y2="2336" x1="2128" />
        </branch>
        <instance x="3584" y="2256" name="XLXI_258" orien="R0">
        </instance>
        <branch name="DOUT(14:3)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3504" y="2224" type="branch" />
            <wire x2="3584" y1="2224" y2="2224" x1="3504" />
        </branch>
        <instance x="880" y="1664" name="XLXI_256" orien="R0" />
        <instance x="880" y="2016" name="XLXI_257" orien="R0" />
        <branch name="DOUT(1)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="4784" y="1408" type="branch" />
            <wire x2="4784" y1="1408" y2="1408" x1="4720" />
            <wire x2="4832" y1="1408" y2="1408" x1="4784" />
        </branch>
        <branch name="DOUT(0)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="4800" y="1760" type="branch" />
            <wire x2="4800" y1="1760" y2="1760" x1="4720" />
            <wire x2="4816" y1="1760" y2="1760" x1="4800" />
        </branch>
        <instance x="4336" y="2016" name="XLXI_38" orien="R0" />
        <instance x="4336" y="1664" name="XLXI_62" orien="R0" />
        <instance x="3840" y="1664" name="XLXI_61" orien="R0" />
        <instance x="3360" y="1664" name="XLXI_60" orien="R0" />
        <instance x="2880" y="1664" name="XLXI_59" orien="R0" />
        <instance x="2368" y="1664" name="XLXI_56" orien="R0" />
        <instance x="1872" y="1664" name="XLXI_55" orien="R0" />
        <instance x="3840" y="2016" name="XLXI_36" orien="R0" />
        <instance x="3360" y="2016" name="XLXI_34" orien="R0" />
        <instance x="2880" y="2016" name="XLXI_32" orien="R0" />
        <instance x="2368" y="2016" name="XLXI_30" orien="R0" />
        <instance x="1872" y="2016" name="XLXI_28" orien="R0" />
        <branch name="DCK">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="3776" y="1536" type="branch" />
            <wire x2="3776" y1="1536" y2="1536" x1="3744" />
            <wire x2="3840" y1="1536" y2="1536" x1="3776" />
        </branch>
        <branch name="DCK">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="4256" y="1536" type="branch" />
            <wire x2="4256" y1="1536" y2="1536" x1="4224" />
            <wire x2="4336" y1="1536" y2="1536" x1="4256" />
        </branch>
        <branch name="DCK">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="4272" y="1888" type="branch" />
            <wire x2="4272" y1="1888" y2="1888" x1="4240" />
            <wire x2="4336" y1="1888" y2="1888" x1="4272" />
        </branch>
        <branch name="DCK">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="3776" y="1888" type="branch" />
            <wire x2="3776" y1="1888" y2="1888" x1="3744" />
            <wire x2="3840" y1="1888" y2="1888" x1="3776" />
        </branch>
        <branch name="DOUT(2)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="4240" y="1760" type="branch" />
            <wire x2="4240" y1="1760" y2="1760" x1="4224" />
            <wire x2="4336" y1="1760" y2="1760" x1="4240" />
        </branch>
        <branch name="DOUT(3)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="4272" y="1408" type="branch" />
            <wire x2="4272" y1="1408" y2="1408" x1="4224" />
            <wire x2="4336" y1="1408" y2="1408" x1="4272" />
        </branch>
        <branch name="DCK">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="3296" y="1888" type="branch" />
            <wire x2="3296" y1="1888" y2="1888" x1="3264" />
            <wire x2="3360" y1="1888" y2="1888" x1="3296" />
        </branch>
        <branch name="DCK">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="2304" y="1888" type="branch" />
            <wire x2="2304" y1="1888" y2="1888" x1="2272" />
            <wire x2="2368" y1="1888" y2="1888" x1="2304" />
        </branch>
        <branch name="DCK">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="2816" y="1888" type="branch" />
            <wire x2="2816" y1="1888" y2="1888" x1="2784" />
            <wire x2="2880" y1="1888" y2="1888" x1="2816" />
        </branch>
        <branch name="DCK">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="3296" y="1536" type="branch" />
            <wire x2="3296" y1="1536" y2="1536" x1="3264" />
            <wire x2="3360" y1="1536" y2="1536" x1="3296" />
        </branch>
        <branch name="DCK">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="2816" y="1536" type="branch" />
            <wire x2="2816" y1="1536" y2="1536" x1="2784" />
            <wire x2="2880" y1="1536" y2="1536" x1="2816" />
        </branch>
        <branch name="DCK">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="2304" y="1536" type="branch" />
            <wire x2="2304" y1="1536" y2="1536" x1="2272" />
            <wire x2="2368" y1="1536" y2="1536" x1="2304" />
        </branch>
        <branch name="DOUT(4)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="3760" y="1760" type="branch" />
            <wire x2="3760" y1="1760" y2="1760" x1="3744" />
            <wire x2="3840" y1="1760" y2="1760" x1="3760" />
        </branch>
        <branch name="DOUT(6)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="3312" y="1760" type="branch" />
            <wire x2="3312" y1="1760" y2="1760" x1="3264" />
            <wire x2="3360" y1="1760" y2="1760" x1="3312" />
        </branch>
        <branch name="DOUT(8)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="2784" y="1760" type="branch" />
            <wire x2="2784" y1="1760" y2="1760" x1="2752" />
            <wire x2="2880" y1="1760" y2="1760" x1="2784" />
        </branch>
        <branch name="DOUT(10)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="2304" y="1760" type="branch" />
            <wire x2="2304" y1="1760" y2="1760" x1="2256" />
            <wire x2="2368" y1="1760" y2="1760" x1="2304" />
        </branch>
        <branch name="DOUT(5)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="3776" y="1408" type="branch" />
            <wire x2="3776" y1="1408" y2="1408" x1="3744" />
            <wire x2="3840" y1="1408" y2="1408" x1="3776" />
        </branch>
        <branch name="DOUT(11)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="2304" y="1408" type="branch" />
            <wire x2="2304" y1="1408" y2="1408" x1="2256" />
            <wire x2="2368" y1="1408" y2="1408" x1="2304" />
        </branch>
        <branch name="DOUT(7)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="3296" y="1408" type="branch" />
            <wire x2="3296" y1="1408" y2="1408" x1="3264" />
            <wire x2="3360" y1="1408" y2="1408" x1="3296" />
        </branch>
        <branch name="DOUT(9)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="2816" y="1408" type="branch" />
            <wire x2="2816" y1="1408" y2="1408" x1="2752" />
            <wire x2="2880" y1="1408" y2="1408" x1="2816" />
        </branch>
        <branch name="DCK">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="1808" y="1888" type="branch" />
            <wire x2="1808" y1="1888" y2="1888" x1="1776" />
            <wire x2="1872" y1="1888" y2="1888" x1="1808" />
        </branch>
        <branch name="DCK">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="1808" y="1536" type="branch" />
            <wire x2="1808" y1="1536" y2="1536" x1="1776" />
            <wire x2="1872" y1="1536" y2="1536" x1="1808" />
        </branch>
        <branch name="DOUT(12)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="1808" y="1760" type="branch" />
            <wire x2="1808" y1="1760" y2="1760" x1="1760" />
            <wire x2="1872" y1="1760" y2="1760" x1="1808" />
        </branch>
        <branch name="DOUT(13)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="1808" y="1408" type="branch" />
            <wire x2="1808" y1="1408" y2="1408" x1="1760" />
            <wire x2="1872" y1="1408" y2="1408" x1="1808" />
        </branch>
        <instance x="1376" y="1664" name="XLXI_273" orien="R0" />
        <instance x="1376" y="2016" name="XLXI_274" orien="R0" />
        <branch name="DCK">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="1312" y="1888" type="branch" />
            <wire x2="1312" y1="1888" y2="1888" x1="1280" />
            <wire x2="1376" y1="1888" y2="1888" x1="1312" />
        </branch>
        <branch name="DCK">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="1312" y="1536" type="branch" />
            <wire x2="1312" y1="1536" y2="1536" x1="1280" />
            <wire x2="1376" y1="1536" y2="1536" x1="1312" />
        </branch>
        <branch name="DOUT(14)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="1312" y="1760" type="branch" />
            <wire x2="1312" y1="1760" y2="1760" x1="1264" />
            <wire x2="1376" y1="1760" y2="1760" x1="1312" />
        </branch>
        <branch name="DOUT(15)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="1312" y="1408" type="branch" />
            <wire x2="1312" y1="1408" y2="1408" x1="1264" />
            <wire x2="1376" y1="1408" y2="1408" x1="1312" />
        </branch>
    </sheet>
</drawing>