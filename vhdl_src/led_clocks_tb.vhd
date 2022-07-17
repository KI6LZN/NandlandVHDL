-- file written 16 Jun 2020
-- nandland goBoard tutorial 6
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity led_clocks_tb is
end led_clocks_tb;

architecture rtl of led_clocks_tb is
  signal i_clk : std_logic := '0';
  constant clk_period : time := 2 ns;
begin
  run_leds: entity work.led_clocks
    generic map(
      max_1Hz  => 10,
      max_2Hz  => 5,
      max_5Hz  => 2,
      max_10Hz => 1
    )
    port map(
      i_Clk   => i_clk,
      o_led1 => open,
      o_led2 => open,
      o_led3 => open,
      o_led4 => open
    );

  i_clk <= not i_clk after clk_period/2;

  process begin
    wait for 60 ns;
    assert false report "Test Complete" severity failure;
    wait;
  end process;

end rtl;
