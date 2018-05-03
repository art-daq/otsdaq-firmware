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
        <signal name="calibrate" />
        <signal name="adc_delayed_clk" />
        <signal name="adc_delayed_frame" />
        <signal name="ADC_FRAME_OUT" />
        <signal name="ADC_CLK_OUT" />
        <signal name="cal_error" />
        <signal name="cal_done" />
        <signal name="man_ch_inc(3:0)" />
        <signal name="man_ch_dec(3:0)" />
        <signal name="adc_single_sample_we(3:0)" />
        <signal name="ADC_65MSPS_CH(3:0)" />
        <signal name="adc_sample_we" />
        <signal name="adc_sample(47:0)" />
        <signal name="auto_del_dat(3:0)" />
        <signal name="del_frm" />
        <signal name="del_clk" />
        <signal name="rst_frm" />
        <signal name="rst_clk" />
        <signal name="auto_rst_dat(3:0)" />
        <signal name="auto_inc_dec_dat(3:0)" />
        <signal name="inc_dec_clk" />
        <signal name="adc_single_sample(39:0)" />
        <signal name="ADC_65MSPS_CH(1)" />
        <signal name="del_dat(1)" />
        <signal name="rst_dat(1)" />
        <signal name="inc_dec_dat(1)" />
        <signal name="ADC_65MSPS_CH(2)" />
        <signal name="del_dat(2)" />
        <signal name="rst_dat(2)" />
        <signal name="inc_dec_dat(2)" />
        <signal name="ADC_65MSPS_CH(3)" />
        <signal name="del_dat(3)" />
        <signal name="rst_dat(3)" />
        <signal name="inc_dec_dat(3)" />
        <signal name="ADC_65MSPS_CH(0)" />
        <signal name="del_dat(0)" />
        <signal name="inc_dec_dat(0)" />
        <signal name="rst_dat(0)" />
        <signal name="mc_adc_sample(47:0)" />
        <signal name="inc_dec_frm" />
        <signal name="calibrating" />
        <signal name="del_dat(3:0)" />
        <signal name="rst_dat(3:0)" />
        <signal name="inc_dec_dat(3:0)" />
        <signal name="auto_rst_frm" />
        <signal name="auto_clk" />
        <signal name="auto_frm" />
        <signal name="auto_rst_clk" />
        <signal name="man_rst" />
        <signal name="adc_burst_word(63:0)" />
        <signal name="adc_burst_word_we" />
        <signal name="adc_delayed_data(3:0)" />
        <signal name="man_clk_inc" />
        <signal name="man_clk_dec" />
        <signal name="man_frm_inc" />
        <signal name="man_frm_dec" />
        <signal name="XLXN_14691" />
        <signal name="adc_delayed_data(0)" />
        <signal name="adc_delayed_data(1)" />
        <signal name="adc_delayed_data(2)" />
        <signal name="adc_delayed_data(3)" />
        <signal name="plaq_sel(1:0)" />
        <port polarity="Input" name="MASTER_CLK" />
        <port polarity="Input" name="reset" />
        <port polarity="Input" name="calibrate" />
        <port polarity="Input" name="ADC_FRAME_OUT" />
        <port polarity="Input" name="ADC_CLK_OUT" />
        <port polarity="Output" name="cal_error" />
        <port polarity="Output" name="cal_done" />
        <port polarity="Input" name="man_ch_inc(3:0)" />
        <port polarity="Input" name="man_ch_dec(3:0)" />
        <port polarity="Output" name="adc_single_sample_we(3:0)" />
        <port polarity="Input" name="ADC_65MSPS_CH(3:0)" />
        <port polarity="Output" name="adc_single_sample(39:0)" />
        <port polarity="Output" name="calibrating" />
        <port polarity="Input" name="man_rst" />
        <port polarity="Output" name="adc_burst_word(63:0)" />
        <port polarity="Output" name="adc_burst_word_we" />
        <port polarity="Input" name="man_clk_inc" />
        <port polarity="Input" name="man_clk_dec" />
        <port polarity="Input" name="man_frm_inc" />
        <port polarity="Input" name="man_frm_dec" />
        <port polarity="Input" name="plaq_sel(1:0)" />
        <blockdef name="ADC_Calibrator">
            <timestamp>2011-9-13T16:48:57</timestamp>
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="480" y1="-480" y2="-480" x1="416" />
            <line x2="480" y1="-416" y2="-416" x1="416" />
            <rect width="64" x="416" y="-364" height="24" />
            <line x2="480" y1="-352" y2="-352" x1="416" />
            <line x2="480" y1="-288" y2="-288" x1="416" />
            <line x2="480" y1="-224" y2="-224" x1="416" />
            <rect width="64" x="416" y="-172" height="24" />
            <line x2="480" y1="-160" y2="-160" x1="416" />
            <rect width="64" x="416" y="-108" height="24" />
            <line x2="480" y1="-96" y2="-96" x1="416" />
            <line x2="480" y1="128" y2="128" x1="416" />
            <line x2="480" y1="0" y2="0" x1="416" />
            <line x2="480" y1="64" y2="64" x1="416" />
            <rect width="64" x="0" y="212" height="24" />
            <line x2="0" y1="224" y2="224" x1="64" />
            <rect width="64" x="0" y="52" height="24" />
            <line x2="0" y1="64" y2="64" x1="64" />
            <rect width="352" x="64" y="-512" height="760" />
        </blockdef>
        <blockdef name="ADC_frame_counter">
            <timestamp>2013-9-16T17:31:57</timestamp>
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="256" x="64" y="-192" height="184" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="idelay">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-128" y2="-128" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-64" y2="-64" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
        </blockdef>
        <blockdef name="adc_delay_data_logic">
            <timestamp>2009-11-6T16:41:14</timestamp>
            <line x2="0" y1="352" y2="352" x1="64" />
            <line x2="0" y1="416" y2="416" x1="64" />
            <line x2="0" y1="480" y2="480" x1="64" />
            <line x2="0" y1="544" y2="544" x1="64" />
            <rect width="64" x="432" y="-364" height="24" />
            <line x2="496" y1="-352" y2="-352" x1="432" />
            <rect width="368" x="64" y="-384" height="960" />
            <rect width="64" x="0" y="-364" height="24" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <rect width="64" x="0" y="-300" height="24" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <rect width="64" x="0" y="-236" height="24" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="0" y1="32" y2="32" x1="64" />
            <rect width="64" x="432" y="-236" height="24" />
            <rect width="64" x="432" y="-300" height="24" />
            <line x2="496" y1="-288" y2="-288" x1="432" />
            <line x2="496" y1="-256" y2="-256" x1="432" />
            <line x2="496" y1="-160" y2="-160" x1="432" />
            <line x2="496" y1="-96" y2="-96" x1="432" />
            <line x2="496" y1="-32" y2="-32" x1="432" />
            <line x2="496" y1="32" y2="32" x1="432" />
            <line x2="496" y1="96" y2="96" x1="432" />
            <line x2="496" y1="160" y2="160" x1="432" />
            <rect width="64" x="0" y="212" height="24" />
            <line x2="0" y1="224" y2="224" x1="64" />
            <rect width="64" x="0" y="276" height="24" />
            <line x2="0" y1="288" y2="288" x1="64" />
            <line x2="0" y1="160" y2="160" x1="64" />
        </blockdef>
        <blockdef name="ADC_block">
            <timestamp>2013-9-17T22:34:37</timestamp>
            <rect width="528" x="64" y="-312" height="208" />
            <line x2="0" y1="-272" y2="-272" x1="64" />
            <line x2="0" y1="-208" y2="-208" x1="64" />
            <rect width="64" x="592" y="-252" height="24" />
            <line x2="656" y1="-240" y2="-240" x1="592" />
        </blockdef>
        <blockdef name="ADC_to_MCLK_domain">
            <timestamp>2009-11-6T17:1:57</timestamp>
            <rect width="560" x="-16" y="-256" height="256" />
            <line x2="-80" y1="-224" y2="-224" x1="-16" />
            <line x2="-80" y1="-176" y2="-176" x1="-16" />
            <line x2="-80" y1="-128" y2="-128" x1="-16" />
            <line x2="-80" y1="-80" y2="-80" x1="-16" />
            <rect width="64" x="-80" y="-44" height="24" />
            <line x2="-80" y1="-32" y2="-32" x1="-16" />
            <rect width="64" x="544" y="-188" height="24" />
            <line x2="608" y1="-176" y2="-176" x1="544" />
            <line x2="608" y1="-224" y2="-224" x1="544" />
        </blockdef>
        <blockdef name="buffer_4x12_to_10">
            <timestamp>2009-10-22T16:56:33</timestamp>
            <rect width="256" x="64" y="-64" height="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="bufg">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="0" x1="64" />
            <line x2="64" y1="-32" y2="-64" x1="128" />
            <line x2="128" y1="0" y2="-32" x1="64" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
        </blockdef>
        <blockdef name="stack_adc_samples">
            <timestamp>2009-12-11T18:34:32</timestamp>
            <rect width="64" x="0" y="20" height="24" />
            <line x2="0" y1="32" y2="32" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="512" y1="-160" y2="-160" x1="448" />
            <rect width="64" x="448" y="-44" height="24" />
            <line x2="512" y1="-32" y2="-32" x1="448" />
            <rect width="384" x="64" y="-192" height="256" />
        </blockdef>
        <block symbolname="ADC_Calibrator" name="XLXI_1">
            <blockpin signalname="MASTER_CLK" name="master_clk" />
            <blockpin signalname="reset" name="rst" />
            <blockpin signalname="calibrate" name="calibrate" />
            <blockpin signalname="adc_single_sample_we(3:0)" name="adc_sample_we(3:0)" />
            <blockpin signalname="mc_adc_sample(47:0)" name="adc_sample(47:0)" />
            <blockpin signalname="auto_clk" name="del_clk" />
            <blockpin signalname="auto_frm" name="del_frm" />
            <blockpin signalname="auto_rst_clk" name="rst_clk" />
            <blockpin signalname="auto_rst_frm" name="rst_frm" />
            <blockpin signalname="cal_done" name="done" />
            <blockpin signalname="calibrating" name="calibrating" />
            <blockpin signalname="cal_error" name="error" />
            <blockpin signalname="auto_del_dat(3:0)" name="del_dat(3:0)" />
            <blockpin signalname="auto_rst_dat(3:0)" name="rst_dat(3:0)" />
            <blockpin signalname="auto_inc_dec_dat(3:0)" name="inc_dec_ch_dat(3:0)" />
        </block>
        <block symbolname="adc_delay_data_logic" name="XLXI_5047">
            <blockpin signalname="man_clk_inc" name="man_clk_inc" />
            <blockpin signalname="man_clk_dec" name="man_clk_dec" />
            <blockpin signalname="man_frm_inc" name="man_frm_inc" />
            <blockpin signalname="man_frm_dec" name="man_frm_dec" />
            <blockpin signalname="del_dat(3:0)" name="del_dat(3:0)" />
            <blockpin signalname="auto_del_dat(3:0)" name="auto_del(3:0)" />
            <blockpin signalname="auto_rst_dat(3:0)" name="auto_rst(3:0)" />
            <blockpin signalname="auto_inc_dec_dat(3:0)" name="auto_inc_dec(3:0)" />
            <blockpin signalname="auto_clk" name="auto_clk" />
            <blockpin signalname="auto_frm" name="auto_frm" />
            <blockpin signalname="auto_rst_clk" name="auto_rst_clk" />
            <blockpin signalname="auto_rst_frm" name="auto_rst_frm" />
            <blockpin signalname="rst_dat(3:0)" name="rst_dat(3:0)" />
            <blockpin signalname="inc_dec_dat(3:0)" name="inc_dec_dat(3:0)" />
            <blockpin signalname="del_clk" name="del_clk" />
            <blockpin signalname="del_frm" name="del_frm" />
            <blockpin signalname="rst_clk" name="rst_clk" />
            <blockpin signalname="rst_frm" name="rst_frm" />
            <blockpin signalname="inc_dec_clk" name="inc_dec_clk" />
            <blockpin signalname="inc_dec_frm" name="inc_dec_frm" />
            <blockpin signalname="man_ch_inc(3:0)" name="man_inc(3:0)" />
            <blockpin signalname="man_ch_dec(3:0)" name="man_dec(3:0)" />
            <blockpin signalname="man_rst" name="man_rst" />
        </block>
        <block symbolname="idelay" name="XLXI_4636">
            <attr value="VARIABLE" name="IOBDELAY_TYPE">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="StringValList DEFAULT FIXED VARIABLE" />
            </attr>
            <blockpin signalname="ADC_CLK_OUT" name="I" />
            <blockpin signalname="del_clk" name="CE" />
            <blockpin signalname="MASTER_CLK" name="C" />
            <blockpin signalname="inc_dec_clk" name="INC" />
            <blockpin signalname="rst_clk" name="RST" />
            <blockpin signalname="XLXN_14691" name="O" />
        </block>
        <block symbolname="idelay" name="XLXI_4634">
            <attr value="VARIABLE" name="IOBDELAY_TYPE">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="StringValList DEFAULT FIXED VARIABLE" />
            </attr>
            <blockpin signalname="ADC_FRAME_OUT" name="I" />
            <blockpin signalname="del_frm" name="CE" />
            <blockpin signalname="MASTER_CLK" name="C" />
            <blockpin signalname="inc_dec_frm" name="INC" />
            <blockpin signalname="rst_frm" name="RST" />
            <blockpin signalname="adc_delayed_frame" name="O" />
        </block>
        <block symbolname="idelay" name="XLXI_5051">
            <attr value="VARIABLE" name="IOBDELAY_TYPE">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="StringValList DEFAULT FIXED VARIABLE" />
            </attr>
            <blockpin signalname="ADC_65MSPS_CH(0)" name="I" />
            <blockpin signalname="del_dat(0)" name="CE" />
            <blockpin signalname="MASTER_CLK" name="C" />
            <blockpin signalname="inc_dec_dat(0)" name="INC" />
            <blockpin signalname="rst_dat(0)" name="RST" />
            <blockpin signalname="adc_delayed_data(0)" name="O" />
        </block>
        <block symbolname="idelay" name="XLXI_5052">
            <attr value="VARIABLE" name="IOBDELAY_TYPE">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="StringValList DEFAULT FIXED VARIABLE" />
            </attr>
            <blockpin signalname="ADC_65MSPS_CH(1)" name="I" />
            <blockpin signalname="del_dat(1)" name="CE" />
            <blockpin signalname="MASTER_CLK" name="C" />
            <blockpin signalname="inc_dec_dat(1)" name="INC" />
            <blockpin signalname="rst_dat(1)" name="RST" />
            <blockpin signalname="adc_delayed_data(1)" name="O" />
        </block>
        <block symbolname="idelay" name="XLXI_5053">
            <attr value="VARIABLE" name="IOBDELAY_TYPE">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="StringValList DEFAULT FIXED VARIABLE" />
            </attr>
            <blockpin signalname="ADC_65MSPS_CH(2)" name="I" />
            <blockpin signalname="del_dat(2)" name="CE" />
            <blockpin signalname="MASTER_CLK" name="C" />
            <blockpin signalname="inc_dec_dat(2)" name="INC" />
            <blockpin signalname="rst_dat(2)" name="RST" />
            <blockpin signalname="adc_delayed_data(2)" name="O" />
        </block>
        <block symbolname="idelay" name="XLXI_5054">
            <attr value="VARIABLE" name="IOBDELAY_TYPE">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="StringValList DEFAULT FIXED VARIABLE" />
            </attr>
            <blockpin signalname="ADC_65MSPS_CH(3)" name="I" />
            <blockpin signalname="del_dat(3)" name="CE" />
            <blockpin signalname="MASTER_CLK" name="C" />
            <blockpin signalname="inc_dec_dat(3)" name="INC" />
            <blockpin signalname="rst_dat(3)" name="RST" />
            <blockpin signalname="adc_delayed_data(3)" name="O" />
        </block>
        <block symbolname="buffer_4x12_to_10" name="XLXI_5058">
            <blockpin signalname="mc_adc_sample(47:0)" name="i(47:0)" />
            <blockpin signalname="adc_single_sample(39:0)" name="o(39:0)" />
        </block>
        <block symbolname="ADC_to_MCLK_domain" name="ADC_to_MCLK_vector(3:0)">
            <blockpin signalname="reset" name="reset" />
            <blockpin signalname="MASTER_CLK" name="MASTER_CLK" />
            <blockpin signalname="adc_delayed_clk" name="adc_delayed_clk" />
            <blockpin signalname="adc_sample_we" name="adc_sample_we" />
            <blockpin signalname="adc_sample(47:0)" name="adc_raw_data(11:0)" />
            <blockpin signalname="mc_adc_sample(47:0)" name="adc_single_sample(11:0)" />
            <blockpin signalname="adc_single_sample_we(3:0)" name="adc_single_sample_we" />
        </block>
        <block symbolname="ADC_block" name="ADC_block_vector(3:0)">
            <blockpin signalname="adc_delayed_data(3:0)" name="adc_delayed_data" />
            <blockpin signalname="adc_delayed_clk" name="adc_delayed_clk" />
            <blockpin signalname="adc_sample(47:0)" name="adc_sample(11:0)" />
        </block>
        <block symbolname="ADC_frame_counter" name="XLXI_3484">
            <blockpin signalname="adc_delayed_clk" name="ADC_clk" />
            <blockpin signalname="adc_delayed_frame" name="ADC_frame" />
            <blockpin signalname="adc_sample_we" name="ADC_wen" />
        </block>
        <block symbolname="bufg" name="XLXI_5065">
            <blockpin signalname="XLXN_14691" name="I" />
            <blockpin signalname="adc_delayed_clk" name="O" />
        </block>
        <block symbolname="stack_adc_samples" name="XLXI_5066">
            <blockpin signalname="MASTER_CLK" name="mclk" />
            <blockpin signalname="mc_adc_sample(47:0)" name="samples(47:0)" />
            <blockpin signalname="adc_single_sample_we(3:0)" name="samples_we(3:0)" />
            <blockpin signalname="plaq_sel(1:0)" name="plaq_sel(1:0)" />
            <blockpin signalname="adc_burst_word_we" name="adc_burst_we" />
            <blockpin signalname="adc_burst_word(63:0)" name="adc_burst_data(63:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="7040" height="5440">
        <branch name="MASTER_CLK">
            <wire x2="560" y1="272" y2="272" x1="416" />
        </branch>
        <iomarker fontsize="28" x="416" y="272" name="MASTER_CLK" orien="R180" />
        <branch name="reset">
            <wire x2="560" y1="336" y2="336" x1="416" />
        </branch>
        <iomarker fontsize="28" x="416" y="336" name="reset" orien="R180" />
        <text style="fontsize:36;fontname:Arial" x="272" y="128">Hold calibrate HI until the cal_done signal raises to gaurantee ADC calibration</text>
        <branch name="ADC_65MSPS_CH(3:0)">
            <wire x2="560" y1="688" y2="688" x1="368" />
        </branch>
        <iomarker fontsize="28" x="368" y="688" name="ADC_65MSPS_CH(3:0)" orien="R180" />
        <branch name="calibrate">
            <wire x2="560" y1="400" y2="400" x1="416" />
        </branch>
        <iomarker fontsize="28" x="416" y="400" name="calibrate" orien="R180" />
        <branch name="man_ch_inc(3:0)">
            <wire x2="480" y1="1024" y2="1024" x1="336" />
        </branch>
        <iomarker fontsize="28" x="336" y="1024" name="man_ch_inc(3:0)" orien="R180" />
        <branch name="man_ch_dec(3:0)">
            <wire x2="480" y1="1104" y2="1104" x1="336" />
        </branch>
        <iomarker fontsize="28" x="336" y="1104" name="man_ch_dec(3:0)" orien="R180" />
        <branch name="ADC_FRAME_OUT">
            <wire x2="560" y1="640" y2="640" x1="368" />
        </branch>
        <iomarker fontsize="28" x="368" y="640" name="ADC_FRAME_OUT" orien="R180" />
        <branch name="ADC_CLK_OUT">
            <wire x2="560" y1="592" y2="592" x1="368" />
        </branch>
        <iomarker fontsize="28" x="368" y="592" name="ADC_CLK_OUT" orien="R180" />
        <branch name="adc_single_sample(39:0)">
            <wire x2="6416" y1="288" y2="288" x1="6272" />
        </branch>
        <branch name="adc_single_sample_we(3:0)">
            <wire x2="6416" y1="224" y2="224" x1="6272" />
        </branch>
        <iomarker fontsize="28" x="6416" y="288" name="adc_single_sample(39:0)" orien="R0" />
        <iomarker fontsize="28" x="6416" y="224" name="adc_single_sample_we(3:0)" orien="R0" />
        <text style="fontsize:40;fontname:Arial" x="5860" y="160">ALL OUTPUTS ARE IN MASTER_CLK DOMAIN</text>
        <branch name="adc_burst_word(63:0)">
            <wire x2="6416" y1="464" y2="464" x1="6272" />
        </branch>
        <branch name="adc_burst_word_we">
            <wire x2="6416" y1="400" y2="400" x1="6272" />
        </branch>
        <iomarker fontsize="28" x="6416" y="464" name="adc_burst_word(63:0)" orien="R0" />
        <iomarker fontsize="28" x="6416" y="400" name="adc_burst_word_we" orien="R0" />
        <branch name="cal_error">
            <wire x2="6400" y1="640" y2="640" x1="6320" />
            <wire x2="6416" y1="640" y2="640" x1="6400" />
        </branch>
        <branch name="cal_done">
            <wire x2="6400" y1="576" y2="576" x1="6320" />
            <wire x2="6416" y1="576" y2="576" x1="6400" />
        </branch>
        <iomarker fontsize="28" x="6416" y="576" name="cal_done" orien="R0" />
        <iomarker fontsize="28" x="6416" y="640" name="cal_error" orien="R0" />
        <branch name="MASTER_CLK">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2240" y="704" type="branch" />
            <wire x2="2336" y1="704" y2="704" x1="2240" />
        </branch>
        <branch name="reset">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2240" y="768" type="branch" />
            <wire x2="2336" y1="768" y2="768" x1="2240" />
        </branch>
        <branch name="calibrate">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2240" y="832" type="branch" />
            <wire x2="2336" y1="832" y2="832" x1="2240" />
        </branch>
        <branch name="auto_del_dat(3:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2912" y="832" type="branch" />
            <wire x2="2912" y1="832" y2="832" x1="2816" />
        </branch>
        <branch name="auto_frm">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2912" y="768" type="branch" />
            <wire x2="2912" y1="768" y2="768" x1="2816" />
        </branch>
        <branch name="auto_clk">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2912" y="704" type="branch" />
            <wire x2="2912" y1="704" y2="704" x1="2816" />
        </branch>
        <branch name="auto_rst_frm">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2912" y="960" type="branch" />
            <wire x2="2912" y1="960" y2="960" x1="2816" />
        </branch>
        <branch name="auto_rst_clk">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2912" y="896" type="branch" />
            <wire x2="2912" y1="896" y2="896" x1="2816" />
        </branch>
        <branch name="auto_rst_dat(3:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2912" y="1024" type="branch" />
            <wire x2="2912" y1="1024" y2="1024" x1="2816" />
        </branch>
        <branch name="auto_inc_dec_dat(3:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2912" y="1088" type="branch" />
            <wire x2="2912" y1="1088" y2="1088" x1="2816" />
        </branch>
        <instance x="2336" y="1184" name="XLXI_1" orien="R0">
        </instance>
        <instance x="2320" y="1936" name="XLXI_5047" orien="R0">
        </instance>
        <instance x="4048" y="1248" name="XLXI_4636" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="IOBDELAY_TYPE" x="0" y="-248" type="instance" />
        </instance>
        <branch name="ADC_CLK_OUT">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3856" y="1088" type="branch" />
            <wire x2="4048" y1="1088" y2="1088" x1="3856" />
        </branch>
        <branch name="MASTER_CLK">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3856" y="1152" type="branch" />
            <wire x2="4048" y1="1152" y2="1152" x1="3856" />
        </branch>
        <branch name="del_clk">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3856" y="1120" type="branch" />
            <wire x2="4048" y1="1120" y2="1120" x1="3856" />
        </branch>
        <branch name="inc_dec_clk">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3664" y="1184" type="branch" />
            <wire x2="4048" y1="1184" y2="1184" x1="3664" />
        </branch>
        <branch name="rst_clk">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3856" y="1216" type="branch" />
            <wire x2="4048" y1="1216" y2="1216" x1="3856" />
        </branch>
        <instance x="4048" y="1536" name="XLXI_4634" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="IOBDELAY_TYPE" x="0" y="-248" type="instance" />
        </instance>
        <branch name="ADC_FRAME_OUT">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3856" y="1376" type="branch" />
            <wire x2="4048" y1="1376" y2="1376" x1="3856" />
        </branch>
        <branch name="MASTER_CLK">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3856" y="1440" type="branch" />
            <wire x2="4048" y1="1440" y2="1440" x1="3856" />
        </branch>
        <branch name="del_frm">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3856" y="1408" type="branch" />
            <wire x2="4048" y1="1408" y2="1408" x1="3856" />
        </branch>
        <branch name="rst_frm">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3856" y="1504" type="branch" />
            <wire x2="4048" y1="1504" y2="1504" x1="3856" />
        </branch>
        <branch name="ADC_65MSPS_CH(0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3856" y="1680" type="branch" />
            <wire x2="4048" y1="1680" y2="1680" x1="3856" />
        </branch>
        <branch name="MASTER_CLK">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3856" y="1744" type="branch" />
            <wire x2="4048" y1="1744" y2="1744" x1="3856" />
        </branch>
        <branch name="del_dat(0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3856" y="1712" type="branch" />
            <wire x2="4048" y1="1712" y2="1712" x1="3856" />
        </branch>
        <branch name="rst_dat(0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3856" y="1808" type="branch" />
            <wire x2="4048" y1="1808" y2="1808" x1="3856" />
        </branch>
        <branch name="inc_dec_dat(0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3664" y="1776" type="branch" />
            <wire x2="4048" y1="1776" y2="1776" x1="3664" />
        </branch>
        <branch name="ADC_65MSPS_CH(1)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3856" y="2016" type="branch" />
            <wire x2="4048" y1="2016" y2="2016" x1="3856" />
        </branch>
        <branch name="MASTER_CLK">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3856" y="2080" type="branch" />
            <wire x2="4048" y1="2080" y2="2080" x1="3856" />
        </branch>
        <branch name="del_dat(1)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3856" y="2048" type="branch" />
            <wire x2="4048" y1="2048" y2="2048" x1="3856" />
        </branch>
        <branch name="rst_dat(1)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3856" y="2144" type="branch" />
            <wire x2="4048" y1="2144" y2="2144" x1="3856" />
        </branch>
        <branch name="inc_dec_dat(1)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3664" y="2112" type="branch" />
            <wire x2="4048" y1="2112" y2="2112" x1="3664" />
        </branch>
        <branch name="ADC_65MSPS_CH(2)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3872" y="2352" type="branch" />
            <wire x2="4064" y1="2352" y2="2352" x1="3872" />
        </branch>
        <branch name="MASTER_CLK">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3872" y="2416" type="branch" />
            <wire x2="4064" y1="2416" y2="2416" x1="3872" />
        </branch>
        <branch name="del_dat(2)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3872" y="2384" type="branch" />
            <wire x2="4064" y1="2384" y2="2384" x1="3872" />
        </branch>
        <branch name="rst_dat(2)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3872" y="2480" type="branch" />
            <wire x2="4064" y1="2480" y2="2480" x1="3872" />
        </branch>
        <branch name="inc_dec_dat(2)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3680" y="2448" type="branch" />
            <wire x2="4064" y1="2448" y2="2448" x1="3680" />
        </branch>
        <branch name="ADC_65MSPS_CH(3)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3872" y="2672" type="branch" />
            <wire x2="4064" y1="2672" y2="2672" x1="3872" />
        </branch>
        <branch name="MASTER_CLK">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3872" y="2736" type="branch" />
            <wire x2="4064" y1="2736" y2="2736" x1="3872" />
        </branch>
        <branch name="del_dat(3)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3872" y="2704" type="branch" />
            <wire x2="4064" y1="2704" y2="2704" x1="3872" />
        </branch>
        <branch name="rst_dat(3)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3872" y="2800" type="branch" />
            <wire x2="4064" y1="2800" y2="2800" x1="3872" />
        </branch>
        <branch name="inc_dec_dat(3)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3680" y="2768" type="branch" />
            <wire x2="4064" y1="2768" y2="2768" x1="3680" />
        </branch>
        <instance x="4048" y="1840" name="XLXI_5051" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="IOBDELAY_TYPE" x="0" y="-248" type="instance" />
        </instance>
        <instance x="4048" y="2176" name="XLXI_5052" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="IOBDELAY_TYPE" x="0" y="-248" type="instance" />
        </instance>
        <instance x="4064" y="2512" name="XLXI_5053" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="IOBDELAY_TYPE" x="0" y="-248" type="instance" />
        </instance>
        <instance x="4064" y="2832" name="XLXI_5054" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="IOBDELAY_TYPE" x="0" y="-248" type="instance" />
        </instance>
        <branch name="adc_single_sample(39:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="6096" y="2944" type="branch" />
            <wire x2="6096" y1="2944" y2="2944" x1="6048" />
        </branch>
        <instance x="5664" y="2976" name="XLXI_5058" orien="R0">
        </instance>
        <branch name="mc_adc_sample(47:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5568" y="2944" type="branch" />
            <wire x2="5584" y1="2944" y2="2944" x1="5568" />
            <wire x2="5664" y1="2944" y2="2944" x1="5584" />
        </branch>
        <branch name="inc_dec_frm">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3664" y="1472" type="branch" />
            <wire x2="4048" y1="1472" y2="1472" x1="3664" />
        </branch>
        <branch name="cal_done">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2912" y="1184" type="branch" />
            <wire x2="2896" y1="1184" y2="1184" x1="2816" />
            <wire x2="2912" y1="1184" y2="1184" x1="2896" />
        </branch>
        <branch name="cal_error">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2912" y="1248" type="branch" />
            <wire x2="2896" y1="1248" y2="1248" x1="2816" />
            <wire x2="2912" y1="1248" y2="1248" x1="2896" />
        </branch>
        <branch name="calibrating">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2912" y="1312" type="branch" />
            <wire x2="2896" y1="1312" y2="1312" x1="2816" />
            <wire x2="2912" y1="1312" y2="1312" x1="2896" />
        </branch>
        <branch name="mc_adc_sample(47:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2240" y="1408" type="branch" />
            <wire x2="2336" y1="1408" y2="1408" x1="2240" />
        </branch>
        <branch name="adc_single_sample_we(3:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2240" y="1248" type="branch" />
            <wire x2="2336" y1="1248" y2="1248" x1="2240" />
        </branch>
        <branch name="calibrating">
            <wire x2="6400" y1="704" y2="704" x1="6320" />
            <wire x2="6416" y1="704" y2="704" x1="6400" />
        </branch>
        <iomarker fontsize="28" x="6416" y="704" name="calibrating" orien="R0" />
        <branch name="del_dat(3:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2912" y="1584" type="branch" />
            <wire x2="2896" y1="1584" y2="1584" x1="2816" />
            <wire x2="2912" y1="1584" y2="1584" x1="2896" />
        </branch>
        <branch name="rst_dat(3:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2912" y="1712" type="branch" />
            <wire x2="2896" y1="1712" y2="1712" x1="2816" />
            <wire x2="2912" y1="1712" y2="1712" x1="2896" />
        </branch>
        <branch name="inc_dec_dat(3:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2912" y="1648" type="branch" />
            <wire x2="2896" y1="1648" y2="1648" x1="2816" />
            <wire x2="2912" y1="1648" y2="1648" x1="2896" />
        </branch>
        <branch name="auto_del_dat(3:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2224" y="1584" type="branch" />
            <wire x2="2320" y1="1584" y2="1584" x1="2224" />
        </branch>
        <branch name="auto_rst_dat(3:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2224" y="1648" type="branch" />
            <wire x2="2320" y1="1648" y2="1648" x1="2224" />
        </branch>
        <branch name="auto_inc_dec_dat(3:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2224" y="1712" type="branch" />
            <wire x2="2320" y1="1712" y2="1712" x1="2224" />
        </branch>
        <branch name="auto_clk">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2224" y="1776" type="branch" />
            <wire x2="2320" y1="1776" y2="1776" x1="2224" />
        </branch>
        <branch name="auto_frm">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2224" y="1840" type="branch" />
            <wire x2="2320" y1="1840" y2="1840" x1="2224" />
        </branch>
        <branch name="auto_rst_clk">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2224" y="1904" type="branch" />
            <wire x2="2320" y1="1904" y2="1904" x1="2224" />
        </branch>
        <branch name="auto_rst_frm">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2224" y="1968" type="branch" />
            <wire x2="2320" y1="1968" y2="1968" x1="2224" />
        </branch>
        <branch name="del_frm">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2912" y="1840" type="branch" />
            <wire x2="2912" y1="1840" y2="1840" x1="2816" />
        </branch>
        <branch name="del_clk">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2912" y="1776" type="branch" />
            <wire x2="2912" y1="1776" y2="1776" x1="2816" />
        </branch>
        <branch name="rst_frm">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2912" y="1968" type="branch" />
            <wire x2="2912" y1="1968" y2="1968" x1="2816" />
        </branch>
        <branch name="rst_clk">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2912" y="1904" type="branch" />
            <wire x2="2912" y1="1904" y2="1904" x1="2816" />
        </branch>
        <branch name="inc_dec_frm">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2912" y="2096" type="branch" />
            <wire x2="2912" y1="2096" y2="2096" x1="2816" />
        </branch>
        <branch name="inc_dec_clk">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2912" y="2032" type="branch" />
            <wire x2="2912" y1="2032" y2="2032" x1="2816" />
        </branch>
        <branch name="man_ch_inc(3:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2224" y="2160" type="branch" />
            <wire x2="2320" y1="2160" y2="2160" x1="2224" />
        </branch>
        <branch name="man_ch_dec(3:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2224" y="2224" type="branch" />
            <wire x2="2320" y1="2224" y2="2224" x1="2224" />
        </branch>
        <branch name="man_rst">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2224" y="2096" type="branch" />
            <wire x2="2320" y1="2096" y2="2096" x1="2224" />
        </branch>
        <instance x="4208" y="3584" name="ADC_to_MCLK_vector(3:0)" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial" attrname="InstName" x="-80" y="-376" type="instance" />
        </instance>
        <branch name="MASTER_CLK">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4032" y="3408" type="branch" />
            <wire x2="4048" y1="3408" y2="3408" x1="4032" />
            <wire x2="4128" y1="3408" y2="3408" x1="4048" />
        </branch>
        <branch name="reset">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4032" y="3360" type="branch" />
            <wire x2="4048" y1="3360" y2="3360" x1="4032" />
            <wire x2="4128" y1="3360" y2="3360" x1="4048" />
        </branch>
        <branch name="adc_delayed_clk">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4032" y="3456" type="branch" />
            <wire x2="4048" y1="3456" y2="3456" x1="4032" />
            <wire x2="4128" y1="3456" y2="3456" x1="4048" />
        </branch>
        <branch name="adc_sample_we">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4032" y="3504" type="branch" />
            <wire x2="4048" y1="3504" y2="3504" x1="4032" />
            <wire x2="4128" y1="3504" y2="3504" x1="4048" />
        </branch>
        <branch name="adc_sample(47:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4032" y="3552" type="branch" />
            <wire x2="4048" y1="3552" y2="3552" x1="4032" />
            <wire x2="4128" y1="3552" y2="3552" x1="4048" />
        </branch>
        <branch name="adc_single_sample_we(3:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4864" y="3360" type="branch" />
            <wire x2="4864" y1="3360" y2="3360" x1="4816" />
        </branch>
        <branch name="mc_adc_sample(47:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4864" y="3408" type="branch" />
            <wire x2="4864" y1="3408" y2="3408" x1="4816" />
        </branch>
        <branch name="adc_delayed_data(3:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2720" y="3376" type="branch" />
            <wire x2="2816" y1="3376" y2="3376" x1="2720" />
        </branch>
        <branch name="adc_delayed_clk">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2720" y="3440" type="branch" />
            <wire x2="2816" y1="3440" y2="3440" x1="2720" />
        </branch>
        <branch name="adc_sample(47:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3520" y="3408" type="branch" />
            <wire x2="3520" y1="3408" y2="3408" x1="3472" />
        </branch>
        <instance x="2816" y="3648" name="ADC_block_vector(3:0)" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial" attrname="InstName" x="0" y="-424" type="instance" />
        </instance>
        <branch name="adc_delayed_frame">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1104" y="3440" type="branch" />
            <wire x2="1120" y1="3440" y2="3440" x1="1104" />
            <wire x2="1184" y1="3440" y2="3440" x1="1120" />
        </branch>
        <branch name="adc_delayed_clk">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1088" y="3376" type="branch" />
            <wire x2="1104" y1="3376" y2="3376" x1="1088" />
            <wire x2="1184" y1="3376" y2="3376" x1="1104" />
        </branch>
        <instance x="1184" y="3536" name="XLXI_3484" orien="R0">
        </instance>
        <branch name="adc_sample_we">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1696" y="3504" type="branch" />
            <wire x2="1696" y1="3504" y2="3504" x1="1568" />
        </branch>
        <branch name="man_clk_inc">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2224" y="2288" type="branch" />
            <wire x2="2320" y1="2288" y2="2288" x1="2224" />
        </branch>
        <branch name="man_clk_dec">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2224" y="2352" type="branch" />
            <wire x2="2320" y1="2352" y2="2352" x1="2224" />
        </branch>
        <branch name="man_frm_inc">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2224" y="2416" type="branch" />
            <wire x2="2320" y1="2416" y2="2416" x1="2224" />
        </branch>
        <branch name="man_frm_dec">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2224" y="2480" type="branch" />
            <wire x2="2320" y1="2480" y2="2480" x1="2224" />
        </branch>
        <branch name="man_clk_inc">
            <wire x2="480" y1="1184" y2="1184" x1="336" />
        </branch>
        <iomarker fontsize="28" x="336" y="1184" name="man_clk_inc" orien="R180" />
        <branch name="man_clk_dec">
            <wire x2="480" y1="1264" y2="1264" x1="336" />
        </branch>
        <iomarker fontsize="28" x="336" y="1264" name="man_clk_dec" orien="R180" />
        <branch name="man_frm_inc">
            <wire x2="480" y1="1344" y2="1344" x1="336" />
        </branch>
        <branch name="man_frm_dec">
            <wire x2="480" y1="1424" y2="1424" x1="336" />
        </branch>
        <iomarker fontsize="28" x="336" y="1344" name="man_frm_inc" orien="R180" />
        <iomarker fontsize="28" x="336" y="1424" name="man_frm_dec" orien="R180" />
        <branch name="man_rst">
            <wire x2="480" y1="944" y2="944" x1="336" />
        </branch>
        <iomarker fontsize="28" x="336" y="944" name="man_rst" orien="R180" />
        <branch name="adc_delayed_clk">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4848" y="1088" type="branch" />
            <wire x2="4848" y1="1088" y2="1088" x1="4736" />
        </branch>
        <instance x="4512" y="1120" name="XLXI_5065" orien="R0" />
        <branch name="XLXN_14691">
            <wire x2="4512" y1="1088" y2="1088" x1="4432" />
        </branch>
        <branch name="adc_delayed_frame">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4544" y="1376" type="branch" />
            <wire x2="4464" y1="1376" y2="1376" x1="4432" />
            <wire x2="4480" y1="1376" y2="1376" x1="4464" />
            <wire x2="4544" y1="1376" y2="1376" x1="4480" />
        </branch>
        <branch name="adc_delayed_data(0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4544" y="1680" type="branch" />
            <wire x2="4544" y1="1680" y2="1680" x1="4432" />
        </branch>
        <branch name="adc_delayed_data(1)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4544" y="2016" type="branch" />
            <wire x2="4544" y1="2016" y2="2016" x1="4432" />
        </branch>
        <branch name="adc_delayed_data(2)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4560" y="2352" type="branch" />
            <wire x2="4560" y1="2352" y2="2352" x1="4448" />
        </branch>
        <branch name="adc_delayed_data(3)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4560" y="2672" type="branch" />
            <wire x2="4560" y1="2672" y2="2672" x1="4448" />
        </branch>
        <instance x="3968" y="656" name="XLXI_5066" orien="R0">
        </instance>
        <branch name="adc_burst_word_we">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4528" y="496" type="branch" />
            <wire x2="4528" y1="496" y2="496" x1="4480" />
        </branch>
        <branch name="adc_burst_word(63:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4528" y="624" type="branch" />
            <wire x2="4528" y1="624" y2="624" x1="4480" />
        </branch>
        <branch name="MASTER_CLK">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3872" y="496" type="branch" />
            <wire x2="3888" y1="496" y2="496" x1="3872" />
            <wire x2="3968" y1="496" y2="496" x1="3888" />
        </branch>
        <branch name="mc_adc_sample(47:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3872" y="560" type="branch" />
            <wire x2="3888" y1="560" y2="560" x1="3872" />
            <wire x2="3968" y1="560" y2="560" x1="3888" />
        </branch>
        <branch name="plaq_sel(1:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3872" y="624" type="branch" />
            <wire x2="3888" y1="624" y2="624" x1="3872" />
            <wire x2="3968" y1="624" y2="624" x1="3888" />
        </branch>
        <branch name="plaq_sel(1:0)">
            <wire x2="448" y1="768" y2="768" x1="432" />
            <wire x2="528" y1="768" y2="768" x1="448" />
        </branch>
        <iomarker fontsize="28" x="432" y="768" name="plaq_sel(1:0)" orien="R180" />
        <branch name="adc_single_sample_we(3:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3872" y="688" type="branch" />
            <wire x2="3888" y1="688" y2="688" x1="3872" />
            <wire x2="3968" y1="688" y2="688" x1="3888" />
        </branch>
    </sheet>
</drawing>