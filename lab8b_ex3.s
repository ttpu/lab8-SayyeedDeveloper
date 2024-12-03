.global _start
_start:
	
	LDR R0, =array @array address
	
	LDR R2, =size @size address
	LDR R1, [R2] @size value
	
	BL FIND_MIN_MAX
	
	MOV R2, R0  @ min val
	MOV R3, R1  @ max val
	
	B END @ stop the program


FIND_MIN_MAX:
	PUSH {R2, R3, R4, R5}
	
	LDR R2, [R0] @ first element -> min
	LDR R3, [R0] @ first element -> max
	
	ADD R0, R0, #4
	
	MOV R4, #1  @index counter
	
	LOOP:
		CMP R4, R1 @ compare index with size
		BGE ENDLOOP
		
		LDR R5, [R0]
		
		CMP R2, R5
		MOVGT R2, R5
		
		CMP R3, R5
		MOVLT R3, R5
		
		ADD R0, R0, #4
		ADD R4, R4, #1
		
		B LOOP
		
	ENDLOOP:
		
	@ R0 - min
	@ R1 - max
	
	MOV R0, R2
	MOV R1, R3
	
	POP {R2, R3, R4, R5}
	BX LR

END:
	
.data
array: .word 5,2,8,4,7,-3, 9, 14, -6, 3
size: .word 10
