data segment
msg1 db "enter two characters$"
msg2 db "the entered characters in rev order is$"
msg3 db 0dh,0ah,24h
ans1 db 00h
ans2 db 00h
data ends
assume cs:code,ds:data
code segment 
start: mov ax,data
mov ds,ax
lea dx,msg1 
mov ah,09h
int 21h
lea dx,msg3
mov ah,09h
int 21h
mov ah,01h
int 21h
mov ans1,al
mov ah,01h
int 21h
mov ans2,al
lea dx,msg2
mov ah,09h
int 21h
lea dx,msg3 
mov ah,09h
int 21h
mov dl,ans2
mov ah,02h
int 21h
mov dl,ans1
mov ah,02h
int 21h
mov ah,4ch
int 21h 
code ends 
end start
