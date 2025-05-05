

;########### ESTOS SON LOS OFFSETS Y TAMAÑO DE LOS STRUCTS
; Completar las definiciones (serán revisadas por ABI enforcer):
NODO_OFFSET_NEXT EQU 0
NODO_OFFSET_CATEGORIA EQU 8
NODO_OFFSET_ARREGLO EQU 16
NODO_OFFSET_LONGITUD EQU 24
NODO_SIZE EQU 32
PACKED_NODO_OFFSET_NEXT EQU 0
PACKED_NODO_OFFSET_CATEGORIA EQU 8
PACKED_NODO_OFFSET_ARREGLO EQU 9
PACKED_NODO_OFFSET_LONGITUD EQU 17
PACKED_NODO_SIZE EQU 21
LISTA_OFFSET_HEAD EQU 0
LISTA_SIZE EQU 8
PACKED_LISTA_OFFSET_HEAD EQU 0
PACKED_LISTA_SIZE EQU 8

;########### SECCION DE DATOS
section .data

;########### SECCION DE TEXTO (PROGRAMA)
section .text

;########### LISTA DE FUNCIONES EXPORTADAS
global cantidad_total_de_elementos
global cantidad_total_de_elementos_packed

;########### DEFINICION DE FUNCIONES
;extern uint32_t cantidad_total_de_elementos(lista_t* lista);
;registros: lista[RDI]
;rdi = node pointer
;rsi = node arr length
cantidad_total_de_elementos:
	;push RBP
	;mov RBP, RSP
	xor EAX, EAX ; EAX = 0
	mov RDI, [RDI] ; RDI = *head

	cantidad_total_de_elementos_loop:
		cmp rdi, 0x00
		JE cantidad_total_de_elementos_ret
		MOV esi, [rdi+NODO_OFFSET_LONGITUD]
		ADD eax, esi
		mov rdi, [rdi+NODO_OFFSET_NEXT]
		JMP cantidad_total_de_elementos_loop

	cantidad_total_de_elementos_ret:
		;pop RBP
		ret

;extern uint32_t cantidad_total_de_elementos_packed(packed_lista_t* lista);
;registros: lista[RDI]
cantidad_total_de_elementos_packed:
	;push RBP
	;mov RBP, RSP
	xor EAX, EAX ; EAX = 0
	mov RDI, [RDI] ; RDI = *head

	cantidad_total_de_elementos_packed_loop:
		cmp rdi, 0x00
		JE cantidad_total_de_elementos_ret
		MOV esi, [rdi+PACKED_NODO_OFFSET_LONGITUD]
		ADD eax, esi
		mov rdi, [rdi+PACKED_NODO_OFFSET_NEXT]
		JMP cantidad_total_de_elementos_packed_loop

	cantidad_total_de_elementos_packed_ret:
		;pop RBP
		ret
