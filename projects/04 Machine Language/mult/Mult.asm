// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Python equivalent.
// def product(R0, R1):
//     R2 = 0
//     while (R0 > 0):
//         R2 += R1
//         R0 -= 1
//     return R2

@R2
M=0 // Initialize R2 to 0.
@R0 
D=M // First check if R0 > 0 or not
@END
D;JLE // If R0 <= 0 goto (END)
(LOOP)
@R2
D=M // D=R2
@R1
D=D+M // D+=R1
@R2
M=D // R2=D
@R0
M=M-1 // R0-=1
D=M
@END
D;JLE // If R0<=0 goto (END)
@LOOP
0;JMP // Else goto (LOOP)
(END)