// this is the third Verilog project
// goal: toggle an LED when a switch is released
// 07/27/2022

module proj_3 (
    input  i_Clk     ,
    input  i_Switch_1,
    output o_LED_1   );

    // signals
    reg LED_1_i  = 1'b0;
    reg switch_i = 1'b0;

    always @ (posedge i_Clk)
      begin
        switch_i <= i_Switch_1;
        if (switch_i == 1'b1 && i_Switch_1 == 1'b0)
          LED_1_i <= ~LED_1_i;
      end

    assign o_LED_1 = LED_1_i;

endmodule
