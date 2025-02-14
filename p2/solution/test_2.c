#include "types.h"
#include "stat.h"
#include "user.h"

#define MAX_NAME_LEN 256

int main(int argc, char* argv[]) {
  char parent_name[MAX_NAME_LEN];
  char child_name[MAX_NAME_LEN];

  if (getparentname((char*)0, child_name, MAX_NAME_LEN, MAX_NAME_LEN) < 0 &&
    getparentname(parent_name, (char*)0, MAX_NAME_LEN, MAX_NAME_LEN) < 0) {
    printf(1, "XV6_TEST_OUTPUT Null pointers handled correctly.\n");
    exit();
  }

  printf(2, "XV6_TEST_ERROR Test failed! Null pointers not handled correctly.\n");
  exit();
}