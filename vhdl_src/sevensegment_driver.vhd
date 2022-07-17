-- file written 07 Jun 2020
-- nandland goBoard tutorial 5
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity sevensegment_driver is
  port(
    i_value     : in  std_logic_vector(3 downto 0);

    o_Segment_A : out std_logic;
    o_Segment_B : out std_logic;
    o_Segment_C : out std_logic;
    o_Segment_D : out std_logic;
    o_Segment_E : out std_logic;
    o_Segment_F : out std_logic;
    o_Segment_G : out std_logic
  );
end sevensegment_driver;

architecture rtl of sevensegment_driver is
  signal value_i : integer range 0 to 15;
begin

  value_i <= 0  when i_value = "0000" else
             1  when i_value = "0001" else
             2  when i_value = "0010" else
             3  when i_value = "0011" else
             4  when i_value = "0100" else
             5  when i_value = "0101" else
             6  when i_value = "0110" else
             7  when i_value = "0111" else
             8  when i_value = "1000" else
             9  when i_value = "1001" else
             10 when i_value = "1010" else
             11 when i_value = "1011" else
             12 when i_value = "1100" else
             13 when i_value = "1101" else
             14 when i_value = "1110" else
             15;

  o_Segment_A <= '0' when value_i = 0  or value_i = 2  or value_i = 3  else
                 '0' when value_i = 5  or value_i = 6  or value_i = 7  else
                 '0' when value_i = 8  or value_i = 9  or value_i = 10 else
                 '0' when value_i = 12 or value_i = 14 or value_i = 15 else
                 '1';

  o_Segment_B <= '0' when value_i = 0  or value_i = 1  or value_i = 2  else
                 '0' when value_i = 3  or value_i = 4  or value_i = 7  else
                 '0' when value_i = 8  or value_i = 9  or value_i = 10 else
                 '0' when value_i = 13                                 else
                 '1';

  o_Segment_C <= '0' when value_i = 0  or value_i = 1  or value_i = 3  else
                 '0' when value_i = 4  or value_i = 5  or value_i = 6  else
                 '0' when value_i = 7  or value_i = 8  or value_i = 9  else
                 '0' when value_i = 10 or value_i = 11 or value_i = 13 else
                 '1';

  o_Segment_D <= '0' when value_i = 0  or value_i = 2  or value_i = 3  else
                 '0' when value_i = 5  or value_i = 6  or value_i = 8  else
                 '0' when value_i = 9  or value_i = 11 or value_i = 12 else
                 '0' when value_i = 13 or value_i = 14 or value_i = 15 else
                 '1';

  o_Segment_E <= '0' when value_i = 0  or value_i = 2  or value_i = 6  else
                 '0' when value_i = 8  or value_i = 10 or value_i = 11 else
                 '0' when value_i = 12 or value_i = 13 or value_i = 14 else
                 '0' when value_i = 15                                 else
                 '1';

  o_Segment_F <= '0' when value_i = 0  or value_i = 4  or value_i = 5  else
                 '0' when value_i = 6  or value_i = 8  or value_i = 9  else
                 '0' when value_i = 10 or value_i = 11 or value_i = 12 else
                 '0' when value_i = 14 or value_i = 15                 else
                 '1';

  o_Segment_G <= '0' when value_i = 2  or value_i = 3  or value_i = 4  else
                 '0' when value_i = 5  or value_i = 6  or value_i = 8  else
                 '0' when value_i = 9  or value_i = 10 or value_i = 11 else
                 '0' when value_i = 13 or value_i = 14 or value_i = 15 else
                 '1';

end;
