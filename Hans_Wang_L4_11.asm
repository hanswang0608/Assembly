
;<divbyshifting>
;This program divides a 4 bit number in B by a 4 bit number in C
;The division is done by shifting the dividend and subtracting it with the divisor when divisible
;The program resembles the process of long-division

jmp start

;data


;code
start: nop
MVI B, 05h	;Dividend
MVI C, 00h	;Divisor
MOV A, C
ADI 00h
JZ divisorZero
MVI D, 00h	;Clear D
MVI E, 00h	;Clear E
MVI H, 00h	;Clear H
MOV A, B	;Move B to A
RLC		;Move the 4 bits of the dividend all the way left
RLC
RLC
RLC
MOV B, A	;Move this shifted version into B
MVI L, 04h	;Set a counter to make loop run 4 times
	loop: nop
	MOV A, B	;Move B to A
	RLC		;Rotate left once and place that bit in the carry flag
	MOV B, A	;Store the rotated version
	MOV A, H	;Move the updating remainder into A
	RAL		;Push a new digit of the dividend to the remainder
	CMP C		;Compare to see if divisible
	JNC divisible	;If the dividend is bigger, it's divisible
	JC remainder	;Otherwise it's a remainder to be carried over for the next shift
	reenter: nop
	DCR L		;Decrement counter
	JNZ rotate	;If counter is not 0, rotate the quotient left once
	JNZ loop	;If counter is not 0, reloop
MOV E, H	;If counter was 0, loop was exited and now move final remainder into E
hlt
divisible: nop
SUB C		;If the dividend is divisble, subtract it by divisor
MOV H, A	;Whatever is left from the subtracting is the remainder to be carried over to the next shift
INR D		;Increment quotient by 1
JMP reenter	;Reenter the loop
remainder: nop
MOV H, A	;Move the dividend to be the remainder for next operation since no subtraction was performed
JMP reenter	;Reenter loop
rotate: MOV A, D;Move quotient to A
RLC		;Rotate all the bits to the left to shift to the next digit
MOV D, A	;Store it back as the new quotient
JMP loop	;Jump back to loop
hlt
divisorZero: MVI D, 0DEh
MVI E, 0ADh
hlt

