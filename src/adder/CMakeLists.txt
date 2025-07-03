cmake_minimum_required(VERSION 3.5)
project(adder C)
include(create_test)

add_library(adder src/add.c)
target_include_directories(adder PUBLIC  include)
target_include_directories(adder PRIVATE src)

cmock_generate_mock(mock_add ${CMAKE_CURRENT_SOURCE_DIR}/include/add.h)
create_test(add_test tests/add_test.c adder)