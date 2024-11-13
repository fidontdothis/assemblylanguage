data segment
msg1 db "enter cee mark$"
msg2 db "enter ese mark$"
msg3 db 0dh,0ah,24h
cee db 00h
ese db 00h
S db "passed grade S"
A db "passed grade A"
B db "passed grade B"
C db "passed grade C"
D db "passed grade D"
failmsg db "failed$"
data ends
assume cs:code,ds:data
code segment
start: 
mov ax,data
mov ds,ax
lea dx,msg1
mov ah,09h
int 21h
lea dx,msg3
mov ah,09h
int 21h
mov ah,01h ;read cee mark
int 21h
sub al,30h
mov cl,04h
rol al,cl
and al,0f0h
mov bl,al
mov ah,01h
int 21h
sub al,30h
add bl,al 
daa 
mov cee,bl
lea dx,msg2
mov ah,09h
int 21h
mov ah,01h ;read ese mark
int 21h
sub al,30h
mov cl,04h
rol al,cl
and al,0f0h
mov bl,al
mov ah,01h
int 21h
sub al,30h
add bl,al 
daa 
cmp bl,19
jb printfailmsg
add bl,cee 
daa 
cmp bl,89h
ja printS
cmp bl,79h
ja printA 
cmp bl,69h
ja printB
cmp bl,59h
ja printC 
cmp bl,50h
ja printD
jmp printfailmsg

printfailmsg:
lea dx,failmsg
mov ah,09h
int 21h
mov ah,4ch
int 21h
printS: lea dx,S 
mov ah,09h
int 21h
jmp exit
printA: lea dx,A
mov ah,09h
int 21h
jmp exit
printB: lea dx,B 
mov ah,09h
int 21h
jmp exit
printC: lea dx,c 
mov ah,09h
int 21h
jmp exit
printD: lea dx,D
mov ah,09h
int 21h
exit:
mov ah,4ch
int 21h
code ends 
end start


