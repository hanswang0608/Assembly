
;<2scomp>
;This program takes a number in the accumulator and determines if it is in 2's complement form
;It does so by checking if the leftmost bit, the sign flag, is 1
;If it is, the program subtracts 1 and complements the bits to turn it back into a positive number
;If it was a 2's complement number, store the result into B

jmp start

;data


;code
start: nop
MVI A, 0FFh	;Move a number into the accumulator in binary form
ADI 00h			;Add 0 to it so the flags are set without any changes
JM true			;If the sign flag (leftmost bit) is a 1, it is a 2's complement number
hlt			;If it wasn't, then stop program
true: DCR A		;Take away 1 from the number to convert it into 1's complement
CMA			;Complement it (bitswap) into the positive number
MOV B, A		;Move result into B
hlt