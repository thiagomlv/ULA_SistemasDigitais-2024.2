--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:43:00 10/02/2024
-- Design Name:   
-- Module Name:   /home/sd/Downloads/my_ULA/my_TESTBENCH.vhd
-- Project Name:  my_ULA
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: my_STATEMACHINE
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY my_TESTBENCH IS
END my_TESTBENCH;
 
ARCHITECTURE behavior OF my_TESTBENCH IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT my_STATEMACHINE
    PORT(
         clk_50 : IN  std_logic;
         input : IN  std_logic_vector(3 downto 0);
         but_A : IN  std_logic;
         but_B : IN  std_logic;
         but_S : IN  std_logic;
         but_reset : IN  std_logic;
         LD7_A : OUT  std_logic;
         LD6_B : OUT  std_logic;
         LD5_S : OUT  std_logic;
         LD4_OUT : OUT  std_logic;
         leds_direita : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk_50 : std_logic := '0';
   signal input : std_logic_vector(3 downto 0) := (others => '0');
   signal but_A : std_logic := '0';
   signal but_B : std_logic := '0';
   signal but_S : std_logic := '0';
   signal but_reset : std_logic := '0';

 	--Outputs
   signal LD7_A : std_logic;
   signal LD6_B : std_logic;
   signal LD5_S : std_logic;
   signal LD4_OUT : std_logic;
   signal leds_direita : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_50_period : time := 10 ns;
	signal sinal : STD_LOGIC;
	
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: my_STATEMACHINE PORT MAP (
          clk_50 => clk_50,
          input => input,
          but_A => but_A,
          but_B => but_B,
          but_S => but_S,
          but_reset => but_reset,
          LD7_A => LD7_A,
          LD6_B => LD6_B,
          LD5_S => LD5_S,
          LD4_OUT => LD4_OUT,
          leds_direita => leds_direita
        );

   -- Clock process definitions
   clk_50_process :process
   begin
		clk_50 <= '0';
		wait for clk_50_period/2;
		clk_50 <= '1';
		wait for clk_50_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		

      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_50_period*10;
		
		-- insert stimulus here 

		A <= "0001";
		B <= "0001";
		S <= "0000";
      
		wait for clk_50_period*10;

		S <= "0001";
		
		wait for clk_50_period*10;

		S <= "0010";
		
		wait for clk_50_period*10;
	
		S <= "0011";
		
		wait for clk_50_period*10;
		
		S <= "0100";
		
		wait for clk_50_period*10;
	
		S <= "0101";
		
		wait for clk_50_period*10;

		S <= "0110";
		
		wait for clk_50_period*10;


		S <= "0111";

      wait;
   end process;

END;
