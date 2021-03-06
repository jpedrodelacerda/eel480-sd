--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:50:23 05/21/2019
-- Design Name:   
-- Module Name:   /home/joao/ufrj/sd/lab/ULA/twosComplementer_test.vhd
-- Project Name:  ULA
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: twosComplementer
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
 
ENTITY twosComplementer_test IS
END twosComplementer_test;
 
ARCHITECTURE behavior OF twosComplementer_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT twosComplementer
    PORT(
         x : IN  std_logic_vector(3 downto 0);
         zeroFlag : OUT  std_logic;
         signFlag : OUT  std_logic;
         output : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal x : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal zeroFlag : std_logic;
   signal signFlag : std_logic;
   signal output : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: twosComplementer PORT MAP (
          x => x,
          zeroFlag => zeroFlag,
          signFlag => signFlag,
          output => output
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	


      -- insert stimulus here 
	x <= "0001";

      wait;
   end process;

END;
