-- file written 09 Jun 2020
-- nandland goBoard tutorial 6
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity led_clocks is
  generic(
    max_1Hz  : integer;
    max_2Hz  : integer;
    max_5Hz  : integer;
    max_10Hz : integer
  );
  port(
    i_Clk   : in  std_logic;

    o_led1 : out std_logic;
    o_led2 : out std_logic;
    o_led3 : out std_logic;
    o_led4 : out std_logic
  );
end led_clocks;

architecture rtl of led_clocks is
  signal counter_1_i  : integer range 0 to max_1Hz;
  signal counter_2_i  : integer range 0 to max_2Hz;
  signal counter_5_i  : integer range 0 to max_5Hz;
  signal counter_10_i : integer range 0 to max_10Hz;

  signal LED_1_i : std_logic := '0';
  signal LED_2_i : std_logic := '0';
  signal LED_3_i : std_logic := '0';
  signal LED_4_i : std_logic := '0';
begin

  o_led1 <= LED_1_i;
  o_led2 <= LED_2_i;
  o_led3 <= LED_3_i;
  o_led4 <= LED_4_i;

  process(i_Clk) begin
    if rising_edge(i_Clk) then
      if (counter_1_i = max_1Hz) then
        counter_1_i <= 0;
        LED_1_i <= not LED_1_i;
      else
        counter_1_i  <= counter_1_i  + 1;
      end if;

      if (counter_2_i = max_2Hz) then
        counter_2_i <= 0;
        LED_2_i <= not LED_2_i;
      else
        counter_2_i  <= counter_2_i  + 1;
      end if;

      if (counter_5_i = max_5Hz) then
        counter_5_i <= 0;
        LED_3_i <= not LED_3_i;
      else
        counter_5_i  <= counter_5_i  + 1;
      end if;

      if (counter_10_i = max_10Hz) then
        counter_10_i <= 0;
        LED_4_i <= not LED_4_i;
      else
        counter_10_i <= counter_10_i + 1;
      end if;

    end if;
  end process;

end rtl;
