extern malloc
extern free
extern fprintf

section .data

null_str: db 'NULL'

section .text

global strCmp
global strClone
global strDelete
global strPrint
global strLen

; ** String **

; int32_t strCmp(char* a, char* b)
; *a = rdi
; *b = rsi
; ch_a = dl
; ch_b = cl
strCmp:
	push rbp
	xor rdx, rdx
	xor rcx, rcx
	
	strCmp_loop:
		mov byte dl, [rdi]  
		mov byte cl, [rsi]
		cmp dl, 0x0
		je strCmp_a0
		cmp cl, 0x0
		je strCmp_retm1
		cmp dl, cl
		jl strCmp_ret1
		jg strCmp_retm1
		add rdi, 1
		add rsi, 1
		jmp strCmp_loop

	strCmp_a0:
		cmp cl, 0x0
		je strCmp_ret0
		mov eax, 1
		jmp strCmp_ep
	
	strCmp_ret1: mov eax, 1
		jmp strCmp_ep
	strCmp_retm1: mov eax, -1
		jmp strCmp_ep
	strCmp_ret0: mov eax, 0
	strCmp_ep: 
		pop rbp
		ret

; char* strClone(char* a)
; *a = rdi
strClone:
	push rbp
	mov rbp, rsp
	
	push rdi
	sub rsp, 8 ;alinear
	call strLen ; len -> rax
	add rsp, 8 ;normal
	mov rdi, rax ; len -> rdi
	add rdi, 1
	push rdi
	call malloc ; clone -> rax
	pop rdi ; len -> rdi
	pop rsi ; *a -> rsi
	mov rdx, rax ; clone_p -> rdx

	; clone = rax
	; len = rdi, *a = rsi, *clone_p = rdx
	strClone_loop: cmp edi, 0
		je strClone_ret
		mov byte cl, [rsi]
		mov byte [rdx], cl
		add rdx, 1
		add rsi, 1
		sub edi, 1
		jmp strClone_loop

	strClone_ret: 
		pop rbp
		ret

; void strDelete(char* a)
; *a -> rdi
strDelete:
	push rbp
	call free
	pop rbp
	ret

; void strPrint(char* a, FILE* pFile)
; *a = rdi
; *pFile = rsi

strPrint:
	push rbp
	
	cmp rdi, 0x0
	jne strPrint_cont
	mov rdi, null_str
strPrint_cont:
	mov rdx, rdi ;
	mov rdi, rsi ; swap 
	mov rsi, rdx ; 

	call fprintf

	pop rbp
	ret

; uint32_t strLen(char* a)
; *a = rdi
; count = eax
strLen:
	xor eax, eax
	strLen_loop:
		cmp byte [rdi], 0x0
		je strLen_ret
		add eax, 1
		add rdi, 1
		jmp strLen_loop
	strLen_ret: ret

