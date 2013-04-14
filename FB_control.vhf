--------------------------------------------------------------------------------
-- Copyright (c) 1995-2012 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.4
--  \   \         Application : sch2hdl
--  /   /         Filename : FB_control.vhf
-- /___/   /\     Timestamp : 04/13/2013 22:59:01
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family spartan3e -flat -suppress -vhdl /home/jadel/fpga/CPU_X/FB_control.vhf -w /home/jadel/fpga/CPU_X/FB_control.sch
--Design Name: FB_control
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

entity FB_control is
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
end FB_control;

architecture BEHAVIORAL of FB_control is
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


