----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:32:34 03/02/2013 
-- Design Name: 
-- Module Name:    PC_MUX - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PC_MUX is
    Port ( RB_IN : in  STD_LOGIC_VECTOR (7 downto 0);
           LR_IN : in  STD_LOGIC_VECTOR (6 downto 0);
           PC_PLUS : in  STD_LOGIC_VECTOR (6 downto 0);
           PC_OUT : out  STD_LOGIC_VECTOR (6 downto 0);
           PC_SELECT : in  STD_LOGIC_VECTOR (1 downto 0));
end PC_MUX;

architecture Behavioral of PC_MUX is
begin

PC_OUT <= PC_PLUS when PC_SELECT="00" else -- 00 is for standard instructions
	RB_IN(6 downto 0) when PC_SELECT="01" else -- Branch address
	LR_IN when PC_SELECT="10" else "0000000"; -- Link register
end Behavioral;

