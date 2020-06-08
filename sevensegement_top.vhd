-- file written 07 Jun 2020
-- nandland goBoard tutorial 5
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity sevensegment_top is
  port(
    i_clk        : in  std_logic;
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

  signal counter_i : integer range 0 to MAX_LED;


begin

  debounce: entity work.debounce_filter
    port map(
      i_clk    => i_clk,
      i_trig   => i_Switch_1,
      o_stable => stable_i
    );

  sevensegment_1: entity work.sevensegment_driver
    port map(
      i_value     => counter_i   ,
      o_Segment_A => o_Segment1_A,
      o_Segment_B => o_Segment1_B,
      o_Segment_C => o_Segment1_C,
      o_Segment_D => o_Segment1_D,
      o_Segment_E => o_Segment1_E,
      o_Segment_F => o_Segment1_F,
      o_Segment_G => o_Segment1_G
    );



  process (i_clk) begin
    if(rising_edge(i_clk)) then

    end if;
  end process;


end;
