#include <calculator.h>
#include <mock_add.h>
#include <mock_divide.h>
#include <unity.h>

void test_adding() {
  add_ExpectAndReturn(1, 2, 3);

  char *str = "1 + 2";
  int res = calculate(str);
  TEST_ASSERT_EQUAL_INT(res, 3);
}

void test_substracting() {
  char *str = "10 - 2";
  int res = calculate(str);
  TEST_ASSERT_EQUAL_INT(res, 8);
}

void test_substracting_negative() {
  char *str = "2 - 10";
  int res = calculate(str);
  TEST_ASSERT_EQUAL_INT(res, -8);
}

void test_dividing() {
  divide_ExpectAndReturn(10, 2, 5);
  char *str = "10 / 2";
  int res = calculate(str);
  TEST_ASSERT_EQUAL_INT(res, 5);
}
