-- TestBench Template 

  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;

  ENTITY testbench IS
  END testbench;

  ARCHITECTURE behavior OF testbench IS 

  -- Component Declaration
          COMPONENT CPU
   PORT( RESET			:	IN	 STD_LOGIC; 
			OUT_PORT		:	OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
         IN_PORT		:	IN	 STD_LOGIC_VECTOR (7 DOWNTO 0);	
         CLK			:	IN	 STD_LOGIC
	);
	END COMPONENT;

   SIGNAL RESET		:	STD_LOGIC;
	SIGNAL OUT_PORT	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL IN_PORT	 	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
   SIGNAL CLK		:	STD_LOGIC;
          
	constant clk_period : time := 1 us;

BEGIN

   UUT: CPU PORT MAP(
		IN_PORT => IN_PORT, 
		CLK => CLK,
		RESET => RESET,
		OUT_PORT => OUT_PORT
   );

	
-- *** Test Bench - User Defined Section ***
   tb : PROCESS
   BEGIN
		-- Initial reset
		CLK <= '0';
		RESET <= '1';
		WAIT FOR clk_period*2;
		CLK <= '1';
		WAIT FOR clk_period*2;
		CLK <= '0';
		WAIT FOR clk_period*2;
		RESET <= '0';
		-- Setup
		IN_PORT <= x"C0";
		
		
		
		for i in 1 to 900 loop
			CLK <= '0';
			wait for clk_period;
			CLK <= '1';
			wait for clk_period;
		end loop;

		wait;
   END PROCESS;
END;
