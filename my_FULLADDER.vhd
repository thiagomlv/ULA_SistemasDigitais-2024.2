----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:03:35 09/13/2024 
-- Design Name: 
-- Module Name:    my_FULLADDER - Behavioral 
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

entity my_FULLADDER is
    Port ( A, B, C : in  STD_LOGIC;
           CARRY, SUM : out  STD_LOGIC);
end my_FULLADDER;

architecture Behavioral of my_FULLADDER is

	signal XOR_1, AND_1, AND_2: STD_LOGIC;
	
begin

	XOR_1 <= A XOR B;
	AND_1 <= A AND B;
	AND_2 <= C AND XOR_1;
	SUM <= XOR_1 XOR C;
	CARRY <= AND_1 OR AND_2;

end Behavioral;

