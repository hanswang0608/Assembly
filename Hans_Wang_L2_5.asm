
;<Program title>

jmp start

;data


;code
start: nop
MVI D, 5
loop: DCR D
JZ end
INR B
JMP loop

end: hlt