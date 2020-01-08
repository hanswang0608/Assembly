
;<divbysubtracting>

jmp start

;data


;code
start: nop
MVI B, 08h
MVI C, 02h
MVI D, 00h
MVI E, 00h
MOV A, B
loop: nop
CMP C
JNC divisible
JC less
hlt
divisible: SUB C
INR D
JMP loop
less: MOV E, A
hlt