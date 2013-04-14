--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:36:45 04/11/2013
-- Design Name:   
-- Module Name:   /run/shm/CPU_Prestige/WB_Q_TB.vhd
-- Project Name:  CPU_Prestige
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Reg_WB_File
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
 
ENTITY WB_Q_TB IS
END WB_Q_TB;
 
ARCHITECTURE behavior OF WB_Q_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Reg_WB_File
    PORT(
         WB_D1 : IN  std_logic_vector(7 downto 0);
         WB_A1 : IN  std_logic_vector(1 downto 0);
         WBE1 : IN  std_logic;
         WB_D2 : IN  std_logic_vector(7 downto 0);
         WB_A2 : IN  std_logic_vector(1 downto 0);
         WBE2 : IN  std_logic;
         clk : IN  std_logic;
         rst : IN  std_logic;
         r0 : OUT  std_logic_vector(7 downto 0);
         r1 : OUT  std_logic_vector(7 downto 0);
         r2 : OUT  std_logic_vector(7 downto 0);
         r3 : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal WB_D1 : std_logic_vector(7 downto 0) := (others => '0');
   signal WB_A1 : std_logic_vector(1 downto 0) := (others => '0');
   signal WBE1 : std_logic := '0';
   signal WB_D2 : std_logic_vector(7 downto 0) := (others => '0');
   signal WB_A2 : std_logic_vector(1 downto 0) := (others => '0');
   signal WBE2 : std_logic := '0';
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';

 	--Outputs
   signal r0 : std_logic_vector(7 downto 0);
   signal r1 : std_logic_vector(7 downto 0);
   signal r2 : std_logic_vector(7 downto 0);
   signal r3 : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Reg_WB_File PORT MAP (
          WB_D1 => WB_D1,
          WB_A1 => WB_A1,
          WBE1 => WBE1,
          WB_D2 => WB_D2,
          WB_A2 => WB_A2,
          WBE2 => WBE2,
          clk => clk,
          rst => rst,
          r0 => r0,
          r1 => r1,
          r2 => r2,
          r3 => r3
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
		rst <= '1';
      wait for 10 ns;
		rst <= '0';
		WBE1 <= '0';
		WB_A1 <= "00";
		WB_D1 <= "00000000";
		
		WBE2 <= '0';
		WB_A2 <= "00";
		WB_D2 <= "00000000";
      wait for clk_period;
		
		WBE1 <= '1';
		WB_A1 <= "00";
		WB_D1 <= "00000011";
		
		WBE2 <= '0';
		WB_A2 <= "00";
		WB_D2 <= "00000000";
		
		wait for clk_period;
		
		WBE1 <= '0';
		WB_A1 <= "00";
		WB_D1 <= "00000000";
		
		WBE2 <= '1';
		WB_A2 <= "01";
		WB_D2 <= "00001100";
		
		wait for clk_period;
		
		WBE1 <= '1';
		WB_A1 <= "00";
		WB_D1 <= "10000000";
		
		WBE2 <= '1';
		WB_A2 <= "01";
		WB_D2 <= "01000000";
		
		wait for clk_period;
		
		WBE1 <= '0';
		WB_A1 <= "00";
		WB_D1 <= "00000000";
		
		WBE2 <= '0';
		WB_A2 <= "00";
		WB_D2 <= "00000000";
		
		wait for clk_period;

      -- insert stimulus here 

      wait;
   end process;

END;
