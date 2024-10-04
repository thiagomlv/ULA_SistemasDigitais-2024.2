----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:26:00 09/27/2024 
-- Design Name: 
-- Module Name:    my_MUX - Behavioral 
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

entity my_MUX is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           S : in  STD_LOGIC_VECTOR (3 downto 0);
           Y : out  STD_LOGIC_VECTOR (3 downto 0) );
end my_MUX;

architecture Behavioral of my_MUX is

	component my_AND is
		Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
             B : in  STD_LOGIC_VECTOR (3 downto 0);
             Y : out  STD_LOGIC_VECTOR (3 downto 0) );
   end component my_AND;

	component my_NAND is
		Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
             B : in  STD_LOGIC_VECTOR (3 downto 0);
             W : out  STD_LOGIC_VECTOR (3 downto 0) );
	end component my_NAND;
		
	component my_OR is
		Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
             B : in  STD_LOGIC_VECTOR (3 downto 0);
             X : out  STD_LOGIC_VECTOR (3 downto 0) );
	end component my_OR;
		
	component my_NOR is
		Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
				 B : in  STD_LOGIC_VECTOR (3 downto 0);
			    V : out  STD_LOGIC_VECTOR (3 downto 0) );
	end component my_NOR;
	
	component my_NOT is
		Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
             Z : out  STD_LOGIC_VECTOR (3 downto 0) );
	end component my_NOT;
	
	component my_FOURBITSUM is
		Port ( A, B : in STD_LOGIC_VECTOR (3 downto 0);
			    C_out : out STD_LOGIC;
             sum : out STD_LOGIC_VECTOR (3 downto 0) );
	end component my_FOURBITSUM;
	
	component my_FOURBITSUBTRACTOR is
		Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
             B : in  STD_LOGIC_VECTOR (3 downto 0);
             DIFF : out  STD_LOGIC_VECTOR (3 downto 0) );
	end component my_FOURBITSUBTRACTOR;
		
	component my_FOURBITMULTIPLIER is
      Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
             B : in  STD_LOGIC_VECTOR (3 downto 0);
             Y : out  STD_LOGIC_VECTOR (3 downto 0) );
	end component my_FOURBITMULTIPLIER;
	
	signal d7, d6, d5, d4, d3, d2, d1, d0: STD_LOGIC_VECTOR (3 downto 0);
	signal carry_out : STD_LOGIC;
	
begin

	OP_AND : my_AND port map(A, B, d0);
	OP_NAND : my_NAND port map(A, B, d1);
	OP_OR : my_OR port map(A, B, d2);
	OP_NOR : my_NOR port map(A, B, d3);
	OP_NOT : my_NOT port map(A, d4);
	OP_ADD : my_FOURBITSUM port map(A, B, carry_out, d5);
	OP_SUB : my_FOURBITSUBTRACTOR port map(A, B, d6);
	OP_MULT : my_FOURBITMULTIPLIER port map(A, B, d7);
	
	processo_1 : process(S, d0, d1, d2, d3, d4, d5, d6, d7)
	
		begin
		
			if (S = "0000") then --and
				Y <= d0;
				
			elsif (S = "0001") then --nand
				Y <= d1;
					
			elsif (S = "0010") then --or
				Y <= d2;
			
			elsif (S = "0011") then --nor
				Y <= d3;
					
			elsif (S = "0100") then --not 
				Y <= d4;
					
			elsif (S = "0101") then --adder
				Y <= d5;
					
			elsif (S = "0110") then --subtractor
				Y <= d6;
				
			elsif (S = "0111") then --multiplier
				Y <= d7;
			
			end if;
	
	end process processo_1;
	
end Behavioral;

