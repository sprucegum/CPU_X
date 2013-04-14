----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:22:40 04/08/2013 
-- Design Name: 
-- Module Name:    NZ_Flag_File - Behavioral 
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

entity NZ_Flag_File is
    Port ( N1 : in  STD_LOGIC;
           Z1 : in  STD_LOGIC;
           ALU1_chng : in  STD_LOGIC;
           N2 : in  STD_LOGIC;
           Z2 : in  STD_LOGIC;
           ALU2_chng : in  STD_LOGIC;
           N : out  STD_LOGIC;
           Z : out  STD_LOGIC;
           clk : in  STD_LOGIC;
			  rst : in STD_LOGIC);
end NZ_Flag_File;

architecture Behavioral of NZ_Flag_File is
begin
	process(clk)
	variable n_s: std_logic := '0';
	variable z_s: std_logic := '0';
	begin
			if(clk='1' and clk'event) then
				-- Update N and Z signals with the results from the 2 ALU's
				if(ALU1_chng = '1')then
						  n_s := N1;
						  z_s := Z1;
				end if;
				-- The second ALU should take priority
				if(ALU2_chng = '1')then
						  n_s := N2;
						  z_s := Z2;
				end if;
				if(rst='1') then
						  n_s := '0';
						  z_s := '0';
				end if;
				N <= n_s;
				Z <= z_s;
			end if;
	end process;


end Behavioral;

