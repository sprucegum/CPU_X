----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:06:26 02/15/2013 
-- Design Name: 
-- Module Name:    Memory - Behavioral 
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

entity Memory is
    Port ( MAr : in  STD_LOGIC_VECTOR (6 downto 0);
			  MAw : in  STD_LOGIC_VECTOR (6 downto 0);
           MDr : out  STD_LOGIC_VECTOR (7 downto 0);
           MDr_next : out STD_LOGIC_VECTOR (7 downto 0);
           MDw : in  STD_LOGIC_VECTOR (7 downto 0);
			  clk : in STD_LOGIC;
           wr_enable : in  STD_LOGIC);
end Memory;

architecture Behavioral of Memory is
	type mem_array is array (integer range 0 to 127) of std_logic_vector(7 downto 0);
	signal ram : mem_array := (
--
--	
--		02 =>	x"30",  -- loadimm	r0,0F							#start#  
--		03 =>	x"0F",  -- 
--		-- nop
--		09 =>	x"20",  -- store		r0,add_nand
--		10 =>	x"0F",  -- 
--		11 =>	x"30",  -- loadimm	r0,7
--		12 =>	x"07",  -- 
--		-- nop
--		-- 14 =>  		counter
--		-- 15 =>  		add_nand
--		-- nop
--		18 =>	x"20",  -- store		r0,counter
--		19 =>	x"0E",  -- 
--		20 =>	x"30",  -- loadimm 	r0,FF
--		21 =>	x"FF",  -- 
--		22 =>	x"34",  -- loadimm	r1,FF
--		23 =>	x"FF",  -- 
--		-- nop
--		29 =>	x"70",  -- shr			r0  							#loop# 
--		30 =>	x"64",  -- shl			r1
--		-- nop
--		35 =>	x"DC",  -- mov			r3,r0 	
--		36 =>	x"10",  -- load		r0,add_nand
--		37 =>	x"0F",  -- 
--		-- nop
--		43 =>	x"70",  -- shr			r0
--		49 =>	x"20",  -- store		r0,add_nand
--		50 =>	x"0F",  -- 
--		51 =>	x"D3",  -- mov			r0,r3	
--		-- nop
--		58 =>	x"38",  -- loadimm	r2,nand
--		59 =>	x"4B",  -- 
--		-- nop
--		65 =>	x"96",  -- brz											nand
--		66 =>	x"41",  -- add			r0,r1   
--		67 =>	x"38",  -- loadimm	r2,out_add_nand
--		68 =>	x"4C",  -- 
--		-- nop
--		74 =>	x"92",  -- br											out_add_nand
--		75 =>	x"81",  -- nand		r0,r1              		#nand#
--		-- nop
--		81 =>	x"C0",  -- out			r0
--		82 =>	x"10",  -- load		r0,counter
--		83 =>	x"0E",  -- 
--		84 =>	x"D9",  -- mov			r2,r1		
--		85 =>	x"34",  -- loadimm	r1,1
--		86 =>	x"01",  -- 
--		-- nop
--		92 =>	x"51",  -- sub			r0,r1
--		-- nop
--		98 =>	x"20",  -- store		r0,counter
--		99 =>	x"0E",  -- 
--		100 => x"D6", -- mov			r1,r2	
--		101 => x"38", -- loadimm	r2,out:
--		102 => x"76", -- 
--		-- nop
--		106 => x"D3", -- mov			r0,r3	
--		-- nop
--		109 => x"9A", -- brn											out
--		110 => x"38", -- loadimm	r2,loop
--		111 => x"1D", -- 
--		-- nop
--		117 => x"92", -- br			loop
--		118 => x"38", -- loadimm	r2,start     				#out#
--		119 => x"02", -- 
--		-- nop
--		125 => x"92", -- br											start
			
	
	
--		00 => x"00", -- NOP
--		01 => x"00", -- NOP
--		02 =>	x"30", -- #start# LOADIMM r0, 0XFF
--		03 =>	x"FF", -- 0xFF, the immediate value
--		04 =>	x"34", -- LOADIMM r1, 0X0c
--		05 =>	x"0c", -- 0x0C, the immediate value
--		06 =>	x"00", -- NOP
--		07 =>	x"00", -- NOP
--		08 =>	x"00", -- NOP
--		09 =>	x"00", -- NOP
--		10 =>	x"64", -- SHL r1
--		11 =>	x"00", -- NOP
--		12 =>	x"00", -- NOP
--		13 =>	x"00", -- NOP
--		14 =>	x"00", -- NOP
--		15 =>	x"51", -- SUB r0, r1
--		16 =>	x"38", -- LOADIMM r2, 0x03
--		17 =>	x"03", -- 0x03, the immediate value
--		18 =>	x"00", -- NOP
--		19 =>	x"00", -- NOP
--		20 =>	x"00", -- NOP
--		21 =>	x"00", -- NOP
--		22 =>	x"D6", -- MOV r1, r2
--		23 =>	x"00", -- NOP
--		24 =>	x"00", -- NOP
--		25 =>	x"00", -- NOP
--		26 =>	x"00", -- NOP
--		27 =>	x"B8", -- IN r2			-- Set the Input port switches on "0xC0" ("11000000")
--		28 =>	x"00", -- NOP
--		29 =>	x"00", -- NOP
--		30 =>	x"00", -- NOP
--		31 =>	x"00", -- NOP
--		32 =>	x"28", -- STORE r2, 0x70
--		33 =>	x"70", -- Effective Address
--		34 =>	x"49", -- ADD r2, r1
--		35 =>	x"00", -- NOP
--		36 =>	x"00", -- NOP
--		37 =>	x"00", -- NOP
--		38 =>	x"00", -- NOP
--		39 =>	x"88", -- NAND r2, r0
--		40 =>	x"00", -- NOP
--		41 =>	x"00", -- NOP
--		42 =>	x"00", -- NOP
--		43 =>	x"00", -- NOP
--		44 =>	x"C8", -- OUT r2			--At this point R[2] must be "00111100"
--		45 =>	x"10", -- LOAD r0, 0x70
--		46 =>	x"70", -- Effective Address
--		47 =>	x"00", -- NOP
--		48 =>	x"00", -- NOP
--		49 =>	x"00", -- NOP
--		50 =>	x"00", -- NOP
--		51 =>	x"70", -- SHR r0
--		52 =>	x"00", -- NOP
--		53 =>	x"00", -- NOP
--		54 =>	x"00", -- NOP
--		55 =>	x"00", -- NOP
--		56 =>	x"48", -- ADD r2, r0		--At this point negative flag must be set
--		57 =>	x"00", -- NOP
--		58 =>	x"00", -- NOP
--		59 =>	x"00", -- NOP
--		60 =>	x"00", -- NOP
--		61 =>	x"C8", -- OUT r2		--At this point R[2] have to be "10011100"
--		
--		110 => x"EE",
--		111 => x"FF",
--		113 => x"11",
--		114 => x"22",
		

		0  => "10110000", -- IN to R0
		1  => "00110100", -- LOADIMM to R1
		2  => "00000000", -- 0
		3  => "00111100", -- LOADIMM to R3
		4  => "00000101", -- 5
		5  => "00111000", -- LOADIMM to R2
		6  => "00000001", -- 1
		7  => "01110000", -- SHR R0
		8  => "01000110", -- ADD R1 R2
		9 => "01011000", -- SUB R2 R0
		10 =>	"11000000", -- OUT R0
		11 => "10011011", -- BR.N R3
		12 => "10010111", -- BR.Z R3
		13 => "00111000", -- LOADIMM to R2
		14 => "00000001", -- 1
		15 => "01010110", -- SUB R1 R2
		16 => "11000100", -- out R1
		--	while(1)
		17 => "00111100", -- LOADIMM to R3
		18 => "00010101", -- 19
		19 => "10010011", -- loop forever
		
		others =>  "00000000"
	);
-- *********************************************
	
	
	
begin
process(clk)
        begin
                if(clk='0' and clk'event) then
                        if(wr_enable='1')then
									ram(to_integer(unsigned(MAw))) <= MDw;
                        end if;
                end if;
end process;

MDr <= ram(to_integer(unsigned(MAr)));
MDr_next <= ram(to_integer(unsigned(MAr))+1);

end Behavioral;

