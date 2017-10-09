;Writes a number to the screen
;param - address of a number (*dword)
%macro	writenum	1
		pushall
		mov		ecx, 0
		mov		eax, [%1]
		jmp	breaknum

breaknum:
		mov		edx, 0
		mov		ebx, 10
		div		ebx 
		push	edx
		inc		ecx
		cmp		edx, 0
		jg		breaknum
		jmp		.checkzero

.checkzero:
		cmp		eax, 0
		jg		breaknum
		cmp		ecx, 1
		jne		.removeleadingzero
		jmp		printnum

.removeleadingzero:
		pop		dword [a]
		jmp		printnum

printnum:
		pop		dword [a]
		add		dword [a], 48
		write	a, 1
		sub		dword [a], 48
		dec		ecx
		cmp		ecx, 1
		jg		printnum
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
%endmacro

;TESTS
segment	.data
a	dd	12345

segment	.text
global	_start

_start:
	writenum	a
	quit	0