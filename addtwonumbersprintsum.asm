data segment 
msg1 db "enter the first number$"
msg2 db "enter the second number$"
msg3 db 0dh,0ah,24h
msg4 db "the sum is$"
data ends
assume cs:code,ds:data
code segment 
start:
mov ax,data
mov ds,ax
lea dx,msg1
mov ah,09h
int 21h
mov ah,01h ;read first num
int 21h
sub al,30h ;convert to decimal
mov bl,al  ;store in bl
lea dx,msg3
mov ah,09h
int 21h
lea dx,msg2
mov ah,09h
int 21h
mov ah,01h ;Read second num
int 21h
sub al,30h ;convert to decimal
add al,bl ;add two nums
daa 
mov bl,al
and al,0f0h
mov cl,04h
ror al,cl ;get the upper digit
add al,30h ;covert to ascii
mov dl,al ;display upper character
mov ah,02h
int 21h
and bl,0fh ;get the lower digit
add bl,30h ;convert to ascii
mov dl,bl  ;display lower character
mov ah,02h
int 21h
mov ah,4ch
int 21h 
code ends
end start








