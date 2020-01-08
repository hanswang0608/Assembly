
;<Palindrome>
;This program takes a number into Reg B and checks if its bits are a palindrome
;If it's a palindrome, move FF into Reg C
;If it's not a palindrome, move 00 into Reg C
;This works by rotating all the 4 rightmost bits of the number right and storing them in reverse direction in E
;Then rotating all the 4 leftmost bits left and store them in original order
;Compare if the 'two halves' of the number are equal forward and backward

jmp start

;data


;code
start: nop
MVI B, 10101001b	;Store a number to be checked
MVI D, 04h		;Make a counter for the loop
MVI E, 00h		;Clear E
MVI L, 00h		;Clear L
MOV A, B		;Move Reg B into A
	loop: nop
	RRC			;Rotate A to the right
	MOV H, A		;Store the rotated result into H
	MOV A, E		;Move E into A
	RAL			;Rotate A to the left and insert the carry bit into D0
	MOV E, A		;Store result into Reg E
	MOV A, H		;Move original number back into A
	DCR D			;Decrease loop counter
	JNZ loop		;If loop counter is not 0, reloop
MOV A, B		;Move original number into A
MVI D, 04h		;Reset loop counter to run 4 times again
	loop2: nop		
	RLC			;Rotate A to the left
	MOV H, A		;Repeat
	MOV A, L		;Move L into A
	RAL			;repeat
	MOV L, A		;Store result into Reg L
	MOV A, H		;repeat
	DCR D			;repeat
	JNZ loop2		;repeat
MOV A, E		;Move Right half of the number into A
CMP L			;Compare it with left
JZ same			;if they are the same, jump
MVI C, 00h		;Put 00 into C if it's not same
hlt
same: MVI C, 0FFh	;put FF into C if it's the same
hlt
