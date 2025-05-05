.data 
resultat: .double 0.0   ; Variable per guardar el resultat en punt flotant

.text
main:   daddi r1, r0, 0     ; Inicialitzem a 0 el comptador
        daddi r3, r0, 5     ; Inicialitzem a 5 el valor limit del bucle 

        ; Convertim les constants a punt flotant
        daddi r4, r0, 2     
        mtc1 r4, f2         ; Movem 2 a f2
        cvt.l.d f2, f2      ; Convertim a double

        daddi r4, r0, 3
            mtc1 r4, f3         ; Movem 3 a f3
        cvt.l.d f3, f3      ; Convertim a double

        daddi r4, r0, 4
        mtc1 r4, f4         ; Movem 4 a f4
        cvt.l.d f4, f4      ; Convertim a double

        daddi r4, r0, 5
        mtc1 r4, f5         ; Movem 5 a f5
        cvt.l.d f5, f5      ; Convertim a double

    loop:   mtc1 r1, f1         ; Movem n a f1
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

    ; Incrementar comptador i comprovar
    daddi r1, r1, 1     ; Incrementem n
    bne r1, r3, loop   ; Si r1 != 5, tornem al bucle

    s.d f10, resultat(r0) ; Guardem el resultat final
    halt                ; Fi del programa