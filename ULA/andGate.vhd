library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


-- Defining entity ports
entity andGate is
  port ( x, y           : in STD_LOGIC_VECTOR (3 downto 0);
         output         : out STD_LOGIC_VECTOR (3 downto 0);
end andGate;

architecture andArch of andGate is

begin

  process(y, x)
  begin
    for i in 0 to 3 loop
      output(i) <= x(i) AND y(i);
    end loop;
  end process;

end andArch;  
