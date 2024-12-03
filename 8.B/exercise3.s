.global _start
_start:

    LDR R0, =array          
    LDR R1, =size           
    LDR R1, [R1]            

    BL find_min_max         

    B .    

find_min_max:

    PUSH {R4, R5, R6, LR}

    MOV R2, R0                 
    MOV R3, #0            
    LDR R4, [R2]               
    MOV R5, R4

LOOP:
    LDR R6, [R2, R3, LSL #2]
    CMP R6, R4                  
    BLT UPDATE_MIN              
    CMP R6, R5                  
    BGT UPDATE_MAX              
    B NEXT_ELEMENT
	
UPDATE_MIN:
    MOV R4, R6
    B NEXT_ELEMENT

UPDATE_MAX:
    MOV R5, R6 

NEXT_ELEMENT:
    ADD R3, R3, #1         
    CMP R3, R1                  
    BLT LOOP                    

    MOV R0, R4                 
    MOV R1, R5                  

    POP {R4, R5, R6, PC}
	
.section .data
array: .word 3, 7, 2, 8, 5  
size:  .word 5               
