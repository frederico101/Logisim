// Problem 4
// load and  traverse an array

//  A[0] =5
//  A[1]=4
//  A[2]=3
//  A[3]=2
//  A[4]=1
//  A[5]=0

// for (i=0; i<=5; i++) {
//              if A[i] == 0 then
//                     A[i] = 5;


	@i
	M[i]=0
(LOOP)
	@i
	D=M[i] // here I set the next position with 5

	@5
	D=D-A // D=0 A=5 

	@INC
	D;JLE  //JUMP TO THE INC LABEL IF LESS THEN 0
	
        @END
	0;JMP  //UNCONDITIONAL JUMP
(INC)
	@i
	M=M+1
	D=M
	
	@SETS
	D;JEQ  //IF D EQUAL TO 0 THEN JUMP TO (SETS)

(SETS)
	@i        //CALL THE SYMBOL
	D=M	
	@6       //I PUT THE 6 TO START BY THE 5..4...3..AND SO ON	  	
	D=A-D	//SET 5 INTO THE 'A' REGISTER AND SUBSTRACT
		
	@LOOP
	0;JMP   // BACK TO THE LOOP
(END)
	@END	//INFITE LOOP 
	0;JMP
