--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   03:21:36 04/09/2013
-- Design Name:   
-- Module Name:   /home/jadel/fpga/CPU_Prestige/DQ_TB.vhd
-- Project Name:  CPU_Prestige
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Data_Queue
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
 
ENTITY DQ_TB IS
END DQ_TB;
 
ARCHITECTURE behavior OF DQ_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Data_Queue
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         data_in : IN  std_logic_vector(7 downto 0);
         out_1 : OUT  std_logic_vector(7 downto 0);
         out_2 : OUT  std_logic_vector(7 downto 0);
         drq_1 : IN  std_logic;
         drq_2 : IN  std_logic;
         queue_full : OUT  std_logic;
         data_write : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal data_in : std_logic_vector(7 downto 0) := (others => '0');
   signal drq_1 : std_logic := '0';
   signal drq_2 : std_logic := '0';
   signal data_write : std_logic := '0';

 	--Outputs
   signal out_1 : std_logic_vector(7 downto 0);
   signal out_2 : std_logic_vector(7 downto 0);
   signal queue_full : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Data_Queue PORT MAP (
          clk => clk,
          rst => rst,
          data_in => data_in,
          out_1 => out_1,
          out_2 => out_2,
          drq_1 => drq_1,
          drq_2 => drq_2,
          queue_full => queue_full,
          data_write => data_write
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
      wait for 20 ns;	
		rst <= '0';

      wait for clk_period*2;

		data_in <= "10100101";
		data_write <= '1';
      -- insert stimulus here 
		wait for clk_period;
		data_in <= "11111111";
		data_write <= '1';
		
		wait for clk_period;
		data_in <= "10100101";
		data_write <= '0';
		wait for clk_period;
		drq_1 <= '1';
		drq_2 <= '1';
      wait;
   end process;

END;
