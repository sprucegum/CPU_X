----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:29:53 03/02/2013 
-- Design Name: 
-- Module Name:    Branch_Controller - Behavioral 
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

entity Branch_Controller is
    Port ( OPCODE : in  STD_LOGIC_VECTOR (3 downto 0);
           N : in  STD_LOGIC;
           Z : in  STD_LOGIC;
			  BRX: in STD_LOGIC_VECTOR (1 downto 0);
			  LR_ENABLE : out STD_LOGIC;
			  RESET_D_E : out STD_LOGIC;
           PC_MUX : out  STD_LOGIC_VECTOR (1 downto 0));

end Branch_Controller;

architecture Behavioral of Branch_Controller is
signal MUX_OUT : std_logic_vector(1 downto 0);
signal RESET2 : std_logic;
signal LR_EN : std_logic;
begin
-- MUX 0 = PC + 1 
-- MUX 1 = RB
-- MUX 2 = LR
MUX_OUT <= 
	"01" when (
		OPCODE="1001" and (
			(BRX="01" and Z='1') or (BRX="10" and N='1') or (BRX="11") or (BRX="00")
		)
		
	) else "10" when (OPCODE="1110" and BRX="00")

	else "00";

RESET2 <= 
	'1' when (
		OPCODE="1001" and (
			(BRX="01" and Z='1') or (BRX="10" and N='1') or (BRX="11") or (BRX="00")
		)
		
	) else '1' when (OPCODE="1110" and BRX="00")

	else '0';

LR_EN <= '1' when (
	OPCODE="1001" and BRX="11"
) else '0';
PC_MUX <= MUX_OUT;
RESET_D_E <= RESET2;
LR_ENABLE <= LR_EN;
end Behavioral;

