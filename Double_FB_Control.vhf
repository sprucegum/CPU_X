--------------------------------------------------------------------------------
-- Copyright (c) 1995-2012 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.4
--  \   \         Application : sch2hdl
--  /   /         Filename : Double_FB_Control.vhf
-- /___/   /\     Timestamp : 04/13/2013 22:59:00
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family spartan3e -flat -suppress -vhdl /home/jadel/fpga/CPU_X/Double_FB_Control.vhf -w /home/jadel/fpga/CPU_X/Double_FB_Control.sch
--Design Name: Double_FB_Control
--Device: spartan3e
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity FB_control_MUSER_Double_FB_Control is
   port ( FBR0 : in    std_logic_vector (7 downto 0); 
          FBR1 : in    std_logic_vector (7 downto 0); 
          FBR2 : in    std_logic_vector (7 downto 0); 
          FBR3 : in    std_logic_vector (7 downto 0); 
          FB0  : in    std_logic; 
          FB1  : in    std_logic; 
          FB2  : in    std_logic; 
          FB3  : in    std_logic; 
          OPA1 : in    std_logic_vector (1 downto 0); 
          OPA2 : in    std_logic_vector (1 downto 0); 
          OPD1 : in    std_logic_vector (7 downto 0); 
          OPD2 : in    std_logic_vector (7 downto 0); 
          OP1  : out   std_logic_vector (7 downto 0); 
          OP2  : out   std_logic_vector (7 downto 0));
end FB_control_MUSER_Double_FB_Control;

architecture BEHAVIORAL of FB_control_MUSER_Double_FB_Control is
   component FeedForward_MUX
      port ( r_fb0   : in    std_logic; 
             r_fb1   : in    std_logic; 
             r_fb2   : in    std_logic; 
             r_fb3   : in    std_logic; 
             opA     : in    std_logic_vector (1 downto 0); 
             opD     : in    std_logic_vector (7 downto 0); 
             r0      : in    std_logic_vector (7 downto 0); 
             r1      : in    std_logic_vector (7 downto 0); 
             r2      : in    std_logic_vector (7 downto 0); 
             r3      : in    std_logic_vector (7 downto 0); 
             opD_out : out   std_logic_vector (7 downto 0));
   end component;
   
begin
   XLXI_1 : FeedForward_MUX
      port map (opA(1 downto 0)=>OPA1(1 downto 0),
                opD(7 downto 0)=>OPD1(7 downto 0),
                r_fb0=>FB0,
                r_fb1=>FB1,
                r_fb2=>FB2,
                r_fb3=>FB3,
                r0(7 downto 0)=>FBR0(7 downto 0),
                r1(7 downto 0)=>FBR1(7 downto 0),
                r2(7 downto 0)=>FBR2(7 downto 0),
                r3(7 downto 0)=>FBR3(7 downto 0),
                opD_out(7 downto 0)=>OP1(7 downto 0));
   
   XLXI_2 : FeedForward_MUX
      port map (opA(1 downto 0)=>OPA2(1 downto 0),
                opD(7 downto 0)=>OPD2(7 downto 0),
                r_fb0=>FB0,
                r_fb1=>FB1,
                r_fb2=>FB2,
                r_fb3=>FB3,
                r0(7 downto 0)=>FBR0(7 downto 0),
                r1(7 downto 0)=>FBR1(7 downto 0),
                r2(7 downto 0)=>FBR2(7 downto 0),
                r3(7 downto 0)=>FBR3(7 downto 0),
                opD_out(7 downto 0)=>OP2(7 downto 0));
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity Double_FB_Control is
   port ( FBR0 : in    std_logic_vector (7 downto 0); 
          FBR1 : in    std_logic_vector (7 downto 0); 
          FBR2 : in    std_logic_vector (7 downto 0); 
          FBR3 : in    std_logic_vector (7 downto 0); 
          OPA1 : in    std_logic_vector (1 downto 0); 
          OPA2 : in    std_logic_vector (1 downto 0); 
          OPA3 : in    std_logic_vector (1 downto 0); 
          OPA4 : in    std_logic_vector (1 downto 0); 
          OPD1 : in    std_logic_vector (7 downto 0); 
          OPD2 : in    std_logic_vector (7 downto 0); 
          OPD3 : in    std_logic_vector (7 downto 0); 
          OPD4 : in    std_logic_vector (7 downto 0); 
          RES  : in    std_logic_vector (3 downto 0); 
          OP1  : out   std_logic_vector (7 downto 0); 
          OP2  : out   std_logic_vector (7 downto 0); 
          OP3  : out   std_logic_vector (7 downto 0); 
          OP4  : out   std_logic_vector (7 downto 0));
end Double_FB_Control;

architecture BEHAVIORAL of Double_FB_Control is
   signal FB0  : std_logic;
   signal FB1  : std_logic;
   signal FB2  : std_logic;
   signal FB3  : std_logic;
   component FB_control_MUSER_Double_FB_Control
      port ( FB0  : in    std_logic; 
             FB1  : in    std_logic; 
             FB2  : in    std_logic; 
             FB3  : in    std_logic; 
             OPA1 : in    std_logic_vector (1 downto 0); 
             OPD1 : in    std_logic_vector (7 downto 0); 
             OPA2 : in    std_logic_vector (1 downto 0); 
             OPD2 : in    std_logic_vector (7 downto 0); 
             FBR0 : in    std_logic_vector (7 downto 0); 
             FBR1 : in    std_logic_vector (7 downto 0); 
             FBR2 : in    std_logic_vector (7 downto 0); 
             FBR3 : in    std_logic_vector (7 downto 0); 
             OP1  : out   std_logic_vector (7 downto 0); 
             OP2  : out   std_logic_vector (7 downto 0));
   end component;
   
   component OneToFour
      port ( resi : in    std_logic_vector (3 downto 0); 
             r0   : out   std_logic; 
             r1   : out   std_logic; 
             r2   : out   std_logic; 
             r3   : out   std_logic);
   end component;
   
begin
   XLXI_1 : FB_control_MUSER_Double_FB_Control
      port map (FBR0(7 downto 0)=>FBR0(7 downto 0),
                FBR1(7 downto 0)=>FBR1(7 downto 0),
                FBR2(7 downto 0)=>FBR2(7 downto 0),
                FBR3(7 downto 0)=>FBR3(7 downto 0),
                FB0=>FB0,
                FB1=>FB1,
                FB2=>FB2,
                FB3=>FB3,
                OPA1(1 downto 0)=>OPA1(1 downto 0),
                OPA2(1 downto 0)=>OPA2(1 downto 0),
                OPD1(7 downto 0)=>OPD1(7 downto 0),
                OPD2(7 downto 0)=>OPD2(7 downto 0),
                OP1(7 downto 0)=>OP1(7 downto 0),
                OP2(7 downto 0)=>OP2(7 downto 0));
   
   XLXI_2 : FB_control_MUSER_Double_FB_Control
      port map (FBR0(7 downto 0)=>FBR0(7 downto 0),
                FBR1(7 downto 0)=>FBR1(7 downto 0),
                FBR2(7 downto 0)=>FBR2(7 downto 0),
                FBR3(7 downto 0)=>FBR3(7 downto 0),
                FB0=>FB0,
                FB1=>FB1,
                FB2=>FB2,
                FB3=>FB3,
                OPA1(1 downto 0)=>OPA3(1 downto 0),
                OPA2(1 downto 0)=>OPA4(1 downto 0),
                OPD1(7 downto 0)=>OPD3(7 downto 0),
                OPD2(7 downto 0)=>OPD4(7 downto 0),
                OP1(7 downto 0)=>OP3(7 downto 0),
                OP2(7 downto 0)=>OP4(7 downto 0));
   
   XLXI_3 : OneToFour
      port map (resi(3 downto 0)=>RES(3 downto 0),
                r0=>FB0,
                r1=>FB1,
                r2=>FB2,
                r3=>FB3);
   
end BEHAVIORAL;


