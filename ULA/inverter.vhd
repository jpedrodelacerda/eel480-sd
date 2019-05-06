library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


-- Defining entity ports
entity inverter is
  Port ( x      : in STD_LOGIC_VECTOR (3 downto 0);
         notX   : out STD_LOGIC_VECTOR (3 downto 0));
end inverter;

-- Defining architecture

architecture Behavioral of inverter is

  begin
    for i in 0 to 3 loop
      notX(i) <= not x(i);
    end loop;

end Behavioral;
