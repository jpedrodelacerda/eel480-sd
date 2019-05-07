library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity twosComplementer is
  port ( x          : in STD_LOGIC_VECTOR (3 downto 0);
         output     : out STD_LOGIC_VECTOR (3 downto 0);
         zeroFlag, signFlag   : out STD_LOGIC);
end twosComplementer;

architecture Behavioral of twosComplementer is

  component addOne
    port ( x                                  : in STD_LOGIC_VECTOR (3 downto 0);
           cin                                : in STD_LOGIC;
           cout, zeroFlag, signFlag, ovFlag   : out STD_LOGIC;
           sum                                : out STD_LOGIC_VECTOR (3 downto 0));

  end component;

  component inverter
    port ( x                    : in STD_LOGIC_VECTOR (3 downto 0);
           notX                 : out STD_LOGIC_VECTOR (3 downto 0);
           zeroFlag, signFlag   : out STD_LOGIC);
  end component;

  signal inverted : STD_LOGIC_VECTOR (3 downto 0);
  signal twosComplemented: STD_LOGIC_VECTOR (3 downto 0);
  
begin

  -- Invert X and add one to it.

  invertLabel : inverter port map (x, inverted, zeroFlag, signFlag);
  addOnelabel : addOne port map (x, '0', cout, zeroFlag, signFlag, ovFlag, twoComplemented);

  output <= twosComplemented;

  zeroFlag <= NOT (output(0) OR output(1) OR output(2) OR output(3));
  signFlag <= output(3);
  
end Behavioral;
