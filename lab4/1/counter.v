module counter(clk, clear, pause, sign_pause, sign_end, num_tens, num_ones);
	input clk, clear, pause;
	output reg sign_pause, sign_end;
	output reg [6:0] num_tens, num_ones;
	
	reg clk_1s;
	reg [24:0] count_clk; 
	integer count;
	
	initial begin
		sign_pause = 0;
		sign_end = 0;
		num_tens = 7'b1;
		num_ones = 7'b1;
		
		clk_1s = 0;
		count_clk = 0;
		count = 0;
	end
	//1s clk
	always @ (posedge clk)
		if (count_clk == 25'd25000000) begin
		//if (count_clk == 25'd5) begin
			count_clk <= 0;
			clk_1s <= ~clk_1s;
		end else
			count_clk <= count_clk + 1;
	// end of count
	always @ (count or pause)
		if (count == 99 && ~pause) sign_end = 1;
		else                       sign_end = 0;
		
	always @ (pause)
		if (pause) sign_pause = 1;
		else       sign_pause = 0;
	
	
	always @ (posedge clk_1s) begin
		if (clear)                        count <= 0;
		else if (~pause && count == 99) count <= 0;
		else if (~pause)                count <= count + 1;
		else                            count <= count;
	
		case (count / 10)
			0 : num_tens <= 7'b1000000;
			1 : num_tens <= 7'b1111001;
			2 : num_tens <= 7'b0100100;
			3 : num_tens <= 7'b0110000;
			4 : num_tens <= 7'b0011001;
			5 : num_tens <= 7'b0010010;
			6 : num_tens <= 7'b0000010;
			7 : num_tens <= 7'b1111000;
			8 : num_tens <= 7'b0000000;
			9 : num_tens <= 7'b0010000;
			default: num_tens <= 7'bx;
		endcase
		case (count % 10)
			0 : num_ones <= 7'b1000000;
			1 : num_ones <= 7'b1111001;
			2 : num_ones <= 7'b0100100;
			3 : num_ones <= 7'b0110000;
			4 : num_ones <= 7'b0011001;
			5 : num_ones <= 7'b0010010;
			6 : num_ones <= 7'b0000010;
			7 : num_ones <= 7'b1111000;
			8 : num_ones <= 7'b0000000;
			9 : num_ones <= 7'b0010000;
			default: num_ones <= 7'bx;
		endcase
	end

endmodule 