// this is the sixth Verilog project
// goal: have the four LEDs blink at different rates
// 07/28/2022

module proj_6 (
  input  i_Clk,
  output o_LED_1,
  output o_LED_2,
  output o_LED_3,
  output o_LED_4);

  parameter MAX_1  = 12500000;  // 1 Hz from 25MHz
  parameter MAX_2  = 6250000;   // 2 Hz from 25MHz
  parameter MAX_5  = 2500000;   // 5 Hz from 25MHz
  parameter MAX_10 = 1250000;   //10 Hz from 25MHz

  reg led_1_i = 1'b0;
  reg led_2_i = 1'b0;
  reg led_3_i = 1'b0;
  reg led_4_i = 1'b0;

  reg [24:0] counter_1_i = 0;
  reg [23:0] counter_2_i = 0;
  reg [22:0] counter_5_i = 0;
  reg [21:0] counter_10_i = 0;

  always @ (posedge i_Clk)
    begin
      counter_1_i <= counter_1_i + 1;
      counter_2_i <= counter_2_i + 1;
      counter_3_i <= counter_3_i + 1;
      counter_4_i <= counter_4_i + 1;

      if (counter_1_i == MAX_1)
        begin
          led_1_i <= ~led_1_i;
          counter_1_i <= 0;
        end

      if (counter_2_i == MAX_2)
        begin
          led_2_i <= ~led_2_i;
          counter_2_i <= 0;
        end

      if (counter_5_i == MAX_5)
        begin
          led_3_i <= ~led_3_i;
          counter_5_i <= 0;
        end

      if (counter_10_i == MAX_10)
        begin
          led_4_i <= ~led_4_i;
          counter_10_i <= 0;
        end

    end

  assign o_LED_1 = led_1_i;
  assign o_LED_2 = led_2_i;
  assign o_LED_3 = led_3_i;
  assign o_LED_4 = led_4_i;

endmodule
