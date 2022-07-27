// this is the second Verilog project
// goal: turn on LEDs when specific switches are pushed
// 07/27/2022

module proj_2 (
    input  i_Switch_1,
    input  i_Switch_2,
    input  i_Switch_3,
    input  i_Switch_4,
    output o_LED_1   ,
    output o_LED_4 );

    assign o_LED_1 = i_Switch_1 AND i_Switch_2;
    assign o_LED_4 = i_Switch_3 AND i_Switch_4;


endmodule
