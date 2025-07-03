cmake_minimum_required(VERSION 3.5)
project(calculator C)
set(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake_common)

include(CTest)

add_subdirectory(src/substractor)
add_subdirectory(src/adder)
add_subdirectory(src/multiplier)
add_subdirectory(src/divider)
add_subdirectory(src/calculator)

add_subdirectory(vendor)


