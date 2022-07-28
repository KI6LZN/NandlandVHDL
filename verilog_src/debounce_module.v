// module to perform debouncing of a switch
// 07/27/2022

module debounce_module (
    input  i_clk   ,
    input  i_switch,
    output o_switch );

    parameter COUNTER_LIMIT = 250000; // 10ns at 25MHz clock

    reg [17:0] counter_i = 0;
    reg switch_i         = 1'b0;


    always @ (posedge i_clk)
    begin
      if (switch_i !== i_switch && counter_i < COUNTER_LIMIT)
        begin
        counter_i <= counter_i + 1;
        end
      else if (counter_i == COUNTER_LIMIT)
        begin
          counter_i    <= 0;
          switch_i     <= i_switch;
        end

      else
        begin
          counter_i    <= 0;
        end

    end

    assign o_switch = switch_i;

endmodule
