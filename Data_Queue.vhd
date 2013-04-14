----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:30:32 04/01/2013 
-- Design Name: 
-- Module Name:    Data_Queue - Behavioral 
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

entity Data_Queue is
    Port ( clk : in  STD_LOGIC;
			  rst : in  STD_LOGIC;
           data_in : in  STD_LOGIC_VECTOR (7 downto 0);
           out_1 : out  STD_LOGIC_VECTOR (7 downto 0);
           out_2 : out  STD_LOGIC_VECTOR (7 downto 0);
           drq_1 : in  STD_LOGIC;
           drq_2 : in  STD_LOGIC;
			  queue_full : out STD_LOGIC;
           data_write : in  STD_LOGIC);
end Data_Queue;

architecture Behavioral of Data_Queue is
type reg_array is array (integer range 0 to 3) of std_logic_vector(7 downto 0);
signal reg_file : reg_array;
--signal Qsize: integer := 3;
--signal Qadd: integer := 1;
begin
process(clk, rst)
variable Qsize: integer :=0;
variable Qadd: integer := 0;
variable QSub: integer := 0;
        begin
                if(falling_edge(clk)) then
								if(rst='1') then
									  for i in 0 to 3 loop
												 reg_file(i)<= (others => '0');
									  end loop;
                        else
									if (Qsub = 1) then
										for i in 0 to 2 loop
												 reg_file(i) <= reg_file(i+1) ;
										end loop;
									elsif (Qsub = 2) then
										for i in 0 to 1 loop
												 reg_file(i)<= reg_file(i+2) ;
										end loop;
									end if;
									if (data_write='1') then
											  reg_file(Qsize) <= data_in;
											  Qadd := 1;
									else
											  Qadd := 0;
									end if;
								end if;
                end if;
					 
					 if(rising_edge(clk)) then
							if(rst='1') then
									  Qsize := 0;
							elsif (Qadd = 1) then 
								Qsize := Qsize + 1;
							end if;
							if (drq_1 = '1' and drq_2 = '0') or (drq_1 = '0' and drq_2 = '1') then
								if (Qsize > 0) then
									Qsize := Qsize - 1;
									Qsub := 1;
								end if;
							elsif (drq_1 = '1' and drq_2 = '1') then
								if (Qsize > 1) then
									Qsize := Qsize - 2;
									Qsub := 2;
								end if;
							else
								Qsub := 0;
							end if;
					 end if;
end process;

--read operation
out_1 <= reg_file(0);
out_2 <= reg_file(0) when(drq_1 = '0' and drq_2 = '1') else
            reg_file(1) when(drq_1 = '1' and drq_2 = '1') else "00000000";


end Behavioral;

