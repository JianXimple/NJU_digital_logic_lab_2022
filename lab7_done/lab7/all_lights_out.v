module all_lights_out(clk, ps_data, alo);
   input clk, ps_data;
   output reg alo;
   integer cnt,gt;
   
   initial begin
      cnt = 0;
      alo = 0;
		gt=1000000;
   end
   
   always @ (posedge clk) begin
      if (ps_data == 0) begin
         cnt <= 0;
         alo <= 0;
      end else begin
         if (alo == 1 || cnt == gt) begin
            alo <= 1;
         end else begin
            cnt <= cnt + 1;
            alo <= 0;
         end
      end
   end
   
endmodule 