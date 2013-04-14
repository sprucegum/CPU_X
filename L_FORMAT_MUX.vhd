----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:18:39 03/14/2013 
-- Design Name: 
-- Module Name:    L_FORMAT_MUX - Behavioral 
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

entity L_FORMAT_MUX is
    Port ( data1_in : in  STD_LOGIC_VECTOR (7 downto 0);
           data2_in : in  STD_LOGIC_VECTOR (7 downto 0);
           l_format_select : in  STD_LOGIC_VECTOR (1 downto 0);
           data_out : out  STD_LOGIC_VECTOR (7 downto 0);
			  wba_out : out STD_LOGIC_VECTOR (6 downto 0)); --
end L_FORMAT_MUX;

architecture Behavioral of L_FORMAT_MUX is
-- L-Format Codes
-- "00" Non-Long instruction
-- "01" Load-immediate
-- "10" Load-effective
-- "11" Store
begin
	data_out <= data2_in when l_format_select = "01"
       	 else data2_in when l_format_select = "10"
			 else data1_in;
	wba_out <= data2_in (6 downto 0) when l_format_select = "11" else "0000000";
end Behavioral;

