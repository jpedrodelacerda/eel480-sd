----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:34:07 05/21/2019 
-- Design Name: 
-- Module Name:    TwosComplementer - Behavioral 
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

entity twosComplementer is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           zeroFlag : out  STD_LOGIC;
           signFlag : out  STD_LOGIC;
			  ovFlag : out STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (3 downto 0));
end twosComplementer;

architecture Behavioral of twosComplementer is

component addOne is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           cin : in  STD_LOGIC;
           cout : out  STD_LOGIC;
           zeroFlag : out  STD_LOGIC;
           signFlag : out  STD_LOGIC;
           ovFlag : out  STD_LOGIC;
           sum : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

SIGNAL sumAdder : STD_LOGIC;
SIGNAL zeroFlagAdder : STD_LOGIC;
SIGNAL signFlagAdder : STD_LOGIC;
SIGNAL ovFlagAdder : STD_LOGIC;
SIGNAL notX : STD_LOGIC_VECTOR(3 downto 0);

SIGNAL oneAdder : STD_LOGIC_VECTOR(3 downto 0);
SIGNAL zeroVector : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');


begin

	notX <= NOT x;

	label2: fourBitAdder port map (notX, zeroVector, '1', cout, zeroFlag, signFlag, ovFlag, sum);

end Behavioral;

