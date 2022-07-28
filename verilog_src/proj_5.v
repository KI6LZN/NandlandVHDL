// this is the fifth Verilog project
// goal: implement a counter that will show the number on the 7-segment display
// 07/27/2022

module proj_5 (
    input  i_Clk       ,
    input  i_Switch_1  ,
    input  i_Switch_3  ,
    output o_Segment1_A,
    output o_Segment1_B,
    output o_Segment1_C,
    output o_Segment1_D,
    output o_Segment1_E,
    output o_Segment1_F,
    output o_Segment1_G,
    output o_Segment2_A,
    output o_Segment2_B,
    output o_Segment2_C,
    output o_Segment2_D,
    output o_Segment2_E,
    output o_Segment2_F,
    output o_Segment2_G  );

    parameter LED_LIMIT = 9;

    // signals
    reg r_switch_i = 1'b0;
    reg l_switch_i = 1'b0;
    reg [3:0] r_counter_i = 0;
    reg [3:0] l_counter_i = 0;

    wire switch_l_w;
    wire switch_r_w;

    debounce_module Debouncing_l
    (.i_clk(i_Clk)        ,
     .i_switch(i_Switch_1),
     .o_switch(switch_l_w)  );

    debounce_module Debouncing_r
    (.i_clk(i_Clk)        ,
     .i_switch(i_Switch_3),
     .o_switch(switch_r_w)  );

    seven_segment Left
    (.i_clk(i_Clk),
     .i_value(l_counter_i),
     .o_seg_A(o_Segment1_A),
     .o_seg_B(o_Segment1_B),
     .o_seg_C(o_Segment1_C),
     .o_seg_D(o_Segment1_D),
     .o_seg_E(o_Segment1_E),
     .o_seg_F(o_Segment1_F),
     .o_seg_G(o_Segment1_G));

     seven_segment Right
     (.i_clk(i_Clk),
      .i_value(r_counter_i),
      .o_seg_A(o_Segment2_A),
      .o_seg_B(o_Segment2_B),
      .o_seg_C(o_Segment2_C),
      .o_seg_D(o_Segment2_D),
      .o_seg_E(o_Segment2_E),
      .o_seg_F(o_Segment2_F),
      .o_seg_G(o_Segment2_G));


    always @ (posedge i_Clk)
      begin
        r_switch_i <= switch_r_w;
        l_switch_i <= switch_l_w;

        // if right switch increments and less than 10, increment counter
        if (r_switch_i == 1'b0 && switch_r_w == 1'b1 && r_counter_i <= LED_LIMIT)
          r_counter_i <= r_counter_i + 1;

        // if right switch increments and counter is at counter limit, reset right counter and increment left
        if (r_switch_i == 1'b0 && switch_r_w == 1'b1 && r_counter_i == LED_LIMIT)
          begin
            // if left counter is at the end, reset both counters
            if (l_counter_i == LED_LIMIT)
              begin
                l_counter_i <= 0;
                r_counter_i <= 0;
              end
            // otherwise increment left and reset right
            else
              begin
                l_counter_i <= l_counter_i + 1;
                r_counter_i <= 0;
              end
          end

        // if left switch increments and greater than 0, decrement counter
        if (l_switch_i == 1'b0 && switch_l_w == 1'b1 && r_counter_i > 0)
          r_counter_i <= r_counter_i - 1;

        // if right switch increments and counter is at counter limit, reset right counter and increment left
        if (l_switch_i == 1'b0 && switch_l_w == 1'b1 && r_counter_i == 0)
          begin
            // if left counter is at the end, reset both counters
            if (l_counter_i == 0)
              begin
                l_counter_i <= LED_LIMIT;
                r_counter_i <= LED_LIMIT;
              end
            // otherwise decrement left and reset right
            else
              begin
                l_counter_i <= l_counter_i - 1;
                r_counter_i <= LED_LIMIT;
              end
          end
    end //end of always block


endmodule
