.global _start
_start:
	MOV R0, #7
	LDR R1, =result
	MOV R2, #0
	MOV R3, #0
	
	LOOP:
		STR R3, [R1], #4
		ADD R3, R3, #2 
		ADD R2, R2, #1
		CMP R2, R0
		BLT LOOP
	
.data 
result: .skip 40
