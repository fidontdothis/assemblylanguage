data segment
conv_table db 30h, 31h, 32h, 33h, 34h, 35h, 36h, 37h, 38h, 39h, 41h, 42h, 43h, 44h, 45h, 46h
temp_c db 00h
temp_k db 00h, 00h
ans db 00h
msg1 db 'temp in cel: $'
msg2 db 'temp in kel: $'
msg3 db 0dh, 0ah, 24h
data ends


code segment
assume cs:code ,ds:data
start:
mov ax, data 
mov ds, ax
lea dx, msg1
mov ah, 09h
int 21h
mov ah, 01h
int 21h
sub al , 30h
mov bl, al

mov ah, 01h
int 21h
sub al, 30h
mov cl, 04h
rol bl, cl
add bl, al
mov ans, bl


mov al, ans
add al, 73h
daa
mov temp_k, al
mov cl, 02h
adc temp_k+1, cl
mov al, temp_k+1
mov ans , al

lea dx, msg3
mov ah, 09h
int 21h
lea dx, msg2
mov ah, 09h
int 21h
call display


mov al, temp_k
mov ans , al

call display


mov ah, 04ch
int 21h



display proc

lea bx , conv_table
mov cl, 04h
mov al, ans
and al, 0f0h
ror al, cl
xlatb
mov dl, al
mov ah, 02h
int 21h

mov al, ans
and al, 0fh
xlatb
mov dl, al
mov ah, 02h
int 21h

ret
display endp
code ends
end start