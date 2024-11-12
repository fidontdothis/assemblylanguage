data segment
convtable db 30h,31h,32h,33h,34h,35h,36h,37h,38h,39h,40h,41h,42h,43h,44h,45h 
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
mov bl,al
mov ah,01h
int 21h
sub al,30h

