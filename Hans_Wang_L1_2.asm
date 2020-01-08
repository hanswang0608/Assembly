
;<L1_2_biggest>
;This program compares integers stored in B and C
;Whichever number is greater, put it into D
;If they are equal, put B into D

jmp start

;data


;code
start: nop
MVI B, 9h	;put number into B
MVI C, 3h	;put number into C
MOV A, B	;move B into A
CMP C		;Compare with C
JC Cbigger	;jump if C is bigger indicated by carry flag
JZ Equal	;jump if equal indicated by zero flag
JNC Bbigger	;jump if B is bigger indicated by resetting of carry/zero flag

Cbigger: MOV D, C	;move C into D if C is bigger
hlt		
Equal: MOV D, B		;move B into D if equal
hlt
Bbigger: MOV D, B	;move B into D if B is bigger
hlt