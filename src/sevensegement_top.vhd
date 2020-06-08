-- file written 07 Jun 2020
-- nandland goBoard tutorial 5
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity sevensegment_top is
  port(
    i_Clk        : in  std_logic;
    i_Switch_1   : in  std_logic;

    o_LED_1      : out std_logic;
    o_Segment1_A : out std_logic;
    o_Segment1_B : out std_logic;
    o_Segment1_C : out std_logic;
    o_Segment1_D : out std_logic;
    o_Segment1_E : out std_logic;
    o_Segment1_F : out std_logic;
    o_Segment1_G : out std_logic
  );
end sevensegment_top;

architecture rtl of sevensegment_top is
  constant MAX_LED : integer := 9;

  signal stable_i  : std_logic;
  signal sw1_i     : std_logic;
  signal led_i     : std_logic;
  signal counter_i : integer range 0 to MAX_LED := 0;

  signal Segment1_A_i : std_logic;
  signal Segment1_B_i : std_logic;
  signal Segment1_C_i : std_logic;
  signal Segment1_D_i : std_logic;
  signal Segment1_E_i : std_logic;
  signal Segment1_F_i : std_logic;
  signal Segment1_G_i : std_logic;
begin

  debounce: entity work.debounce_filter
    port map(
      i_clk    => i_Clk,
      i_trig   => i_Switch_1,
      o_stable => stable_i
    );

  sevensegment_1: entity work.sevensegment_driver
    port map(
      i_value     => std_logic_vector(to_unsigned(counter_i, 4)),
      o_Segment_A => Segment1_A_i,
      o_Segment_B => Segment1_B_i,
      o_Segment_C => Segment1_C_i,
      o_Segment_D => Segment1_D_i,
      o_Segment_E => Segment1_E_i,
      o_Segment_F => Segment1_F_i,
      o_Segment_G => Segment1_G_i
    );

  o_Segment1_A <= Segment1_A_i;
  o_Segment1_B <= Segment1_B_i;
  o_Segment1_C <= Segment1_C_i;
  o_Segment1_D <= Segment1_D_i;
  o_Segment1_E <= Segment1_E_i;
  o_Segment1_F <= Segment1_F_i;
  o_Segment1_G <= Segment1_G_i;

  o_LED_1 <= led_i;

  process (i_Clk) begin
    if(rising_edge(i_Clk)) then
      sw1_i <= stable_i;

      -- if switch, update LED
      if stable_i = '0' and sw1_i = '1' then
        led_i <= not led_i;

        -- update counter
        if counter_i = MAX_LED then
          counter_i <= 0;
        else
          counter_i <= counter_i + 1;
        end if;
      end if;
    end if;
  end process;

end rtl;
