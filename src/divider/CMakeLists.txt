cmake_minimum_required(VERSION 3.5)

add_library(divider src/divide.c)
target_include_directories(divider PUBLIC include)

add_subdirectory(tests)
