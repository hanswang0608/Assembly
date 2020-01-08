
;<prime>
;This program takes a number in B and determines if it is a prime number
;If it's a prime number, set C to 01, else set it to 00
;It works by having a 2 loops
;The outer loop sets C at 2, and loops all the way up until C equals B
;The inner loop repeatedly subtracts B by C until it can no longer be subtracted
;If the remainder of the subtraction is 0, then it is not a prime number
;If the remainder wasn't 0, increment C and repeat
;If the program runs all the way until C equals B, then it is a prime number

jmp start

;data


;code
start: nop
MVI B, 00h	;Number to be checked, or the upper bound of the loop
MVI C, 02h	;Lower bound of the loop, like saying for(int i = 2;;)
MOV A, B
CMP C
JC notPrime

outerloop: nop
MOV A, C	;Move the current iteration of the loop into A
CMP B		;Check the current iteration against the upper bound
MOV A, B	;Move the original number into A
JC innerloop	;If the previous check says that C is less than B, then the loop is not finished
JMP isPrime	;If the C > B, then the loop is finished and B is a prime
	innerloop: nop		;Innerloop is for repeated subtraction to check remainder
	CMP C			;Check if the dividend is still bigger than the divisor
	JC notDivisible2	;If it's smaller, then it's not divisible and exit loop
	SUB C			;If it's equal or bigger, subtract
	JMP innerloop
notDivisible2: ORI 00h		;If it's not divisble, check remainder by OR
JZ notPrime			;If the remainder is 0, it's not a prime number
INR C				;If remainder is not 0, increment C to next loop iteration and keep checking
JMP outerloop
notPrime: MVI C, 00h		;If it's not prime, set C to 00
hlt 			
isPrime: MVI C, 01h		;If it's a prime, set C to 01
hlt