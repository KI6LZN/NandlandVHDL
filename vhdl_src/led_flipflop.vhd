-- file written 05 Jun 2020
-- nandland goBoard tutorial 3
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
  signal led_i : std_logic;
  signal sw1_i : std_logic;
begin
  o_LED_1 <= led_i;

  process(i_clk) is begin
    if rising_edge(i_clk) then
      sw1_i <= i_Switch_1;
      if i_Switch_1 = '0' and sw1_i = '1' then
        led_i <= not led_i;
      end if;
    end if;
  end process;


end rtl;
