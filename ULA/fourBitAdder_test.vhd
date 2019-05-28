--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:41:35 05/21/2019
-- Design Name:   
-- Module Name:   /home/joao/ufrj/sd/lab/ULA/fourBitAdder_test.vhd
-- Project Name:  ULA
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: fourBitAdder
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
 
ENTITY fourBitAdder_test IS
END fourBitAdder_test;
 
ARCHITECTURE behavior OF fourBitAdder_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT fourBitAdder
    PORT(
         x : IN  std_logic_vector(3 downto 0);
         y : IN  std_logic_vector(3 downto 0);
         cin : IN  std_logic;
         cout : OUT  std_logic;
         zeroFlag : OUT  std_logic;
         signFlag : OUT  std_logic;
         ovFlag : OUT  std_logic;
         sum : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal x : std_logic_vector(3 downto 0) := (others => '0');
   signal y : std_logic_vector(3 downto 0) := (others => '0');
   signal cin : std_logic := '0';

 	--Outputs
   signal cout : std_logic;
   signal zeroFlag : std_logic;
   signal signFlag : std_logic;
   signal ovFlag : std_logic;
   signal sum : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: fourBitAdder PORT MAP (
          x => x,
          y => y,
          cin => cin,
          cout => cout,
          zeroFlag => zeroFlag,
          signFlag => signFlag,
          ovFlag => ovFlag,
          sum => sum
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
   -- hold reset state for 100 ns.
   wait for 100 ns;	

      -- insert stimulus here 
	x <= "0000";
	y <= "0000";
	cin <= '1';


      wait;
   end process;



END;
