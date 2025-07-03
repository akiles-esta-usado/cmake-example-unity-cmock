#include <add.h>
#include <unity.h>

void test_add_positive_numbers() {
  TEST_ASSERT_EQUAL(10, add(4, 6));
  TEST_ASSERT_EQUAL(20, add(14, 6));
}

void test_add_to_zero() { TEST_ASSERT_EQUAL(5, add(0, 5)); }

void test_random_number() {
  TEST_ASSERT_EQUAL(42, get_random());
  TEST_ASSERT_EQUAL(84, double_random());
}