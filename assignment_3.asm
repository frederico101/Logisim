//while loop
//i = 0
//while(i==0) {
//    j++
//  if j = 5 then
//                i = j


	@i
	M=0
	@j
	M=1
	D=M
(LOOP)
	@j
	M=D
        @5
	D=D-A // 1- 5 = -4	
	@THEN
	D;JEQ	
	@j
	D=M+1	 // D is my J++
	
	@LOOP
	0;JMP
(THEN)
	@i
	M=0
	@5
	D=D+A

	@END
	0;JMP
(END)
		
	@END
	0;JMP
