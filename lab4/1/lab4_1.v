
//=======================================================
//  This code is generated by Terasic System Builder
//=======================================================

module lab4_1(

	//////////// CLOCK //////////
	input 		          		CLOCK2_50,
	input 		          		CLOCK3_50,
	input 		          		CLOCK4_50,
	input 		          		CLOCK_50,

	//////////// SW //////////
	input 		     [9:0]		SW,

	//////////// LED //////////
	output		     [9:0]		LEDR,

	//////////// Seg7 //////////
	output		     [6:0]		HEX0,
	output		     [6:0]		HEX1,
	output		     [6:0]		HEX2,
	output		     [6:0]		HEX3,
	output		     [6:0]		HEX4,
	output		     [6:0]		HEX5
);



//=======================================================
//  REG/WIRE declarations
//=======================================================


counter c(CLOCK_50, SW[1], SW[0], LEDR[0], LEDR[1], HEX1, HEX0);

//=======================================================
//  Structural coding
//=======================================================



endmodule