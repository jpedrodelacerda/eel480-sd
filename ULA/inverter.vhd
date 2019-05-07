library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity inverter is
  Port ( x      : in STD_LOGIC_VECTOR (3 downto 0);
         notX   : out STD_LOGIC_VECTOR (3 downto 0);
         zeroFlag, signFlag   : out STD_LOGIC);
end inverter;

architecture Behavioral of inverter is

  begin
    for i in 0 to 3 loop
      notX(i) <= not x(i);
    end loop;
    
  zeroFlag <= NOT (output(0) OR output(1) OR output(2) OR output(3));
  signFlag <= output(3);

end Behavioral;
