----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:20:02 09/20/2024 
-- Design Name: 
-- Module Name:    my_FOURBITMULTIPLIER - Behavioral 
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

entity my_FOURBITMULTIPLIER is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           Y : out  STD_LOGIC_VECTOR (3 downto 0));
end my_FOURBITMULTIPLIER;

architecture Behavioral of my_FOURBITMULTIPLIER is

	component my_FOURBITSUM is
    Port ( A, B : in STD_LOGIC_VECTOR (3 downto 0);
			  C_out : out STD_LOGIC;
           sum : out STD_LOGIC_VECTOR (3 downto 0));
	end component my_FOURBITSUM;
	
	signal AND_1: STD_LOGIC_VECTOR (3 downto 0); 
	signal AND_2: STD_LOGIC_VECTOR (3 downto 0);	
	signal AND_3: STD_LOGIC_VECTOR (3 downto 0); 
	signal AND_4: STD_LOGIC_VECTOR (3 downto 0);
	
	signal CARRY : STD_LOGIC_VECTOR (2 downto 0);
	
	signal SOMA_1: STD_LOGIC_VECTOR (3 downto 0);
	signal SOMA_2: STD_LOGIC_VECTOR (3 downto 0);	
	signal SOMA_3: STD_LOGIC_VECTOR (3 downto 0);

	signal input_adder_2: STD_LOGIC_VECTOR (3 downto 0);
	signal input_adder_3: STD_LOGIC_VECTOR (3 downto 0);

begin

	AND_1(0) <= A(1) AND B(0);
	AND_1(1) <= A(2) AND B(0);
	AND_1(2) <= A(3) AND B(0);
	AND_1(3) <= '0';
	
	AND_2(0) <= A(0) AND B(1);
	AND_2(1) <= A(1) AND B(1);
	AND_2(2) <= A(2) AND B(1);
	AND_2(3) <= A(3) AND B(1);
	
	AND_3(0) <= A(0) AND B(2);
	AND_3(1) <= A(1) AND B(2);
	AND_3(2) <= A(2) AND B(2);
	AND_3(3) <= A(3) AND B(2);
	
	AND_4(0) <= A(0) AND B(3);
	AND_4(1) <= A(1) AND B(3);
	AND_4(2) <= A(2) AND B(3);
	AND_4(3) <= A(3) AND B(3);	

	input_adder_2(0) <= SOMA_1(1);
	input_adder_2(1) <= SOMA_1(2);
	input_adder_2(2) <= SOMA_1(3);
	input_adder_2(3) <= CARRY(0);
	
	input_adder_3(0) <= SOMA_2(1);
	input_adder_3(1) <= SOMA_2(2);
	input_adder_3(2) <= SOMA_2(3);
	input_adder_3(3) <= CARRY(1);
	
	soma_aux1: my_FOURBITSUM port map (AND_1, AND_2, CARRY(0), SOMA_1);
   soma_aux2: my_FOURBITSUM port map (input_adder_2, AND_3, CARRY(1), SOMA_2);
	soma_aux3: my_FOURBITSUM port map (input_adder_3, AND_4, CARRY(2), SOMA_3);
	
	Y(0) <= A(0) AND B(0);
	Y(1) <= SOMA_1(0); 
	Y(2) <= SOMA_2(0);
	Y(3) <= SOMA_3(0);

end Behavioral;

