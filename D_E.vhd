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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity D_E is
    Port ( OP_IN : in  STD_LOGIC_VECTOR (3 downto 0);
           OP_OUT : out  STD_LOGIC_VECTOR (3 downto 0);
           Ra_in : in  STD_LOGIC_VECTOR (7 downto 0);
           Ra_out : out  STD_LOGIC_VECTOR (7 downto 0);
           Rb_in : in  STD_LOGIC_VECTOR (7 downto 0);
           Rb_out : out  STD_LOGIC_VECTOR (7 downto 0);
           WBA_in : in  STD_LOGIC_VECTOR (1 downto 0);
           WBA_out : out  STD_LOGIC_VECTOR (1 downto 0);
			  RBA_in : in  STD_LOGIC_VECTOR (1 downto 0);
           RBA_out : out  STD_LOGIC_VECTOR (1 downto 0);
           WBE_in : in  STD_LOGIC;
			  M_WBE_in : in  STD_LOGIC;
			  clk: in STD_LOGIC;
			  rst: in STD_LOGIC;
           WBE_out : out  STD_LOGIC;
			  M_WBA_in: in STD_LOGIC_VECTOR (6 downto 0);
			  M_WBA_out: out STD_LOGIC_VECTOR (6 downto 0);
			  M_WBE_out : out  STD_LOGIC;
			  resi : in STD_LOGIC_VECTOR(3 downto 0);
			  reso : out STD_LOGIC_VECTOR(3 downto 0)
	);
			  
end D_E;

architecture Behavioral of D_E is
	signal OP : std_logic_vector(3 downto 0);
	signal Ra : std_logic_vector(7 downto 0);
	signal Rb : std_logic_vector(7 downto 0);
	signal WBA: std_logic_vector(1 downto 0);
	signal RBA: std_logic_vector(1 downto 0);
	signal WBE: std_logic;
	signal M_WBE: std_logic;
	signal M_WBA: std_logic_vector(6 downto 0);
begin
	process(clk, rst)
	variable rsv: std_logic_vector(3 downto 0) := "0000";
	begin
		if(clk='1' and clk'event) then
			if(rst = '1') then
				OP <= "0000"; 
				Ra <= "00000000";
				Rb <= "00000000";
				WBA <= "00";
				WBE <= '0';
				M_WBE <= '0';
				M_WBA <= "0000000";
				rsv := "0000";

			else
				rsv := resi;

				OP <= OP_IN; 
				Ra <= Ra_in;
				Rb <= Rb_in;
				WBA <= WBA_in;
				RBA <= RBA_in;
				WBE <= WBE_in;
				M_WBA <= M_WBA_in;
				M_WBE <= M_WBE_in;
			end if;
		end if;
		reso <= rsv;
	end process;
	OP_OUT <= OP; 
	Ra_out <= Ra;
	Rb_out <= Rb;
	WBA_out <= WBA;
	RBA_out <= RBA;
	WBE_out <= WBE;
	M_WBA_out <= M_WBA;
	M_WBE_out <= M_WBE;
end Behavioral;

