data segment
convtable db 30h,31h,32h,33h,34h,35h,36h,37h,38h,39h,40h,41h,42h,43h,44h,45h 
ans db 00h
data ends
assume cs:code,ds:data
code segment
start: 
mov ax,data
mov ds,ax
lea bx,convtable
mov ah,01h
int 21h
sub al,30h
mov ans,al
mov ah,01h
int 21h
sub al,30h
add al,ans
mov ans,al
and al,0f0h
mov cl,04h
ror al,cl
xlatb
mov dl,al
mov ah,02h
int 21h
mov al,ans
and al,0fh
xlatb
mov dl,al
mov ah,02h
int 21h
mov ah,4ch
int 21h
code ends 
end start


