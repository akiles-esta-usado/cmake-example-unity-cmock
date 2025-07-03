cmock_generate_mock(mock_add ../include/add.h)
unity_add_test(
  add_test    # target name
  add_test.c  # .c
  adder       # linked libraries
  )

cmock_add_test(
  add_test_cmock    # target name
  add_test_cmock.c  # .c
  adder mock_add    # linked libraries
  ) # Does not work