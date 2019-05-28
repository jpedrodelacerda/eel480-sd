----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:14:35 05/21/2019 
-- Design Name: 
-- Module Name:    addOne - Behavioral 
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

entity addOne is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           cout : out  STD_LOGIC;
           zeroFlag : out  STD_LOGIC;
           signFlag : out  STD_LOGIC;
           ovFlag : out  STD_LOGIC;
           sum : out  STD_LOGIC_VECTOR (3 downto 0));
end addOne;

architecture Behavioral of addOne is

-- Importing fourBitAdder
component fourBitAdder is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           y : in  STD_LOGIC_VECTOR (3 downto 0);
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

SIGNAL fBAdder : STD_LOGIC_VECTOR(3 downto 0);
SIGNAL zeroVector : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');

begin

	label2: fourBitAdder port map (x, zeroVector, '1', cout, zeroFlag, signFlag, ovFlag, sum);

--  zeroFlag <= NOT (FA(0) OR FA(1) OR FA(2) OR FA(3));
--  signFlag <= FA(3);
--  ovFlag <= carries(2) XOR carries(3);
--  cout <= carries(3);
	
--	sum <= FA;

end Behavioral;

