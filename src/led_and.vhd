-- file written 05 Jun 2020
-- nandland goBoard tutorial 2
library ieee;
  use ieee.std_logic_1164.all;

entity led_and is
  port (
    -- Push-Button Switches:
    i_Switch_1 : in std_logic;
    i_Switch_2 : in std_logic;

    -- LED
    o_LED_1 : out std_logic
  );

end led_and;

architecture rtl of led_and is
begin
  o_LED_1 <= i_Switch_1 and i_Switch_2;
end rtl;
