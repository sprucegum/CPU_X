<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="OP1(7:0)" />
        <signal name="OP2(7:0)" />
        <signal name="FB0" />
        <signal name="FB1" />
        <signal name="FB2" />
        <signal name="FB3" />
        <signal name="OPA1(1:0)" />
        <signal name="OPD1(7:0)" />
        <signal name="OPA2(1:0)" />
        <signal name="OPD2(7:0)" />
        <signal name="FBR0(7:0)" />
        <signal name="FBR1(7:0)" />
        <signal name="FBR2(7:0)" />
        <signal name="FBR3(7:0)" />
        <port polarity="Output" name="OP1(7:0)" />
        <port polarity="Output" name="OP2(7:0)" />
        <port polarity="Input" name="FB0" />
        <port polarity="Input" name="FB1" />
        <port polarity="Input" name="FB2" />
        <port polarity="Input" name="FB3" />
        <port polarity="Input" name="OPA1(1:0)" />
        <port polarity="Input" name="OPD1(7:0)" />
        <port polarity="Input" name="OPA2(1:0)" />
        <port polarity="Input" name="OPD2(7:0)" />
        <port polarity="Input" name="FBR0(7:0)" />
        <port polarity="Input" name="FBR1(7:0)" />
        <port polarity="Input" name="FBR2(7:0)" />
        <port polarity="Input" name="FBR3(7:0)" />
        <blockdef name="FeedForward_MUX">
            <timestamp>2013-4-8T11:0:14</timestamp>
            <rect width="256" x="64" y="-640" height="640" />
            <line x2="0" y1="-608" y2="-608" x1="64" />
            <line x2="0" y1="-544" y2="-544" x1="64" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
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
            <rect width="64" x="320" y="-620" height="24" />
            <line x2="384" y1="-608" y2="-608" x1="320" />
        </blockdef>
        <block symbolname="FeedForward_MUX" name="XLXI_1">
            <blockpin signalname="FB0" name="r_fb0" />
            <blockpin signalname="FB1" name="r_fb1" />
            <blockpin signalname="FB2" name="r_fb2" />
            <blockpin signalname="FB3" name="r_fb3" />
            <blockpin signalname="OPA1(1:0)" name="opA(1:0)" />
            <blockpin signalname="OPD1(7:0)" name="opD(7:0)" />
            <blockpin signalname="FBR0(7:0)" name="r0(7:0)" />
            <blockpin signalname="FBR1(7:0)" name="r1(7:0)" />
            <blockpin signalname="FBR2(7:0)" name="r2(7:0)" />
            <blockpin signalname="FBR3(7:0)" name="r3(7:0)" />
            <blockpin signalname="OP1(7:0)" name="opD_out(7:0)" />
        </block>
        <block symbolname="FeedForward_MUX" name="XLXI_2">
            <blockpin signalname="FB0" name="r_fb0" />
            <blockpin signalname="FB1" name="r_fb1" />
            <blockpin signalname="FB2" name="r_fb2" />
            <blockpin signalname="FB3" name="r_fb3" />
            <blockpin signalname="OPA2(1:0)" name="opA(1:0)" />
            <blockpin signalname="OPD2(7:0)" name="opD(7:0)" />
            <blockpin signalname="FBR0(7:0)" name="r0(7:0)" />
            <blockpin signalname="FBR1(7:0)" name="r1(7:0)" />
            <blockpin signalname="FBR2(7:0)" name="r2(7:0)" />
            <blockpin signalname="FBR3(7:0)" name="r3(7:0)" />
            <blockpin signalname="OP2(7:0)" name="opD_out(7:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1328" y="1152" name="XLXI_1" orien="R0">
        </instance>
        <instance x="1328" y="1968" name="XLXI_2" orien="R0">
        </instance>
        <branch name="OP1(7:0)">
            <wire x2="2240" y1="544" y2="544" x1="1712" />
        </branch>
        <branch name="OP2(7:0)">
            <wire x2="2256" y1="1360" y2="1360" x1="1712" />
        </branch>
        <branch name="FB0">
            <wire x2="704" y1="544" y2="544" x1="352" />
            <wire x2="1328" y1="544" y2="544" x1="704" />
            <wire x2="704" y1="544" y2="1360" x1="704" />
            <wire x2="1328" y1="1360" y2="1360" x1="704" />
        </branch>
        <branch name="FB1">
            <wire x2="752" y1="608" y2="608" x1="352" />
            <wire x2="1328" y1="608" y2="608" x1="752" />
            <wire x2="752" y1="608" y2="1424" x1="752" />
            <wire x2="1328" y1="1424" y2="1424" x1="752" />
        </branch>
        <branch name="FB2">
            <wire x2="800" y1="672" y2="672" x1="352" />
            <wire x2="1328" y1="672" y2="672" x1="800" />
            <wire x2="800" y1="672" y2="1488" x1="800" />
            <wire x2="1328" y1="1488" y2="1488" x1="800" />
        </branch>
        <branch name="FB3">
            <wire x2="848" y1="736" y2="736" x1="352" />
            <wire x2="1328" y1="736" y2="736" x1="848" />
            <wire x2="848" y1="736" y2="1552" x1="848" />
            <wire x2="1328" y1="1552" y2="1552" x1="848" />
        </branch>
        <branch name="OPA1(1:0)">
            <wire x2="1312" y1="800" y2="800" x1="352" />
            <wire x2="1328" y1="800" y2="800" x1="1312" />
        </branch>
        <branch name="OPD1(7:0)">
            <wire x2="1328" y1="864" y2="864" x1="352" />
        </branch>
        <branch name="OPA2(1:0)">
            <wire x2="1328" y1="1616" y2="1616" x1="352" />
        </branch>
        <branch name="OPD2(7:0)">
            <wire x2="1328" y1="1680" y2="1680" x1="352" />
        </branch>
        <branch name="FBR0(7:0)">
            <wire x2="928" y1="1744" y2="1744" x1="352" />
            <wire x2="1328" y1="1744" y2="1744" x1="928" />
            <wire x2="1328" y1="928" y2="928" x1="928" />
            <wire x2="928" y1="928" y2="1744" x1="928" />
        </branch>
        <branch name="FBR1(7:0)">
            <wire x2="976" y1="1808" y2="1808" x1="352" />
            <wire x2="1328" y1="1808" y2="1808" x1="976" />
            <wire x2="1328" y1="992" y2="992" x1="976" />
            <wire x2="976" y1="992" y2="1808" x1="976" />
        </branch>
        <branch name="FBR2(7:0)">
            <wire x2="1040" y1="1872" y2="1872" x1="352" />
            <wire x2="1328" y1="1872" y2="1872" x1="1040" />
            <wire x2="1328" y1="1056" y2="1056" x1="1040" />
            <wire x2="1040" y1="1056" y2="1872" x1="1040" />
        </branch>
        <branch name="FBR3(7:0)">
            <wire x2="1104" y1="1936" y2="1936" x1="352" />
            <wire x2="1328" y1="1936" y2="1936" x1="1104" />
            <wire x2="1328" y1="1120" y2="1120" x1="1104" />
            <wire x2="1104" y1="1120" y2="1936" x1="1104" />
        </branch>
        <iomarker fontsize="28" x="352" y="544" name="FB0" orien="R180" />
        <iomarker fontsize="28" x="352" y="608" name="FB1" orien="R180" />
        <iomarker fontsize="28" x="352" y="672" name="FB2" orien="R180" />
        <iomarker fontsize="28" x="352" y="736" name="FB3" orien="R180" />
        <iomarker fontsize="28" x="352" y="864" name="OPD1(7:0)" orien="R180" />
        <iomarker fontsize="28" x="352" y="1616" name="OPA2(1:0)" orien="R180" />
        <iomarker fontsize="28" x="352" y="1680" name="OPD2(7:0)" orien="R180" />
        <iomarker fontsize="28" x="352" y="1808" name="FBR1(7:0)" orien="R180" />
        <iomarker fontsize="28" x="352" y="1744" name="FBR0(7:0)" orien="R180" />
        <iomarker fontsize="28" x="352" y="1872" name="FBR2(7:0)" orien="R180" />
        <iomarker fontsize="28" x="352" y="1936" name="FBR3(7:0)" orien="R180" />
        <iomarker fontsize="28" x="2240" y="544" name="OP1(7:0)" orien="R0" />
        <iomarker fontsize="28" x="2256" y="1360" name="OP2(7:0)" orien="R0" />
        <iomarker fontsize="28" x="352" y="800" name="OPA1(1:0)" orien="R180" />
    </sheet>
</drawing>