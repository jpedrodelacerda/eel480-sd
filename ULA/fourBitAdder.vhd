----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:27:56 05/21/2019 
-- Design Name: 
-- Module Name:    fourBitAdder - Behavioral 
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

entity fourBitAdder is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           y : in  STD_LOGIC_VECTOR (3 downto 0);
           cin : in  STD_LOGIC;
           cout : out  STD_LOGIC;
           zeroFlag : out  STD_LOGIC;
           signFlag : out  STD_LOGIC;
           ovFlag : out  STD_LOGIC;
           sum : out  STD_LOGIC_VECTOR (3 downto 0));
end fourBitAdder;

architecture Behavioral of fourBitAdder is

-- Importing fullAdder
    component fullAdder is
    Port ( x, y, cin      : in STD_LOGIC;
			  cout, sum      : out STD_LOGIC);
	 end component; 

SIGNAL carries : STD_LOGIC_VECTOR(3 downto 0);
SIGNAL FA : STD_LOGIC_VECTOR(3 downto 0);

begin
  
  FA_0: fullAdder port map (x(0), y(0), cin,			 carries(0), FA(0));
  FA_1: fullAdder port map (x(1), y(1), carries(0), carries(1), FA(1));
  FA_2: fullAdder port map (x(2), y(2), carries(1), carries(2), FA(2));
  FA_3: fullAdder port map (x(3), y(3), carries(2), carries(3), FA(3));
  

  zeroFlag <= NOT (FA(0) OR FA(1) OR FA(2) OR FA(3));
  signFlag <= FA(3);
  ovFlag <= carries(2) XOR carries(3);
  cout <= carries(3);
	
	sum <= FA;

end Behavioral;

