#include "types.h"
#include "stat.h"
#include "user.h"

#define MAX_NAME_LEN 256

int main(int argc, char* argv[]) {
  char parent_name[MAX_NAME_LEN];
  char child_name[MAX_NAME_LEN];

  if (getparentname(parent_name, child_name, MAX_NAME_LEN, MAX_NAME_LEN) < 0)
  {
    printf(2, "XV6_TEST_ERROR getparentname call failed!\n");
    exit();
  }

  printf(1, "XV6_TEST_OUTPUT Parent Name: %s,", parent_name);
  printf(1, " Child Name: %s\n", child_name);
  exit();
}