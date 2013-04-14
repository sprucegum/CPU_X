----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:29:24 03/07/2013 
-- Design Name: 
-- Module Name:    LR - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity LR is
    Port (	enable		: in  STD_LOGIC;
				clk			: in  STD_LOGIC;
				rst			: in  STD_LOGIC;
				PC_INPUT		: in  STD_LOGIC_VECTOR (6 downto 0);
				PC_OUTPUT	: out STD_LOGIC_VECTOR (6 downto 0));
end LR;

architecture Behavioral of LR is
	signal link_reg : std_logic_vector(6 downto 0);
begin

process(clk)
begin
	if (rst = '1') then 
		link_reg <= "0000000";
	else
		if(enable = '1' and falling_edge(clk)) then
			link_reg <= PC_INPUT;
		end if;
	end if;
end process;

PC_OUTPUT <= link_reg;

end Behavioral;

