cmake_minimum_required(VERSION 3.5)

add_library(substractor src/substract.c)
target_include_directories(substractor PUBLIC include)