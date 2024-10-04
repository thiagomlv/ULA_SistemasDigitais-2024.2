----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:03:43 09/27/2024 
-- Design Name: 
-- Module Name:    my_FREQDIV - Behavioral 
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

entity my_FREQDIV is
    Port ( CLOCK_50M : in  STD_LOGIC;
           my_CLOCK : out  STD_LOGIC);
end my_FREQDIV;

architecture Behavioral of my_FREQDIV is

	signal saida: std_logic;
	signal counter: integer range 0 to 49999999 := 0;

begin
	CLK: process (CLOCK_50M) begin
		if (rising_edge(CLOCK_50M)) then
			if (counter = 49999999) then
				saida <= not (saida);
				counter <= 0;
			else
				counter <= counter + 1;
			end if;
		end if;
	end process;
	my_CLOCK <= saida;

end Behavioral;

