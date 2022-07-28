// module to map number to 7-segment display
// 07/27/2022

module seven_segment(
  input       i_clk  ,
  input [3:0] i_value,
  output      o_seg_A,
  output      o_seg_B,
  output      o_seg_C,
  output      o_seg_D,
  output      o_seg_E,
  output      o_seg_F,
  output      o_seg_G);

  always @ (posedge i_clk)
    begin
      case(i_value)
        4'b0000 :
          begin
            o_seg_A <= 1b'1;
            o_seg_B <= 1b'1;
            o_seg_C <= 1b'1;
            o_seg_D <= 1b'1;
            o_seg_E <= 1b'1;
            o_seg_F <= 1b'1;
            o_seg_G <= 1b'0;
          end
        4'b0001 :
          begin
            o_seg_A <= 1b'0;
            o_seg_B <= 1b'1;
            o_seg_C <= 1b'1;
            o_seg_D <= 1b'0;
            o_seg_E <= 1b'0;
            o_seg_F <= 1b'0;
            o_seg_G <= 1b'0;
          end
        4'b0010 :
          begin
            o_seg_A <= 1b'1;
            o_seg_B <= 1b'1;
            o_seg_C <= 1b'0;
            o_seg_D <= 1b'1;
            o_seg_E <= 1b'1;
            o_seg_F <= 1b'0;
            o_seg_G <= 1b'1;
          end
        4'b0011 :
          begin
            o_seg_A <= 1b'1;
            o_seg_B <= 1b'1;
            o_seg_C <= 1b'1;
            o_seg_D <= 1b'1;
            o_seg_E <= 1b'0;
            o_seg_F <= 1b'0;
            o_seg_G <= 1b'1;
          end
        4'b0100 :
          begin
            o_seg_A <= 1b'0;
            o_seg_B <= 1b'1;
            o_seg_C <= 1b'1;
            o_seg_D <= 1b'0;
            o_seg_E <= 1b'0;
            o_seg_F <= 1b'1;
            o_seg_G <= 1b'1;
          end
        4'b0101 :
          begin
            o_seg_A <= 1b'1;
            o_seg_B <= 1b'0;
            o_seg_C <= 1b'1;
            o_seg_D <= 1b'1;
            o_seg_E <= 1b'0;
            o_seg_F <= 1b'1;
            o_seg_G <= 1b'1;
          end
        4'b0110 :
          begin
            o_seg_A <= 1b'1;
            o_seg_B <= 1b'0;
            o_seg_C <= 1b'1;
            o_seg_D <= 1b'1;
            o_seg_E <= 1b'1;
            o_seg_F <= 1b'1;
            o_seg_G <= 1b'1;
          end
        4'b0111 :
          begin
            o_seg_A <= 1b'1;
            o_seg_B <= 1b'1;
            o_seg_C <= 1b'1;
            o_seg_D <= 1b'0;
            o_seg_E <= 1b'0;
            o_seg_F <= 1b'0;
            o_seg_G <= 1b'0;
          end
        4'b1000 :
          begin
            o_seg_A <= 1b'1;
            o_seg_B <= 1b'1;
            o_seg_C <= 1b'1;
            o_seg_D <= 1b'1;
            o_seg_E <= 1b'1;
            o_seg_F <= 1b'1;
            o_seg_G <= 1b'1;
          end
        4'b1001 :
          begin
            o_seg_A <= 1b'1;
            o_seg_B <= 1b'1;
            o_seg_C <= 1b'1;
            o_seg_D <= 1b'0;
            o_seg_E <= 1b'0;
            o_seg_F <= 1b'1;
            o_seg_G <= 1b'1;
          end
        4'b1010 :
          begin
            o_seg_A <= 1b'1;
            o_seg_B <= 1b'1;
            o_seg_C <= 1b'1;
            o_seg_D <= 1b'0;
            o_seg_E <= 1b'1;
            o_seg_F <= 1b'1;
            o_seg_G <= 1b'1;
          end
        4'b1011 :
          begin
            o_seg_A <= 1b'0;
            o_seg_B <= 1b'0;
            o_seg_C <= 1b'1;
            o_seg_D <= 1b'1;
            o_seg_E <= 1b'1;
            o_seg_F <= 1b'1;
            o_seg_G <= 1b'1;
          end
        4'b1100 :
          begin
            o_seg_A <= 1b'1;
            o_seg_B <= 1b'0;
            o_seg_C <= 1b'0;
            o_seg_D <= 1b'1;
            o_seg_E <= 1b'1;
            o_seg_F <= 1b'1;
            o_seg_G <= 1b'0;
          end
        4'b1101 :
          begin
            o_seg_A <= 1b'0;
            o_seg_B <= 1b'1;
            o_seg_C <= 1b'1;
            o_seg_D <= 1b'1;
            o_seg_E <= 1b'1;
            o_seg_F <= 1b'0;
            o_seg_G <= 1b'1;
          end
        4'b1110 :
          begin
            o_seg_A <= 1b'1;
            o_seg_B <= 1b'0;
            o_seg_C <= 1b'0;
            o_seg_D <= 1b'1;
            o_seg_E <= 1b'1;
            o_seg_F <= 1b'1;
            o_seg_G <= 1b'1;
          end
        4'b1111 :
          begin
            o_seg_A <= 1b'1;
            o_seg_B <= 1b'0;
            o_seg_C <= 1b'0;
            o_seg_D <= 1b'0;
            o_seg_E <= 1b'1;
            o_seg_F <= 1b'1;
            o_seg_G <= 1b'1;
          end

      endcase

  end



endmodule
