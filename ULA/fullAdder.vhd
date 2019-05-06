library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


-- Defining entity ports
entity fullAdder is
  port ( x, y, cin      : in STD_LOGIC;
         cout, sum      : out STD_LOGIC;)
end Adder1Bit;

-- Defining Architecture

architecture Behavioral of fullAdder is
  
begin

  S     <= (x XOR y) XOR cin
  cout  <= ((x AND y) or (x AND cin)) OR (x AND cin);

end Behavioral;
