#include <mock_add.h>
#include <unity.h>

void setUp() {}
void tearDown() {}

void test_boring() { TEST_ASSERT_EQUAL(10, 10); }

void test_get_random() {
  // This test just verifies the behaviour of cmock, Is not a validation over
  // adder. mock_add might be useful on Calculator
  double_random_ExpectAndReturn(2 * 42);
  TEST_ASSERT_EQUAL(2 * 42, double_random());
}
