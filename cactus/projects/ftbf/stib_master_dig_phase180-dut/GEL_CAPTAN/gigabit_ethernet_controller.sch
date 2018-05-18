<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="virtex4" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="crc_gen_en" />
        <signal name="crc_gen_rd" />
        <signal name="crc_gen_init" />
        <signal name="crc_chk_en" />
        <signal name="crc_init" />
        <signal name="crc_chk_err" />
        <signal name="user_rx_size_out(10:0)" />
        <signal name="GMII_TX_EN" />
        <signal name="GMII_TX_ER" />
        <signal name="GTX_CLK" />
        <signal name="user_tx_data_in(7:0)" />
        <signal name="user_tx_size_in(10:0)" />
        <signal name="user_addrs(7:0)" />
        <signal name="GMII_RXD(7:0)" />
        <signal name="GMII_RX_CLK" />
        <signal name="user_trigger" />
        <signal name="user_busy" />
        <signal name="user_rx_valid_out" />
        <signal name="user_tx_enable_out" />
        <signal name="user_rx_data_out(7:0)" />
        <signal name="txd_sig(7:0)" />
        <signal name="GMII_TXD(7:0)" />
        <signal name="crc_out(7:0)" />
        <signal name="reset" />
        <signal name="GMII_RX_DV" />
        <signal name="GMII_RX_ER" />
        <signal name="rx_data(7:0)" />
        <signal name="rx_er" />
        <signal name="rx_dv" />
        <signal name="user_src_addrs(7:0)" />
        <signal name="crc_err" />
        <signal name="user_src_capture" />
        <signal name="user_src_mac(47:0)" />
        <signal name="user_src_port(15:0)" />
        <signal name="user_dest_addrs(7:0)" />
        <signal name="user_dest_mac(47:0)" />
        <signal name="user_dest_port(15:0)" />
        <port polarity="Output" name="user_rx_size_out(10:0)" />
        <port polarity="Output" name="GMII_TX_EN" />
        <port polarity="Output" name="GMII_TX_ER" />
        <port polarity="Output" name="GTX_CLK" />
        <port polarity="Input" name="user_tx_data_in(7:0)" />
        <port polarity="Input" name="user_tx_size_in(10:0)" />
        <port polarity="Input" name="user_addrs(7:0)" />
        <port polarity="Input" name="GMII_RXD(7:0)" />
        <port polarity="Input" name="GMII_RX_CLK" />
        <port polarity="Input" name="user_trigger" />
        <port polarity="Output" name="user_busy" />
        <port polarity="Output" name="user_rx_valid_out" />
        <port polarity="Output" name="user_tx_enable_out" />
        <port polarity="Output" name="user_rx_data_out(7:0)" />
        <port polarity="Output" name="GMII_TXD(7:0)" />
        <port polarity="Input" name="reset" />
        <port polarity="Input" name="GMII_RX_DV" />
        <port polarity="Input" name="GMII_RX_ER" />
        <port polarity="Output" name="user_src_addrs(7:0)" />
        <port polarity="Output" name="crc_err" />
        <port polarity="Output" name="user_src_capture" />
        <port polarity="Output" name="user_src_mac(47:0)" />
        <port polarity="Output" name="user_src_port(15:0)" />
        <port polarity="Input" name="user_dest_addrs(7:0)" />
        <port polarity="Input" name="user_dest_mac(47:0)" />
        <port polarity="Input" name="user_dest_port(15:0)" />
        <blockdef name="DIG_GEC">
            <timestamp>2012-3-6T17:31:45</timestamp>
            <rect width="64" x="0" y="628" height="24" />
            <line x2="0" y1="640" y2="640" x1="64" />
            <rect width="64" x="0" y="692" height="24" />
            <line x2="0" y1="704" y2="704" x1="64" />
            <rect width="64" x="0" y="756" height="24" />
            <line x2="0" y1="768" y2="768" x1="64" />
            <line x2="720" y1="640" y2="640" x1="656" />
            <rect width="64" x="656" y="692" height="24" />
            <line x2="720" y1="704" y2="704" x1="656" />
            <rect width="64" x="656" y="756" height="24" />
            <line x2="720" y1="768" y2="768" x1="656" />
            <rect width="64" x="656" y="564" height="24" />
            <line x2="720" y1="576" y2="576" x1="656" />
            <line x2="720" y1="384" y2="384" x1="656" />
            <line x2="720" y1="448" y2="448" x1="656" />
            <line x2="720" y1="512" y2="512" x1="656" />
            <line x2="720" y1="256" y2="256" x1="656" />
            <line x2="720" y1="320" y2="320" x1="656" />
            <line x2="720" y1="192" y2="192" x1="656" />
            <line x2="0" y1="-128" y2="-128" x1="64" />
            <line x2="0" y1="-784" y2="-784" x1="64" />
            <line x2="0" y1="-672" y2="-672" x1="64" />
            <line x2="0" y1="-608" y2="-608" x1="64" />
            <line x2="0" y1="-544" y2="-544" x1="64" />
            <rect width="64" x="0" y="-492" height="24" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <rect width="64" x="656" y="52" height="24" />
            <line x2="720" y1="64" y2="64" x1="656" />
            <rect width="64" x="656" y="116" height="24" />
            <line x2="720" y1="128" y2="128" x1="656" />
            <line x2="720" y1="-672" y2="-672" x1="656" />
            <line x2="720" y1="-608" y2="-608" x1="656" />
            <line x2="720" y1="-544" y2="-544" x1="656" />
            <rect width="64" x="656" y="-492" height="24" />
            <line x2="720" y1="-480" y2="-480" x1="656" />
            <line x2="720" y1="-192" y2="-192" x1="656" />
            <line x2="720" y1="-128" y2="-128" x1="656" />
            <line x2="720" y1="-64" y2="-64" x1="656" />
            <rect width="64" x="0" y="-76" height="24" />
            <line x2="0" y1="-64" y2="-64" x1="64" />
            <rect width="64" x="0" y="116" height="24" />
            <line x2="0" y1="128" y2="128" x1="64" />
            <rect width="64" x="0" y="52" height="24" />
            <line x2="0" y1="64" y2="64" x1="64" />
            <rect width="592" x="64" y="-944" height="1756" />
        </blockdef>
        <blockdef name="CRC_splice">
            <timestamp>2007-12-4T22:53:2</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-172" height="24" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
        </blockdef>
        <blockdef name="CRC_gen">
            <timestamp>2007-12-4T22:48:38</timestamp>
            <rect width="400" x="64" y="-384" height="384" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="528" y1="-352" y2="-352" x1="464" />
            <rect width="64" x="464" y="-44" height="24" />
            <line x2="528" y1="-32" y2="-32" x1="464" />
        </blockdef>
        <blockdef name="CRC_chk">
            <timestamp>2007-12-4T20:42:42</timestamp>
            <rect width="256" x="64" y="-384" height="384" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-352" y2="-352" x1="320" />
        </blockdef>
        <blockdef name="RX_IN_LATCH">
            <timestamp>2009-3-18T21:15:33</timestamp>
            <rect width="256" x="64" y="-256" height="256" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
        </blockdef>
        <block symbolname="DIG_GEC" name="XLXI_249">
            <blockpin signalname="GMII_RX_CLK" name="GMII_RX_CLK" />
            <blockpin signalname="rx_dv" name="GMII_RX_DV" />
            <blockpin signalname="rx_er" name="GMII_RX_ER" />
            <blockpin signalname="reset" name="reset" />
            <blockpin signalname="user_trigger" name="trigger" />
            <blockpin signalname="rx_data(7:0)" name="GMII_RXD(7:0)" />
            <blockpin signalname="user_dest_addrs(7:0)" name="dest_addrs(7:0)" />
            <blockpin signalname="user_dest_mac(47:0)" name="dest_mac(47:0)" />
            <blockpin signalname="user_dest_port(15:0)" name="dest_port(15:0)" />
            <blockpin signalname="user_addrs(7:0)" name="user_addrs(7:0)" />
            <blockpin signalname="user_tx_data_in(7:0)" name="user_tx_data_in(7:0)" />
            <blockpin signalname="user_tx_size_in(10:0)" name="user_tx_size_in(10:0)" />
            <blockpin signalname="GTX_CLK" name="GMII_GTX_CLK" />
            <blockpin signalname="GMII_TX_EN" name="GMII_TX_EN" />
            <blockpin signalname="GMII_TX_ER" name="GMII_TX_ER" />
            <blockpin signalname="user_busy" name="busy" />
            <blockpin signalname="crc_chk_en" name="crc_chk_en" />
            <blockpin signalname="crc_chk_err" name="crc_chk_err" />
            <blockpin signalname="crc_init" name="crc_chk_init" />
            <blockpin signalname="crc_gen_en" name="crc_gen_en" />
            <blockpin signalname="crc_gen_init" name="crc_gen_init" />
            <blockpin signalname="crc_gen_rd" name="crc_gen_rd" />
            <blockpin signalname="user_tx_enable_out" name="en_tx_data" />
            <blockpin signalname="user_src_capture" name="src_capture" />
            <blockpin signalname="user_rx_valid_out" name="udp_data_valid_out" />
            <blockpin signalname="txd_sig(7:0)" name="GMII_TXD(7:0)" />
            <blockpin signalname="user_src_addrs(7:0)" name="src_addrs(7:0)" />
            <blockpin signalname="user_src_mac(47:0)" name="src_mac(47:0)" />
            <blockpin signalname="user_src_port(15:0)" name="src_port(15:0)" />
            <blockpin signalname="user_rx_size_out(10:0)" name="udp_data_count(10:0)" />
            <blockpin signalname="user_rx_data_out(7:0)" name="user_rx_data_out(7:0)" />
        </block>
        <block symbolname="CRC_splice" name="XLXI_248">
            <blockpin signalname="crc_gen_rd" name="rd" />
            <blockpin signalname="txd_sig(7:0)" name="data(7:0)" />
            <blockpin signalname="crc_out(7:0)" name="crc(7:0)" />
            <blockpin signalname="GMII_TXD(7:0)" name="dataout(7:0)" />
        </block>
        <block symbolname="CRC_gen" name="XLXI_238">
            <blockpin signalname="reset" name="Reset" />
            <blockpin signalname="GMII_RX_CLK" name="Clk" />
            <blockpin signalname="crc_gen_init" name="Init" />
            <blockpin signalname="crc_gen_en" name="Data_en" />
            <blockpin signalname="crc_gen_rd" name="CRC_rd" />
            <blockpin signalname="txd_sig(7:0)" name="Frame_data(7:0)" />
            <blockpin name="CRC_end" />
            <blockpin signalname="crc_out(7:0)" name="CRC_out(7:0)" />
        </block>
        <block symbolname="RX_IN_LATCH" name="XLXI_251">
            <blockpin signalname="GMII_RX_CLK" name="clk" />
            <blockpin signalname="GMII_RX_DV" name="dv" />
            <blockpin signalname="GMII_RX_ER" name="er" />
            <blockpin signalname="GMII_RXD(7:0)" name="d(7:0)" />
            <blockpin signalname="rx_data(7:0)" name="do(7:0)" />
            <blockpin signalname="rx_dv" name="dvo" />
            <blockpin signalname="rx_er" name="ero" />
        </block>
        <block symbolname="CRC_chk" name="XLXI_226">
            <blockpin signalname="reset" name="Reset" />
            <blockpin signalname="GMII_RX_CLK" name="Clk" />
            <blockpin signalname="crc_init" name="CRC_init" />
            <blockpin signalname="crc_chk_en" name="CRC_en" />
            <blockpin signalname="crc_chk_err" name="CRC_chk_en" />
            <blockpin signalname="rx_data(7:0)" name="CRC_data(7:0)" />
            <blockpin signalname="crc_err" name="CRC_err" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="7040" height="5440">
        <instance x="3040" y="3056" name="XLXI_249" orien="R0">
        </instance>
        <branch name="crc_gen_en">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4032" y="3440" type="branch" />
            <wire x2="4032" y1="3440" y2="3440" x1="3760" />
        </branch>
        <branch name="crc_gen_rd">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4032" y="3568" type="branch" />
            <wire x2="4032" y1="3568" y2="3568" x1="3760" />
        </branch>
        <branch name="crc_gen_init">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4032" y="3504" type="branch" />
            <wire x2="4032" y1="3504" y2="3504" x1="3760" />
        </branch>
        <branch name="crc_chk_en">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4032" y="3248" type="branch" />
            <wire x2="4032" y1="3248" y2="3248" x1="3760" />
        </branch>
        <branch name="crc_init">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4032" y="3376" type="branch" />
            <wire x2="4032" y1="3376" y2="3376" x1="3760" />
        </branch>
        <branch name="crc_chk_err">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4032" y="3312" type="branch" />
            <wire x2="4032" y1="3312" y2="3312" x1="3760" />
        </branch>
        <branch name="user_rx_size_out(10:0)">
            <wire x2="4496" y1="3120" y2="3120" x1="3760" />
        </branch>
        <branch name="GMII_TX_EN">
            <wire x2="4464" y1="2448" y2="2448" x1="3760" />
        </branch>
        <branch name="GMII_TX_ER">
            <wire x2="4464" y1="2512" y2="2512" x1="3760" />
        </branch>
        <branch name="GTX_CLK">
            <wire x2="4464" y1="2384" y2="2384" x1="3760" />
        </branch>
        <branch name="user_tx_data_in(7:0)">
            <wire x2="3040" y1="3184" y2="3184" x1="2032" />
        </branch>
        <branch name="user_tx_size_in(10:0)">
            <wire x2="3040" y1="3120" y2="3120" x1="2032" />
        </branch>
        <branch name="user_addrs(7:0)">
            <wire x2="3040" y1="2992" y2="2992" x1="2032" />
        </branch>
        <branch name="user_trigger">
            <wire x2="3040" y1="2928" y2="2928" x1="2032" />
        </branch>
        <branch name="reset">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="2864" y="2272" type="branch" />
            <wire x2="2864" y1="2272" y2="2272" x1="1808" />
            <wire x2="3040" y1="2272" y2="2272" x1="2864" />
        </branch>
        <branch name="user_busy">
            <wire x2="4496" y1="2864" y2="2864" x1="3760" />
        </branch>
        <branch name="user_rx_valid_out">
            <wire x2="4496" y1="2992" y2="2992" x1="3760" />
        </branch>
        <branch name="user_tx_enable_out">
            <wire x2="4496" y1="2928" y2="2928" x1="3760" />
        </branch>
        <branch name="user_rx_data_out(7:0)">
            <wire x2="4496" y1="3184" y2="3184" x1="3760" />
        </branch>
        <branch name="txd_sig(7:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4096" y="2576" type="branch" />
            <wire x2="4096" y1="2576" y2="2576" x1="3760" />
        </branch>
        <instance x="3968" y="1936" name="XLXI_248" orien="R0">
        </instance>
        <branch name="txd_sig(7:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3712" y="1840" type="branch" />
            <wire x2="3968" y1="1840" y2="1840" x1="3712" />
        </branch>
        <branch name="crc_gen_rd">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3712" y="1776" type="branch" />
            <wire x2="3968" y1="1776" y2="1776" x1="3712" />
        </branch>
        <branch name="GMII_TXD(7:0)">
            <wire x2="4656" y1="1776" y2="1776" x1="4352" />
        </branch>
        <branch name="crc_out(7:0)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="3360" y="1904" type="branch" />
            <wire x2="3360" y1="1904" y2="1904" x1="3200" />
            <wire x2="3968" y1="1904" y2="1904" x1="3360" />
        </branch>
        <branch name="txd_sig(7:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2416" y="1904" type="branch" />
            <wire x2="2672" y1="1904" y2="1904" x1="2416" />
        </branch>
        <branch name="GMII_RX_CLK">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2400" y="1648" type="branch" />
            <wire x2="2672" y1="1648" y2="1648" x1="2400" />
        </branch>
        <branch name="crc_gen_en">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2416" y="1776" type="branch" />
            <wire x2="2672" y1="1776" y2="1776" x1="2416" />
        </branch>
        <branch name="crc_gen_rd">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2416" y="1840" type="branch" />
            <wire x2="2672" y1="1840" y2="1840" x1="2416" />
        </branch>
        <branch name="crc_gen_init">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2416" y="1712" type="branch" />
            <wire x2="2672" y1="1712" y2="1712" x1="2416" />
        </branch>
        <branch name="reset">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2400" y="1584" type="branch" />
            <wire x2="2672" y1="1584" y2="1584" x1="2400" />
        </branch>
        <instance x="2672" y="1936" name="XLXI_238" orien="R0">
        </instance>
        <iomarker fontsize="28" x="4496" y="2864" name="user_busy" orien="R0" />
        <iomarker fontsize="28" x="4496" y="2992" name="user_rx_valid_out" orien="R0" />
        <iomarker fontsize="28" x="4496" y="2928" name="user_tx_enable_out" orien="R0" />
        <iomarker fontsize="28" x="4496" y="3120" name="user_rx_size_out(10:0)" orien="R0" />
        <iomarker fontsize="28" x="4496" y="3184" name="user_rx_data_out(7:0)" orien="R0" />
        <iomarker fontsize="28" x="4656" y="1776" name="GMII_TXD(7:0)" orien="R0" />
        <iomarker fontsize="28" x="2032" y="2928" name="user_trigger" orien="R180" />
        <iomarker fontsize="28" x="2032" y="2992" name="user_addrs(7:0)" orien="R180" />
        <iomarker fontsize="28" x="2032" y="3120" name="user_tx_size_in(10:0)" orien="R180" />
        <iomarker fontsize="28" x="2032" y="3184" name="user_tx_data_in(7:0)" orien="R180" />
        <iomarker fontsize="28" x="4464" y="2384" name="GTX_CLK" orien="R0" />
        <iomarker fontsize="28" x="4464" y="2448" name="GMII_TX_EN" orien="R0" />
        <iomarker fontsize="28" x="4464" y="2512" name="GMII_TX_ER" orien="R0" />
        <branch name="GMII_RXD(7:0)">
            <wire x2="2064" y1="2576" y2="2576" x1="1792" />
        </branch>
        <branch name="GMII_RX_DV">
            <wire x2="2064" y1="2448" y2="2448" x1="1792" />
        </branch>
        <branch name="GMII_RX_ER">
            <wire x2="2064" y1="2512" y2="2512" x1="1792" />
        </branch>
        <branch name="GMII_RX_CLK">
            <wire x2="2064" y1="2384" y2="2384" x1="1792" />
        </branch>
        <instance x="2064" y="2608" name="XLXI_251" orien="R0">
        </instance>
        <iomarker fontsize="28" x="1792" y="2384" name="GMII_RX_CLK" orien="R180" />
        <iomarker fontsize="28" x="1792" y="2448" name="GMII_RX_DV" orien="R180" />
        <iomarker fontsize="28" x="1792" y="2512" name="GMII_RX_ER" orien="R180" />
        <iomarker fontsize="28" x="1792" y="2576" name="GMII_RXD(7:0)" orien="R180" />
        <branch name="rx_data(7:0)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="2736" y="2576" type="branch" />
            <wire x2="2736" y1="2576" y2="2576" x1="2448" />
            <wire x2="3040" y1="2576" y2="2576" x1="2736" />
        </branch>
        <branch name="rx_er">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="2640" y="2512" type="branch" />
            <wire x2="2640" y1="2512" y2="2512" x1="2448" />
            <wire x2="3040" y1="2512" y2="2512" x1="2640" />
        </branch>
        <branch name="rx_dv">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="2656" y="2448" type="branch" />
            <wire x2="2656" y1="2448" y2="2448" x1="2448" />
            <wire x2="3040" y1="2448" y2="2448" x1="2656" />
        </branch>
        <branch name="GMII_RX_CLK">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2864" y="2384" type="branch" />
            <wire x2="3040" y1="2384" y2="2384" x1="2864" />
        </branch>
        <iomarker fontsize="28" x="1808" y="2272" name="reset" orien="R180" />
        <branch name="user_src_addrs(7:0)">
            <wire x2="3776" y1="3632" y2="3632" x1="3760" />
            <wire x2="4496" y1="3632" y2="3632" x1="3776" />
        </branch>
        <iomarker fontsize="28" x="4496" y="3632" name="user_src_addrs(7:0)" orien="R0" />
        <branch name="crc_chk_en">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3680" y="4256" type="branch" />
            <wire x2="3952" y1="4256" y2="4256" x1="3680" />
        </branch>
        <branch name="crc_chk_err">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3680" y="4320" type="branch" />
            <wire x2="3952" y1="4320" y2="4320" x1="3680" />
        </branch>
        <branch name="crc_init">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3680" y="4192" type="branch" />
            <wire x2="3952" y1="4192" y2="4192" x1="3680" />
        </branch>
        <branch name="rx_data(7:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3584" y="4384" type="branch" />
            <wire x2="3952" y1="4384" y2="4384" x1="3584" />
        </branch>
        <branch name="GMII_RX_CLK">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3680" y="4128" type="branch" />
            <wire x2="3952" y1="4128" y2="4128" x1="3680" />
        </branch>
        <branch name="reset">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3680" y="4064" type="branch" />
            <wire x2="3952" y1="4064" y2="4064" x1="3680" />
        </branch>
        <branch name="crc_err">
            <wire x2="4544" y1="4064" y2="4064" x1="4336" />
        </branch>
        <instance x="3952" y="4416" name="XLXI_226" orien="R0">
        </instance>
        <iomarker fontsize="28" x="4544" y="4064" name="crc_err" orien="R0" />
        <branch name="user_src_capture">
            <wire x2="4464" y1="3696" y2="3696" x1="3760" />
            <wire x2="4496" y1="3696" y2="3696" x1="4464" />
        </branch>
        <branch name="user_src_mac(47:0)">
            <wire x2="4464" y1="3760" y2="3760" x1="3760" />
            <wire x2="4496" y1="3760" y2="3760" x1="4464" />
        </branch>
        <branch name="user_src_port(15:0)">
            <wire x2="4464" y1="3824" y2="3824" x1="3760" />
            <wire x2="4496" y1="3824" y2="3824" x1="4464" />
        </branch>
        <iomarker fontsize="28" x="4496" y="3696" name="user_src_capture" orien="R0" />
        <iomarker fontsize="28" x="4496" y="3760" name="user_src_mac(47:0)" orien="R0" />
        <iomarker fontsize="28" x="4496" y="3824" name="user_src_port(15:0)" orien="R0" />
        <branch name="user_dest_addrs(7:0)">
            <wire x2="2080" y1="3696" y2="3696" x1="2048" />
            <wire x2="3024" y1="3696" y2="3696" x1="2080" />
            <wire x2="3040" y1="3696" y2="3696" x1="3024" />
        </branch>
        <branch name="user_dest_mac(47:0)">
            <wire x2="2080" y1="3760" y2="3760" x1="2048" />
            <wire x2="3024" y1="3760" y2="3760" x1="2080" />
            <wire x2="3040" y1="3760" y2="3760" x1="3024" />
        </branch>
        <branch name="user_dest_port(15:0)">
            <wire x2="2080" y1="3824" y2="3824" x1="2048" />
            <wire x2="3024" y1="3824" y2="3824" x1="2080" />
            <wire x2="3040" y1="3824" y2="3824" x1="3024" />
        </branch>
        <iomarker fontsize="28" x="2048" y="3696" name="user_dest_addrs(7:0)" orien="R180" />
        <iomarker fontsize="28" x="2048" y="3760" name="user_dest_mac(47:0)" orien="R180" />
        <iomarker fontsize="28" x="2048" y="3824" name="user_dest_port(15:0)" orien="R180" />
    </sheet>
</drawing>