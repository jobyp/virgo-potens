#include <stdio.h>
#include <stdlib.h>

/* defined in hello.s */
void hello(void);

int main(void)
{
	hello();
	exit(EXIT_SUCCESS);
}
