// this is the fourth Verilog project
// goal: toggle an LED when a switch is released plus debouncing
// 07/27/2022

module proj_4 (
    input  i_Clk     ,
    input  i_Switch_1,
    output o_LED_1   );

    // signals
    reg LED_1_i  = 1'b0;
    reg switch_i = 1'b0;
    reg count_flag_i = 1'b0;

    reg [17:0] counter_i = 0;

    always @ (posedge i_Clk)
      begin
        if (switch_i == 1'b1 && i_Switch_1 == 1'b0)
          LED_1_i <= ~LED_1_i;
      end

    always @ (posedge i_Clk)
      begin
        if (switch_i ~= 1'b1 && i_Switch_1 == 1'b0)
          count_flag_i <= 1'b1;
        if (count_flag_i == 1'b1)
          begin
            counter_i <= counter_i + 1;
          end
          if (counter_i == 250000)
            begin
              count_flag_i <= 1'b0;
              switch_i <= i_Switch_1;
              counter_i <= 0;
            end
      end

    assign o_LED_1 = LED_1_i;

endmodule
