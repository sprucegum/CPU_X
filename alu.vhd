library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity alu is
        port(   rst: in std_logic;
                clk: in std_logic;
                -- data in   
                in1: in std_logic_vector(7 downto 0);
                in2: in std_logic_vector(7 downto 0);
                -- alu mode (up to 16 modes, 8 for now)
                alu_mode: std_logic_vector(3 downto 0);
                -- data out
                result: out std_logic_vector(7 downto 0);
                -- flags
                z_flag: out std_logic;
                n_flag: out std_logic;
					 nz_change: out std_logic;
					 -- IN/OUT
					 in_port: in std_logic_vector(7 downto 0);
					 out_port: out std_logic_vector(7 downto 0));
end alu;

architecture behavioural of alu is
signal result0 : std_logic_vector(7 downto 0);
signal out_register : std_logic_vector(7 downto 0);

begin



process(clk)

begin
	 -- if rising edge....
    if(clk='0' and clk'event) then
			-- if resest
         if(rst='1') then
            z_flag <= '0';
				n_flag <= '0';
				out_register <= "00000000";
         else
					if(alu_mode = 12) then
						out_register <= in1;
					elsif(alu_mode = 4 or alu_mode = 5 or alu_mode = 8) then	-- add, sub, nand
						nz_change <= '1';
						-- update Zero flag
						if(result0 = "00000000") then -- result is 0
							z_flag <= '1';
						else -- re
							z_flag <= '0';
						end if;
					   
						-- update Negative flag
						if(result0(7) = '1') then -- 2' complement
							n_flag <= '1';
						else
							n_flag <= '0';
						end if;
					
					elsif(alu_mode = 6) then -- shift left
						nz_change <= '1';
						z_flag <= in1(7);
						n_flag <= '0';
					
					elsif(alu_mode = 7) then -- shift right
						nz_change <= '1';
						z_flag <= in1(0);
						n_flag <= '0';
						
					else							
						nz_change <= '0';
					end if;
					

          end if;
     end if;
end process;

 

-- Asynchronous result operation
result0 <= (in1 + in2) when(alu_mode=4) else
          (in1 - in2) when(alu_mode=5) else
          (in1 nand in2) when(alu_mode=8) else
			 (in1(6 downto 0)&'0') when(alu_mode=6) else
			 ('0'&in1(7 downto 1)) when(alu_mode=7) else
			 (in_port) when(alu_mode=11) else
			 (in2) when (alu_mode=13) else
			 (in1) when (alu_mode=3) else
			 (in1) when (alu_mode=1) else
			 (in1) when (alu_mode=2) else
			 "00000000";
result <= result0;
out_port <= out_register;


end behavioural;