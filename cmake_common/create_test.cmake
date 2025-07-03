# Creates a unity test
function(unity_add_test test_name test_src test_dep)
  get_filename_component( test_src_absolute ${test_src} REALPATH )
  add_custom_command    (OUTPUT ${test_name}_runner.c
    COMMAND
    ruby ${CMAKE_SOURCE_DIR}/vendor/Unity/auto/generate_test_runner.rb
    ${CMAKE_SOURCE_DIR}/cmake_common/project.yml
    ${test_src_absolute} ${test_name}_runner.c
    DEPENDS ${test_src})
  add_executable        (${test_name} ${test_src} ${test_name}_runner.c)
  target_link_libraries (${test_name} unity)
  target_link_libraries (${test_name} ${test_dep})
  add_test              (${test_name} ${test_name})
endfunction()

# INTERNAL
# Defines useful variables for cmock functions
# requires: work on "tests" directory
function(_cmock_set_variables)
  set(_CMOCK_CWD         ${CMAKE_CURRENT_SOURCE_DIR} PARENT_SCOPE)
  set(_CMOCK_MOCK_DIR    ${CMAKE_CURRENT_SOURCE_DIR}/mocks PARENT_SCOPE)
  set(_CMOCK_RUBY_SCRIPT ${CMAKE_SOURCE_DIR}/vendor/cmock/lib/cmock.rb PARENT_SCOPE)
endfunction()

# Generates a mock library based on a module's header file
# arguments:
#   MOCK_NAME   target name
#   HEADER      used to generate the mock
# requires: a file called cmock_config.yml on the tests directory
function(cmock_generate_mock MOCK_NAME HEADER)
  _cmock_set_variables()

  if(NOT EXISTS "${_CMOCK_CWD}/cmock_config.yml")
    message(FATAL_ERROR "${_CMOCK_CWD}/cmock_config.yml does not exist!")
  endif()

  file(MAKE_DIRECTORY ${_CMOCK_MOCK_DIR})

  add_custom_command (
    OUTPUT ${_CMOCK_MOCK_DIR}/${MOCK_NAME}.c
    COMMAND ruby
            ${_CMOCK_RUBY_SCRIPT}
            -o${_CMOCK_CWD}/cmock_config.yml
            ${HEADER}
    WORKING_DIRECTORY ${_CMOCK_CWD}
    DEPENDS ${HEADER})
  
  get_filename_component(CMOCK_HEADER_DIR ${HEADER} DIRECTORY)

  add_library(${MOCK_NAME} ${_CMOCK_MOCK_DIR}/${MOCK_NAME}.c)
  target_link_libraries(${MOCK_NAME} unity cmock)
  target_include_directories(${MOCK_NAME} 
    PUBLIC  ${CMOCK_HEADER_DIR} ${MOCK_NAME}
    PUBLIC  ${_CMOCK_MOCK_DIR}
  )
endfunction()

# Creates a unity test linked with cmock generated mocks
function(cmock_add_test TEST_NAME TEST_SRC TEST_DEP)
  unity_add_test(${TEST_NAME} ${TEST_SRC} ${TEST_DEP})

  _cmock_set_variables()

  target_link_libraries(${TEST_NAME} cmock)
  target_include_directories(${TEST_NAME} 
    PRIVATE ${_CMOCK_MOCK_DIR}
  )
endfunction()