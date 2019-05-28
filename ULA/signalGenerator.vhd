----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:21:20 05/21/2019 
-- Design Name: 
-- Module Name:    signalGenerator - Behavioral 
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

entity signalGenerator is
    Port ( CLK : in STD_LOGIC;
			  limit : in integer range 3000000000 downto 0;
			  signals : out  STD_LOGIC_VECTOR (9 downto 0));
end signalGenerator;

architecture Behavioral of signalGenerator is

-- Initial count
SIGNAL count : integer range 3000000000 downto 0 := 0;

begin

process(CLK)

	if (CLK'event AND CLK = '1') then
		countLabel: while (count < limit) loop
			count <= count + '1' -- count up
			end countLabel;
			count = 0;		
	end if;

end process;
	

end Behavioral;