.386

dseg segment use16
    x db ?
    y dw ?
dseg ends

cseg segment use16
assume ds:dseg, cs:cseg
m1:  mov cx, dseg
     mov ds, cx

     movsx ax, ds:x
     cmp ax, 30
     jb short f1
     je short f2
     neg ax
     add ax, 84
     jmp short fin

f1:  neg ax
     add ax, 120
     jmp short fin

f2:  add ax, 140

fin: mov ds:y, ax

     mov ah, 4ch
     int 21h
cseg ends
end m1
    
