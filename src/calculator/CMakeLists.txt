cmake_minimum_required(VERSION 3.5)
project(calculator C)

add_library(calculator src/calculator.c)
target_include_directories(calculator PUBLIC include)
target_link_libraries(calculator adder multiplier divider substractor)

add_executable(calculator_app src/calculator_app.c)
target_link_libraries(calculator_app calculator)

add_subdirectory(tests)