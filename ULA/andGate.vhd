----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:54:04 05/21/2019 
-- Design Name: 
-- Module Name:    andGate - Behavioral 
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

entity andGate is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           y : in  STD_LOGIC_VECTOR (3 downto 0);
           zeroFlag : out  STD_LOGIC;
           signFlag : out  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (3 downto 0));
end andGate;

architecture Behavioral of andGate is

	signal xANDy : STD_LOGIC_VECTOR (3 downto 0);

begin
	xANDy <= x AND y;

	zeroFlag <= NOT( xANDy(0) OR xANDy(1) OR xANDy(2) OR xANDy(3));
	signFlag <= xANDy(3);
	output 	<= xANDy;

end Behavioral;

