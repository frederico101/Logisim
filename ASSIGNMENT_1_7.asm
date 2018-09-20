PROBLEM_1

	@i    0000 0000 0001 0000            // J=5
	M=1   1110 1111 1100 1000            //for(i=1; i<5; i++) {
                                                       // J--
                                                  // {     
(LOOP)
	@i     0000 0000 0001 0000  
	D=M    1111 1100 0001 0000   // second jump D=2
	@5     0000 0000 0000 0101   //its represents the "j=5" varable    
	D=D-A  1110 0001 1111 0000   //and here "j--",If A-B < 0, then A < B
              				 //now D=-4..D=-3..       
	@END   0000 0000 0001 0111   //TEC    
	D;JGT  1110 0000 0001 0001   // D =-4 then D<0.. second jump D=-3..
                 
	@i     0000 0000 0001 0000
	D=M    1111 1100 0001 0000   //D= 1.. D=2
	@i     0000 0000 0001 0000
	M=M+1  1111 1101 1100 1000   // or M= 1+1... M=2+1

	@LOOP  0000 0000 0000 0010
	0;JMP  1110 0000 0000 0111  // unconditional loop

(END)
	@END  0000 0000 0001 0111   //TEC  
	0;JMP 1110 0000 0000 0111


PROBLEM_2

//i=4
//if (i < 5) then
//                j = 3
//else
//                j = 2 
	@i     0000 0000 0001 0000
	M=0    1110 1010 1000 1000 //The variable "i" is in the memory[0]
	@4     0000 0000 0000 0100
	D=M    1111 1100 0001 0000 // i= The value @XX is stored in D
	@5     0000 0000 0000 0101
	D=D-A  1110 0100 1101 0000
@IF_LESS       0000 0000 0000 0010
	D;JLT  1110 0011 0000 0100
	@2     0000 0000 0000 0010
	D=A    1110 1100 0001 0000 
	@END  0000 0000 0001 0111   //TEC  
	0;JMP  1110 0000 0000 0111
(IF_LESS)
	@3     0000 0000 0000 0011
	D=A    1110 1100 0001 0000
	@END  0000 0000 0001 0111   //TEC  
	0;JMP  1110 0000 0000 0111
(END)
	@END  0000 0000 0001 0111   //TEC  
	0;JMP  1110 0000 0000 0111

PROBLEM_3

	//while loop
//i = 0
//while(i==0) {
//    j++
//  if j = 5 then
//                i = j


	@i      0000 0000 0001 0000
	M=0     1110 0000 0000 1000
	@j      0000 0000 0001 0000 
	M=1     1110 1111 1100 1000
	D=M     1111 1100 0001 0000
(LOOP)
	@j      0000 0000 0001 0000
	M=D     1110 0011 0000 1000
        @5      0000 0000 0000 0101
	D=D-A   1110 0100 1101 0000   // 1- 5 = -4	
        @THEN   0000 0000 0000 0010
	D;JEQ	1110 0000 0001 0010
	@j      0000 0000 0001 0000
	D=M+1	1111 1101 1101 0000  // D is my J++
	
	@LOOP   0000 0000 0000 0010
	0;JMP   1110 0000 0000 0111
(THEN)
	@i      0000 0000 0001 0000
	M=0     1110 1010 1000 1000
	@5      0000 0000 0000 0101
	D=D+A   1110 0000 1001 0000

	@END  0000 0000 0001 0111   //TEC  
	0;JMP   1110 0000 0000 0111
(END)
	@END  0000 0000 0001 0111   //TEC  
	0;JMP   1110 0000 0000 0111

      
PROBLEM_4
// load and  traverse an array

//  A[0] =5
//  A[1]=4
//  A[2]=3
//  A[3]=2
//  A[4]=1
//  A[5]=0

// for (i=0; i<=5; i++) { 00
//              if A[i] == 0 then
//                     A[i] = 5;


	@i       0000 0000 0001 0000
	         0000 0000 0001 0000 // Second the TEC (I used just to learn this instruction)
        M[i]=0   1110 1010 1000 1000 // I believe that is occurs because the M receive a new
(LOOP)                               // space
 	@i       0000 0000 0001 0000
	
                 0000 0000 0001 0000
	D=M[i]   1110 1010 1000 1000 // here I set the next position with 5

	@5       0000 0000 0000 0101
	D=D-A    1110 0100 1101 0000  // D=0 A=5 

	@INC     1110 0000 0000 1100  // INC of increment also seconde the TEC this jumps to D
	D;JLE    1110 0000 0001 0110  //JUMP TO THE INC LABEL IF LESS THEN 0
	
        @END     0000 0000 0001 0111  //Second the TEC
	0;JMP    1110 0000 0000 0111 //UNCONDITIONAL
(INC)
	@i       0000 0000 0001 0000 
	M=M+1    1111 1101 1100 1000
	D=M      1111 1100 0001 0000
	
	@SETS    0000 0000 0001 0001  // Second the TEC
	D;JEQ    1110 0000 0001 0010 //IF D EQUAL TO 0 THEN JUMP TO (SETS)

(SETS)
	@i       0000 0000 0001 0000 //CALL THE SYMBOL
	D=M	 1111 1100 0001 0000
	@6       0000 0000 0000 0110  //I PUT THE 6 TO START BY THE 5..4...3..AND SO ON	  	
	D=A-D	 1110 0001 1101 0000  //SET 5 INTO THE 'A' REGISTER AND SUBSTRACT
		
	@LOOP    0000 0000 0000 0010 //Using TEC in this line
	0;JMP    1110 0000 0000 0111 // BACK TO THE LOOP
(END)
	@END	 0000 0000 0001 0111 //INFITE LOOP 
	0;JMP    1110 0000 0000 0111


