--------------------------------------------------------------------------------
-- Copyright (c) 1995-2012 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.4
--  \   \         Application : sch2hdl
--  /   /         Filename : CPU.vhf
-- /___/   /\     Timestamp : 04/13/2013 22:59:00
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family spartan3e -flat -suppress -vhdl /home/jadel/fpga/CPU_X/CPU.vhf -w /home/jadel/fpga/CPU_X/CPU.sch
--Design Name: CPU
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

entity FB_control_MUSER_CPU is
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
end FB_control_MUSER_CPU;

architecture BEHAVIORAL of FB_control_MUSER_CPU is
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

entity Double_FB_Control_MUSER_CPU is
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
end Double_FB_Control_MUSER_CPU;

architecture BEHAVIORAL of Double_FB_Control_MUSER_CPU is
   signal FB0  : std_logic;
   signal FB1  : std_logic;
   signal FB2  : std_logic;
   signal FB3  : std_logic;
   component FB_control_MUSER_CPU
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
   XLXI_1 : FB_control_MUSER_CPU
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
   
   XLXI_2 : FB_control_MUSER_CPU
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



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity CPU is
   port ( CLK      : in    std_logic; 
          IN_PORT  : in    std_logic_vector (7 downto 0); 
          RESET    : in    std_logic; 
          OUT_PORT : out   std_logic_vector (7 downto 0));
end CPU;

architecture BEHAVIORAL of CPU is
   attribute BOX_TYPE   : string ;
   signal XLXN_454                      : std_logic_vector (6 downto 0);
   signal XLXN_455                      : std_logic_vector (7 downto 0);
   signal XLXN_456                      : std_logic_vector (7 downto 0);
   signal XLXN_457                      : std_logic_vector (6 downto 0);
   signal XLXN_458                      : std_logic_vector (6 downto 0);
   signal XLXN_459                      : std_logic_vector (6 downto 0);
   signal XLXN_461                      : std_logic_vector (6 downto 0);
   signal XLXN_462                      : std_logic_vector (7 downto 0);
   signal XLXN_463                      : std_logic_vector (7 downto 0);
   signal XLXN_464                      : std_logic_vector (7 downto 0);
   signal XLXN_465                      : std_logic;
   signal XLXN_466                      : std_logic;
   signal XLXN_467                      : std_logic_vector (7 downto 0);
   signal XLXN_468                      : std_logic_vector (7 downto 0);
   signal XLXN_469                      : std_logic_vector (3 downto 0);
   signal XLXN_471                      : std_logic;
   signal XLXN_472                      : std_logic_vector (3 downto 0);
   signal XLXN_473                      : std_logic_vector (1 downto 0);
   signal XLXN_474                      : std_logic_vector (1 downto 0);
   signal XLXN_475                      : std_logic_vector (1 downto 0);
   signal XLXN_476                      : std_logic_vector (1 downto 0);
   signal XLXN_478                      : std_logic_vector (6 downto 0);
   signal XLXN_481                      : std_logic_vector (7 downto 0);
   signal XLXN_484                      : std_logic;
   signal XLXN_485                      : std_logic;
   signal XLXN_486                      : std_logic_vector (3 downto 0);
   signal XLXN_487                      : std_logic_vector (7 downto 0);
   signal XLXN_488                      : std_logic_vector (7 downto 0);
   signal XLXN_489                      : std_logic_vector (7 downto 0);
   signal XLXN_490                      : std_logic_vector (3 downto 0);
   signal XLXN_495                      : std_logic_vector (7 downto 0);
   signal XLXN_496                      : std_logic_vector (7 downto 0);
   signal XLXN_498                      : std_logic_vector (6 downto 0);
   signal XLXN_499                      : std_logic;
   signal XLXN_500                      : std_logic_vector (1 downto 0);
   signal XLXN_501                      : std_logic_vector (7 downto 0);
   signal XLXN_502                      : std_logic_vector (1 downto 0);
   signal XLXN_503                      : std_logic;
   signal XLXN_504                      : std_logic_vector (7 downto 0);
   signal XLXN_505                      : std_logic_vector (7 downto 0);
   signal XLXN_506                      : std_logic_vector (7 downto 0);
   signal XLXN_507                      : std_logic_vector (7 downto 0);
   signal XLXN_508                      : std_logic_vector (7 downto 0);
   signal XLXN_510                      : std_logic_vector (3 downto 0);
   signal XLXN_511                      : std_logic;
   signal XLXN_512                      : std_logic;
   signal XLXN_513                      : std_logic;
   signal XLXN_514                      : std_logic;
   signal XLXN_515                      : std_logic;
   signal XLXN_516                      : std_logic;
   signal XLXN_518                      : std_logic_vector (1 downto 0);
   signal XLXN_519                      : std_logic;
   signal XLXN_520                      : std_logic_vector (6 downto 0);
   signal XLXN_521                      : std_logic_vector (7 downto 0);
   signal XLXN_522                      : std_logic_vector (3 downto 0);
   signal XLXN_523                      : std_logic;
   signal XLXN_524                      : std_logic_vector (1 downto 0);
   signal XLXN_525                      : std_logic_vector (7 downto 0);
   signal XLXN_526                      : std_logic_vector (1 downto 0);
   signal XLXN_527                      : std_logic;
   signal XLXN_528                      : std_logic_vector (3 downto 0);
   signal XLXN_529                      : std_logic_vector (1 downto 0);
   signal XLXN_530                      : std_logic_vector (1 downto 0);
   signal XLXN_531                      : std_logic_vector (7 downto 0);
   signal XLXN_532                      : std_logic;
   signal XLXN_533                      : std_logic_vector (7 downto 0);
   signal XLXN_534                      : std_logic_vector (7 downto 0);
   signal XLXN_535                      : std_logic_vector (7 downto 0);
   signal XLXN_536                      : std_logic;
   signal XLXN_537                      : std_logic_vector (6 downto 0);
   signal XLXN_538                      : std_logic_vector (1 downto 0);
   signal XLXN_540                      : std_logic_vector (7 downto 0);
   signal XLXN_542                      : std_logic_vector (7 downto 0);
   signal XLXN_544                      : std_logic_vector (1 downto 0);
   signal XLXN_545                      : std_logic_vector (3 downto 0);
   signal XLXN_546                      : std_logic_vector (7 downto 0);
   signal XLXN_547                      : std_logic_vector (7 downto 0);
   signal XLXN_548                      : std_logic;
   signal XLXN_549                      : std_logic;
   signal XLXN_550                      : std_logic;
   signal XLXN_552                      : std_logic_vector (1 downto 0);
   signal XLXN_553                      : std_logic;
   signal XLXN_554                      : std_logic;
   signal XLXN_555                      : std_logic_vector (7 downto 0);
   signal XLXN_556                      : std_logic_vector (7 downto 0);
   signal XLXN_557                      : std_logic_vector (1 downto 0);
   signal XLXN_581                      : std_logic;
   signal XLXN_599                      : std_logic;
   signal XLXI_76_resi_openSignal       : std_logic_vector (3 downto 0);
   signal XLXI_82_resi_openSignal       : std_logic_vector (3 downto 0);
   signal XLXI_83_in_port_openSignal    : std_logic_vector (7 downto 0);
   signal XLXI_85_RBA_in_openSignal     : std_logic_vector (1 downto 0);
   signal XLXI_86_MEM_WBA_in_openSignal : std_logic_vector (6 downto 0);
   signal XLXI_86_MEM_WBE_in_openSignal : std_logic;
   signal XLXI_86_RBA_in_openSignal     : std_logic_vector (1 downto 0);
   signal XLXI_86_resi_openSignal       : std_logic_vector (3 downto 0);
   component Memory
      port ( clk       : in    std_logic; 
             wr_enable : in    std_logic; 
             MAr       : in    std_logic_vector (6 downto 0); 
             MAw       : in    std_logic_vector (6 downto 0); 
             MDw       : in    std_logic_vector (7 downto 0); 
             MDr       : out   std_logic_vector (7 downto 0); 
             MDr_next  : out   std_logic_vector (7 downto 0));
   end component;
   
   component MemQ_Control
      port ( clk     : in    std_logic; 
             rst     : in    std_logic; 
             PC_in   : in    std_logic_vector (6 downto 0); 
             M_in1   : in    std_logic_vector (7 downto 0); 
             M_in2   : in    std_logic_vector (7 downto 0); 
             dq_en   : out   std_logic; 
             M_addr  : out   std_logic_vector (6 downto 0); 
             inst_o1 : out   std_logic_vector (7 downto 0); 
             inst_o2 : out   std_logic_vector (7 downto 0); 
             data_o  : out   std_logic_vector (7 downto 0); 
             PC_next : out   std_logic_vector (6 downto 0); 
             IQ_Full : in    std_logic);
   end component;
   
   component Instruction_Queue
      port ( clk        : in    std_logic; 
             queue_full : out   std_logic; 
             out_B0     : out   std_logic_vector (7 downto 0); 
             out_B1     : out   std_logic_vector (7 downto 0); 
             reso       : out   std_logic_vector (3 downto 0); 
             rst        : in    std_logic; 
             in_B0      : in    std_logic_vector (7 downto 0); 
             in_B1      : in    std_logic_vector (7 downto 0));
   end component;
   
   component F_D
      port ( clk          : in    std_logic; 
             rst          : in    std_logic; 
             IR_IN        : in    std_logic_vector (7 downto 0); 
             resi         : in    std_logic_vector (3 downto 0); 
             WBE          : out   std_logic; 
             MEM_WBE      : out   std_logic; 
             data_req     : out   std_logic; 
             OP_CODE      : out   std_logic_vector (3 downto 0); 
             RA_A         : out   std_logic_vector (1 downto 0); 
             WBA          : out   std_logic_vector (1 downto 0); 
             RB_A         : out   std_logic_vector (1 downto 0); 
             l_format_sel : out   std_logic_vector (1 downto 0); 
             reso         : out   std_logic_vector (3 downto 0));
   end component;
   
   component register_file
      port ( rst        : in    std_logic; 
             clk        : in    std_logic; 
             wr_enable  : in    std_logic; 
             rd_index1  : in    std_logic_vector (1 downto 0); 
             rd_index2  : in    std_logic_vector (1 downto 0); 
             wr_index   : in    std_logic_vector (1 downto 0); 
             wr_data    : in    std_logic_vector (7 downto 0); 
             rd_data1   : out   std_logic_vector (7 downto 0); 
             rd_data2   : out   std_logic_vector (7 downto 0); 
             wr_enable2 : in    std_logic; 
             wr_index2  : in    std_logic_vector (1 downto 0); 
             wr_data2   : in    std_logic_vector (7 downto 0));
   end component;
   
   component L_FORMAT_MUX
      port ( data1_in        : in    std_logic_vector (7 downto 0); 
             data2_in        : in    std_logic_vector (7 downto 0); 
             data_out        : out   std_logic_vector (7 downto 0); 
             l_format_select : in    std_logic_vector (1 downto 0); 
             wba_out         : out   std_logic_vector (6 downto 0));
   end component;
   
   component D_E
      port ( WBE_in    : in    std_logic; 
             M_WBE_in  : in    std_logic; 
             clk       : in    std_logic; 
             rst       : in    std_logic; 
             OP_IN     : in    std_logic_vector (3 downto 0); 
             Ra_in     : in    std_logic_vector (7 downto 0); 
             Rb_in     : in    std_logic_vector (7 downto 0); 
             WBA_in    : in    std_logic_vector (1 downto 0); 
             M_WBA_in  : in    std_logic_vector (6 downto 0); 
             resi      : in    std_logic_vector (3 downto 0); 
             WBE_out   : out   std_logic; 
             M_WBE_out : out   std_logic; 
             OP_OUT    : out   std_logic_vector (3 downto 0); 
             Ra_out    : out   std_logic_vector (7 downto 0); 
             Rb_out    : out   std_logic_vector (7 downto 0); 
             WBA_out   : out   std_logic_vector (1 downto 0); 
             M_WBA_out : out   std_logic_vector (6 downto 0); 
             reso      : out   std_logic_vector (3 downto 0); 
             RBA_in    : in    std_logic_vector (1 downto 0); 
             RBA_out   : out   std_logic_vector (1 downto 0));
   end component;
   
   component alu
      port ( rst       : in    std_logic; 
             clk       : in    std_logic; 
             in1       : in    std_logic_vector (7 downto 0); 
             in2       : in    std_logic_vector (7 downto 0); 
             alu_mode  : in    std_logic_vector (3 downto 0); 
             in_port   : in    std_logic_vector (7 downto 0); 
             z_flag    : out   std_logic; 
             n_flag    : out   std_logic; 
             result    : out   std_logic_vector (7 downto 0); 
             out_port  : out   std_logic_vector (7 downto 0); 
             nz_change : out   std_logic);
   end component;
   
   component E_M
      port ( WBE_in      : in    std_logic; 
             MEM_WBE_in  : in    std_logic; 
             clk         : in    std_logic; 
             Result_in   : in    std_logic_vector (7 downto 0); 
             WBA_in      : in    std_logic_vector (1 downto 0); 
             WBE_out     : out   std_logic; 
             MEM_WBE_out : out   std_logic; 
             Result_out  : out   std_logic_vector (7 downto 0); 
             WBA_out     : out   std_logic_vector (1 downto 0); 
             MEM_WBA_out : out   std_logic_vector (6 downto 0); 
             RBA_in      : in    std_logic_vector (1 downto 0); 
             resi        : in    std_logic_vector (3 downto 0); 
             RBA_out     : out   std_logic_vector (1 downto 0); 
             reso        : out   std_logic_vector (3 downto 0); 
             MEM_WBA_in  : in    std_logic_vector (6 downto 0));
   end component;
   
   component Double_FB_Control_MUSER_CPU
      port ( FBR2 : in    std_logic_vector (7 downto 0); 
             FBR1 : in    std_logic_vector (7 downto 0); 
             FBR0 : in    std_logic_vector (7 downto 0); 
             FBR3 : in    std_logic_vector (7 downto 0); 
             OP1  : out   std_logic_vector (7 downto 0); 
             OP2  : out   std_logic_vector (7 downto 0); 
             OPA1 : in    std_logic_vector (1 downto 0); 
             OPD1 : in    std_logic_vector (7 downto 0); 
             OPA2 : in    std_logic_vector (1 downto 0); 
             OPD2 : in    std_logic_vector (7 downto 0); 
             OPA3 : in    std_logic_vector (1 downto 0); 
             OPD3 : in    std_logic_vector (7 downto 0); 
             OPA4 : in    std_logic_vector (1 downto 0); 
             OPD4 : in    std_logic_vector (7 downto 0); 
             RES  : in    std_logic_vector (3 downto 0); 
             OP3  : out   std_logic_vector (7 downto 0); 
             OP4  : out   std_logic_vector (7 downto 0));
   end component;
   
   component Data_Queue
      port ( clk        : in    std_logic; 
             rst        : in    std_logic; 
             drq_1      : in    std_logic; 
             drq_2      : in    std_logic; 
             data_write : in    std_logic; 
             data_in    : in    std_logic_vector (7 downto 0); 
             queue_full : out   std_logic; 
             out_1      : out   std_logic_vector (7 downto 0); 
             out_2      : out   std_logic_vector (7 downto 0));
   end component;
   
   component NZ_Flag_File
      port ( N1        : in    std_logic; 
             Z1        : in    std_logic; 
             ALU1_chng : in    std_logic; 
             N2        : in    std_logic; 
             Z2        : in    std_logic; 
             ALU2_chng : in    std_logic; 
             clk       : in    std_logic; 
             rst       : in    std_logic; 
             N         : out   std_logic; 
             Z         : out   std_logic);
   end component;
   
   component Branch_Controller
      port ( N         : in    std_logic; 
             Z         : in    std_logic; 
             OPCODE    : in    std_logic_vector (3 downto 0); 
             BRX       : in    std_logic_vector (1 downto 0); 
             LR_ENABLE : out   std_logic; 
             RESET_D_E : out   std_logic; 
             PC_MUX    : out   std_logic_vector (1 downto 0));
   end component;
   
   component PC
      port ( rst    : in    std_logic; 
             clk    : in    std_logic; 
             PC_IN  : in    std_logic_vector (6 downto 0); 
             PC_OUT : out   std_logic_vector (6 downto 0));
   end component;
   
   component PC_MUX
      port ( RB_IN     : in    std_logic_vector (7 downto 0); 
             LR_IN     : in    std_logic_vector (6 downto 0); 
             PC_PLUS   : in    std_logic_vector (6 downto 0); 
             PC_SELECT : in    std_logic_vector (1 downto 0); 
             PC_OUT    : out   std_logic_vector (6 downto 0));
   end component;
   
   component LR
      port ( enable    : in    std_logic; 
             clk       : in    std_logic; 
             rst       : in    std_logic; 
             PC_INPUT  : in    std_logic_vector (6 downto 0); 
             PC_OUTPUT : out   std_logic_vector (6 downto 0));
   end component;
   
   component Reg_WB_File
      port ( WBE1  : in    std_logic; 
             WBE2  : in    std_logic; 
             clk   : in    std_logic; 
             rst   : in    std_logic; 
             WB_D1 : in    std_logic_vector (7 downto 0); 
             WB_A1 : in    std_logic_vector (1 downto 0); 
             WB_D2 : in    std_logic_vector (7 downto 0); 
             WB_A2 : in    std_logic_vector (1 downto 0); 
             r0    : out   std_logic_vector (7 downto 0); 
             r1    : out   std_logic_vector (7 downto 0); 
             r2    : out   std_logic_vector (7 downto 0); 
             r3    : out   std_logic_vector (7 downto 0));
   end component;
   
   component OR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR2 : component is "BLACK_BOX";
   
begin
   XLXI_71 : Memory
      port map (clk=>CLK,
                MAr(6 downto 0)=>XLXN_454(6 downto 0),
                MAw(6 downto 0)=>XLXN_520(6 downto 0),
                MDw(7 downto 0)=>XLXN_521(7 downto 0),
                wr_enable=>XLXN_519,
                MDr(7 downto 0)=>XLXN_455(7 downto 0),
                MDr_next(7 downto 0)=>XLXN_456(7 downto 0));
   
   XLXI_72 : MemQ_Control
      port map (clk=>CLK,
                IQ_Full=>XLXN_466,
                M_in1(7 downto 0)=>XLXN_455(7 downto 0),
                M_in2(7 downto 0)=>XLXN_456(7 downto 0),
                PC_in(6 downto 0)=>XLXN_457(6 downto 0),
                rst=>XLXN_599,
                data_o(7 downto 0)=>XLXN_464(7 downto 0),
                dq_en=>XLXN_465,
                inst_o1(7 downto 0)=>XLXN_462(7 downto 0),
                inst_o2(7 downto 0)=>XLXN_463(7 downto 0),
                M_addr(6 downto 0)=>XLXN_454(6 downto 0),
                PC_next(6 downto 0)=>XLXN_459(6 downto 0));
   
   XLXI_74 : Instruction_Queue
      port map (clk=>CLK,
                in_B0(7 downto 0)=>XLXN_462(7 downto 0),
                in_B1(7 downto 0)=>XLXN_463(7 downto 0),
                rst=>XLXN_599,
                out_B0(7 downto 0)=>XLXN_467(7 downto 0),
                out_B1(7 downto 0)=>XLXN_468(7 downto 0),
                queue_full=>XLXN_466,
                reso(3 downto 0)=>XLXN_469(3 downto 0));
   
   XLXI_75 : F_D
      port map (clk=>CLK,
                IR_IN(7 downto 0)=>XLXN_467(7 downto 0),
                resi(3 downto 0)=>XLXN_469(3 downto 0),
                rst=>XLXN_599,
                data_req=>XLXN_485,
                l_format_sel(1 downto 0)=>XLXN_476(1 downto 0),
                MEM_WBE=>XLXN_484,
                OP_CODE(3 downto 0)=>XLXN_472(3 downto 0),
                RA_A(1 downto 0)=>XLXN_473(1 downto 0),
                RB_A(1 downto 0)=>XLXN_474(1 downto 0),
                reso(3 downto 0)=>XLXN_486(3 downto 0),
                WBA(1 downto 0)=>XLXN_475(1 downto 0),
                WBE=>XLXN_471);
   
   XLXI_76 : F_D
      port map (clk=>CLK,
                IR_IN(7 downto 0)=>XLXN_468(7 downto 0),
                resi(3 downto 0)=>XLXI_76_resi_openSignal(3 downto 0),
                rst=>XLXN_599,
                data_req=>XLXN_532,
                l_format_sel(1 downto 0)=>XLXN_526(1 downto 0),
                MEM_WBE=>XLXN_536,
                OP_CODE(3 downto 0)=>XLXN_528(3 downto 0),
                RA_A(1 downto 0)=>XLXN_529(1 downto 0),
                RB_A(1 downto 0)=>XLXN_530(1 downto 0),
                reso=>open,
                WBA(1 downto 0)=>XLXN_538(1 downto 0),
                WBE=>XLXN_527);
   
   XLXI_77 : register_file
      port map (clk=>CLK,
                rd_index1(1 downto 0)=>XLXN_473(1 downto 0),
                rd_index2(1 downto 0)=>XLXN_474(1 downto 0),
                rst=>RESET,
                wr_data(7 downto 0)=>XLXN_521(7 downto 0),
                wr_data2(7 downto 0)=>XLXN_556(7 downto 0),
                wr_enable=>XLXN_516,
                wr_enable2=>XLXN_554,
                wr_index(1 downto 0)=>XLXN_518(1 downto 0),
                wr_index2(1 downto 0)=>XLXN_557(1 downto 0),
                rd_data1(7 downto 0)=>XLXN_487(7 downto 0),
                rd_data2(7 downto 0)=>XLXN_489(7 downto 0));
   
   XLXI_78 : register_file
      port map (clk=>CLK,
                rd_index1(1 downto 0)=>XLXN_529(1 downto 0),
                rd_index2(1 downto 0)=>XLXN_530(1 downto 0),
                rst=>RESET,
                wr_data(7 downto 0)=>XLXN_521(7 downto 0),
                wr_data2(7 downto 0)=>XLXN_556(7 downto 0),
                wr_enable=>XLXN_516,
                wr_enable2=>XLXN_554,
                wr_index(1 downto 0)=>XLXN_518(1 downto 0),
                wr_index2(1 downto 0)=>XLXN_557(1 downto 0),
                rd_data1(7 downto 0)=>XLXN_531(7 downto 0),
                rd_data2(7 downto 0)=>XLXN_535(7 downto 0));
   
   XLXI_79 : L_FORMAT_MUX
      port map (data1_in(7 downto 0)=>XLXN_531(7 downto 0),
                data2_in(7 downto 0)=>XLXN_533(7 downto 0),
                l_format_select(1 downto 0)=>XLXN_526(1 downto 0),
                data_out(7 downto 0)=>XLXN_534(7 downto 0),
                wba_out(6 downto 0)=>XLXN_537(6 downto 0));
   
   XLXI_80 : L_FORMAT_MUX
      port map (data1_in(7 downto 0)=>XLXN_487(7 downto 0),
                data2_in(7 downto 0)=>XLXN_488(7 downto 0),
                l_format_select(1 downto 0)=>XLXN_476(1 downto 0),
                data_out(7 downto 0)=>XLXN_481(7 downto 0),
                wba_out(6 downto 0)=>XLXN_478(6 downto 0));
   
   XLXI_81 : D_E
      port map (clk=>CLK,
                M_WBA_in(6 downto 0)=>XLXN_478(6 downto 0),
                M_WBE_in=>XLXN_484,
                OP_IN(3 downto 0)=>XLXN_472(3 downto 0),
                Ra_in(7 downto 0)=>XLXN_481(7 downto 0),
                RBA_in(1 downto 0)=>XLXN_474(1 downto 0),
                Rb_in(7 downto 0)=>XLXN_489(7 downto 0),
                resi(3 downto 0)=>XLXN_486(3 downto 0),
                rst=>XLXN_599,
                WBA_in(1 downto 0)=>XLXN_475(1 downto 0),
                WBE_in=>XLXN_471,
                M_WBA_out(6 downto 0)=>XLXN_498(6 downto 0),
                M_WBE_out=>XLXN_499,
                OP_OUT(3 downto 0)=>XLXN_510(3 downto 0),
                Ra_out(7 downto 0)=>XLXN_495(7 downto 0),
                RBA_out(1 downto 0)=>XLXN_500(1 downto 0),
                Rb_out(7 downto 0)=>XLXN_496(7 downto 0),
                reso(3 downto 0)=>XLXN_490(3 downto 0),
                WBA_out(1 downto 0)=>XLXN_502(1 downto 0),
                WBE_out=>XLXN_503);
   
   XLXI_82 : D_E
      port map (clk=>CLK,
                M_WBA_in(6 downto 0)=>XLXN_537(6 downto 0),
                M_WBE_in=>XLXN_536,
                OP_IN(3 downto 0)=>XLXN_528(3 downto 0),
                Ra_in(7 downto 0)=>XLXN_534(7 downto 0),
                RBA_in(1 downto 0)=>XLXN_530(1 downto 0),
                Rb_in(7 downto 0)=>XLXN_535(7 downto 0),
                resi(3 downto 0)=>XLXI_82_resi_openSignal(3 downto 0),
                rst=>XLXN_599,
                WBA_in(1 downto 0)=>XLXN_538(1 downto 0),
                WBE_in=>XLXN_527,
                M_WBA_out=>open,
                M_WBE_out=>open,
                OP_OUT(3 downto 0)=>XLXN_545(3 downto 0),
                Ra_out(7 downto 0)=>XLXN_540(7 downto 0),
                RBA_out(1 downto 0)=>XLXN_544(1 downto 0),
                Rb_out(7 downto 0)=>XLXN_542(7 downto 0),
                reso=>open,
                WBA_out(1 downto 0)=>XLXN_552(1 downto 0),
                WBE_out=>XLXN_553);
   
   XLXI_83 : alu
      port map (alu_mode(3 downto 0)=>XLXN_545(3 downto 0),
                clk=>CLK,
                in_port(7 downto 0)=>XLXI_83_in_port_openSignal(7 downto 0),
                in1(7 downto 0)=>XLXN_546(7 downto 0),
                in2(7 downto 0)=>XLXN_547(7 downto 0),
                rst=>RESET,
                nz_change=>XLXN_550,
                n_flag=>XLXN_549,
                out_port=>open,
                result(7 downto 0)=>XLXN_555(7 downto 0),
                z_flag=>XLXN_548);
   
   XLXI_84 : alu
      port map (alu_mode(3 downto 0)=>XLXN_510(3 downto 0),
                clk=>CLK,
                in_port(7 downto 0)=>IN_PORT(7 downto 0),
                in1(7 downto 0)=>XLXN_508(7 downto 0),
                in2(7 downto 0)=>XLXN_525(7 downto 0),
                rst=>RESET,
                nz_change=>XLXN_513,
                n_flag=>XLXN_512,
                out_port(7 downto 0)=>OUT_PORT(7 downto 0),
                result(7 downto 0)=>XLXN_501(7 downto 0),
                z_flag=>XLXN_511);
   
   XLXI_85 : E_M
      port map (clk=>CLK,
                MEM_WBA_in(6 downto 0)=>XLXN_498(6 downto 0),
                MEM_WBE_in=>XLXN_499,
                RBA_in(1 downto 0)=>XLXI_85_RBA_in_openSignal(1 downto 0),
                resi(3 downto 0)=>XLXN_490(3 downto 0),
                Result_in(7 downto 0)=>XLXN_501(7 downto 0),
                WBA_in(1 downto 0)=>XLXN_502(1 downto 0),
                WBE_in=>XLXN_503,
                MEM_WBA_out(6 downto 0)=>XLXN_520(6 downto 0),
                MEM_WBE_out=>XLXN_519,
                RBA_out=>open,
                reso(3 downto 0)=>XLXN_522(3 downto 0),
                Result_out(7 downto 0)=>XLXN_521(7 downto 0),
                WBA_out(1 downto 0)=>XLXN_518(1 downto 0),
                WBE_out=>XLXN_516);
   
   XLXI_86 : E_M
      port map (clk=>CLK,
                MEM_WBA_in(6 downto 0)=>XLXI_86_MEM_WBA_in_openSignal(6 downto 
            0),
                MEM_WBE_in=>XLXI_86_MEM_WBE_in_openSignal,
                RBA_in(1 downto 0)=>XLXI_86_RBA_in_openSignal(1 downto 0),
                resi(3 downto 0)=>XLXI_86_resi_openSignal(3 downto 0),
                Result_in(7 downto 0)=>XLXN_555(7 downto 0),
                WBA_in(1 downto 0)=>XLXN_552(1 downto 0),
                WBE_in=>XLXN_553,
                MEM_WBA_out=>open,
                MEM_WBE_out=>open,
                RBA_out=>open,
                reso=>open,
                Result_out(7 downto 0)=>XLXN_556(7 downto 0),
                WBA_out(1 downto 0)=>XLXN_557(1 downto 0),
                WBE_out=>XLXN_554);
   
   XLXI_87 : Double_FB_Control_MUSER_CPU
      port map (FBR0(7 downto 0)=>XLXN_504(7 downto 0),
                FBR1(7 downto 0)=>XLXN_505(7 downto 0),
                FBR2(7 downto 0)=>XLXN_506(7 downto 0),
                FBR3(7 downto 0)=>XLXN_507(7 downto 0),
                OPA1(1 downto 0)=>XLXN_502(1 downto 0),
                OPA2(1 downto 0)=>XLXN_500(1 downto 0),
                OPA3(1 downto 0)=>XLXN_552(1 downto 0),
                OPA4(1 downto 0)=>XLXN_544(1 downto 0),
                OPD1(7 downto 0)=>XLXN_495(7 downto 0),
                OPD2(7 downto 0)=>XLXN_496(7 downto 0),
                OPD3(7 downto 0)=>XLXN_540(7 downto 0),
                OPD4(7 downto 0)=>XLXN_542(7 downto 0),
                RES(3 downto 0)=>XLXN_522(3 downto 0),
                OP1(7 downto 0)=>XLXN_508(7 downto 0),
                OP2(7 downto 0)=>XLXN_525(7 downto 0),
                OP3(7 downto 0)=>XLXN_546(7 downto 0),
                OP4(7 downto 0)=>XLXN_547(7 downto 0));
   
   XLXI_127 : Data_Queue
      port map (clk=>CLK,
                data_in(7 downto 0)=>XLXN_464(7 downto 0),
                data_write=>XLXN_465,
                drq_1=>XLXN_485,
                drq_2=>XLXN_532,
                rst=>XLXN_599,
                out_1(7 downto 0)=>XLXN_488(7 downto 0),
                out_2(7 downto 0)=>XLXN_533(7 downto 0),
                queue_full=>open);
   
   XLXI_128 : NZ_Flag_File
      port map (ALU1_chng=>XLXN_513,
                ALU2_chng=>XLXN_550,
                clk=>CLK,
                N1=>XLXN_512,
                N2=>XLXN_549,
                rst=>RESET,
                Z1=>XLXN_511,
                Z2=>XLXN_548,
                N=>XLXN_514,
                Z=>XLXN_515);
   
   XLXI_151 : Branch_Controller
      port map (BRX(1 downto 0)=>XLXN_502(1 downto 0),
                N=>XLXN_514,
                OPCODE(3 downto 0)=>XLXN_510(3 downto 0),
                Z=>XLXN_515,
                LR_ENABLE=>XLXN_523,
                PC_MUX(1 downto 0)=>XLXN_524(1 downto 0),
                RESET_D_E=>XLXN_581);
   
   XLXI_152 : PC
      port map (clk=>CLK,
                PC_IN(6 downto 0)=>XLXN_458(6 downto 0),
                rst=>RESET,
                PC_OUT(6 downto 0)=>XLXN_457(6 downto 0));
   
   XLXI_153 : PC_MUX
      port map (LR_IN(6 downto 0)=>XLXN_461(6 downto 0),
                PC_PLUS(6 downto 0)=>XLXN_459(6 downto 0),
                PC_SELECT(1 downto 0)=>XLXN_524(1 downto 0),
                RB_IN(7 downto 0)=>XLXN_525(7 downto 0),
                PC_OUT(6 downto 0)=>XLXN_458(6 downto 0));
   
   XLXI_154 : LR
      port map (clk=>CLK,
                enable=>XLXN_523,
                PC_INPUT(6 downto 0)=>XLXN_457(6 downto 0),
                rst=>RESET,
                PC_OUTPUT(6 downto 0)=>XLXN_461(6 downto 0));
   
   XLXI_156 : Reg_WB_File
      port map (clk=>CLK,
                rst=>XLXN_599,
                WBE1=>XLXN_503,
                WBE2=>XLXN_553,
                WB_A1(1 downto 0)=>XLXN_502(1 downto 0),
                WB_A2(1 downto 0)=>XLXN_552(1 downto 0),
                WB_D1(7 downto 0)=>XLXN_501(7 downto 0),
                WB_D2(7 downto 0)=>XLXN_555(7 downto 0),
                r0(7 downto 0)=>XLXN_504(7 downto 0),
                r1(7 downto 0)=>XLXN_505(7 downto 0),
                r2(7 downto 0)=>XLXN_506(7 downto 0),
                r3(7 downto 0)=>XLXN_507(7 downto 0));
   
   XLXI_160 : OR2
      port map (I0=>XLXN_581,
                I1=>RESET,
                O=>XLXN_599);
   
end BEHAVIORAL;


