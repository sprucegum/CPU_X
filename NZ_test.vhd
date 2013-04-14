--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:45:48 04/08/2013
-- Design Name:   
-- Module Name:   /home/jadel/fpga/CPU_Prestige/NZ_test.vhd
-- Project Name:  CPU_Prestige
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: NZ_Flag_File
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY NZ_test IS
END NZ_test;
 
ARCHITECTURE behavior OF NZ_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT NZ_Flag_File
    PORT(
         N1 : IN  std_logic;
         Z1 : IN  std_logic;
         ALU1_chng : IN  std_logic;
         N2 : IN  std_logic;
         Z2 : IN  std_logic;
         ALU2_chng : IN  std_logic;
         N : OUT  std_logic;
         Z : OUT  std_logic;
         clk : IN  std_logic;
         rst : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal N1 : std_logic := '0';
   signal Z1 : std_logic := '0';
   signal ALU1_chng : std_logic := '0';
   signal N2 : std_logic := '0';
   signal Z2 : std_logic := '0';
   signal ALU2_chng : std_logic := '0';
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';

 	--Outputs
   signal N : std_logic;
   signal Z : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: NZ_Flag_File PORT MAP (
          N1 => N1,
          Z1 => Z1,
          ALU1_chng => ALU1_chng,
          N2 => N2,
          Z2 => Z2,
          ALU2_chng => ALU2_chng,
          N => N,
          Z => Z,
          clk => clk,
          rst => rst
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 
		N1 <= '1';
		ALU1_chng <= '1';
		wait for clk_period;
		ALU1_chng <= '0';
		N2 <= '0';
		Z2 <= '1';
		ALU2_chng <= '1';
      wait;
		ALU1_chng <= '0';
		ALU2_chng <= '0';
   end process;

END;
