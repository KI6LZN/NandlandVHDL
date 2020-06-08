-- file written 07 Jun 2020
-- nandland goBoard tutorial 5
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity sevensegment_driver is
  port(
    i_value     : in  integer;

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
begin

  o_Segment_A <= '1' when i_value = 0  or i_value = 2  or i_value = 3  else
                 '1' when i_value = 5  or i_value = 6  or i_value = 7  else
                 '1' when i_value = 8  or i_value = 9  or i_value = 10 else
                 '1' when i_value = 12 or i_value = 14 or i_value = 15 else
                 '0';

  o_Segment_B <= '1' when i_value = 0  or i_value = 1  or i_value = 2  else
                 '1' when i_value = 3  or i_value = 4  or i_value = 7  else
                 '1' when i_value = 8  or i_value = 9  or i_value = 10 else
                 '1' when i_value = 13                                 else
                 '0';

  o_Segment_C <= '1' when i_value = 0  or i_value = 1  or i_value = 3  else
                 '1' when i_value = 4  or i_value = 5  or i_value = 6  else
                 '1' when i_value = 7  or i_value = 8  or i_value = 9  else
                 '1' when i_value = 10 or i_value = 11 or i_value = 13 else
                 '0';

  o_Segment_D <= '1' when i_value = 0  or i_value = 2  or i_value = 3  else
                 '1' when i_value = 5  or i_value = 6  or i_value = 8  else
                 '1' when i_value = 9  or i_value = 11 or i_value = 12 else
                 '1' when i_value = 13 or i_value = 14 or i_value = 15 else
                 '0';

  o_Segment_E <= '1' when i_value = 0  or i_value = 2  or i_value = 6  else
                 '1' when i_value = 8  or i_value = 10 or i_value = 11 else
                 '1' when i_value = 12 or i_value = 13 or i_value = 14 else
                 '1' when i_value = 15                                 else
                 '0';

  o_Segment_F <= '1' when i_value = 0  or i_value = 4  or i_value = 5  else
                 '1' when i_value = 6  or i_value = 8  or i_value = 9  else
                 '1' when i_value = 10 or i_value = 11 or i_value = 12 else
                 '1' when i_value = 14 or i_value = 15                 else
                 '0';

  o_Segment_G <= '1' when i_value = 2  or i_value = 3  or i_value = 4  else
                 '1' when i_value = 5  or i_value = 6  or i_value = 8  else
                 '1' when i_value = 9  or i_value = 10 or i_value = 11 else
                 '1' when i_value = 13 or i_value = 14 or i_value = 15 else
                 '0';

end;
