----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:27:18 09/13/2024 
-- Design Name: 
-- Module Name:    my_FOURBITSUM - Behavioral 
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

entity my_FOURBITSUM is
    Port ( A, B : in STD_LOGIC_VECTOR (3 downto 0);
			  C_out : out STD_LOGIC;
           sum : out STD_LOGIC_VECTOR (3 downto 0));
end my_FOURBITSUM;

architecture Behavioral of my_FOURBITSUM is
	
	signal c: STD_LOGIC_VECTOR (3 downto 0);
	
	component my_FULLADDER
		port(A, B, C: in STD_LOGIC;
				sum, carry: out STD_LOGIC);
	end component;
	
	begin
	
		ADD0: my_FULLADDER port map (A(0), B(0), '0', sum(0), c(0));
		ADD1: my_FULLADDER port map (A(1), B(1), c(0), sum(1), c(1));
		ADD2: my_FULLADDER port map (A(2), B(2), c(1), sum(2), c(2));
		ADD3: my_FULLADDER port map (A(3), B(3), c(2), sum(3), c(3));
			
		C_out <= c(3);
		
end Behavioral;

