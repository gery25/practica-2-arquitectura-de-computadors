.data 
resultat: .double 0.0  ; Variable per guardar el resultat en punt flotant
dos: .double 2.0       ; Constant 2.0
tres: .double 3.0      ; Constant 3.0
quatre: .double 4.0    ; Constant 4.0
cinc: .double 5.0      ; Constant 5.0
zero: .double 0.0      ; Constant 0.0
.text
main:   
    daddi r1, r0, 1     ; Inicialitzem a 0 el comptador
    daddi r3, r0, 6     ; Inicialitzem a 5 el valor limit del bucle 

    ; Carreguem les constants en registres de punt flotant
    l.d f2, dos(r0)     ; Carreguem 2.0
    l.d f3, tres(r0)    ; Carreguem 3.0
    l.d f4, quatre(r0)  ; Carreguem 4.0
    l.d f5, cinc(r0)    ; Carreguem 5.0
    l.d f11, zero(r0)   ; Carreguem 0.0

loop:   
    mtc1 f1, r1        ; Movem n a f1
    cvt.l.d f1, f1      ; Convertim n a double
    mul.d f6, f2, f1    ; 2 * n
    add.d f6, f6, f3    ; 2n + 3 

    ; Calculem n³
    mul.d f7, f1, f1    ; n²
    mul.d f7, f7, f1    ; n³
    mul.d f7, f7, f3    ; 3n³

    ; Calculem 4n i sumem
    mul.d f8, f4, f1    ; 4n
    add.d f7, f7, f8    ; 3n³ + 4n
    add.d f7, f7, f5    ; 3n³ + 4n + 5

    ; Fem la divisió
    div.d f10, f6, f7   ; (2n + 3)/(3n³ + 4n + 5)
    add.d f11, f11, f10

    ; Incrementar comptador i comprovar
    daddi r1, r1, 1     ; Incrementem n
    bne r1, r3, loop    ; Si r1 != 5, tornem al bucle

    s.d f10, resultat(r0) ; Guardem el resultat final
    halt                ; Fi del programa