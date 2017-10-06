
;Writes a single number (0-9) to the screen
;param - adress of a number (*byte)
%macro	writenum	1
		pushall
		add		byte [%1], 48
		write	%1, 1
		sub		byte [%1], 48
		popall
%endmacro

;Writes an specifed number of bytes to the screen
;param - address of the start of a string (*byte)
;param - number of bytes to write to screen (dword)
%macro	write	2
		pushall
		mov		eax, 4
		mov		ebx, 1
		mov 	ecx, %1
		mov		edx, %2
		int		0x80
		popall
%endmacro

;Exits the program with a specified code
;param - exit status, usually zero if no error (dword)
%macro	quit	1
		mov 	eax, 1
		mov		ebx, %1
		int		0x80
%endmacro

;Pushes general purpose registers to stack (use popall to ensure clean reset)
%macro	pushall	0
		push	eax
		push	ebx
		push	ecx
		push	edx
%endmacro

;Pops general purpose registers from stack (in reverse order to ensure proper alignment)
%macro	popall	0
		pop		edx
		pop		ecx
		pop		ebx
		pop		eax