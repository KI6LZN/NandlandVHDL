-- file written 16 Jun 2020
-- nandland goBoard tutorial 6
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity led_clocks_top is
  port(
    i_Clk   : in  std_logic;

    o_LED_1 : out std_logic;
    o_LED_2 : out std_logic;
    o_LED_3 : out std_logic;
    o_LED_4 : out std_logic
  );
end led_clocks_top;

architecture rtl of led_clocks_top is
begin
  run_leds: entity work.led_clocks
    generic map(
      max_1Hz  => 12500000,
      max_2Hz  => 6250000,
      max_5Hz  => 2500000,
      max_10Hz => 1250000
    )
    port map(
      i_Clk  => i_Clk,
      o_led1 => o_LED_1,
      o_led2 => o_LED_2,
      o_led3 => o_LED_3,
      o_led4 => o_LED_4
    );

end rtl;
