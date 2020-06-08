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
-- Set for 250,000 clock ticks of 25 MHz clock (10 ms)
  constant c_DEBOUNCE_LIMIT : integer := 250000;

  signal count_i : integer range 0 to c_DEBOUNCE_LIMIT := 0;
  signal state_i : std_logic := '0';
begin

  process(i_clk) begin
    if(rising_edge(i_clk)) then
      -- Switch input is different than internal switch value, so an input is
      -- changing.  Increase counter until it is stable for c_DEBOUNCE_LIMIT.
      if (i_trig /= state_i and count_i < c_DEBOUNCE_LIMIT) then
        count_i <= count_i + 1;

      -- End of counter reached, switch is stable, register it, reset counter
      elsif count_i = c_DEBOUNCE_LIMIT then
        state_i <= i_trig;
        count_i <= 0;

      -- Switches are the same state, reset the counter
      else
        count_i <= 0;

      end if;
    end if;
  end process;

  o_stable <= state_i;

end rtl;
