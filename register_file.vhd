library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity register_file is
        port(rst : in std_logic;
                clk: in std_logic;

                --read signals
                rd_index1: in std_logic_vector(1 downto 0);
                rd_index2: in std_logic_vector(1 downto 0);
                rd_data1: out std_logic_vector(7 downto 0);
                rd_data2: out std_logic_vector(7 downto 0);

                --write signals
                wr_index: in std_logic_vector(1 downto 0);
                wr_data: in std_logic_vector(7 downto 0);
                wr_enable: in std_logic;
					 wr_index2: in std_logic_vector(1 downto 0);
                wr_data2: in std_logic_vector(7 downto 0);
                wr_enable2: in std_logic);
end register_file;

architecture behavioural of register_file is

type reg_array is array (integer range 0 to 3) of std_logic_vector(7 downto 0);
--internals signals
signal reg_file : reg_array;

begin
--write operation
process(clk)
variable r_file : reg_array;
        begin
                if(clk='0' and clk'event) then
                        if(rst='1') then
                                for i in 0 to 3 loop
                                        r_file(i) := (others => '0');
                                end loop;
                        else
									if(wr_enable='1')then
										  case wr_index(1 downto 0) is
                                        when "00" => r_file(0) := wr_data;
                                        when "01" => r_file(1) := wr_data;
                                        when "10" => r_file(2) := wr_data;
                                        when "11" => r_file(3) := wr_data;
                                        when others => NULL;
                                end case;
									end if;
									if(wr_enable2='1')then
										  case wr_index2(1 downto 0) is
                                        when "00" => r_file(0) := wr_data2;
                                        when "01" => r_file(1) := wr_data2;
                                        when "10" => r_file(2) := wr_data2;
                                        when "11" => r_file(3) := wr_data2;
                                        when others => NULL;
                                end case;
									end if;
                        end if;
                end if;
					 for i in 0 to 3 loop
						reg_file(i) <= r_file(i);
                end loop; 
end process;

--read operation
rd_data1 <= reg_file(0) when(rd_index1="00") else
            reg_file(1) when(rd_index1="01") else
            reg_file(2) when(rd_index1="10") else reg_file(3);

rd_data2 <= reg_file(0) when(rd_index2="00") else
            reg_file(1) when(rd_index2="01") else
            reg_file(2) when(rd_index2="10") else reg_file(3);

end behavioural;
