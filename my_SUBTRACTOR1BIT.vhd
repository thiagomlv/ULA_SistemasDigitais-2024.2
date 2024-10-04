----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:30:11 09/20/2024 
-- Design Name: 
-- Module Name:    my_SUBTRACTOR1BIT - Behavioral 
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

entity my_SUBTRACTOR1BIT is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           B_in : in  STD_LOGIC;
           Difference : out  STD_LOGIC;
           B_out : out  STD_LOGIC);
end my_SUBTRACTOR1BIT;

architecture Behavioral of my_SUBTRACTOR1BIT is

	signal XOR_1, AND_1, AND_2 : STD_LOGIC;
	
begin
	
	XOR_1 <= A XOR B;
	Difference <= XOR_1 XOR B_in;
	AND_1 <= not A and B;
	AND_2 <= not B_in and XOR_1;
	B_out <= AND_1 or AND_2;

end Behavioral;

