----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:29:28 02/15/2013 
-- Design Name: 
-- Module Name:    PC - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity PC is
    Port ( PC_IN : in  STD_LOGIC_VECTOR (6 downto 0);
			  PC_OUT : out  STD_LOGIC_VECTOR (6 downto 0);
			  rst : in STD_LOGIC;
           clk : in  STD_LOGIC
	 );
end PC;

architecture Behavioral of PC is
--internals signals
signal reg : std_logic_vector(6 downto 0);
begin

process(clk)
	begin
		if(falling_edge(clk)) then
			reg <= PC_IN;
			if(rst = '1') then
				reg <= "0000000";
			end if;
		end if;
end process;

PC_OUT <= reg;

end Behavioral;

