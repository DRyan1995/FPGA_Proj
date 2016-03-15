<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="artix7" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="FAN_EN" />
        <signal name="FAN_OUT" />
        <signal name="DHT11_DATA" />
        <signal name="BREATH_LED_EN" />
        <signal name="BREATH_LED_CLK" />
        <signal name="WIFI_TXD_IN" />
        <signal name="WIFI_RXD_OUT" />
        <signal name="WIFI_TXD_OUT" />
        <signal name="SIGTAP_IN" />
        <signal name="SIGTAP_OUT" />
        <signal name="DHT11_TXD" />
        <signal name="DHT11_CLK" />
        <signal name="Alarm_in" />
        <signal name="Alarm_out" />
        <signal name="alarm_key_in" />
        <signal name="alarm_en_out" />
        <signal name="led(15:0)" />
        <signal name="CLOCK" />
        <signal name="WIFI_RXD_IN" />
        <signal name="XLXN_20" />
        <signal name="XLXN_25" />
        <signal name="XLXN_26" />
        <signal name="XLXN_27" />
        <signal name="MP3_IN" />
        <signal name="MP3_OUT" />
        <port polarity="Input" name="FAN_EN" />
        <port polarity="Output" name="FAN_OUT" />
        <port polarity="BiDirectional" name="DHT11_DATA" />
        <port polarity="Input" name="BREATH_LED_EN" />
        <port polarity="Input" name="WIFI_TXD_IN" />
        <port polarity="Output" name="WIFI_RXD_OUT" />
        <port polarity="Output" name="WIFI_TXD_OUT" />
        <port polarity="Input" name="SIGTAP_IN" />
        <port polarity="Output" name="SIGTAP_OUT" />
        <port polarity="Output" name="DHT11_TXD" />
        <port polarity="Input" name="Alarm_in" />
        <port polarity="Output" name="Alarm_out" />
        <port polarity="Input" name="alarm_key_in" />
        <port polarity="Output" name="alarm_en_out" />
        <port polarity="Output" name="led(15:0)" />
        <port polarity="Input" name="CLOCK" />
        <port polarity="Input" name="WIFI_RXD_IN" />
        <port polarity="BiDirectional" name="MP3_IN" />
        <port polarity="BiDirectional" name="MP3_OUT" />
        <blockdef name="FAN">
            <timestamp>2015-12-22T12:9:52</timestamp>
            <rect width="256" x="64" y="-64" height="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="DHT11_top">
            <timestamp>2015-12-22T12:19:46</timestamp>
            <rect width="256" x="64" y="-128" height="128" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="sigtap">
            <timestamp>2015-12-22T13:3:4</timestamp>
            <rect width="256" x="64" y="-64" height="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="Alarm">
            <timestamp>2015-12-22T13:45:14</timestamp>
            <rect width="256" x="64" y="-64" height="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="alarm_en">
            <timestamp>2015-12-23T2:49:23</timestamp>
            <line x2="384" y1="32" y2="32" x1="320" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="256" x="64" y="-64" height="128" />
        </blockdef>
        <blockdef name="breathe_led">
            <timestamp>2015-12-23T3:1:50</timestamp>
            <rect width="256" x="64" y="-128" height="128" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-108" height="24" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
        </blockdef>
        <blockdef name="Clock_generate">
            <timestamp>2015-12-23T4:46:19</timestamp>
            <rect width="256" x="64" y="-128" height="128" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="wifi_inout">
            <timestamp>2015-12-23T6:16:34</timestamp>
            <rect width="256" x="64" y="-256" height="256" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="MP3">
            <timestamp>2015-12-23T12:16:9</timestamp>
            <rect width="256" x="64" y="-128" height="128" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <block symbolname="sigtap" name="XLXI_7">
            <blockpin signalname="SIGTAP_IN" name="touch_in" />
            <blockpin signalname="SIGTAP_OUT" name="touch_out" />
        </block>
        <block symbolname="DHT11_top" name="XLXI_4">
            <blockpin signalname="DHT11_CLK" name="clk" />
            <blockpin signalname="DHT11_TXD" name="TxD" />
            <blockpin signalname="DHT11_DATA" name="data" />
        </block>
        <block symbolname="FAN" name="XLXI_1">
            <blockpin signalname="FAN_EN" name="en" />
            <blockpin signalname="FAN_OUT" name="fan_out" />
        </block>
        <block symbolname="Alarm" name="XLXI_8">
            <blockpin signalname="Alarm_in" name="alarm_in" />
            <blockpin signalname="Alarm_out" name="alarm_out" />
        </block>
        <block symbolname="alarm_en" name="XLXI_10">
            <blockpin signalname="alarm_key_in" name="key_in" />
            <blockpin signalname="alarm_en_out" name="alarm_en" />
        </block>
        <block symbolname="breathe_led" name="XLXI_12">
            <blockpin signalname="BREATH_LED_CLK" name="clk" />
            <blockpin signalname="BREATH_LED_EN" name="en" />
            <blockpin signalname="led(15:0)" name="led(15:0)" />
        </block>
        <block symbolname="Clock_generate" name="XLXI_20">
            <blockpin signalname="CLOCK" name="clk_100M" />
            <blockpin signalname="BREATH_LED_CLK" name="clk_50M_1" />
            <blockpin signalname="DHT11_CLK" name="clk_50M_2" />
        </block>
        <block symbolname="wifi_inout" name="XLXI_25">
            <blockpin signalname="WIFI_TXD_IN" name="txd_in" />
            <blockpin signalname="WIFI_RXD_IN" name="rxd_in" />
            <blockpin signalname="WIFI_TXD_OUT" name="txd_out" />
            <blockpin signalname="WIFI_RXD_OUT" name="rxd_out" />
        </block>
        <block symbolname="MP3" name="XLXI_26">
            <blockpin signalname="MP3_IN" name="mp3_in" />
            <blockpin signalname="MP3_OUT" name="mp3_out" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="FAN_EN">
            <wire x2="1856" y1="1264" y2="1264" x1="1808" />
        </branch>
        <branch name="FAN_OUT">
            <wire x2="2256" y1="1264" y2="1264" x1="2240" />
        </branch>
        <branch name="DHT11_DATA">
            <wire x2="2256" y1="1600" y2="1600" x1="2240" />
            <wire x2="2272" y1="1600" y2="1600" x1="2256" />
        </branch>
        <branch name="BREATH_LED_EN">
            <wire x2="1056" y1="1392" y2="1392" x1="1040" />
            <wire x2="1072" y1="1392" y2="1392" x1="1056" />
        </branch>
        <branch name="BREATH_LED_CLK">
            <wire x2="1040" y1="1312" y2="1312" x1="608" />
            <wire x2="1040" y1="1312" y2="1328" x1="1040" />
            <wire x2="1056" y1="1328" y2="1328" x1="1040" />
            <wire x2="1072" y1="1328" y2="1328" x1="1056" />
        </branch>
        <branch name="WIFI_TXD_IN">
            <wire x2="720" y1="1600" y2="1600" x1="640" />
            <wire x2="720" y1="1520" y2="1600" x1="720" />
            <wire x2="1088" y1="1520" y2="1520" x1="720" />
            <wire x2="1088" y1="1520" y2="1632" x1="1088" />
            <wire x2="1088" y1="1632" y2="1632" x1="1056" />
        </branch>
        <branch name="WIFI_RXD_OUT">
            <wire x2="704" y1="1792" y2="1792" x1="640" />
            <wire x2="704" y1="1792" y2="1808" x1="704" />
            <wire x2="1472" y1="1808" y2="1808" x1="704" />
            <wire x2="1504" y1="1696" y2="1696" x1="1472" />
            <wire x2="1472" y1="1696" y2="1808" x1="1472" />
        </branch>
        <branch name="WIFI_TXD_OUT">
            <wire x2="704" y1="1728" y2="1728" x1="640" />
            <wire x2="704" y1="1728" y2="1744" x1="704" />
            <wire x2="1120" y1="1744" y2="1744" x1="704" />
            <wire x2="1120" y1="1632" y2="1744" x1="1120" />
            <wire x2="1472" y1="1632" y2="1632" x1="1120" />
            <wire x2="1504" y1="1632" y2="1632" x1="1472" />
        </branch>
        <instance x="1104" y="1024" name="XLXI_7" orien="R0">
        </instance>
        <branch name="SIGTAP_IN">
            <wire x2="1104" y1="992" y2="992" x1="1072" />
        </branch>
        <branch name="SIGTAP_OUT">
            <wire x2="1520" y1="992" y2="992" x1="1488" />
        </branch>
        <branch name="DHT11_TXD">
            <wire x2="2256" y1="1536" y2="1536" x1="2240" />
            <wire x2="2272" y1="1536" y2="1536" x1="2256" />
        </branch>
        <branch name="DHT11_CLK">
            <wire x2="640" y1="1376" y2="1376" x1="608" />
            <wire x2="640" y1="1376" y2="1536" x1="640" />
            <wire x2="1824" y1="1536" y2="1536" x1="640" />
            <wire x2="1840" y1="1536" y2="1536" x1="1824" />
            <wire x2="1856" y1="1536" y2="1536" x1="1840" />
        </branch>
        <instance x="1856" y="1632" name="XLXI_4" orien="R0">
        </instance>
        <instance x="1856" y="1296" name="XLXI_1" orien="R0">
        </instance>
        <branch name="Alarm_in">
            <wire x2="1104" y1="1904" y2="1904" x1="1088" />
        </branch>
        <branch name="Alarm_out">
            <wire x2="1536" y1="1904" y2="1904" x1="1488" />
        </branch>
        <instance x="1888" y="1888" name="XLXI_10" orien="R0">
        </instance>
        <branch name="alarm_key_in">
            <wire x2="1888" y1="1856" y2="1856" x1="1856" />
        </branch>
        <branch name="alarm_en_out">
            <wire x2="2304" y1="1920" y2="1920" x1="2272" />
        </branch>
        <instance x="1072" y="1424" name="XLXI_12" orien="R0">
        </instance>
        <branch name="led(15:0)">
            <wire x2="1488" y1="1328" y2="1328" x1="1456" />
        </branch>
        <iomarker fontsize="28" x="1808" y="1264" name="FAN_EN" orien="R180" />
        <iomarker fontsize="28" x="2256" y="1264" name="FAN_OUT" orien="R0" />
        <iomarker fontsize="28" x="2272" y="1536" name="DHT11_TXD" orien="R0" />
        <iomarker fontsize="28" x="2272" y="1600" name="DHT11_DATA" orien="R0" />
        <iomarker fontsize="28" x="1040" y="1392" name="BREATH_LED_EN" orien="R180" />
        <iomarker fontsize="28" x="1056" y="1632" name="WIFI_TXD_IN" orien="R180" />
        <iomarker fontsize="28" x="1504" y="1696" name="WIFI_RXD_OUT" orien="R0" />
        <iomarker fontsize="28" x="1504" y="1632" name="WIFI_TXD_OUT" orien="R0" />
        <iomarker fontsize="28" x="1072" y="992" name="SIGTAP_IN" orien="R180" />
        <iomarker fontsize="28" x="1520" y="992" name="SIGTAP_OUT" orien="R0" />
        <iomarker fontsize="28" x="1088" y="1904" name="Alarm_in" orien="R180" />
        <iomarker fontsize="28" x="1536" y="1904" name="Alarm_out" orien="R0" />
        <iomarker fontsize="28" x="1856" y="1856" name="alarm_key_in" orien="R180" />
        <iomarker fontsize="28" x="2304" y="1920" name="alarm_en_out" orien="R0" />
        <iomarker fontsize="28" x="1488" y="1328" name="led(15:0)" orien="R0" />
        <instance x="1104" y="1936" name="XLXI_8" orien="R0">
        </instance>
        <instance x="224" y="1408" name="XLXI_20" orien="R0">
        </instance>
        <branch name="CLOCK">
            <wire x2="224" y1="1312" y2="1312" x1="192" />
        </branch>
        <iomarker fontsize="28" x="192" y="1312" name="CLOCK" orien="R180" />
        <instance x="256" y="1824" name="XLXI_25" orien="R0">
        </instance>
        <iomarker fontsize="28" x="1056" y="1696" name="WIFI_RXD_IN" orien="R180" />
        <branch name="WIFI_RXD_IN">
            <wire x2="720" y1="1664" y2="1664" x1="640" />
            <wire x2="720" y1="1664" y2="1792" x1="720" />
            <wire x2="1088" y1="1792" y2="1792" x1="720" />
            <wire x2="1088" y1="1696" y2="1696" x1="1056" />
            <wire x2="1088" y1="1696" y2="1792" x1="1088" />
        </branch>
        <instance x="256" y="2112" name="XLXI_26" orien="R0">
        </instance>
        <branch name="MP3_IN">
            <wire x2="672" y1="2016" y2="2016" x1="640" />
        </branch>
        <iomarker fontsize="28" x="672" y="2016" name="MP3_IN" orien="R0" />
        <branch name="MP3_OUT">
            <wire x2="672" y1="2080" y2="2080" x1="640" />
        </branch>
        <iomarker fontsize="28" x="672" y="2080" name="MP3_OUT" orien="R0" />
    </sheet>
</drawing>