cmock_generate_mock(mock_add ../include/add.h)
unity_add_test(add_test add_test.c adder)
# cmock_add_test(add_test_cmock add_test_cmock.c adder) # Does not work