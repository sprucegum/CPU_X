----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:43:57 04/08/2013 
-- Design Name: 
-- Module Name:    FeedForward_MUX - Behavioral 
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

entity FeedForward_MUX is
    Port ( 
				-- Ports for first ALU
			  opA : in  STD_LOGIC_VECTOR (1 downto 0);
           opD : in  STD_LOGIC_VECTOR (7 downto 0);
			  -- Buffer validity flags
           r_fb0 : in  STD_LOGIC;
           r_fb1 : in  STD_LOGIC;
           r_fb2 : in  STD_LOGIC;
           r_fb3 : in  STD_LOGIC;
			  -- buffer data 
           r0 : in  STD_LOGIC_VECTOR (7 downto 0);
           r1 : in  STD_LOGIC_VECTOR (7 downto 0);
           r2 : in  STD_LOGIC_VECTOR (7 downto 0);
           r3 : in  STD_LOGIC_VECTOR (7 downto 0);
			  -- ALU 1 outputs
           opD_out: out STD_LOGIC_VECTOR(7 downto 0));
			  -- ALU 2 outputs
			  
end FeedForward_MUX;

architecture Behavioral of FeedForward_MUX is

begin
-- Compare addresses of incoming operands, 
-- if they conflict with any valid data in the feedforward buffers, replace them

	opD_out <= 
		opD when (
			(opA = "00" and r_fb0 = '0') or 
			(opA = "01" and r_fb1 = '0') or
			(opA = "10" and r_fb2 = '0') or 
			(opA = "11" and r_fb3 = '0')
		)
		else r0 when (opA = "00")
		else r1 when (opA = "01")
		else r2 when (opA = "10")
		else r3 when (opA = "11");

end Behavioral;

