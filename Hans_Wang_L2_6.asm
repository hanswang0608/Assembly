
;<oddparity>
;Checks the rightmost 7 bits of a number in reg B. 
;If there is an odd amount of 1s, change the first bit of the number to 0
;If there is an even amount of 1s, change the first bit of the number to 1
;The answer is stored in C

jmp start

;data


;code
start: nop
MVI B, 00011100b	;choose a number to put in B
MOV A, B	;Move it into A
MVI D, 07h	;set a loop counter to run the loop 7 times
MVI E, 00h	;Clear E
	loop: nop	
	RRC		;rotate all the bits of the number to the right
	JC one		;if the rightmost bit was a 1, jump to flag
	reenter: nop	;reenter the loop after condition
	DCR D		;decrease counter
	JZ done		;if counter reaches 0 exit
	JMP loop	;return to top of loop
one: INR E	;if the bit was a 1 increase a counter in E
JMP reenter	;reenter loop after condition

done: nop	;loop exit
MOV A, E	;move the counter for 1s into A
ANI 01h		;check if its even or odd
JZ even		;condition for even
JNZ odd		;condition for odd
even: nop	
MOV A, B	;move original number into A
ORI 10000000b	;or it with 10000000 in binary so that all the 7 rightmost bits remain but the first bit is always set to a 1
MOV C, A	;move result into C
hlt		;stop program
odd: nop	
MOV A, B	;move original into A
ani 01111111b	;and it with 01111111 in binary so that all the 7 rightmost bits remain but the first bit is always set to a 0
MOV C, A	;move result into C
hlt		;stop program
