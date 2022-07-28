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

  reg seg_A_i = 1'b0;
  reg seg_B_i = 1'b0;
  reg seg_C_i = 1'b0;
  reg seg_D_i = 1'b0;
  reg seg_E_i = 1'b0;
  reg seg_F_i = 1'b0;
  reg seg_G_i = 1'b0;


  always @ (posedge i_clk)
    begin
      case(i_value)
        4'b0000 :
          begin
            seg_A_i <= 1;
            seg_B_i <= 1;
            seg_C_i <= 1;
            seg_D_i <= 1;
            seg_E_i <= 1;
            seg_F_i <= 1;
            seg_G_i <= 0;
          end
        4'b0001 :
          begin
            seg_A_i <= 0;
            seg_B_i <= 1;
            seg_C_i <= 1;
            seg_D_i <= 0;
            seg_E_i <= 0;
            seg_F_i <= 0;
            seg_G_i <= 0;
          end
        4'b0010 :
          begin
            seg_A_i <= 1;
            seg_B_i <= 1;
            seg_C_i <= 0;
            seg_D_i <= 1;
            seg_E_i <= 1;
            seg_F_i <= 0;
            seg_G_i <= 1;
          end
        4'b0011 :
          begin
            seg_A_i <= 1;
            seg_B_i <= 1;
            seg_C_i <= 1;
            seg_D_i <= 1;
            seg_E_i <= 0;
            seg_F_i <= 0;
            seg_G_i <= 1;
          end
        4'b0100 :
          begin
            seg_A_i <= 0;
            seg_B_i <= 1;
            seg_C_i <= 1;
            seg_D_i <= 0;
            seg_E_i <= 0;
            seg_F_i <= 1;
            seg_G_i <= 1;
          end
        4'b0101 :
          begin
            seg_A_i <= 1;
            seg_B_i <= 0;
            seg_C_i <= 1;
            seg_D_i <= 1;
            seg_E_i <= 0;
            seg_F_i <= 1;
            seg_G_i <= 1;
          end
        4'b0110 :
          begin
            seg_A_i <= 1;
            seg_B_i <= 0;
            seg_C_i <= 1;
            seg_D_i <= 1;
            seg_E_i <= 1;
            seg_F_i <= 1;
            seg_G_i <= 1;
          end
        4'b0111 :
          begin
            seg_A_i <= 1;
            seg_B_i <= 1;
            seg_C_i <= 1;
            seg_D_i <= 0;
            seg_E_i <= 0;
            seg_F_i <= 0;
            seg_G_i <= 0;
          end
        4'b1000 :
          begin
            seg_A_i <= 1;
            seg_B_i <= 1;
            seg_C_i <= 1;
            seg_D_i <= 1;
            seg_E_i <= 1;
            seg_F_i <= 1;
            seg_G_i <= 1;
          end
        4'b1001 :
          begin
            seg_A_i <= 1;
            seg_B_i <= 1;
            seg_C_i <= 1;
            seg_D_i <= 0;
            seg_E_i <= 0;
            seg_F_i <= 1;
            seg_G_i <= 1;
          end
        4'b1010 :
          begin
            seg_A_i <= 1;
            seg_B_i <= 1;
            seg_C_i <= 1;
            seg_D_i <= 0;
            seg_E_i <= 1;
            seg_F_i <= 1;
            seg_G_i <= 1;
          end
        4'b1011 :
          begin
            seg_A_i <= 0;
            seg_B_i <= 0;
            seg_C_i <= 1;
            seg_D_i <= 1;
            seg_E_i <= 1;
            seg_F_i <= 1;
            seg_G_i <= 1;
          end
        4'b1100 :
          begin
            seg_A_i <= 1;
            seg_B_i <= 0;
            seg_C_i <= 0;
            seg_D_i <= 1;
            seg_E_i <= 1;
            seg_F_i <= 1;
            seg_G_i <= 0;
          end
        4'b1101 :
          begin
            seg_A_i <= 0;
            seg_B_i <= 1;
            seg_C_i <= 1;
            seg_D_i <= 1;
            seg_E_i <= 1;
            seg_F_i <= 0;
            seg_G_i <= 1;
          end
        4'b1110 :
          begin
            seg_A_i <= 1;
            seg_B_i <= 0;
            seg_C_i <= 0;
            seg_D_i <= 1;
            seg_E_i <= 1;
            seg_F_i <= 1;
            seg_G_i <= 1;
          end
        4'b1111 :
          begin
            seg_A_i <= 1;
            seg_B_i <= 0;
            seg_C_i <= 0;
            seg_D_i <= 0;
            seg_E_i <= 1;
            seg_F_i <= 1;
            seg_G_i <= 1;
          end

      endcase

  end

  assign o_seg_A = seg_A_i;
  assign o_seg_B = seg_B_i;
  assign o_seg_C = seg_C_i;
  assign o_seg_D = seg_D_i;
  assign o_seg_E = seg_E_i;
  assign o_seg_F = seg_F_i;
  assign o_seg_G = seg_G_i;



endmodule
