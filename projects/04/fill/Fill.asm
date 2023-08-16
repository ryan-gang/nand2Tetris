// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

(START)
@KBD
D=M
@BLACK
D;JGT

@LIGHT
D;JEQ

(BLACK)
    @SCREEN
    D=A
    @STOREDVALUE
    M=D
    (LOOPB)
        @STOREDVALUE
        A=M
        M=-1
        A=A+1
        D=A
        @STOREDVALUE
        M=D
        @24543 // Last pixel
        D=D-A
        @LOOPB
        D;JLT
        @FINISH
        D;JEQ
    (END)
(ENDBLACK)

(LIGHT)
    @SCREEN
    D=A
    @STOREDVALUE
    M=D
    (LOOPL)
        @STOREDVALUE
        A=M
        M=0
        A=A+1
        D=A
        @STOREDVALUE
        M=D
        @24543 // Last pixel
        D=D-A
        @LOOPL
        D;JLT
        @FINISH
        D;JEQ
    (END)
(ENDLIGHT)

(FINISH)
@START
0;JMP
