.386

dseg segment use16 
    a db 12h
    b db 34h
    c db 56h
    d db 78h
    e db 90h
    f dw 0FFFBh
    symb db 'T', 'B', 'O'
dseg ends
eseg segment use16
    j db ?
    k db ?
    l db ?
eseg ends
cseg segment use16
assume ds:dseg, es:eseg, cs:cseg
m1:
    mov cx, dseg
    mov ds, cx
    mov cx, eseg
    mov es, cx
    mov al, ds:c
    mov es:j, al
    mov ah, ds:f+1
    mov es:k, ah
    mov bl, ds:symb+2
    mov es:h, bl
    mov ah, 4ch
    int 21h
cseg ends
end m1