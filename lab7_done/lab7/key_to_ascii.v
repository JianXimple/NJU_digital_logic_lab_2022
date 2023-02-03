module key_to_ascii( addr, dout_vec);

   input [7:0] addr;
   output reg [7:0] dout_vec;
   
   reg [7:0] normcode[255:0];

   
   initial begin
      dout_vec = 8'b0;
		$readmemh("D:/My_design/lab7/scancode.txt", normcode, 0, 255);
   end
      
   always @ (*) begin
		dout_vec = normcode[addr];
   end
   
endmodule