;Writes a number to the screen
;param - address of a number (*qword)
%macro	writenum	1
		push	qword [%1]
		xor		eax, eax
		xor		ebx, ebx
		xor		ecx, ecx
		xor		edx, edx
		mov		rax, [%1]
		jmp	%%breaknum

%%breaknum:
		mov		rdx, 0
		mov		rbx, 10
		div		rbx 
		push	rdx
		inc		rcx
		cmp		rdx, 0
		jg		%%breaknum
		jmp		%%checkzero

%%checkzero:
		cmp		rax, 0
		jg		%%breaknum
		cmp		rcx, 1
		jne		%%removeleadingzero
		jmp		%%printnum

%%removeleadingzero:
		pop		qword [%1]
		jmp		%%printnum

%%printnum:
		pop		qword [%1]
		add		qword [%1], 48
		write	a, 1
		sub		qword [%1], 48
		dec		rcx
		cmp		rcx, 1
		jg		%%printnum
		pop		qword [%1]
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
%macro	quit	0-1		0
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
	call	testnum
	writenum	a
	writenum	a
	writenum	a
	writenum	a
	quit

; testnum:
; 	call	testnum2
; 	ret

testnum:
	ret

; testnum:
; 		pushall
; 		xor		eax, eax
; 		xor		ebx, ebx
; 		xor		ecx, ecx
; 		xor		edx, edx
; 		mov		rax, [a]
; 		sub		rax, 0x2C00000000
; 		; write	a, 1		;for some reason this allow us to print the correct number
; 		jmp	%%breaknum

; %%breaknum:
; 		mov		rdx, 0
; 		mov		rbx, 10
; 		div		rbx 
; 		push	rdx
; 		inc		rcx
; 		cmp		rdx, 0
; 		jg		%%breaknum
; 		jmp		%%checkzero

; %%checkzero:
; 		cmp		rax, 0
; 		jg		%%breaknum
; 		cmp		rcx, 1
; 		jne		%%removeleadingzero
; 		jmp		%%printnum

; %%removeleadingzero:
; 		pop		qword [a]
; 		jmp		%%printnum

; %%printnum:
; 		pop		qword [a]
; 		add		qword [a], 48
; 		write	a, 1
; 		sub		qword [a], 48
; 		dec		rcx
; 		cmp		rcx, 1
; 		jg		%%printnum
; 		popall
; 		ret