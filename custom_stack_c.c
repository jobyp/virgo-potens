#include <stdio.h>
#include <stdlib.h>

void custom_stack(void);

int main(void)
{
	puts("calling custom_stack()");
	custom_stack();
	puts("after custom_stack()");
	exit(EXIT_SUCCESS);
}
