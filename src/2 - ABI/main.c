#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>
#include <assert.h>

#include "../test-utils.h"
#include "ABI.h"

int main() {
	/* Acá pueden realizar sus propias pruebas */
	//assert(alternate_sum_4_using_c(8, 2, 5, 1) == 10);
	assert(alternate_sum_4_using_c_alternative(8, 2, 5, 1) == 10);
	assert(alternate_sum_8(0x11, 0x2, 0x13, 0x4, 0x15, 0x6, 0x17, 0x8) == 0x3c);
	uint32_t product_2_f_test = 69;
	product_2_f(&product_2_f_test, 9, 0.7f);
	assert(product_2_f_test == 6);
	
	double product_9_f_test;
	product_9_f(&product_9_f_test, 1, 1.1f, 2, 2.2f, 3, 3.3f, 4, 4.4f, 5, 5.5f, 6, 6.6f, 7, 7.7f, 8, 8.8f, 9, 9.9f);
	assert(product_9_f_test == 1*1.1f*2*2.2f*3*3.3f*4*4.4f*5*5.5f*6*6.6f*7*7.7f*8*8.8f*9*9.9f);

	return 0;
}
