#include <stdio.h>
#include <stdlib.h>

/* defined in exponentfunc.s */
unsigned exponent(unsigned, unsigned);

int main(void)
{
	printf("3^4 == %u\n", exponent(3, 4));
	exit(EXIT_SUCCESS);
}
