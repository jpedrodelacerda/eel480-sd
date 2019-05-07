library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity counter is
  port ( load, clk, rst : bit
         loadData      : in integer range 300000000 downto 0;
         output         : out integer range 300000000 downto 0);
end counter;

architecture hardware of counter is

begin
  counting: process(clk, rst)
    variable count : integer range 300000000 downto 0;

  begin
    if (rst = '1') then
      count := 0;
    elsif (clk'event and clk = '1') then
      if (load = '1') then
        contando := loadData;
      else
        -- Resets after limit
        if (count >= 300000000) then
          count := 0;
        else
          count := count + 1;
        end if;
      end if;
    end if;
    output <= count;
  end process;
end hardware
