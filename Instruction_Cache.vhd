----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:40:49 03/30/2013 
-- Design Name: 
-- Module Name:    Instruction_Queue - Behavioral 
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
use ieee.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Instruction_Queue is
    Port ( in_B0 : in  STD_LOGIC_VECTOR (7 downto 0);
           in_B1 : in  STD_LOGIC_VECTOR (7 downto 0);
           out_B0 : out  STD_LOGIC_VECTOR (7 downto 0);
           out_B1 : out  STD_LOGIC_VECTOR (7 downto 0);
			  -- Reservation Flags
			  reso : out STD_LOGIC_VECTOR (3 downto 0);
			  queue_full : out STD_LOGIC;
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC);
end Instruction_Queue;



architecture Behavioral of Instruction_Queue is

type reg_array is array (integer range 0 to 7) of std_logic_vector(7 downto 0);
signal reg_file : reg_array;
signal double: STD_LOGIC; -- We'll use this variable to keep track of whether we've issued one or two instructions
signal dispatch: STD_LOGIC;
signal out0: STD_LOGIC_VECTOR (7 downto 0);
signal out1: STD_LOGIC_VECTOR (7 downto 0);
-- Falling Edge
-- Add new instructions to the end of the queue 
-- Lets look at the first byte, if it's writing to a register, then let's reserve that register
-- If the first byte is a branch, let's execute it on it's own.
-- Let's look at the second byte, if it's a Load, Store, Add, Sub, SHL, SHR, NAND, RETURN, or MOV, let's check that it doesn't
-- depend on the first byte. If it doesn't, then let's reserve the register that it's writing to and push it through the pipeline
-- If the second instruction is a Branch, IN, OUT, or STORE, then let's put a NOP on the second pipeline 
-- and only move the queue forward by one.


begin
process(clk) 
variable Qsize: integer :=0;
variable r_file : reg_array;
variable rez0: std_logic := '0';
variable rez1: std_logic := '0';
variable rez2: std_logic := '0';
variable rez3: std_logic := '0';
variable inst0: std_logic_vector(7 downto 0) := "00000000";
variable inst1: std_logic_vector(7 downto 0) := "00000000";
variable dub: std_logic := '0';
variable disp: std_logic := '0';
variable safe: std_logic := '0';
	begin
	
	if(falling_edge(clk)) then
		if(rst='1') then
				  for i in 0 to 7 loop
							 r_file(i):= (others => '0');
				  end loop;
				  Qsize := 0;
				  dub := '0';
				  disp := '0';
				  queue_full <= '0';

				  inst0 := "00000000";
				  inst1 := "00000000";
				  rez0 := '0';
				  rez1 := '0';
				  rez2 := '0';
				  rez3 := '0';

		else
			if (disp = '1') then
				-- Let's shift the queue
				if (dub = '0') then
					if (Qsize /= 0) then
						Qsize := Qsize - 1;
					end if;
					for i in 0 to 6 loop
						r_file(i) := r_file(i + 1);
					end loop;

				elsif (dub = '1') then
					for i in 0 to 5 loop
						r_file(i) := r_file(i + 2);
					end loop;
					if (Qsize > 1) then
						Qsize := Qsize - 2;
					end if;
				end if;

			end if;
			-- Reset the tracking variables
			inst0 := "00000000";
			inst1 := "00000000";
			rez0 := '0';
			rez1 := '0';
			rez2 := '0';
			rez3 := '0';
			dub := '0';
			safe := '0';
			disp := '1';
			-- Looking at the First Input
			if ((in_B0(7 downto 4) /=  "0000") and Qsize < 8) then
				r_file(Qsize) := in_B0;
				Qsize := Qsize + 1;
			end if;
			if ((in_B1(7 downto 4) /=  "0000") and (Qsize < 8)) then
				r_file(Qsize) := in_B1;
				Qsize := Qsize + 1;				
			end if;
			if (Qsize = 7) then
				queue_full <= '1';
			end if;

			-- Looking at the second input and adding it to the Queue

			
			 -- Ok, now lets look at Slot 0 and reserve the necessary register
				 -- Let's consider operations that write to a register
				 -- Load, Loadimm, Add, Sub, SHL, SHR, NAND, IN, MOV
			 -- Let's reset the flags
			 

				 -- We need to check that it's safe to use any of these instructions
					-- ADD, SUB, SHL, NAND, and MOVE 
			 
				 -- Let's consider operations that write to a register
				 -- Load, Loadimm, Add, Sub, SHL, SHR, NAND, IN, MOV


			inst0 := r_file(0);
			inst1 := r_file(1);
			if ((inst0(7 downto 4) = "0001") or 	-- Load
					(inst0(7 downto 4) = "0011") or	-- Load imm
					(inst0(7 downto 4) = "0100") or	-- Add
					(inst0(7 downto 4) = "0110") or	-- Shift Left
					(inst0(7 downto 4) = "0101") or	-- Sub
					(inst0(7 downto 4) = "0111") or	-- Shift Right
					(inst0(7 downto 4) = "1000") or 	-- Nand
					(inst0(7 downto 4) = "1011") or 	-- In
					(inst0(7 downto 4) = "1101")) then -- Mov
						safe := '1';
						case inst0(3 downto 2) is
							when "00" => rez0 := '1';
							when "01" => rez1 := '1';
							when "10" => rez2 := '1';
							when "11" => rez3 := '1';
							when others => NULL;
						end case;
				end if;
			 
			 -- And now lets look at the second slot, and if it's safe, 
			 -- lets dispatch an instruction and reserve the slot 
			 if (safe = '1') then
					if ((inst1(7 downto 4) = "0001") or -- Load
						(inst1(7 downto 4) = "0011") or	-- Load imm
						(inst1(7 downto 4) = "0100") or	-- Add
						(inst1(7 downto 4) = "0101") or	-- Sub
						(inst1(7 downto 4) = "0110") or	-- Shift Left
						(inst1(7 downto 4) = "0111") or	-- Shift Right
						(inst1(7 downto 4) = "1000") or  -- Nand
						(inst1(7 downto 4) = "1101")) then -- Mov
						if ( (((inst1(1 downto 0) = "00") and (rez0 /= '1')) or
								((inst1(1 downto 0) = "01") and (rez1 /= '1')) or
								((inst1(1 downto 0) = "10") and (rez2 /= '1')) or
								((inst1(1 downto 0) = "11") and (rez3 /= '1'))) and 
								
								(((inst1(3 downto 2) = "00") and (rez0 /= '1')) or
								((inst1(3 downto 2) = "01") and (rez1 /= '1')) or
								((inst1(3 downto 2) = "10") and (rez2 /= '1')) or
								((inst1(3 downto 2) = "11") and (rez3 /= '1')))) then 
								
								case inst1(3 downto 2)  is
									when "00" => rez0 := '1';
									when "01" => rez1 := '1';
									when "10" => rez2 := '1';
									when "11" => rez3 := '1';
									when others => NULL;
								end case;
								if ((inst0(7 downto 4) /= "1001") and 
									(inst0(7 downto 4) /= "1110")) then
									dub := '1';
								end if;
						end if;
					end if;
				end if;
			end if;
			
			
			double <= dub;
			dispatch <= disp;
			out0 <= inst0;
			out1 <= inst1;
			for i in 0 to 7 loop
				reg_file(i) <= r_file(i);
			end loop;
		end if;
		reso <= rez3 & rez2 & rez1 & rez0;
end process;

out_B0 <= out0 when (dispatch = '1') else "00000000";
out_B1 <= out1 when (double = '1' and dispatch = '1') else "00000000";

-- Instruction Outputs

end Behavioral;



