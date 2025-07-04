cmake_minimum_required(VERSION 3.5)

add_library(adder src/add.c)
target_include_directories(adder PUBLIC include)

add_subdirectory(tests)
