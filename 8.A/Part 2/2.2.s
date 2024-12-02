.global _start
_start:
	
	MOV R0, #10
	MOV R1, #20
	MOV R2, #0
	MOV R3, #0x30000000
	
	CMP R1, R0
	MOVGT R2, #1 
	
	STR R2, [R3] 
	
