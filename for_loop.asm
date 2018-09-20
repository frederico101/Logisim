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
	D=M[i]

	@5
	D=D-A // D=0 A=5 

	@INC
	D;JLE
	
	@END
	0;JMP
(INC)
	@i
	M=M+1
	D=M
	
	

	@LOOP
	0;JMP
(END)
	@END
	0;JMP
