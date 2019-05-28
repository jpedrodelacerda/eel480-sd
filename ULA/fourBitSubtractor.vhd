----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:01:48 05/21/2019 
-- Design Name: 
-- Module Name:    fourBitSubtractor - Behavioral 
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

entity fourBitSubtractor is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           y : in  STD_LOGIC_VECTOR (3 downto 0);
           borrowFlag : out  STD_LOGIC;
           zeroFlag : out  STD_LOGIC;
           signFlag : out  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (3 downto 0));
end fourBitSubtractor;

architecture Behavioral of fourBitSubtractor is

component twosComplementer is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           zeroFlag : out  STD_LOGIC;
           signFlag : out  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

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

SIGNAL borrow : STD_LOGIC;
SIGNAL zeroFlagComp : STD_LOGIC;
SIGNAL signFlagComp : STD_LOGIC;
SIGNAL borrowFlagComp : STD_LOGIC;
SIGNAL complemented : STD_LOGIC_VECTOR (3 downto 0);

begin

-- Complementing the Y.
complement: twosComplementer port map (y, zeroFlagComp, signFlagComp, complemented);

--output <= complemented;

-- X + (-Y):
subctract: fourBitAdder port map (x, complemented, '0', borrow, zeroFlag, signFlag, borrowFlag, output);


end Behavioral;

