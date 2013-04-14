----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:39:25 04/01/2013 
-- Design Name: 
-- Module Name:    MemQ_Control - Behavioral 
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
use ieee.std_logic_unsigned.all;
-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MemQ_Control is
    Port ( PC_in : in  STD_LOGIC_VECTOR (6 downto 0);
           M_addr : out  STD_LOGIC_VECTOR (6 downto 0);
           clk : in  STD_LOGIC;
			  rst : in  STD_LOGIC;
			  IQ_Full : in STD_LOGIC;
           M_in1 : in  STD_LOGIC_VECTOR (7 downto 0);
           M_in2 : in  STD_LOGIC_VECTOR (7 downto 0);
           inst_o1 : out  STD_LOGIC_VECTOR (7 downto 0);
           inst_o2 : out  STD_LOGIC_VECTOR (7 downto 0);
           data_o : out  STD_LOGIC_VECTOR (7 downto 0);
           dq_en : out  STD_LOGIC;
			  PC_next : out  STD_LOGIC_VECTOR (6 downto 0));
end MemQ_Control;
-- we need to look for instructions that require special memory access
-- load effective needs to store the memory location and look it up from 
-- the memory in the next cycle. Branches may either be ignored or a clear may be required 
architecture Behavioral of MemQ_Control is
 signal load_address: std_logic_vector(6 downto 0);
 signal load_next: std_logic; -- Load data from load_address next cycle
 signal PC_inc: integer; -- Store the last amount that we incremented the PC
 signal out1: std_logic_vector(7 downto 0);
 signal out2: std_logic_vector(7 downto 0);
begin

process(clk)
-- if the first slot is a load effective write second byte to load_address
-- if the first slot is a load immediate, write second byte to data queue
-- if the firt slot is a store, write second byte to data queue
-- if the second slot is a load effective, store or immediate, dispatch no-op to second slot, increment PC by one
-- if both instructions are Arithmetic, increment by two
-- if loading from memory, don't increment PC
variable ld_next: std_logic := '0';
variable ld_addr: std_logic_vector(6 downto 0) := "0000000";
variable PC_increment: integer :=0;
begin

		if(rising_edge(clk)) then
			if(rst = '1') then
				out1 <= M_in1;
				out2 <= M_in2;
				ld_addr := "0000000";
				ld_next := '0';
				PC_increment := 2;
			end if;
		-- Load Next logic
			if (ld_next = '1') then
				out1 <= "00000000";
				out2 <= "00000000";			
				dq_en <= '1';
				data_o <= M_in1;
				ld_next := '0';
				PC_increment := 2;
		-- First Slot Logic
			-- Load Effective
			elsif (M_in1(7 downto 4) = "0001") then
				out1 <= M_in1;
				out2 <="00000000";
				dq_en <= '0';
				ld_addr := M_in2(6 downto 0);
				ld_next := '1';
				PC_increment := 0;
			-- Load Immediate
			elsif (M_in1(7 downto 4) = "0011") then
				out1 <= M_in1;
				out2 <= "00000000";
				dq_en <= '1';
				data_o <= M_in2;
				PC_increment := 2;
			-- Store
			elsif (M_in1(7 downto 4) = "0010") then
				out1 <= M_in1;
				out2 <="00000000";
				dq_en <= '1';
				data_o <= M_in2;
				PC_increment := 2;
			
		-- Second Slot Logic
			elsif (M_in2(7 downto 4) = "0001") or
					(M_in2(7 downto 4) = "0011") or
					(M_in2(7 downto 4) = "0010") then
				out1 <= M_in1;
				out2 <="00000000";	
				PC_increment := 1;
				dq_en <= '0';
			else 
				out1 <= M_in1;
				out2 <= M_in2;
				dq_en <= '0';
				PC_increment := 2;
			end if;
			if (IQ_Full = '1') then
				PC_increment := 0;
			end if;
			load_next <= ld_next;
			load_address <= ld_addr;
			PC_inc <= PC_increment;
		end if;
end process;
	inst_o1 <= out1;
	inst_o2 <= out2;
	M_addr <= PC_in when (load_next = '0') else load_address;
	PC_next <= 	(PC_in + PC_inc);
end Behavioral;

