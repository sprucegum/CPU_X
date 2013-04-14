--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:29:32 04/10/2013
-- Design Name:   
-- Module Name:   /home/jadel/fpga/CPU_Prestige/Instruction_Queue_TB.vhd
-- Project Name:  CPU_Prestige
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Instruction_Queue
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
 
ENTITY Instruction_Queue_TB IS
END Instruction_Queue_TB;
 
ARCHITECTURE behavior OF Instruction_Queue_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Instruction_Queue
    PORT(
         in_B0 : IN  std_logic_vector(7 downto 0);
         in_B1 : IN  std_logic_vector(7 downto 0);
         out_B0 : OUT  std_logic_vector(7 downto 0);
         out_B1 : OUT  std_logic_vector(7 downto 0);
         reso : OUT  std_logic_vector(3 downto 0);
         queue_full : OUT  std_logic;
         clk : IN  std_logic;
         rst : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal in_B0 : std_logic_vector(7 downto 0) := (others => '0');
   signal in_B1 : std_logic_vector(7 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';

 	--Outputs
   signal out_B0 : std_logic_vector(7 downto 0);
   signal out_B1 : std_logic_vector(7 downto 0);
   signal reso : std_logic_vector(3 downto 0);

   signal queue_full : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Instruction_Queue PORT MAP (
          in_B0 => in_B0,
          in_B1 => in_B1,
          out_B0 => out_B0,
          out_B1 => out_B1,
          reso => reso,
          queue_full => queue_full,
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
		rst <= '1';
		in_B0 <= "00000000"; -- Add R0, R1
		in_B1 <= "00000000"; -- Add R1, R0
      wait for 20 ns;	
		rst <= '0';

      wait for clk_period*2;

      -- insert stimulus here 
		in_B0 <= "01000001"; -- Add R0, R1
		in_B1 <= "01000100"; -- Add R1, R0

		
		wait for clk_period;
		
		in_B0 <= "01000001"; -- Add R0, R1
		in_B1 <= "00010100"; -- Load R1
		
		wait for clk_period;
		
		in_B0 <= "01000111"; -- Add R1, R3
		in_B1 <= "01001000"; -- Add R2, R0
		
		wait for clk_period;
		
		in_B0 <= "01000001"; -- Add R0, R1
		in_B1 <= "01000100"; -- Add R1, R0
		
		wait for clk_period;
		
		in_B0 <= "01000001"; -- Add R0, R1
		in_B1 <= "01000100"; -- Add R1, R0

		
		wait for clk_period;
		
		in_B0 <= "00000000";
		in_B1 <= "00000000";
		
		wait for clk_period;
		
		wait for clk_period;

      wait;
   end process;

END;
