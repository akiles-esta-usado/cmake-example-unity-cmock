include(create_test)

cmock_add_test(calculator_test
  calculator_test.c
  calculator mock_add mock_divide
)
