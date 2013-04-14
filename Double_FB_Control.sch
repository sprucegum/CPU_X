<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="FBR2(7:0)" />
        <signal name="FBR1(7:0)" />
        <signal name="FBR0(7:0)" />
        <signal name="FB0" />
        <signal name="FB1" />
        <signal name="FB2" />
        <signal name="FB3" />
        <signal name="FBR3(7:0)" />
        <signal name="OPA1(1:0)" />
        <signal name="OPD1(7:0)" />
        <signal name="OPA2(1:0)" />
        <signal name="OPD2(7:0)" />
        <signal name="OPA3(1:0)" />
        <signal name="OPD3(7:0)" />
        <signal name="OPA4(1:0)" />
        <signal name="OPD4(7:0)" />
        <signal name="OP1(7:0)" />
        <signal name="OP2(7:0)" />
        <signal name="OP3(7:0)" />
        <signal name="OP4(7:0)" />
        <signal name="RES(3:0)" />
        <port polarity="Input" name="FBR2(7:0)" />
        <port polarity="Input" name="FBR1(7:0)" />
        <port polarity="Input" name="FBR0(7:0)" />
        <port polarity="Input" name="FBR3(7:0)" />
        <port polarity="Input" name="OPA1(1:0)" />
        <port polarity="Input" name="OPD1(7:0)" />
        <port polarity="Input" name="OPA2(1:0)" />
        <port polarity="Input" name="OPD2(7:0)" />
        <port polarity="Input" name="OPA3(1:0)" />
        <port polarity="Input" name="OPD3(7:0)" />
        <port polarity="Input" name="OPA4(1:0)" />
        <port polarity="Input" name="OPD4(7:0)" />
        <port polarity="Output" name="OP1(7:0)" />
        <port polarity="Output" name="OP2(7:0)" />
        <port polarity="Output" name="OP3(7:0)" />
        <port polarity="Output" name="OP4(7:0)" />
        <port polarity="Input" name="RES(3:0)" />
        <blockdef name="FB_control">
            <timestamp>2013-4-8T11:11:53</timestamp>
            <rect width="256" x="64" y="-768" height="768" />
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
            <rect width="64" x="320" y="-748" height="24" />
            <line x2="384" y1="-736" y2="-736" x1="320" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="OneToFour">
            <timestamp>2013-4-11T18:52:46</timestamp>
            <rect width="256" x="64" y="-256" height="256" />
            <rect width="64" x="0" y="-236" height="24" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <block symbolname="FB_control" name="XLXI_1">
            <blockpin signalname="FB0" name="FB0" />
            <blockpin signalname="FB1" name="FB1" />
            <blockpin signalname="FB2" name="FB2" />
            <blockpin signalname="FB3" name="FB3" />
            <blockpin signalname="OPA1(1:0)" name="OPA1(1:0)" />
            <blockpin signalname="OPD1(7:0)" name="OPD1(7:0)" />
            <blockpin signalname="OPA2(1:0)" name="OPA2(1:0)" />
            <blockpin signalname="OPD2(7:0)" name="OPD2(7:0)" />
            <blockpin signalname="FBR0(7:0)" name="FBR0(7:0)" />
            <blockpin signalname="FBR1(7:0)" name="FBR1(7:0)" />
            <blockpin signalname="FBR2(7:0)" name="FBR2(7:0)" />
            <blockpin signalname="FBR3(7:0)" name="FBR3(7:0)" />
            <blockpin signalname="OP1(7:0)" name="OP1(7:0)" />
            <blockpin signalname="OP2(7:0)" name="OP2(7:0)" />
        </block>
        <block symbolname="FB_control" name="XLXI_2">
            <blockpin signalname="FB0" name="FB0" />
            <blockpin signalname="FB1" name="FB1" />
            <blockpin signalname="FB2" name="FB2" />
            <blockpin signalname="FB3" name="FB3" />
            <blockpin signalname="OPA3(1:0)" name="OPA1(1:0)" />
            <blockpin signalname="OPD3(7:0)" name="OPD1(7:0)" />
            <blockpin signalname="OPA4(1:0)" name="OPA2(1:0)" />
            <blockpin signalname="OPD4(7:0)" name="OPD2(7:0)" />
            <blockpin signalname="FBR0(7:0)" name="FBR0(7:0)" />
            <blockpin signalname="FBR1(7:0)" name="FBR1(7:0)" />
            <blockpin signalname="FBR2(7:0)" name="FBR2(7:0)" />
            <blockpin signalname="FBR3(7:0)" name="FBR3(7:0)" />
            <blockpin signalname="OP3(7:0)" name="OP1(7:0)" />
            <blockpin signalname="OP4(7:0)" name="OP2(7:0)" />
        </block>
        <block symbolname="OneToFour" name="XLXI_3">
            <blockpin signalname="RES(3:0)" name="resi(3:0)" />
            <blockpin signalname="FB0" name="r0" />
            <blockpin signalname="FB1" name="r1" />
            <blockpin signalname="FB2" name="r2" />
            <blockpin signalname="FB3" name="r3" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1488" y="1312" name="XLXI_1" orien="R0">
        </instance>
        <instance x="1472" y="2288" name="XLXI_2" orien="R0">
        </instance>
        <branch name="FBR2(7:0)">
            <wire x2="1072" y1="2192" y2="2192" x1="544" />
            <wire x2="1472" y1="2192" y2="2192" x1="1072" />
            <wire x2="1488" y1="1216" y2="1216" x1="1072" />
            <wire x2="1072" y1="1216" y2="2192" x1="1072" />
        </branch>
        <branch name="FBR1(7:0)">
            <wire x2="1008" y1="2128" y2="2128" x1="544" />
            <wire x2="1472" y1="2128" y2="2128" x1="1008" />
            <wire x2="1488" y1="1152" y2="1152" x1="1008" />
            <wire x2="1008" y1="1152" y2="2128" x1="1008" />
        </branch>
        <branch name="FBR0(7:0)">
            <wire x2="944" y1="2064" y2="2064" x1="544" />
            <wire x2="1472" y1="2064" y2="2064" x1="944" />
            <wire x2="1488" y1="1088" y2="1088" x1="944" />
            <wire x2="944" y1="1088" y2="2064" x1="944" />
        </branch>
        <branch name="FB0">
            <wire x2="688" y1="576" y2="576" x1="608" />
            <wire x2="1488" y1="576" y2="576" x1="688" />
            <wire x2="688" y1="576" y2="1552" x1="688" />
            <wire x2="1472" y1="1552" y2="1552" x1="688" />
        </branch>
        <branch name="FB1">
            <wire x2="752" y1="640" y2="640" x1="608" />
            <wire x2="1488" y1="640" y2="640" x1="752" />
            <wire x2="752" y1="640" y2="1616" x1="752" />
            <wire x2="1472" y1="1616" y2="1616" x1="752" />
        </branch>
        <branch name="FB2">
            <wire x2="816" y1="704" y2="704" x1="608" />
            <wire x2="1488" y1="704" y2="704" x1="816" />
            <wire x2="816" y1="704" y2="1680" x1="816" />
            <wire x2="1472" y1="1680" y2="1680" x1="816" />
        </branch>
        <branch name="FB3">
            <wire x2="880" y1="768" y2="768" x1="608" />
            <wire x2="1488" y1="768" y2="768" x1="880" />
            <wire x2="880" y1="768" y2="1744" x1="880" />
            <wire x2="1472" y1="1744" y2="1744" x1="880" />
        </branch>
        <branch name="FBR3(7:0)">
            <wire x2="1120" y1="2256" y2="2256" x1="544" />
            <wire x2="1136" y1="2256" y2="2256" x1="1120" />
            <wire x2="1472" y1="2256" y2="2256" x1="1136" />
            <wire x2="1488" y1="1280" y2="1280" x1="1136" />
            <wire x2="1136" y1="1280" y2="2256" x1="1136" />
        </branch>
        <branch name="OPA1(1:0)">
            <wire x2="1488" y1="832" y2="832" x1="544" />
        </branch>
        <branch name="OPD1(7:0)">
            <wire x2="1488" y1="896" y2="896" x1="544" />
        </branch>
        <branch name="OPA2(1:0)">
            <wire x2="1488" y1="960" y2="960" x1="544" />
        </branch>
        <branch name="OPD2(7:0)">
            <wire x2="1488" y1="1024" y2="1024" x1="544" />
        </branch>
        <branch name="OPA3(1:0)">
            <wire x2="1472" y1="1808" y2="1808" x1="560" />
        </branch>
        <branch name="OPD3(7:0)">
            <wire x2="1472" y1="1872" y2="1872" x1="560" />
        </branch>
        <branch name="OPA4(1:0)">
            <wire x2="1472" y1="1936" y2="1936" x1="560" />
        </branch>
        <branch name="OPD4(7:0)">
            <wire x2="1472" y1="2000" y2="2000" x1="544" />
        </branch>
        <branch name="OP1(7:0)">
            <wire x2="3248" y1="576" y2="576" x1="1872" />
        </branch>
        <branch name="OP2(7:0)">
            <wire x2="2016" y1="1280" y2="1280" x1="1872" />
            <wire x2="2016" y1="672" y2="1280" x1="2016" />
            <wire x2="3248" y1="672" y2="672" x1="2016" />
        </branch>
        <branch name="OP3(7:0)">
            <wire x2="3216" y1="1552" y2="1552" x1="1856" />
        </branch>
        <branch name="OP4(7:0)">
            <wire x2="1872" y1="2256" y2="2256" x1="1856" />
            <wire x2="2064" y1="2256" y2="2256" x1="1872" />
            <wire x2="2064" y1="1632" y2="2256" x1="2064" />
            <wire x2="3216" y1="1632" y2="1632" x1="2064" />
        </branch>
        <iomarker fontsize="28" x="544" y="832" name="OPA1(1:0)" orien="R180" />
        <iomarker fontsize="28" x="544" y="896" name="OPD1(7:0)" orien="R180" />
        <iomarker fontsize="28" x="544" y="960" name="OPA2(1:0)" orien="R180" />
        <iomarker fontsize="28" x="544" y="1024" name="OPD2(7:0)" orien="R180" />
        <iomarker fontsize="28" x="560" y="1808" name="OPA3(1:0)" orien="R180" />
        <iomarker fontsize="28" x="560" y="1872" name="OPD3(7:0)" orien="R180" />
        <iomarker fontsize="28" x="560" y="1936" name="OPA4(1:0)" orien="R180" />
        <iomarker fontsize="28" x="544" y="2000" name="OPD4(7:0)" orien="R180" />
        <iomarker fontsize="28" x="544" y="2064" name="FBR0(7:0)" orien="R180" />
        <iomarker fontsize="28" x="544" y="2128" name="FBR1(7:0)" orien="R180" />
        <iomarker fontsize="28" x="544" y="2192" name="FBR2(7:0)" orien="R180" />
        <iomarker fontsize="28" x="544" y="2256" name="FBR3(7:0)" orien="R180" />
        <iomarker fontsize="28" x="3248" y="672" name="OP2(7:0)" orien="R0" />
        <iomarker fontsize="28" x="3216" y="1552" name="OP3(7:0)" orien="R0" />
        <iomarker fontsize="28" x="3248" y="576" name="OP1(7:0)" orien="R0" />
        <iomarker fontsize="28" x="3216" y="1632" name="OP4(7:0)" orien="R0" />
        <instance x="224" y="800" name="XLXI_3" orien="R0">
        </instance>
        <branch name="RES(3:0)">
            <wire x2="224" y1="576" y2="576" x1="160" />
        </branch>
        <iomarker fontsize="28" x="160" y="576" name="RES(3:0)" orien="R180" />
    </sheet>
</drawing>