cmake_minimum_required(VERSION 3.5)
project(adder C)
include(create_test)

add_library(adder src/add.c)
target_include_directories(adder
  PUBLIC  include
  PRIVATE src
)

cmock_generate_mock(mock_add ${CMAKE_CURRENT_SOURCE_DIR}/include/add.h)
unity_add_test(add_test tests/add_test.c adder)
# cmock_add_test(add_test_cmock tests/add_test_cmock.c adder) # Does not work