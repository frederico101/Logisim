//Program 1 to convert to machine language
// Computes R0 = 2 + 3
@2       //  0000 0000 0000 0010    //  A=2
D=A      //  1110 1100 0001 0000    //  D=2
@3       //  0000 0000 0000 0011    //   A=3
D=D+A    //  1110 0000 1001 0000    //   C5 setted then D+A   
@0       //  0000 0000 0000 0000    //   D=0
M=D      //  1111 0011 0000 1000    //  dest M received D    
