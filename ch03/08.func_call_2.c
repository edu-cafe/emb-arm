#include <stdio.h>

extern int asm_func_test(void);
int main(void)
{
	int rst;

	printf("Arm Assembly Function Call Test2!!\n");
	rst = asm_func_test();
	printf("\nReturn Val : %d\n", rst);

	return 0;
}

