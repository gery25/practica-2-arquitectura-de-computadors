.data
A:  .word 5

.text
    daddi r1,r0,0
    daddi r8,r0,0
    lw r3,A(r0)

    daddi r9,r0,2
    daddi r10,r0,3
    daddi r11,r0,4

loop:   
    daddi r1,r1,1

    dmul r4,r1,r9
    daddi r4,r4,3 
    	
    dmul r5,r1,r1
    dmul r5,r5,r1
    dmul r5,r5,r10

    dmul r6,r1,r11
    dadd r5,r5,r6
    daddi r5,r5,5

    ; Ho transformem a float
    mtc1 r4,f2
    cvt.d.l f2,f2

    mtc1 r5,f4
    cvt.d.l f4,f4

    div.d f6,f2,f4

    ; Guardem el resultat
    add.d f8,f8,f6      

    daddi r3,r3,-1      ; Comptador
    bne r3,r0,loop

    halt
