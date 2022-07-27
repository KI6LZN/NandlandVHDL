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

    wire switch_w;

    debounce_module Debouncing
    (.i_clk(i_Clk)        ,
     .i_switch(i_Switch_1),
     .o_switch(switch_w)  );


    always @ (posedge i_Clk)
      begin
        switch_i <= switch_w;
        if (switch_i == 1'b1 && switch_w == 1'b0)
          LED_1_i <= ~LED_1_i;
      end

    assign o_LED_1 = LED_1_i;

endmodule
