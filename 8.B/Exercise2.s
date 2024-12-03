.global _start
_start:
    LDR     R1, =array
    LDR     R2, =5
    MOV     R3, #0
    LDR     R5, [R1]
    MOV     R6, R5

LOOP:
    LDR     R4, [R1], #4
    ADD     R3, R3, R4
    CMP     R4, R5
    MOVLT   R5, R4
    CMP     R4, R6
    MOVGT   R6, R4
    SUBS    R2, R2, #1
    BNE     LOOP

.data
array: .word 1, 2, 3, 4, 5
