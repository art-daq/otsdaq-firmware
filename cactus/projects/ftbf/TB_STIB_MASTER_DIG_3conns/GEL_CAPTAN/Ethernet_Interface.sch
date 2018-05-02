<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="virtex4" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="MASTER_CLK" />
        <signal name="reset" />
        <signal name="gec_user_trigger" />
        <signal name="gec_user_tx_data_in(7:0)" />
        <signal name="gec_user_tx_size_in(10:0)" />
        <signal name="gec_user_crc_err" />
        <signal name="gec_user_tx_enable_out" />
        <signal name="gec_user_busy" />
        <signal name="gec_user_rx_size_out(10:0)" />
        <signal name="gec_user_rx_data_out(7:0)" />
        <signal name="gec_user_rx_valid_out" />
        <signal name="b_data_we" />
        <signal name="b_end_packet" />
        <signal name="b_data(63:0)" />
        <signal name="tx_data(63:0)" />
        <signal name="rx_data(63:0)" />
        <signal name="rx_addr(63:0)" />
        <signal name="rx_wren" />
        <signal name="XLXN_15874" />
        <signal name="b_enable" />
        <signal name="GMII_RX_DV" />
        <signal name="GMII_RX_ER" />
        <signal name="GMII_RXD(7:0)" />
        <signal name="GTX_CLK" />
        <signal name="PHY_TX_EN" />
        <signal name="PHY_TXD(7:0)" />
        <signal name="PHY_TX_ER" />
        <signal name="gec_user_addrs(7:0)" />
        <signal name="gec_user_dest_addrs(7:0)" />
        <signal name="gec_user_dest_mac(47:0)" />
        <signal name="gec_user_dest_port(15:0)" />
        <signal name="gec_user_src_capture" />
        <signal name="gec_user_src_addrs(7:0)" />
        <signal name="gec_user_src_mac(47:0)" />
        <signal name="gec_user_src_port(15:0)" />
        <port polarity="Input" name="MASTER_CLK" />
        <port polarity="Input" name="reset" />
        <port polarity="Input" name="b_data_we" />
        <port polarity="Input" name="b_data(63:0)" />
        <port polarity="Input" name="tx_data(63:0)" />
        <port polarity="Output" name="rx_data(63:0)" />
        <port polarity="Output" name="rx_addr(63:0)" />
        <port polarity="Output" name="rx_wren" />
        <port polarity="Output" name="b_enable" />
        <port polarity="Input" name="GMII_RX_DV" />
        <port polarity="Input" name="GMII_RX_ER" />
        <port polarity="Input" name="GMII_RXD(7:0)" />
        <port polarity="Output" name="GTX_CLK" />
        <port polarity="Output" name="PHY_TX_EN" />
        <port polarity="Output" name="PHY_TXD(7:0)" />
        <port polarity="Output" name="PHY_TX_ER" />
        <port polarity="Input" name="gec_user_addrs(7:0)" />
        <port polarity="Input" name="gec_user_dest_addrs(7:0)" />
        <port polarity="Input" name="gec_user_dest_mac(47:0)" />
        <port polarity="Input" name="gec_user_dest_port(15:0)" />
        <port polarity="Output" name="gec_user_src_capture" />
        <port polarity="Output" name="gec_user_src_addrs(7:0)" />
        <port polarity="Output" name="gec_user_src_mac(47:0)" />
        <port polarity="Output" name="gec_user_src_port(15:0)" />
        <blockdef name="gigabit_ethernet_controller">
            <timestamp>2012-3-6T17:32:16</timestamp>
            <rect width="512" x="64" y="-896" height="1288" />
            <line x2="640" y1="-800" y2="-800" x1="576" />
            <line x2="640" y1="-736" y2="-736" x1="576" />
            <line x2="640" y1="-672" y2="-672" x1="576" />
            <rect width="64" x="0" y="-876" height="24" />
            <line x2="0" y1="-864" y2="-864" x1="64" />
            <rect width="64" x="576" y="-876" height="24" />
            <line x2="640" y1="-864" y2="-864" x1="576" />
            <line x2="0" y1="-800" y2="-800" x1="64" />
            <line x2="0" y1="-736" y2="-736" x1="64" />
            <line x2="0" y1="-672" y2="-672" x1="64" />
            <rect width="64" x="0" y="-284" height="24" />
            <line x2="0" y1="-272" y2="-272" x1="64" />
            <rect width="64" x="0" y="-220" height="24" />
            <line x2="0" y1="-208" y2="-208" x1="64" />
            <line x2="0" y1="-336" y2="-336" x1="64" />
            <line x2="640" y1="-336" y2="-336" x1="576" />
            <rect width="64" x="576" y="-220" height="24" />
            <line x2="640" y1="-208" y2="-208" x1="576" />
            <rect width="64" x="576" y="-284" height="24" />
            <line x2="640" y1="-272" y2="-272" x1="576" />
            <line x2="640" y1="-400" y2="-400" x1="576" />
            <line x2="640" y1="-464" y2="-464" x1="576" />
            <line x2="640" y1="-144" y2="-144" x1="576" />
            <line x2="0" y1="96" y2="96" x1="64" />
            <rect width="64" x="0" y="148" height="24" />
            <line x2="0" y1="160" y2="160" x1="64" />
            <rect width="64" x="0" y="212" height="24" />
            <line x2="0" y1="224" y2="224" x1="64" />
            <rect width="64" x="0" y="276" height="24" />
            <line x2="0" y1="288" y2="288" x1="64" />
            <rect width="64" x="0" y="340" height="24" />
            <line x2="0" y1="352" y2="352" x1="64" />
            <rect width="64" x="576" y="212" height="24" />
            <line x2="640" y1="224" y2="224" x1="576" />
            <rect width="64" x="576" y="276" height="24" />
            <line x2="640" y1="288" y2="288" x1="576" />
            <rect width="64" x="576" y="340" height="24" />
            <line x2="640" y1="352" y2="352" x1="576" />
            <line x2="640" y1="96" y2="96" x1="576" />
        </blockdef>
        <blockdef name="DATA_MANAGER">
            <timestamp>2011-10-8T16:1:47</timestamp>
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <line x2="0" y1="-544" y2="-544" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <rect width="64" x="0" y="-300" height="24" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-236" height="24" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <line x2="736" y1="-544" y2="-544" x1="672" />
            <line x2="736" y1="-480" y2="-480" x1="672" />
            <rect width="64" x="672" y="-492" height="24" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="736" y1="-416" y2="-416" x1="672" />
            <rect width="64" x="672" y="-428" height="24" />
            <line x2="0" y1="-736" y2="-736" x1="64" />
            <line x2="736" y1="-48" y2="-48" x1="672" />
            <rect width="64" x="672" y="-60" height="24" />
            <line x2="736" y1="-112" y2="-112" x1="672" />
            <line x2="736" y1="128" y2="128" x1="672" />
            <line x2="0" y1="128" y2="128" x1="64" />
            <line x2="0" y1="256" y2="256" x1="64" />
            <rect width="64" x="0" y="180" height="24" />
            <line x2="0" y1="192" y2="192" x1="64" />
            <line x2="0" y1="-688" y2="-688" x1="64" />
            <line x2="0" y1="-640" y2="-640" x1="64" />
            <rect width="608" x="64" y="-768" height="1056" />
            <rect width="64" x="0" y="4" height="24" />
            <line x2="0" y1="16" y2="16" x1="64" />
            <rect width="64" x="672" y="4" height="24" />
            <line x2="736" y1="16" y2="16" x1="672" />
        </blockdef>
        <blockdef name="burst_traffic_controller">
            <timestamp>2009-3-13T21:12:13</timestamp>
            <rect width="448" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="576" y1="-160" y2="-160" x1="512" />
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
        <block symbolname="DATA_MANAGER" name="XLXI_3535">
            <blockpin signalname="reset" name="reset" />
            <blockpin signalname="MASTER_CLK" name="MASTER_CLK" />
            <blockpin signalname="XLXN_15874" name="reset_n" />
            <blockpin signalname="gec_user_rx_size_out(10:0)" name="gec_user_rx_size_out(10:0)" />
            <blockpin signalname="gec_user_crc_err" name="gec_user_crc_err" />
            <blockpin signalname="gec_user_rx_valid_out" name="gec_user_rx_valid_out" />
            <blockpin signalname="gec_user_rx_data_out(7:0)" name="gec_user_rx_data_out(7:0)" />
            <blockpin signalname="gec_user_busy" name="gec_user_busy" />
            <blockpin signalname="gec_user_tx_enable_out" name="gec_user_tx_enable_out" />
            <blockpin signalname="b_data_we" name="b_data_we" />
            <blockpin signalname="tx_data(63:0)" name="tx_data(63:0)" />
            <blockpin signalname="b_data(63:0)" name="b_data(63:0)" />
            <blockpin signalname="b_end_packet" name="b_end_packet" />
            <blockpin signalname="rx_data(63:0)" name="rx_data(63:0)" />
            <blockpin signalname="rx_wren" name="ram_wren" />
            <blockpin signalname="rx_addr(63:0)" name="ram_addr(63:0)" />
            <blockpin signalname="gec_user_tx_data_in(7:0)" name="gec_user_tx_data_in(7:0)" />
            <blockpin signalname="gec_user_tx_size_in(10:0)" name="gec_user_tx_size_in(10:0)" />
            <blockpin signalname="gec_user_trigger" name="gec_user_trigger" />
            <blockpin signalname="b_enable" name="b_enable" />
        </block>
        <block symbolname="inv" name="XLXI_5365">
            <blockpin signalname="reset" name="I" />
            <blockpin signalname="XLXN_15874" name="O" />
        </block>
        <block symbolname="gigabit_ethernet_controller" name="GEC">
            <blockpin signalname="gec_user_tx_data_in(7:0)" name="user_tx_data_in(7:0)" />
            <blockpin signalname="gec_user_tx_size_in(10:0)" name="user_tx_size_in(10:0)" />
            <blockpin signalname="gec_user_addrs(7:0)" name="user_addrs(7:0)" />
            <blockpin signalname="GMII_RXD(7:0)" name="GMII_RXD(7:0)" />
            <blockpin signalname="MASTER_CLK" name="GMII_RX_CLK" />
            <blockpin signalname="gec_user_trigger" name="user_trigger" />
            <blockpin signalname="reset" name="reset" />
            <blockpin signalname="GMII_RX_DV" name="GMII_RX_DV" />
            <blockpin signalname="GMII_RX_ER" name="GMII_RX_ER" />
            <blockpin signalname="gec_user_dest_addrs(7:0)" name="user_dest_addrs(7:0)" />
            <blockpin signalname="gec_user_dest_mac(47:0)" name="user_dest_mac(47:0)" />
            <blockpin signalname="gec_user_dest_port(15:0)" name="user_dest_port(15:0)" />
            <blockpin signalname="gec_user_rx_size_out(10:0)" name="user_rx_size_out(10:0)" />
            <blockpin signalname="PHY_TX_EN" name="GMII_TX_EN" />
            <blockpin signalname="PHY_TX_ER" name="GMII_TX_ER" />
            <blockpin signalname="GTX_CLK" name="GTX_CLK" />
            <blockpin signalname="gec_user_busy" name="user_busy" />
            <blockpin signalname="gec_user_rx_valid_out" name="user_rx_valid_out" />
            <blockpin signalname="gec_user_tx_enable_out" name="user_tx_enable_out" />
            <blockpin signalname="gec_user_rx_data_out(7:0)" name="user_rx_data_out(7:0)" />
            <blockpin signalname="PHY_TXD(7:0)" name="GMII_TXD(7:0)" />
            <blockpin signalname="gec_user_src_addrs(7:0)" name="user_src_addrs(7:0)" />
            <blockpin signalname="gec_user_crc_err" name="crc_err" />
            <blockpin signalname="gec_user_src_capture" name="user_src_capture" />
            <blockpin signalname="gec_user_src_mac(47:0)" name="user_src_mac(47:0)" />
            <blockpin signalname="gec_user_src_port(15:0)" name="user_src_port(15:0)" />
        </block>
        <block symbolname="burst_traffic_controller" name="XLXI_4124">
            <blockpin signalname="MASTER_CLK" name="MASTER_CLK" />
            <blockpin signalname="reset" name="RESET" />
            <blockpin signalname="b_data_we" name="BURST_WE" />
            <blockpin signalname="b_end_packet" name="BURST_END_PACKET" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="7040" height="5440">
        <text style="fontsize:64;fontname:Arial" x="136" y="168">GEC_CONTROLLER</text>
        <instance x="2768" y="3472" name="XLXI_3535" orien="R0">
        </instance>
        <branch name="b_data_we">
            <wire x2="2768" y1="3600" y2="3600" x1="2544" />
        </branch>
        <branch name="b_end_packet">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2544" y="3728" type="branch" />
            <wire x2="2768" y1="3728" y2="3728" x1="2544" />
        </branch>
        <branch name="b_data(63:0)">
            <wire x2="2768" y1="3664" y2="3664" x1="2544" />
        </branch>
        <branch name="MASTER_CLK">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2544" y="2736" type="branch" />
            <wire x2="2768" y1="2736" y2="2736" x1="2544" />
        </branch>
        <branch name="gec_user_crc_err">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2544" y="2928" type="branch" />
            <wire x2="2768" y1="2928" y2="2928" x1="2544" />
        </branch>
        <branch name="gec_user_busy">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2544" y="2992" type="branch" />
            <wire x2="2768" y1="2992" y2="2992" x1="2544" />
        </branch>
        <branch name="gec_user_rx_valid_out">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2544" y="3056" type="branch" />
            <wire x2="2768" y1="3056" y2="3056" x1="2544" />
        </branch>
        <branch name="gec_user_tx_enable_out">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2544" y="3120" type="branch" />
            <wire x2="2768" y1="3120" y2="3120" x1="2544" />
        </branch>
        <branch name="gec_user_rx_data_out(7:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2544" y="3184" type="branch" />
            <wire x2="2768" y1="3184" y2="3184" x1="2544" />
        </branch>
        <branch name="gec_user_rx_size_out(10:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2544" y="3248" type="branch" />
            <wire x2="2768" y1="3248" y2="3248" x1="2544" />
        </branch>
        <branch name="tx_data(63:0)">
            <wire x2="2768" y1="3488" y2="3488" x1="2544" />
        </branch>
        <branch name="rx_data(63:0)">
            <wire x2="3728" y1="3488" y2="3488" x1="3504" />
        </branch>
        <branch name="rx_addr(63:0)">
            <wire x2="3728" y1="3424" y2="3424" x1="3504" />
        </branch>
        <branch name="rx_wren">
            <wire x2="3728" y1="3360" y2="3360" x1="3504" />
        </branch>
        <branch name="gec_user_trigger">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3728" y="2928" type="branch" />
            <wire x2="3728" y1="2928" y2="2928" x1="3504" />
        </branch>
        <branch name="gec_user_tx_data_in(7:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3728" y="2992" type="branch" />
            <wire x2="3728" y1="2992" y2="2992" x1="3504" />
        </branch>
        <branch name="gec_user_tx_size_in(10:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3728" y="3056" type="branch" />
            <wire x2="3728" y1="3056" y2="3056" x1="3504" />
        </branch>
        <branch name="reset">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1808" y="2832" type="branch" />
            <wire x2="1840" y1="2832" y2="2832" x1="1808" />
            <wire x2="2768" y1="2832" y2="2832" x1="1840" />
            <wire x2="2048" y1="2784" y2="2784" x1="1840" />
            <wire x2="1840" y1="2784" y2="2832" x1="1840" />
        </branch>
        <instance x="2048" y="2816" name="XLXI_5365" orien="R0" />
        <branch name="XLXN_15874">
            <wire x2="2768" y1="2784" y2="2784" x1="2272" />
        </branch>
        <branch name="b_enable">
            <wire x2="3744" y1="3600" y2="3600" x1="3504" />
        </branch>
        <iomarker fontsize="28" x="2544" y="3600" name="b_data_we" orien="R180" />
        <iomarker fontsize="28" x="3744" y="3600" name="b_enable" orien="R0" />
        <iomarker fontsize="28" x="3728" y="3360" name="rx_wren" orien="R0" />
        <iomarker fontsize="28" x="3728" y="3424" name="rx_addr(63:0)" orien="R0" />
        <iomarker fontsize="28" x="3728" y="3488" name="rx_data(63:0)" orien="R0" />
        <iomarker fontsize="28" x="2544" y="3488" name="tx_data(63:0)" orien="R180" />
        <iomarker fontsize="28" x="2544" y="3664" name="b_data(63:0)" orien="R180" />
        <instance x="2816" y="1936" name="GEC" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial" attrname="InstName" x="64" y="424" type="instance" />
        </instance>
        <branch name="GMII_RX_DV">
            <wire x2="2816" y1="1136" y2="1136" x1="2384" />
        </branch>
        <branch name="GMII_RX_ER">
            <wire x2="2816" y1="1200" y2="1200" x1="2384" />
        </branch>
        <branch name="MASTER_CLK">
            <wire x2="2816" y1="1264" y2="1264" x1="2384" />
        </branch>
        <branch name="GMII_RXD(7:0)">
            <wire x2="2816" y1="1072" y2="1072" x1="2384" />
        </branch>
        <branch name="GTX_CLK">
            <wire x2="3840" y1="1264" y2="1264" x1="3456" />
        </branch>
        <branch name="PHY_TX_EN">
            <wire x2="3840" y1="1136" y2="1136" x1="3456" />
        </branch>
        <branch name="PHY_TXD(7:0)">
            <wire x2="3840" y1="1072" y2="1072" x1="3456" />
        </branch>
        <branch name="PHY_TX_ER">
            <wire x2="3840" y1="1200" y2="1200" x1="3456" />
        </branch>
        <branch name="reset">
            <wire x2="2816" y1="2032" y2="2032" x1="2384" />
        </branch>
        <branch name="gec_user_addrs(7:0)">
            <wire x2="2800" y1="2096" y2="2096" x1="2384" />
            <wire x2="2816" y1="2096" y2="2096" x1="2800" />
        </branch>
        <branch name="gec_user_dest_addrs(7:0)">
            <wire x2="2800" y1="2160" y2="2160" x1="2384" />
            <wire x2="2816" y1="2160" y2="2160" x1="2800" />
        </branch>
        <branch name="gec_user_dest_mac(47:0)">
            <wire x2="2800" y1="2224" y2="2224" x1="2384" />
            <wire x2="2816" y1="2224" y2="2224" x1="2800" />
        </branch>
        <branch name="gec_user_dest_port(15:0)">
            <wire x2="2800" y1="2288" y2="2288" x1="2384" />
            <wire x2="2816" y1="2288" y2="2288" x1="2800" />
        </branch>
        <branch name="gec_user_trigger">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2752" y="1600" type="branch" />
            <wire x2="2816" y1="1600" y2="1600" x1="2752" />
        </branch>
        <branch name="gec_user_busy">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3696" y="1536" type="branch" />
            <wire x2="3696" y1="1536" y2="1536" x1="3456" />
        </branch>
        <branch name="gec_user_rx_valid_out">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3696" y="1600" type="branch" />
            <wire x2="3696" y1="1600" y2="1600" x1="3456" />
        </branch>
        <branch name="gec_user_crc_err">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3696" y="1792" type="branch" />
            <wire x2="3696" y1="1792" y2="1792" x1="3456" />
        </branch>
        <branch name="gec_user_tx_enable_out">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3696" y="1472" type="branch" />
            <wire x2="3696" y1="1472" y2="1472" x1="3456" />
        </branch>
        <branch name="gec_user_rx_size_out(10:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3696" y="1728" type="branch" />
            <wire x2="3696" y1="1728" y2="1728" x1="3456" />
        </branch>
        <branch name="gec_user_rx_data_out(7:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3696" y="1664" type="branch" />
            <wire x2="3696" y1="1664" y2="1664" x1="3456" />
        </branch>
        <branch name="gec_user_tx_data_in(7:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2400" y="1664" type="branch" />
            <wire x2="2816" y1="1664" y2="1664" x1="2400" />
        </branch>
        <branch name="gec_user_tx_size_in(10:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2400" y="1728" type="branch" />
            <wire x2="2816" y1="1728" y2="1728" x1="2400" />
        </branch>
        <branch name="gec_user_src_capture">
            <wire x2="3472" y1="2032" y2="2032" x1="3456" />
            <wire x2="3872" y1="2032" y2="2032" x1="3472" />
        </branch>
        <branch name="gec_user_src_addrs(7:0)">
            <wire x2="3472" y1="2160" y2="2160" x1="3456" />
            <wire x2="3872" y1="2160" y2="2160" x1="3472" />
        </branch>
        <branch name="gec_user_src_mac(47:0)">
            <wire x2="3472" y1="2224" y2="2224" x1="3456" />
            <wire x2="3872" y1="2224" y2="2224" x1="3472" />
        </branch>
        <branch name="gec_user_src_port(15:0)">
            <wire x2="3472" y1="2288" y2="2288" x1="3456" />
            <wire x2="3872" y1="2288" y2="2288" x1="3472" />
        </branch>
        <iomarker fontsize="28" x="2384" y="1264" name="MASTER_CLK" orien="R180" />
        <iomarker fontsize="28" x="2384" y="1072" name="GMII_RXD(7:0)" orien="R180" />
        <iomarker fontsize="28" x="2384" y="1136" name="GMII_RX_DV" orien="R180" />
        <iomarker fontsize="28" x="2384" y="1200" name="GMII_RX_ER" orien="R180" />
        <iomarker fontsize="28" x="3840" y="1072" name="PHY_TXD(7:0)" orien="R0" />
        <iomarker fontsize="28" x="3840" y="1136" name="PHY_TX_EN" orien="R0" />
        <iomarker fontsize="28" x="3840" y="1200" name="PHY_TX_ER" orien="R0" />
        <iomarker fontsize="28" x="3840" y="1264" name="GTX_CLK" orien="R0" />
        <iomarker fontsize="28" x="2384" y="2032" name="reset" orien="R180" />
        <iomarker fontsize="28" x="2384" y="2096" name="gec_user_addrs(7:0)" orien="R180" />
        <iomarker fontsize="28" x="2384" y="2160" name="gec_user_dest_addrs(7:0)" orien="R180" />
        <iomarker fontsize="28" x="2384" y="2224" name="gec_user_dest_mac(47:0)" orien="R180" />
        <iomarker fontsize="28" x="2384" y="2288" name="gec_user_dest_port(15:0)" orien="R180" />
        <iomarker fontsize="28" x="3872" y="2032" name="gec_user_src_capture" orien="R0" />
        <iomarker fontsize="28" x="3872" y="2160" name="gec_user_src_addrs(7:0)" orien="R0" />
        <iomarker fontsize="28" x="3872" y="2224" name="gec_user_src_mac(47:0)" orien="R0" />
        <iomarker fontsize="28" x="3872" y="2288" name="gec_user_src_port(15:0)" orien="R0" />
        <instance x="2864" y="4128" name="XLXI_4124" orien="R0">
        </instance>
        <branch name="reset">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2784" y="4032" type="branch" />
            <wire x2="2864" y1="4032" y2="4032" x1="2784" />
        </branch>
        <branch name="b_data_we">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2784" y="4096" type="branch" />
            <wire x2="2864" y1="4096" y2="4096" x1="2784" />
        </branch>
        <branch name="b_end_packet">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3520" y="3968" type="branch" />
            <wire x2="3520" y1="3968" y2="3968" x1="3440" />
        </branch>
        <branch name="MASTER_CLK">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2784" y="3968" type="branch" />
            <wire x2="2864" y1="3968" y2="3968" x1="2784" />
        </branch>
    </sheet>
</drawing>