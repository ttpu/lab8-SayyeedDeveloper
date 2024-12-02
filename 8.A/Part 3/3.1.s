.global _start
_start:
	
	MOV R0, #0x40000000
	MOV R1, #0 
	
	LOOP:
		STR R1, [R0] 
  		ADD R0, R0, #4
		ADD R1, R1, #1
		CMP R1, #10
		BNE LOOP
