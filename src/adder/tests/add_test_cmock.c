#include <add.h>
#include <mock_add.h>
#include <unity.h>

void setUp() {}
void tearDown() {}

void test_get_random() {
  get_random_ExpectAndReturn(10);
  TEST_ASSERT_EQUAL(10, get_random());
}

// int main(void) {
//   UNITY_BEGIN();
//   RUN_TEST(test_add_positive_numbers);
//   RUN_TEST(test_add_to_zero);
//   return UNITY_END();
// }
