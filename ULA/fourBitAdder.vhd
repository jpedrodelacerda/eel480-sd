library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fourBitAdder is
  port ( x, y                               : in STD_LOGIC_VECTOR (3 downto 0);
         cin                                : in STD_LOGIC;
         cout, zeroFlag, signFlag, ovFlag   : out STD_LOGIC;
         sum                                : out STD_LOGIC_VECTOR (3 downto 0));
end fourBitAdder;

architecture Behavioral of fourBitAdder is

  -- To pass the carries around
  signal carries : STD_LOGIC_VECTOR(3 downto 0);

  -- Importing fullAdder
  component fullAdder
  port ( x, y, cin      : in STD_LOGIC;
         cout, sum      : out STD_LOGIC)
  end component;

begin

  FA(0): fullAdder port map (x(0), y(0), cin, carries(0), sum(0));
  genOne: FOR i in 1 to 3 GENERATE 
    FA(i): fullAdder port map (x(i), y(i), carries(i-1), carries(i),sum(i));
  end GENERATE;

  zeroFlag <= NOT (output(0) OR output(1) OR output(2) OR output(3));
  signFlag <= output(3);
  ovFlag <= carries(2) XOR carries(3);
  cout <= carries(3);

end Behavioral;
