#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>
#include <assert.h>

#include "../test-utils.h"
#include "Estructuras.h"

int main() {
	lista_t cnt_lista;
	uint32_t cnt_head_arr[] = {10,20,30};
	nodo_t cnt_head = {NULL, 69, cnt_head_arr, 3};

	uint32_t cnt_next_arr[] = {100, 200, 300, 400};
	nodo_t cnt_next = {NULL, 137, cnt_next_arr, 4};
	
	cnt_head.next = &cnt_next;
	cnt_lista.head = &cnt_head;

	assert(cantidad_total_de_elementos(&cnt_lista) == 7);

	return 0;
}
