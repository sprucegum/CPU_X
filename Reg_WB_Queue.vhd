----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:34:14 04/08/2013 
-- Design Name: 
-- Module Name:    Reg_WB_Queue - Behavioral 
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

entity Reg_WB_File is
    Port ( WB_D1 : in  STD_LOGIC_VECTOR (7 downto 0);
           WB_A1 : in  STD_LOGIC_VECTOR (1 downto 0);
			  WBE1 : in  STD_LOGIC;
           WB_D2 : in  STD_LOGIC_VECTOR (7 downto 0);
           WB_A2 : in  STD_LOGIC_VECTOR (1 downto 0);
			  WBE2 : in  STD_LOGIC;
           clk : in  STD_LOGIC;
			  rst : in STD_LOGIC;
           r0 : out  STD_LOGIC_VECTOR (7 downto 0);
           r1 : out  STD_LOGIC_VECTOR (7 downto 0);
           r2 : out  STD_LOGIC_VECTOR (7 downto 0);
           r3 : out  STD_LOGIC_VECTOR (7 downto 0));
end Reg_WB_File;
-- Takes results from each ALU, writes back to register one at a time
-- Feeds data forward through a MUX to each ALU when data is valid

architecture Behavioral of Reg_WB_File is
-- writeback data is held in these registers
type reg_array is array (integer range 0 to 3) of std_logic_vector(7 downto 0);

begin
-- every falling clock cycle, write one piece of data back to the register file if necessary
	process(clk) 
	variable reg_file : reg_array;
	begin
		if(rising_edge(clk)) then
			if(rst='1') then
					  for i in 0 to 3 loop
								 reg_file(i) := (others => '0');
					  end loop;
			else
				if(WBE1='1')then
						  case WB_A1(1 downto 0) is
									 when "00" => reg_file(0) := WB_D1;
									 when "01" => reg_file(1) := WB_D1;
									 when "10" => reg_file(2) := WB_D1;
									 when "11" => reg_file(3) := WB_D1;
									 when others => NULL;
						  end case;
				end if;
				if(WBE2='1')then
						  case WB_A2(1 downto 0) is
									 when "00" => reg_file(0) := WB_D2;
									 when "01" => reg_file(1) := WB_D2;
									 when "10" => reg_file(2) := WB_D2;
									 when "11" => reg_file(3) := WB_D2;
									 when others => NULL;
						  end case;
				end if;
			end if;	
		end if;
	r0 <= reg_file(0);
	r1 <= reg_file(1);
	r2 <= reg_file(2);
	r3 <= reg_file(3);
	end process;

end Behavioral;

