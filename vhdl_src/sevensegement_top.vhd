-- file written 07 Jun 2020
-- nandland goBoard tutorial 5
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity sevensegment_top is
  port(
    i_Clk        : in  std_logic;
    i_Switch_1   : in  std_logic;
    i_Switch_2   : in  std_logic;

    o_LED_1      : out std_logic;
    o_LED_2      : out std_logic;
    o_Segment1_A : out std_logic;
    o_Segment1_B : out std_logic;
    o_Segment1_C : out std_logic;
    o_Segment1_D : out std_logic;
    o_Segment1_E : out std_logic;
    o_Segment1_F : out std_logic;
    o_Segment1_G : out std_logic;

    o_Segment2_A : out std_logic;
    o_Segment2_B : out std_logic;
    o_Segment2_C : out std_logic;
    o_Segment2_D : out std_logic;
    o_Segment2_E : out std_logic;
    o_Segment2_F : out std_logic;
    o_Segment2_G : out std_logic
  );
end sevensegment_top;

architecture rtl of sevensegment_top is
  constant MAX_LED : integer := 9;

  signal stable_1_i   : std_logic;
  signal sw1_i        : std_logic;
  signal led_1_i      : std_logic;
  signal stable_2_i   : std_logic;
  signal sw2_i        : std_logic;
  signal led_2_i      : std_logic;
  signal counter_l_i  : integer range 0 to MAX_LED := 0;
  signal counter_r_i  : integer range 0 to MAX_LED := 0;

  signal Segment1_A_i : std_logic;
  signal Segment1_B_i : std_logic;
  signal Segment1_C_i : std_logic;
  signal Segment1_D_i : std_logic;
  signal Segment1_E_i : std_logic;
  signal Segment1_F_i : std_logic;
  signal Segment1_G_i : std_logic;

  signal Segment2_A_i : std_logic;
  signal Segment2_B_i : std_logic;
  signal Segment2_C_i : std_logic;
  signal Segment2_D_i : std_logic;
  signal Segment2_E_i : std_logic;
  signal Segment2_F_i : std_logic;
  signal Segment2_G_i : std_logic;
begin

  debounce1: entity work.debounce_filter
    port map(
      i_clk    => i_Clk,
      i_trig   => i_Switch_1,
      o_stable => stable_1_i
    );

  debounce2: entity work.debounce_filter
    port map(
      i_clk    => i_Clk,
      i_trig   => i_Switch_2,
      o_stable => stable_2_i
    );

  sevensegment_left: entity work.sevensegment_driver
    port map(
      i_value     => std_logic_vector(to_unsigned(counter_l_i, 4)),
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

  sevensegment_right: entity work.sevensegment_driver
    port map(
      i_value     => std_logic_vector(to_unsigned(counter_r_i, 4)),
      o_Segment_A => Segment2_A_i,
      o_Segment_B => Segment2_B_i,
      o_Segment_C => Segment2_C_i,
      o_Segment_D => Segment2_D_i,
      o_Segment_E => Segment2_E_i,
      o_Segment_F => Segment2_F_i,
      o_Segment_G => Segment2_G_i
    );

  o_Segment2_A <= Segment2_A_i;
  o_Segment2_B <= Segment2_B_i;
  o_Segment2_C <= Segment2_C_i;
  o_Segment2_D <= Segment2_D_i;
  o_Segment2_E <= Segment2_E_i;
  o_Segment2_F <= Segment2_F_i;
  o_Segment2_G <= Segment2_G_i;

  o_LED_1 <= led_1_i;
  o_LED_2 <= led_2_i;

  process (i_Clk) begin
    if(rising_edge(i_Clk)) then
      sw1_i <= stable_1_i;
      sw2_i <= stable_2_i;

      -- if switch 1, update LED
      if stable_1_i = '0' and sw1_i = '1' then
        led_1_i <= not led_1_i;

        -- update counter
        if counter_r_i = MAX_LED then
          counter_r_i <= 0;
          counter_l_i <= counter_l_i + 1;
        else
          counter_r_i <= counter_r_i + 1;
        end if;
        if counter_l_i = MAX_LED and counter_r_i = MAX_LED then
          counter_l_i <= 0;
          counter_r_i <= 0;
        end if;
      end if;

      -- if switch 2, update LED
      if stable_2_i = '0' and sw2_i = '1' then
        led_2_i <= not led_2_i;

        -- update counter
        if counter_r_i = 0 then
          counter_r_i <= MAX_LED;
          counter_l_i <= counter_l_i - 1;
        else
          counter_r_i <= counter_r_i - 1;
        end if;
        if counter_l_i = 0 and counter_r_i = 0 then
          counter_l_i <= MAX_LED;
          counter_r_i <= MAX_LED;
        end if;
      end if;
    end if;
  end process;

end rtl;
