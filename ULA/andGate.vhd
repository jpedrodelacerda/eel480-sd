library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity andGate is
  port ( x, y                 : in STD_LOGIC_VECTOR (3 downto 0);
         output               : out STD_LOGIC_VECTOR (3 downto 0);
         zeroFlag, signFlag   : out STD_LOGIC);
end andGate;

architecture andArch of andGate is

begin

  process(y, x)
  begin
    for i in 0 to 3 loop
      output(i) <= x(i) AND y(i);
    end loop;
  end process;

  zeroFlag <= NOT (output(0) OR output(1) OR output(2) OR output(3));
  signFlag <= output(3);

end andArch;  
