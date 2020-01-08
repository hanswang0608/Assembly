
;<Program title>

jmp start

;data


;code
start: nop
LXI H, 3000h
MVI M, 210h
MOV A, M
MVI C, 04h
loop: nop
CMP C
JNC divisible
JC notLeap
hlt
divisible: SUB C
JZ nextStep
JMP loop

nextStep: nop
MOV A, M
MVI C, 64h
loop2: nop
CMP C
JNC divisible2
JC leap
hlt
divisible2: SUB C
JZ div400
JMP loop2

div400: nop
MOV A, M
MVI C, 90h
MVI B, 01h
loop3: nop

hlt
leap: MVI B, 01h
hlt
notLeap: MVI B, 00h
hlt