unity_add_test(calculator_test calculator_test.c calculator)

# get_filename_component( test_src_absolute tests/calculator_test.c REALPATH )
# add_custom_command    (OUTPUT calculator_test_runner.c
#   COMMAND
#     ruby ${CMAKE_SOURCE_DIR}/vendor/Unity/auto/generate_test_runner.rb
#     ${CMAKE_SOURCE_DIR}/cmake_common/project.yml
#     ${test_src_absolute} calculator_test_runner.c
#   DEPENDS tests/calculator_test.c
#   WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/tests/runners
# )

# add_executable        (calculator_test tests/calculator_test_runner.c)
# target_link_libraries (calculator_test unity calculator)
# add_test              (calculator_test calculator_test)

# target_link_libraries(calculator_test maths)
