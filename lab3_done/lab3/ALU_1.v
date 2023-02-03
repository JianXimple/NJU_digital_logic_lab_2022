module ALU_1(A, B, Cin, S);
	input [3:0] A, B;
	input Cin;
	output [6:0] S;
	wire [3:0] t_no_Cin;

	assign t_no_Cin = {4{Cin}} ^ B;
	assign S[4:0] = A + t_no_Cin + Cin; // { carry, result}
	assign S[5] = (A[3] == t_no_Cin[3]) 
	            && (A[3] != S[3]); // overflow
	assign S[6] = ~(| S[3:0]); // zero 
	
endmodule 