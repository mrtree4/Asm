.386

dseg segment use16
    numb1 db 6Ah
    numb2 dw 07F2Dh   
    result dd ?  
    change dd ?    
    code dw ?
dseg ends
cseg segment use16
assume ds:dseg, cs:cseg
m1: mov cx, dseg
    mov ds, cx
    movzx ax, ds:numb1
    mul ds:numb2
    mov bh, dh
    mov bl, al
    shl edx, 16
    mov dx, ax
    mov ds:result, edx
    mov dh, bh
    mov dl, bl
    and bh, 00001111b
    and bl, 11110000b
    or bh, bl
    or bl, dl
    and dh, 11110000b
    and bl, 00001111b
    or bl, dh
    mov eax, ds:result
    and eax, 00001111111111111111111100001111b
    mov cl, bl 
    and bl, 00000000b
    shl ebx, 16
    or eax, ebx
    or eax, ecx
    mov ds:change, eax
    and dx, 0000000000000000b
    or dx, 1110000000000000b
    or dx, ds:numb2   
    and dx, 1111111111000000b
    mov ds:code, dx
    mov ah, 4ch
    int 21h
cseg ends
end m1
    