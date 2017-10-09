;Writes a number to the screen
;param - address of a number (*qword)
%macro	writenum	1
		pushall
		mov		rcx, 0
		mov		rax, [%1]
		jmp	breaknum

breaknum:
		mov		rdx, 0
		mov		rbx, 10
		div		rbx 
		push	rdx
		inc		rcx
		cmp		rdx, 0
		jg		breaknum
		jmp		.checkzero

.checkzero:
		cmp		rax, 0
		jg		breaknum
		cmp		rcx, 1
		jne		.removeleadingzero
		jmp		printnum

.removeleadingzero:
		pop		qword [a]
		jmp		printnum

printnum:
		pop		qword [a]
		add		qword [a], 48
		write	a, 1
		sub		qword [a], 48
		dec		rcx
		cmp		rcx, 1
		jg		printnum
		popall
%endmacro

;Writes an specifed number of bytes to the screen
;param - address of the start of a string (*byte)
;param - number of bytes to write to screen (dword)
%macro	write	2
		pushall
		mov		rax, 4
		mov		rbx, 1
		mov 	rcx, %1
		mov		rdx, %2
		int		0x80
		popall
%endmacro

;Exits the program with a specified code
;param - exit status, usually zero if no error (dword)
%macro	quit	1
		mov 	rax, 1
		mov		rbx, %1
		int		0x80
%endmacro

;Pushes general purpose registers to stack (use popall to ensure clean reset)
%macro	pushall	0
		push	rax
		push	rbx
		push	rcx
		push	rdx
%endmacro

;Pops general purpose registers from stack (in reverse order to ensure proper alignment)
%macro	popall	0
		pop		rdx
		pop		rcx
		pop		rbx
		pop		rax
%endmacro

;TESTS
segment	.data
a	dd	12345

segment	.text
global	_start

_start:
	writenum	a
	quit	0