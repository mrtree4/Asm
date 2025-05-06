;Сегментная структура данных: Трёх сегментная структура, 2 сегмента данных(dseg, eseg) и один кодовый сегмент(cseg)
;Размещение данных: В сегменте ds используются адреса ds:[a-i]; a-e - однобайтные кода, f - число со знаком в формате слова, g-i - три символа
;Использование регистров: Регистры используются по усмотрению и необходимостьи для решения данной задачи


.386

dseg segment use16 
    a db 12h
    b db 34h
    c db 56h
    d db 78h
    e db 90h
    f dw 0FFFBh
    g db 'T'
    h db 'B'
    i db 'O'
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
    mov ah, ds:[7]
    mov es:k, ah
    mov bl, ds:i
    mov es:h, bl
    mov ah, 4ch
    int 21h
cseg ends
end m1