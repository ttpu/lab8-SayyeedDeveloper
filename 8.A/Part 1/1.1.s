.global _start
_start:
	
	MOV R1, #10
	
	MOV R0, #0x20000000
	STR R1, [R0]