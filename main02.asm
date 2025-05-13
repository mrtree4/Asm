.386

dseg segment use16
    numb1 db 6Ah
    numb2 dw 07F2Dh   
    result dd ?  
    change dd ?    
    code   dw ?
dseg ends

cseg segment use16
assume ds:dseg, cs:cseg
m1: mov cx, dseg
    mov ds, cx
    movzx ax, ds:numb1
    mul ds:numb2
    ; сохранение в result
    mov bl, al ;мл. байт
    mov bh, dh ;ст. байт
    mov ds:res2, ebx
    rol bx, 8
    shl edx, 16
    mov dx, ax
    mov ds:res1, edx 
    mov cx, ds:numb2
    bt cx, 12
    rcl dx, 1
    bt cx, 11
    rcl dx, 1
    bt cx, 10
    rcl dx, 1
    bt cx, 9
    rcl dx, 1
    bt cx, 8
    rcl dx, 1
    bt cx, 7
    rcl dx, 1
    bt cx, 6
    rcl dx, 1
    shl dx, 6
    or dx, 1110000000000000b
    and dx, 111111111000000b
    mov ds:res3, dx
    mov ah, 4ch
    int 21h
cseg ends
end m1
