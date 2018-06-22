#include <stdio.h>
char data[100];

extern char *asm_inst_pseudo(void);
extern int (*asm_inst_pseudo2(void))(void);
extern int asm_sum_1_10(void);
int main(void)
{
	char *rst=NULL;
	int (*fp)(void);
	int rst2=0;

	printf("addr_data:%p\n", &data);
	printf("addr_rst:%p\n", &rst);
	printf("Arm Assembly Pseudo Instruction Test!!\n");
	rst = asm_inst_pseudo();
	printf("\nReturn Val : %s\n", rst);

	printf("\n\nArm Assembly Pseudo Instruction Test2!!\n");
	fp = asm_inst_pseudo2();
	rst2 = fp();
	printf("\nReturn Val : %d\n", rst2);

	return 0;
}

