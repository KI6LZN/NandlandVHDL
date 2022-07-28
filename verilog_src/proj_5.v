// this is the fifth Verilog project
// goal: implement a counter that will show the number on the 7-segment display
// 07/27/2022

module proj_5 (
    input  i_Clk       ,
    input  i_Switch_1  ,
    output o_Segment2_A,
    output o_Segment2_B,
    output o_Segment2_C,
    output o_Segment2_D,
    output o_Segment2_E,
    output o_Segment2_F,
    output o_Segment2_G  );

    parameter COUNTER_LIMIT = 16;

    // signals
    reg switch_i = 1'b0;
    reg [3:0] counter_i = 0;

    wire switch_w;

    debounce_module Debouncing
    (.i_clk(i_Clk)        ,
     .i_switch(i_Switch_1),
     .o_switch(switch_w)  );

     seven_segment Right
     (.i_clk(i_Clk),
      .i_value(counter_i),
      .o_seg_A(o_Segment2_A),
      .o_seg_B(o_Segment2_B),
      .o_seg_C(o_Segment2_C),
      .o_seg_D(o_Segment2_D),
      .o_seg_E(o_Segment2_E),
      .o_seg_F(o_Segment2_F),
      .o_seg_G(o_Segment2_G));


    always @ (posedge i_Clk)
      begin
        switch_i <= switch_w;
        if (switch_i == 1'b0 && switch_w == 1'b1 && counter_i < COUNTER_LIMIT)
          counter_i <= counter_i + 1;
        else if (switch_i == 1'b0 && switch_w == 1'b1 && counter_i == COUNTER_LIMIT)
          counter_i <= 0;
      end


endmodule
