----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:12:06 09/27/2024 
-- Design Name: 
-- Module Name:    my_STATEMACHINE - Behavioral 
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

entity my_STATEMACHINE is
    Port ( clk_50 : in  STD_LOGIC;
           input : in  STD_LOGIC_VECTOR (3 downto 0);
           but_A : in  STD_LOGIC;
           but_B : in  STD_LOGIC;
           but_S : in  STD_LOGIC;
           but_reset : in  STD_LOGIC;
           LD7_A : out  STD_LOGIC;
           LD6_B : out  STD_LOGIC;
           LD5_S : out  STD_LOGIC;
           LD4_OUT : out  STD_LOGIC;
           leds_direita : out  STD_LOGIC_VECTOR (3 downto 0));
end my_STATEMACHINE;

architecture Behavioral of my_STATEMACHINE is

	component my_FREQDIV is
		Port ( CLOCK_50M : in  STD_LOGIC;
             my_CLOCK : out  STD_LOGIC);
   end component my_FREQDIV;
	
	component my_MUX is
		Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           S : in  STD_LOGIC_VECTOR (3 downto 0);
           Y : out  STD_LOGIC_VECTOR (3 downto 0) );
	end component my_MUX;
	
	type state is (state0, state1, state2, state3, state4, state5, state6, state7, 
						state8, state9, state10, state11, state12, state13, state14, 
						state15, state16, state17, state18, state19, state20, state21, 
						state22, state23, state24, state25, state26, state27, state28, 
						state29, state30, state31, state32, state33, state34);  

	signal state_1, aux : state := state0;
	signal my_clk : STD_LOGIC;
	signal A, B, S: STD_LOGIC_VECTOR (3 downto 0);
	signal Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7 : STD_LOGIC_VECTOR (3 downto 0);
	
begin

	divisor_freq : my_FREQDIV port map(clk_50, my_clk);
	
	op_AND: my_MUX port map (A, B,"0000", Y0);
	op_NAND: my_MUX port map (A, B,"0001",Y1);
	op_OR: my_MUX port map (A, B,"0010", Y2);
	op_NOR: my_MUX port map (A, B,"0011", Y3);
	op_NOT: my_MUX port map (A, B,"0100", Y4);
	op_ADD: my_MUX port map (A, B,"0101", Y5);
	op_SUB: my_MUX port map (A, B,"0110", Y6);
	op_MULT: my_MUX port map (A, B,"0111", Y7);

	process (my_clk, aux)
	
	begin
		if (rising_edge(my_clk)) then
			state_1 <= aux;
		end if;
	end process;
	
	process (input, but_A, but_B, but_S, but_reset, state_1, aux,
				A, B, S, Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7)
	
	begin
		
		if (but_reset = '1') then
			aux <= state0;
			leds_direita <= "0000";
			
		else
			case state_1 is
				when state0 => --entro com A
					LD7_A <= '1';
					LD6_B <= '0';
					LD5_S <= '0';
					LD4_OUT <= '0';
					
					if (but_A = '1') then
						A <= input;
						aux <= state1;
					else
						aux <= state0;
					end if;
				
				when state1 => -- entro com B
					LD7_A <= '0';
					LD6_B <= '1';
					LD5_S <= '0';
					LD4_OUT <= '0';
				
					if (but_B = '1') then
						B <= input;
						aux <= state2;
					else
						aux <= state1;
					end if;
					
				when state2 => --entro com a selecao 
					LD7_A <= '0';
					LD6_B <= '0';
					LD5_S <= '1';
					LD4_OUT <= '0';
					if (but_S = '1') then
						S <= input;						
						if (S = "0000") then
							aux <= state3;
						elsif (S = "0001") then
							aux <= state7;
						elsif (S = "0010") then
							aux <= state11;
						elsif (S = "0011") then
							aux <= state15;
						elsif (S = "0100") then
							aux <= state19;
						elsif (S = "0101") then
							aux <= state23;
						elsif (S = "0110") then
							aux <= state27;
						elsif (S = "0111") then
							aux <= state31;
						end if;
					else
						aux <= state2;
					end if;
					
				when state3 => -- and
					LD7_A <= '1';
					LD6_B <= '0';
					LD5_S <= '0';
					LD4_OUT <= '0';
					leds_direita <= A;
					aux <= state4;
				
				when state4 =>
					LD7_A <= '0';
					LD6_B <= '1';
					LD5_S <= '0';
					LD4_OUT <= '0';
					leds_direita <= B;
					aux <= state5;
					
				when state5 => --exibe a seleção do and
					LD7_A <= '0';
					LD6_B <= '0';
					LD5_S <= '1';
					LD4_OUT <= '0';
					leds_direita <= "0000";
					aux <= state6;
					
				when state6 =>
					LD7_A <= '0';
					LD6_B <= '0';
					LD5_S <= '0';
					LD4_OUT <= '1';
					leds_direita <= Y0;
					aux <= state7;

				when state7 => -- nand
					LD7_A <= '1';
					LD6_B <= '0';
					LD5_S <= '0';
					LD4_OUT <= '0';
					leds_direita <= A;
					aux <= state8;

				when state8 =>
					LD7_A <= '0';
					LD6_B <= '1';
					LD5_S <= '0';
					LD4_OUT <= '0';
					leds_direita <= B;
					aux <= state9;
				
				when state9 => -- sel nand
					LD7_A <= '0';
					LD6_B <= '0';
					LD5_S <= '1';
					LD4_OUT <= '0';
					leds_direita <= "0001";
					aux <= state10;
				
				when state10 =>
					LD7_A <= '0';
					LD6_B <= '0';
					LD5_S <= '0';
					LD4_OUT <= '1';
					leds_direita <= Y1;
					aux <= state11;

				when state11 => --or 
					LD7_A <= '1';
					LD6_B <= '0';
					LD5_S <= '0';
					LD4_OUT <= '0';
					leds_direita <= A;
					aux <= state12;
				
				when state12 =>
					LD7_A <= '0';
					LD6_B <= '1';
					LD5_S <= '0';
					LD4_OUT <= '0';
					leds_direita <= B;
					aux <= state13;
					
				when state13 => -- sel or
					LD7_A <= '0';
					LD6_B <= '0';
					LD5_S <= '1';
					LD4_OUT <= '0';
					leds_direita <= "0010";
					aux <= state14;
					
				when state14 => 
					LD7_A <= '0';
					LD6_B <= '0';
					LD5_S <= '0';
					LD4_OUT <= '1';
					leds_direita <= Y2;
					aux <= state15;

				when state15 => --nor 
					LD7_A <= '1';
					LD6_B <= '0';
					LD5_S <= '0';
					LD4_OUT <= '0';
					leds_direita <= A;
					aux <= state16;
				
				when state16 =>
					LD7_A <= '0';
					LD6_B <= '1';
					LD5_S <= '0';
					LD4_OUT <= '0';
					leds_direita <= B;
					aux <= state17;
					
				when state17 => -- sel nor
					LD7_A <= '0';
					LD6_B <= '0';
					LD5_S <= '1';
					LD4_OUT <= '0';
					leds_direita <= "0011";
					aux <= state18;
					
				when state18 =>
					LD7_A <= '0';
					LD6_B <= '0';
					LD5_S <= '0';
					LD4_OUT <= '1';
					leds_direita <= Y3;
					aux <= state19;

				when state19 => --not 
					LD7_A <= '1'; 
					LD6_B <= '0';
					LD5_S <= '0';
					LD4_OUT <= '0';
					leds_direita <= A;
					aux <= state20;
				
				when state20 =>
					LD7_A <= '0';
					LD6_B <= '1';
					LD5_S <= '0';
					LD4_OUT <= '0';
					leds_direita <= B;
					aux <= state21;
					
				when state21 => --sel not
					LD7_A <= '0';
					LD6_B <= '0';
					LD5_S <= '1';
					LD4_OUT <= '0';
					leds_direita <= "0100";
					aux <= state22;
					
				when state22 =>
					LD7_A <= '0';
					LD6_B <= '0';
					LD5_S <= '0';
					LD4_OUT <= '1';
					leds_direita <= Y4;
					aux <= state23;
					
				when state23 => -- add
					LD7_A <= '1';
					LD6_B <= '0';
					LD5_S <= '0';
					LD4_OUT <= '0';
					leds_direita <= A;
					aux <= state24;
				
				when state24 =>
					LD7_A <= '0';
					LD6_B <= '1';
					LD5_S <= '0';
					LD4_OUT <= '0';
					leds_direita <= B;
					aux <= state25;
					
				when state25 => --sel add
					LD7_A <= '0';
					LD6_B <= '0';
					LD5_S <= '1';
					LD4_OUT <= '0';
					leds_direita <= "0101";
					aux <= state26;
					
				when state26 =>
					LD7_A <= '0';
					LD6_B <= '0';
					LD5_S <= '0';
					LD4_OUT <= '1';
					leds_direita <= Y5;
					aux <= state27;

				when state27 => --sub
					LD7_A <= '1';
					LD6_B <= '0';
					LD5_S <= '0';
					LD4_OUT <= '0';
					leds_direita <= A;
					aux <= state28;
				
				when state28 =>
					LD7_A <= '0';
					LD6_B <= '1';
					LD5_S <= '0';
					LD4_OUT <= '0';
					leds_direita <= B;
					aux <= state29;
					
				when state29 => --sel sub
					LD7_A <= '0';
					LD6_B <= '0';
					LD5_S <= '1';
					LD4_OUT <= '0';
					leds_direita <= "0110";
					aux <= state30;
					
				when state30 =>
					LD7_A <= '0';
					LD6_B <= '0';
					LD5_S <= '0';
					LD4_OUT <= '1';
					leds_direita <= Y6;
					aux <= state31;
					
				when state31 => --mult
					LD7_A <= '1';
					LD6_B <= '0';
					LD5_S <= '0';
					LD4_OUT <= '0';
					leds_direita <= A;
					aux <= state32;
				
				when state32 =>
					LD7_A <= '0';
					LD6_B <= '1';
					LD5_S <= '0';
					LD4_OUT <= '0';
					leds_direita <= B;
					aux <= state33;
					
				when state33 =>
					LD7_A <= '0';
					LD6_B <= '0';
					LD5_S <= '1';
					LD4_OUT <= '0';
					leds_direita <= "0111";
					aux <= state34;
					
				when state34 =>
					LD7_A <= '0';
					LD6_B <= '0';
					LD5_S <= '0';
					LD4_OUT <= '1';
					leds_direita <= Y7;
					aux <= state3;
				
				when others =>
					null;
				
			end case;
		
		end if;
		
	end process;

end Behavioral;

