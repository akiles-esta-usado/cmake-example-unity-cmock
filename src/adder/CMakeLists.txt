cmake_minimum_required(VERSION 3.5)
project(adder C)
include(create_test)

add_library(adder src/add.c)
target_include_directories(adder
  PUBLIC  include
  PRIVATE src
)

add_subdirectory(tests)