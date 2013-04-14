--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:58:41 04/09/2013
-- Design Name:   
-- Module Name:   /home/jadel/fpga/CPU_Prestige/MemQ_test.vhd
-- Project Name:  CPU_Prestige
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MemQ_Control
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
 
ENTITY MemQ_test IS
END MemQ_test;
 
ARCHITECTURE behavior OF MemQ_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MemQ_Control
    PORT(
         PC_in : IN  std_logic_vector(6 downto 0);
         M_addr : OUT  std_logic_vector(6 downto 0);
         clk : IN  std_logic;
         rst : IN  std_logic;
         M_in1 : IN  std_logic_vector(7 downto 0);
         M_in2 : IN  std_logic_vector(7 downto 0);
         inst_o1 : OUT  std_logic_vector(7 downto 0);
         inst_o2 : OUT  std_logic_vector(7 downto 0);
         data_o : OUT  std_logic_vector(7 downto 0);
         dq_en : OUT  std_logic;
         PC_next : OUT  std_logic_vector(6 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal PC_in : std_logic_vector(6 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal M_in1 : std_logic_vector(7 downto 0) := (others => '0');
   signal M_in2 : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal M_addr : std_logic_vector(6 downto 0);
   signal inst_o1 : std_logic_vector(7 downto 0);
   signal ints_o2 : std_logic_vector(7 downto 0);
   signal data_o : std_logic_vector(7 downto 0);
   signal dq_en : std_logic;
   signal PC_next : std_logic_vector(6 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MemQ_Control PORT MAP (
          PC_in => PC_in,
          M_addr => M_addr,
          clk => clk,
          rst => rst,
          M_in1 => M_in1,
          M_in2 => M_in2,
          inst_o1 => inst_o1,
          inst_o2 => ints_o2,
          data_o => data_o,
          dq_en => dq_en,
          PC_next => PC_next
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
      wait for clk_period*2;

--			PC_in : IN  std_logic_vector(6 downto 0);
--         M_addr : OUT  std_logic_vector(6 downto 0);
--         clk : IN  std_logic;
--         rst : IN  std_logic;
--         M_in1 : IN  std_logic_vector(7 downto 0);
--         M_in2 : IN  std_logic_vector(7 downto 0);
--         inst_o1 : OUT  std_logic_vector(7 downto 0);
--         inst_o2 : OUT  std_logic_vector(7 downto 0);
--         data_o : OUT  std_logic_vector(7 downto 0);
--         dq_en : OUT  std_logic;
--         PC_next : OUT  std_logic_vector(6 downto 0)
        


      -- insert stimulus here 
		PC_in <= "0000000";
		M_in1 <= "00000000";
		M_in2 <= "00000000";
		
		wait for clk_period;
		PC_in <= "0000010";
		M_in1 <= "00010000";
		M_in2 <= "00011000";

		wait for clk_period;
		PC_in <= "0000100";
		M_in1 <= "00110000";
		M_in2 <= "11001100";

		wait for clk_period;
		PC_in <= "0000110";
		M_in1 <= "00000000";
		M_in2 <= "00000000";

      wait;
   end process;

END;
