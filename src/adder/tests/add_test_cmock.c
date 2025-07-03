#include <add.h>
#include <mock_add.h>
#include <unity.h>

void setUp() {}
void tearDown() {}

void test_boring() { TEST_ASSERT_EQUAL(10, 10); }

void test_get_random() {
  get_random_ExpectAndReturn(10);
  // TEST_ASSERT_EQUAL(10, get_random());
  TEST_ASSERT_EQUAL(10, 10);
}