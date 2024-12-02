.global _start
_start:


	MOV R1, #5
	MOV R2, #0
	MOV R3, #0
	
	LOOP:
		ADD R2, R2, R3
		ADD R3, R3, #1
		CMP R3, R1
		BLE LOOP
