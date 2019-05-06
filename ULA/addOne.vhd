library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


-- Defining entity ports
entity addOne is
  port ( x          : in STD_LOGIC_VECTOR (3 downto 0);
         cin        : in STD_LOGIC;
         cout, ov   : out STD_LOGIC;
         sum        : out STD_LOGIC_VECTOR (3 downto 0));
end addOne;

-- Defining Architecture

architecture Behavioral of addOne is
  
  -- Defining the '0001' vector
  -- signal vectorOne : STD_LOGIC_VECTOR (3 downto 0);
  -- To pass the carries around
  signal carries : STD_LOGIC_VECTOR(3 downto 0);

  -- Importing fullAdder
  component fullAdder
  port ( x, y, cin      : in STD_LOGIC;
         cout, sum      : out STD_LOGIC;)
  end component;

begin

  FA(0): fullAdder port map (x(0), '1', cin, carries(0), sum(0));
  genOne: FOR i in 1 to 3 GENERATE 
    FA(i): fullAdder port map (x(i), '0', carries(i-1), carries(i),sum(i));
  end GENERATE;

   ov <= carries(2) XOR carries(3);
   cout <= carries(3);

end Behavioral;
