.386

dseg segment use16
    x db ?
    y dw ?
dseg ends

cseg segment use16
assume ds:dseg, cs:cseg
m1:  mov cx, dseg
     mov ds, cx

     cmp ds:x, 30
     jb short f1
     je short f2
     mov ax, 84d
     sub ax, word ptr ds:x ; -x + 84
     jmp short fin

f1:  mov ax, 120d
     sub ax, word ptr ds:x ; 120 - x
     jmp short fin

f2:  mov ax, 140d
     add ax, word ptr ds:x ; 140 + x

fin: mov ds:y, ax

     mov ah, 4ch
     int 21h
cseg ends
end m1
    
