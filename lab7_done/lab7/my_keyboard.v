module my_keyboard(clk, clrn, ps2_clk, ps2_data, 
               keys_times_h, keys_times_l,
               ascii_h, ascii_l,
               scancode_h, scancode_l 
               );
   input clk, clrn, ps2_clk, ps2_data;
   output reg [6:0] keys_times_h, keys_times_l, ascii_h, ascii_l, scancode_h, scancode_l; 
   
   wire ready, alo, overflow;
   wire [7:0] data;
   wire [7:0] ascii_vec;
   wire [6:0] keys_times_h_tmp, keys_times_l_tmp, ascii_h_tmp, ascii_l_tmp, scancode_h_tmp, scancode_l_tmp;
   
   reg nextdata_n;
   reg pressed, has_counted;

   reg [7:0] eff_data, keys_times;

   ps2_keyboard inst(
      .clk(clk),
      .clrn(clrn),
      .ps2_clk(ps2_clk),
      .ps2_data(ps2_data),
      .data(data),
      .ready(ready),
      .nextdata_n(nextdata_n),
      .overflow(overflow)
   );
   
   all_lights_out sp1(
      .clk(clk),
      .ps_data(ps2_data),
      .alo(alo)
   ); 
      
   key_to_ascii rom1( 
      .addr(eff_data), 
      .dout_vec(ascii_vec)
   );

   seg_7 seg1(.in_4bit(eff_data[7:4]), .out_seg(scancode_h_tmp));
   seg_7 seg0(.in_4bit(eff_data[3:0]), .out_seg(scancode_l_tmp));
   seg_7 seg3(.in_4bit(ascii_vec[7:4]), .out_seg(ascii_h_tmp));
   seg_7 seg2(.in_4bit(ascii_vec[3:0]), .out_seg(ascii_l_tmp));
   seg_7 seg5(.in_4bit(keys_times[7:4]), .out_seg(keys_times_h_tmp));
   seg_7 seg4(.in_4bit(keys_times[3:0]), .out_seg(keys_times_l_tmp));
   
   initial begin
      nextdata_n = 1;
      pressed = 1;
      has_counted = 0;  
      eff_data = 8'b0;
      keys_times = 0;
   end
   
   always @ (posedge clk) begin
      if (clrn == 0) begin
         nextdata_n <= 1;
         pressed <= 1;
         has_counted <= 0;
         eff_data <= 8'b0;
         keys_times <= 0;
      end else begin
         if (ready) begin 
            if (data == 8'hF0) begin 
               pressed <= 0;
               if (has_counted == 0) begin
                  keys_times <= keys_times + 1;
                  has_counted <= 1;
               end 
            end else begin
               has_counted <= 0;
               if (pressed == 0) begin
                  pressed <= 1;
               end else begin
                  eff_data <= data;
               end
            end
            nextdata_n <= 0; 
         end else nextdata_n <= 1;
         
      end
   end
   
   always @ (posedge clk) begin
      if (clrn == 0) begin
         keys_times_h <= 7'bz;
         keys_times_l <= 7'bz;
         ascii_h <= 7'bz;
         ascii_l <= 7'bz;
         scancode_h <= 7'bz;
         scancode_l <= 7'bz;
      end else begin
         keys_times_h <= keys_times_h_tmp;
         keys_times_l <= keys_times_l_tmp;
         if (alo) begin 
            ascii_h <= 7'bz;
            ascii_l <= 7'bz;
            scancode_h <= 7'bz;
            scancode_l <= 7'bz;
         end else begin
            ascii_h <= ascii_h_tmp;
            ascii_l <= ascii_l_tmp;
            scancode_h <= scancode_h_tmp;
            scancode_l <= scancode_l_tmp;
         end
      end
   end

endmodule 