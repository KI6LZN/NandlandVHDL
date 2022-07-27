// this is the first Verilog project
// goal: turn on LEDs when switches are pushed
// 07/26/2022

module proj_1 (
    input  i_switch_0,
    input  i_switch_1,`
    input  i_switch_2,
    input  i_switch_3,
    output o_led_0   ,
    output o_led_1   ,
    output o_led_2   ,
    output o_led_3 );

    assign o_led_0 = i_switch_0;
    assign o_led_1 = i_switch_1;
    assign o_led_2 = i_switch_2;
    assign o_led_3 = i_switch_3;


endmodule
