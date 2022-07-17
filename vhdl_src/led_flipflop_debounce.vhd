-- file written 07 Jun 2020
-- nandland goBoard tutorial 4
library ieee;
  use ieee.std_logic_1164.all;

entity led_flipflop is
  port(
  i_Clk      : in  std_logic;

  -- Push-Button Switches:
  i_Switch_1 : in std_logic;

  -- LED
  o_LED_1 : out std_logic
  );
end led_flipflop;

architecture rtl of led_flipflop is
  signal led_i     : std_logic;
  signal sw1_i     : std_logic;
  signal trig_i    : std_logic;
begin

  debounce: entity work.debounce_filter
    port map(
      i_clk    => i_clk,
      i_trig   => i_Switch_1,

      o_stable => trig_i
    );

  o_LED_1 <= led_i;

  process(i_clk) is begin
    if rising_edge(i_clk) then
      sw1_i <= trig_i;

      if trig_i = '0' and sw1_i = '1' then
        led_i <= not led_i;
      end if;
    end if;
  end process;


end rtl;
