----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:51:28 04/11/2013 
-- Design Name: 
-- Module Name:    OneToFour - Behavioral 
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

entity OneToFour is
    Port ( resi : in  STD_LOGIC_VECTOR (3 downto 0);
           r0 : out  STD_LOGIC;
           r1 : out  STD_LOGIC;
           r2 : out  STD_LOGIC;
           r3 : out  STD_LOGIC);
end OneToFour;

architecture Behavioral of OneToFour is

begin
r0 <= resi(0);
r1 <= resi(1);
r2 <= resi(2);
r3 <= resi(3);
end Behavioral;

