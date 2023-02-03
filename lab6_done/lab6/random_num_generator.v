module random_num_generator(clk, output_high, output_low);
	input clk;
	output reg [6:0] output_high, output_low;
	reg [7:0] random_num = 8'b00000001;
	
	always @ (negedge clk)
		random_num <= {(random_num[4]^random_num[3]^random_num[2]^random_num[0]),
			random_num[7:1]};
			
	always @ (random_num) begin
			case (random_num[7:4])
			0 : output_high = 7'b1000000;
			1 : output_high = 7'b1111001;
			2 : output_high = 7'b0100100;
			3 : output_high = 7'b0110000;
			4 : output_high = 7'b0011001;
			5 : output_high = 7'b0010010;
			6 : output_high = 7'b0000010;
			7 : output_high = 7'b1111000;
			8 : output_high = 7'b0000000;
			9 : output_high = 7'b0010000;
			10 : output_high = 7'b0001000;
			11 : output_high = 7'b0000011;
			12 : output_high = 7'b1000110;
			13 : output_high = 7'b0100001;
			14 : output_high = 7'b0000110;
			15 : output_high = 7'b0001110;
			default: output_high = 7'bx;
		endcase
		case (random_num[3:0])
			0 : output_low = 7'b1000000;
			1 : output_low = 7'b1111001;
			2 : output_low = 7'b0100100;
			3 : output_low = 7'b0110000;
			4 : output_low = 7'b0011001;
			5 : output_low = 7'b0010010;
			6 : output_low = 7'b0000010;
			7 : output_low = 7'b1111000;
			8 : output_low = 7'b0000000;
			9 : output_low = 7'b0010000;
			10 : output_low = 7'b0001000;
			11 : output_low = 7'b0000011;
			12 : output_low = 7'b1000110;
			13 : output_low = 7'b0100001;
			14 : output_low = 7'b0000110;
			15 : output_low = 7'b0001110;
			default: output_low = 7'bx;
		endcase
	end
	
endmodule