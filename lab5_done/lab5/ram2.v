module ram2(clk, en, we, addr, din, dout_h, dout_l);
	input clk;
	input en, we;
	input [3:0] addr;

	input [1:0] din;
	output wire [6:0] dout_h, dout_l;
	
   wire [7:0] din_full;
   wire [7:0] dout_vec;
   //wire [6:0] dout_h_tmp, dout_l_tmp;

   assign din_full = {6'b0, din};
   assign ram_en = en & we;

   ram1port r1(
		.address(addr),
      .clock(clk),
      .data(din_full),
      .wren(ram_en),
      .q(dout_vec));
   seg_7_out s1(dout_vec[7:4], dout_h);
   seg_7_out s2(dout_vec[3:0], dout_l);
//	assign dout_h = dout_h_tmp;
//	assign dout_l = dout_l_tmp;

//   always @ (posedge clk) begin
//      if (en && !we) begin
//         dout_h <= dout_h_tmp;
//         dout_l <= dout_l_tmp;	
//      end else begin
//         dout_h <= dout_h;
//         dout_l <= dout_l;
//      end
//   end

endmodule 