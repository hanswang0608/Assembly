
;<L1_4_sum5>
;This program puts 5 integers into 5 consecutive memory addresses starting at 0x3000
;It then sums the 5 integers and puts the result into register pair DE

jmp start

;data


;code
start: nop
MVI A, 00h	;clear accumulator
MVI D, 00h	
MVI E, 00h
LXI H, 3000h	;set memory address as 0x3000
MVI M, 0CDh	;set value
INX H		;increment memory address
MVI M, 0CCh	;set value
INX H		;increment memory address
MVI M, 0C9h	;set value
INX H		;increment memory address
MVI M, 0CBh	;set value
INX H		;increment memory address
MVI M, 0CAh	;set valuex
MVI C, 5h	;counter to make the loop run 5 times
	loop: nop
	ADD M		;add value at memory address 0x3004 to accumulator
	JC overflow	;jump if there is overflow
	continue: nop	;re-entering the loop from overflow branch
	DCX H		;decrement memory address
	DCR C		;decrement counter
	JNZ loop	;if counter is not 0, loop again
MOV E, A	;move the last 2 bytes of the summation into E
hlt
overflow: INR D	;if there is overflow, increment D by 1
JMP continue	;jump to re-enter loop
hlt