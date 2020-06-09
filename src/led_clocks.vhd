-- file written 09 Jun 2020
-- nandland goBoard tutorial 5
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity led_clocks is
  port(
    i_Clk   : in  std_logic;

    o_LED_1 : out std_logic;
    o_LED_2 : out std_logic;
    o_LED_3 : out std_logic;
    o_LED_4 : out std_logic
  );
end led_clocks;

architecture rtl of led_clocks is
  signal counter_1_i : std_logic_vector( downto 0);
  signal counter_2_i : std_logic_vector( downto 0);
  signal counter_3_i : std_logic_vector( downto 0);
  signal counter_4_i : std_logic_vector( downto 0);
begin

end rtl;
