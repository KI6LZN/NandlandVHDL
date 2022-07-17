-- file written 07 Jun 2020
-- nandland goBoard tutorial 4
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity debounce_filter is
  port(
    i_clk    : in  std_logic;
    i_trig   : in  std_logic;

    o_stable : out std_logic
  );
end debounce_filter;

architecture rtl of debounce_filter is
  constant DEBOUNCE_LIMIT : integer := 250000;

  signal count_i : integer range 0 to DEBOUNCE_LIMIT := 0;
  signal state_i : std_logic := '0';
begin

  process(i_clk) begin
    if(rising_edge(i_clk)) then

      if (count_i < DEBOUNCE_LIMIT and i_trig /= state_i) then
        count_i <= count_i + 1;

      elsif count_i = DEBOUNCE_LIMIT then
        state_i <= i_trig;
        count_i <= 0;

      else
        count_i <= 0;

      end if;
    end if;
  end process;

  o_stable <= state_i;

end rtl;
