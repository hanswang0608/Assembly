
;<L1_1_oddeven>
;this program puts an immediate into the accumulator
;if this number is even, then eight 1s are moved into reg C
;if this number is odd, then eight 0s are movied into reg C

jmp start

;data


;code
start: nop
MVI A, 00h	;move a number into A
ANI 01h		;AND the number with 1
JNZ odd		;if the result of the AND is not zero, it's an odd number
JZ even		;if the result is zero, it's an even number
even: MVI C, 0FFh	;when it's even, move eight 1s into C
hlt
odd: MVI C, 00h		;when it's odd, move eight 0s into C
hlt