library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity xorGate is
  port ( x, y                 : in STD_LOGIC_VECTOR (3 downto 0);
         output               : out STD_LOGIC_VECTOR (3 downto 0);
         zeroFlag, signFlag   : out STD_LOGIC);
end xorGate;

architecture xorArch of xorGate is

begin

  process(y, x)
  begin
    for i in 0 to 3 loop
      output(i) <= x(i) XOR y(i);
    end loop;
  end process;

  zeroFlag <= NOT (output(0) OR output(1) OR output(2) OR output(3));
  signFlag <= output(3);
  
end xorArch;  
