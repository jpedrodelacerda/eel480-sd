--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:13:18 05/24/2019
-- Design Name:   
-- Module Name:   /home/joao/ufrj/sd/lab/ULA/ULA_test.vhd
-- Project Name:  ULA
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ULA
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
 
ENTITY ULA_test IS
END ULA_test;
 
ARCHITECTURE behavior OF ULA_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ULA
    PORT(
         selection : IN  std_logic_vector(3 downto 0);
         x : IN  std_logic_vector(3 downto 0);
         y : IN  std_logic_vector(3 downto 0);
         cout : OUT  std_logic;
         zeroFlag : OUT  std_logic;
         signFlag : OUT  std_logic;
         ovFlag : OUT  std_logic;
         output : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal selection : std_logic_vector(3 downto 0) := (others => '0');
   signal x : std_logic_vector(3 downto 0) := (others => '0');
   signal y : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal cout : std_logic;
   signal zeroFlag : std_logic;
   signal signFlag : std_logic;
   signal ovFlag : std_logic;
   signal output : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ULA PORT MAP (
          selection => selection,
          x => x,
          y => y,
          cout => cout,
          zeroFlag => zeroFlag,
          signFlag => signFlag,
          ovFlag => ovFlag,
          output => output
        );

   -- Clock process definitions
--   <clock>_process :process
 --  begin
--		<clock> <= '0';
--		wait for <clock>_period/2;
--		<clock> <= '1';
--		wait for <clock>_period/2;
  -- end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

   --   wait for <clock>_period*10;
	selection <= "0010";
	x <= "0000";
	y <= "0000";


      -- insert stimulus here 

      wait;
   end process;

END;
