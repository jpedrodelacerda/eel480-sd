----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:46:31 05/23/2019 
-- Design Name: 
-- Module Name:    counterClockReductor - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counterClockReductor is
    Port ( selector : in  STD_LOGIC_VECTOR (3 downto 0);
           clk : in  STD_LOGIC;
           step : out  STD_LOGIC_VECTOR (1 downto 0);
           leds : out  STD_LOGIC_VECTOR (3 downto 0));
end counterClockReductor;

architecture Behavioral of counterClockReductor is

component ULA is
    Port ( selection : in STD_LOGIC_VECTOR (3 downto 0);
			  x : in  STD_LOGIC_VECTOR (3 downto 0);
           y : in  STD_LOGIC_VECTOR (3 downto 0);
           cout : out  STD_LOGIC;
           zeroFlag : out  STD_LOGIC;
           signFlag : out  STD_LOGIC;
           ovFlag : out  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

-- Steps:
-- #00: Show inputV1
-- #01: Show inputV2
-- #02: Show Results
-- #03: Show Flags

-- CountVector
SIGNAL counterVector : UNSIGNED (7 downto 0) := "00000000";

-- Flags:
SIGNAL ledCOut : STD_LOGIC := '0';
SIGNAL ledZeroFlag : STD_LOGIC := '0';
SIGNAL ledSignFlag : STD_LOGIC := '0';
SIGNAL ledOVFlag : STD_LOGIC := '0';

-- Input Vectors:
SIGNAL inputV1 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
SIGNAL inputV2 : STD_LOGIC_VECTOR (3 downto 0) := "0000";

-- Output
SIGNAL outputVector : STD_LOGIC_VECTOR (3 downto 0) := "0000";


begin

-- Map Vectors:
inputV1(0) <= counterVector(0);
inputV1(1) <= counterVector(1);
inputV1(2) <= counterVector(2);
inputV1(3) <= counterVector(3);
inputV2(0) <= counterVector(4);
inputV2(1) <= counterVector(5);
inputV2(2) <= counterVector(6);
inputV2(3) <= counterVector(7);

-- Map ULA:
use_ULA: ULA port map (selector, inputV1, inputV2, ledCOut, ledZeroFlag, ledSignFlag, ledOVFlag, outputVector);

process(clk)

	VARIABLE showSteps : integer range 3 downto 0 := 0;
	VARIABLE reductorCount : integer range 50000000 downto 0 := 0;

-- Clock up pulse
begin
if (clk'event and clk = '1') then

	if ( reductorCount <= 50000000 ) then
		reductorCount := reductorCount + 1;
	else

		if ( showSteps = 0 ) then -- Input1
			leds <= inputV1;
			step <= "00";
		elsif ( showSteps = 1) then -- Input2
			leds <= inputV2;
			step <= "01";
		elsif ( showSteps = 2 ) then -- Result
			leds <= outputVector;
			step <= "10";
		elsif ( showSteps = 3 ) then -- Flags
			leds(0) <= ledCOut;
			leds(1) <= ledZeroFlag;
			leds(2) <= ledSignFlag;
			leds(3) <= ledOVFlag;
			step <= "11";
			counterVector <= counterVector + 1;
		end if;
		
		if ( showSteps = 3 ) then
			showSteps := 0;
		else
			showSteps := showSteps +1;
		end if;
	
		reductorCount := 0;
	
	end if;
	
end if;

end process;	

end Behavioral;