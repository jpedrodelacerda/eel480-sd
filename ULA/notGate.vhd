----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:08:54 05/21/2019 
-- Design Name: 
-- Module Name:    notGate - Behavioral 
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

entity notGate is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           zeroFlag : out  STD_LOGIC;
           signFlag : out  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (3 downto 0));
end notGate;

architecture Behavioral of notGate is

	signal notX : STD_LOGIC_VECTOR (3 downto 0);

begin

	notX <= NOT x;
	
	zeroFlag <= NOT( notX(0) OR notX(1) OR notX(2) OR notX(3));
	signFlag <= notX(3);
	output 	<= notX;

end Behavioral;

