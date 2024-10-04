----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:39:00 09/20/2024 
-- Design Name: 
-- Module Name:    my_FOURBITSUBTRACTOR - Behavioral 
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

entity my_FOURBITSUBTRACTOR is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           DIFF : out  STD_LOGIC_VECTOR (3 downto 0));
end my_FOURBITSUBTRACTOR;

architecture Behavioral of my_FOURBITSUBTRACTOR is

	component my_SUBTRACTOR1BIT is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           B_in : in  STD_LOGIC;
           Difference : out  STD_LOGIC;
           B_out : out  STD_LOGIC);
   end component my_SUBTRACTOR1BIT;
	
	signal borrow : STD_LOGIC_VECTOR (3 downto 0); 
	
begin
		SUB0: my_SUBTRACTOR1BIT port map (A(0), B(0), '0', DIFF(0), borrow(0));
		SUB1: my_SUBTRACTOR1BIT port map (A(1), B(1), borrow(0), DIFF(1), borrow(1));
		SUB2: my_SUBTRACTOR1BIT port map (A(2), B(2), borrow(1), DIFF(2), borrow(2));
		SUB3: my_SUBTRACTOR1BIT port map (A(3), B(3), borrow(2), DIFF(3), borrow(3));

end Behavioral;

