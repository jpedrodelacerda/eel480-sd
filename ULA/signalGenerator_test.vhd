--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:34:58 05/21/2019
-- Design Name:   
-- Module Name:   /home/joao/ufrj/sd/lab/ULA/signalGenerator_test.vhd
-- Project Name:  ULA
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: signalGenerator
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
 
ENTITY signalGenerator_test IS
END signalGenerator_test;
 
ARCHITECTURE behavior OF signalGenerator_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT signalGenerator
    PORT(
         CLK : IN  std_logic;
         upOrDown : IN  std_logic;
         signals : OUT  std_logic_vector(9 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal upOrDown : std_logic := '0';

 	--Outputs
   signal signals : std_logic_vector(9 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: signalGenerator PORT MAP (
          CLK => CLK,
          upOrDown => upOrDown,
          signals => signals
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for CLK_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
