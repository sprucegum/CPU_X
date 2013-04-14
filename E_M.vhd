----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:20:07 02/15/2013 
-- Design Name: 
-- Module Name:    execute_register - Behavioral 
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

entity E_M is
    Port ( Result_in : in  STD_LOGIC_VECTOR (7 downto 0);
           Result_out : out  STD_LOGIC_VECTOR (7 downto 0);
           WBA_in : in  STD_LOGIC_VECTOR (1 downto 0);
			  RBA_in : in  STD_LOGIC_VECTOR (1 downto 0);
           WBA_out : out  STD_LOGIC_VECTOR (1 downto 0);
			  RBA_out : out  STD_LOGIC_VECTOR (1 downto 0);
           WBE_in : in  STD_LOGIC;
           WBE_out : out  STD_LOGIC;
			  MEM_WBE_in : in  STD_LOGIC;
           MEM_WBE_out : out  STD_LOGIC;
			  MEM_WBA_in: in STD_LOGIC_VECTOR (6 downto 0);
			  MEM_WBA_out: out STD_LOGIC_VECTOR (6 downto 0);
			  resi : in STD_LOGIC_VECTOR(3 downto 0);
			  reso : out STD_LOGIC_VECTOR(3 downto 0);
			  clk: in STD_LOGIC);
end E_M;

architecture Behavioral of E_M is
signal Result : std_logic_vector(7 downto 0);
signal WBA: std_logic_vector(1 downto 0);
signal RBA: std_logic_vector(1 downto 0);
signal WBE: std_logic;
signal MEM_WBE: std_logic;
signal MEM_WBA: std_logic_vector(6 downto 0);

begin
	process(clk) begin
		if(clk='1' and clk'event) then
				Result <= Result_in;
				WBA <= WBA_in;
				WBE <= WBE_in;
				MEM_WBE <= MEM_WBE_in;
				MEM_WBA <= MEM_WBA_in;
				reso <= resi;
		end if;
	end process;
	Result_out <= Result;
	
	WBA_out <= WBA;
	RBA_out <= RBA;
	WBE_out <= WBE;
	MEM_WBA_out <= MEM_WBA;
	MEM_WBE_out <= MEM_WBE;
end Behavioral;

