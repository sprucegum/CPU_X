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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

use ieee.std_logic_unsigned.all;
-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity F_D is
    Port ( IR_IN : in  STD_LOGIC_VECTOR (7 downto 0);
           OP_CODE : out STD_LOGIC_VECTOR (3 downto 0);
			  RA_A : out STD_LOGIC_VECTOR (1 downto 0);
			  WBA	 : out STD_LOGIC_VECTOR (1 downto 0);
			  WBE : out STD_LOGIC;
			  MEM_WBE : out STD_LOGIC;
			  RB_A : out STD_LOGIC_VECTOR (1 downto 0);
			  l_format_sel : out STD_LOGIC_VECTOR (1 downto 0);
			  data_req : out std_logic;
           clk : in  STD_LOGIC;
			  rst : in STD_LOGIC;
			  resi : in STD_LOGIC_VECTOR (3 downto 0);
			  reso : out STD_LOGIC_VECTOR (3 downto 0));
			  
end F_D;

architecture Behavioral of F_D is
--internals signals
signal reg : std_logic_vector(7 downto 0);
signal writeback : std_logic;
signal mem_writeback : std_logic;
begin

process(clk)
	variable rsv: std_logic_vector(3 downto 0) := "0000";
	begin
		if(clk='1' and clk'event) then
			if (rst = '1') then 
				rsv := "0000";
				reg <= "00000000";
				writeback <= '0';
				mem_writeback <= '0';
			else
				rsv := resi;
				reg <= IR_IN;
				if (	IR_IN(7 downto 4) = 1 or
						IR_IN(7 downto 4) = 3 or 
						IR_IN(7 downto 4) = 4 or
						IR_IN(7 downto 4) = 5 or
						IR_IN(7 downto 4) = 6 or
						IR_IN(7 downto 4) = 7 or
						IR_IN(7 downto 4) = 8 or
						IR_IN(7 downto 4) = 11 or
						IR_IN(7 downto 4) = 13) then
							writeback <= '1';
				else
					writeback <= '0';
				end if;
				if IR_IN(7 downto 4) = 2 then  mem_writeback <= '1';
				else
					mem_writeback <= '0';
				end if;
			end if;
		end if;
		reso <= rsv;
end process;
-- L-Format Codes
-- "00" Non-Long instruction
-- "01" Load-immediate
-- "10" Load-effective
-- "11" Store
l_format_sel <= "01" when reg(7 downto 4) = 3 
           else "10" when reg(7 downto 4) = 1
			  else "11"	when reg(7 downto 4) = 2
			  else "00";
data_req <= '1' when reg(7 downto 4) = 3 
           else '1' when reg(7 downto 4) = 1
			  else '1'	when reg(7 downto 4) = 2
			  else '0';

MEM_WBE <= mem_writeback;
WBE <= writeback;
OP_CODE <= reg(7 downto 4);
RA_A <= reg(3 downto 2);
WBA <= reg(3 downto 2);
RB_A <= reg(1 downto 0);
end Behavioral;

