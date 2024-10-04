--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:41:37 09/13/2024
-- Design Name:   
-- Module Name:   /home/sd/my_ULA/teste_somador.vhd
-- Project Name:  my_ULA
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: my_FOURBITSUM
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
 
ENTITY teste_somador IS
END teste_somador;
 
ARCHITECTURE behavior OF teste_somador IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT my_FOURBITSUM
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         C_in : IN  std_logic;
         sum : OUT  std_logic_vector(3 downto 0);
         C_out : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');
   signal C_in : std_logic := '0';

 	--Outputs
   signal sum : std_logic_vector(3 downto 0);
   signal C_out : std_logic;
   -- No clocks detected in port list. Replace clock below with 
   -- appropriate port name 
 
   constant clock_period : time := 10 ns;
	signal clock: STD_LOGIC;
	
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: my_FOURBITSUM PORT MAP (
          A => A,
          B => B,
          C_in => C_in,
          sum => sum,
          C_out => C_out
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		
		A <= "0101";
		B <= "1000";
		C_in <= '0';
		
      -- hold reset state for 15 ns.
      wait for 15 ns;	
		
		A <= "0011";
		B <= "1010";
		C_in <= '0';
		
      wait for clock_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
