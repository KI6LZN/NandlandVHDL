-- file written 25 Mar 2020
-- nandland goBoard tutorial 1
library ieee;
  use ieee.std_logic_1164.all;
 
entity led_switch is
  port (
    -- Push-Button Switches:
    i_Switch_1 : in std_logic;
    i_Switch_2 : in std_logic;
    i_Switch_3 : in std_logic;
    i_Switch_4 : in std_logic;
     
    -- LED Pins:
    o_LED_1 : out std_logic;
    o_LED_2 : out std_logic;
    o_LED_3 : out std_logic;
    o_LED_4 : out std_logic
    );
end entity led_switch;
 
architecture rtl of led_switch is
begin
  o_LED_1 <= i_Switch_1;
  o_LED_2 <= i_Switch_2;
  o_LED_3 <= i_Switch_3; 
  o_LED_4 <= i_Switch_4;
   
end rtl;
