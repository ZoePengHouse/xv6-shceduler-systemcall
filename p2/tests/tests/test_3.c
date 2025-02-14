#include "types.h"
#include "stat.h"
#include "user.h"

#define MAX_NAME_LEN 256

int main(int argc, char* argv[]) {
  char parent_name[MAX_NAME_LEN];
  char child_name[MAX_NAME_LEN];

  int empty_buffer_length = 0;

  if (getparentname(parent_name, child_name, empty_buffer_length, MAX_NAME_LEN) < 0 &&
    getparentname(parent_name, child_name, MAX_NAME_LEN, empty_buffer_length) < 0) {
    printf(1, "XV6_TEST_OUTPUT Zero buffer length handled correctly.\n");
    exit();
  }

  printf(2, "XV6_TEST_ERROR Test failed! Zero buffer length not handled correctly.\n");
  exit();
}