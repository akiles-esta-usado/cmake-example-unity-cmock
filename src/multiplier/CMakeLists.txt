cmake_minimum_required(VERSION 3.5)

add_library(multiplier src/multiply.c)
target_include_directories(multiplier PUBLIC include)