function(create_test test_name test_src test_dep)
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

# Generates a mock library based on a module's header file
function(cmock_generate_mock MOCK_NAME HEADER)
  get_filename_component(CMOCK_HEADER_DIR ${HEADER} DIRECTORY)

  set(CMOCK_CWD ${CMAKE_CURRENT_SOURCE_DIR}/tests)
  set(CMOCK_MOCK_DIR ${CMOCK_CWD}/mocks)
  set(CMOCK_RUBY_SCRIPT ${CMAKE_SOURCE_DIR}/vendor/cmock/lib/cmock.rb)
  file(MAKE_DIRECTORY ${CMOCK_MOCK_DIR})

  if(NOT EXISTS "${CMOCK_CWD}/cmock_config.yml")
    message(FATAL_ERROR "${CMOCK_CWD}/cmock_config.yml does not exist!")
  endif()

  add_custom_command (
    OUTPUT ${CMOCK_MOCK_DIR}/${MOCK_NAME}.c
    COMMAND ruby
            ${CMOCK_RUBY_SCRIPT}
            -o${CMOCK_CWD}/cmock_config.yml
            ${HEADER}
    WORKING_DIRECTORY ${CMOCK_CWD}
    DEPENDS ${HEADER})
  
  add_library(${MOCK_NAME} ${CMOCK_MOCK_DIR}/${MOCK_NAME}.c)
  target_link_libraries(${MOCK_NAME} unity cmock)
  target_include_directories(${MOCK_NAME} 
    PUBLIC  ${CMOCK_HEADER_DIR} ${MOCK_NAME}
    PUBLIC  ${CMOCK_MOCK_DIR}
  )
  
endfunction()