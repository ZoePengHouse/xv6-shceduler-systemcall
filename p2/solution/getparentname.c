// getparentname.c
#include "types.h"
#include "stat.h"
#include "user.h"
int main(void)
{
	char parentbuf[256];
	char childbuf[256];

	if(getparentname(parentbuf,childbuf, 5, 5) == 0)
	{
		printf(1, "XV6_TEST_OUTPUT Parent name: %s Child name: %s\n", parentbuf, childbuf);
	}
	exit();
}
