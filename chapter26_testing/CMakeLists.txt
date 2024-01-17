cmake_minimum_required(VERSION 3.22.1)
project(project_testing VERSION 1.0.0 LANGUAGES C CXX)

enable_testing()

add_executable(simple_test_app simple_test_app.cpp)
add_executable(env_test_app env_test_app.cpp)
add_test(NAME simple_test COMMAND simple_test_app)
add_test(NAME simple_test2 COMMAND simple_test_app "hello")
set_tests_properties(simple_test
  PROPERTIES DEPENDS "simple_test2"
)

add_test(NAME env_test_fail COMMAND env_test_app)
set_tests_properties(env_test_fail PROPERTIES ENVIRONMENT "test_env=1")
add_test(NAME env_test_suc COMMAND env_test_app)
set_tests_properties(env_test_suc PROPERTIES ENVIRONMENT "test_env=0")
add_test(NAME env_test_skip COMMAND env_test_skip)
set_tests_properties(env_test_suc PROPERTIES
    ENVIRONMENT "test_env=2"
    SKIP_RETURN_CODE 2)

set_tests_properties(env_test_fail PROPERTIES LABELS "env")
set_tests_properties(env_test_suc PROPERTIES LABELS "env")
set_tests_properties(env_test_skip PROPERTIES LABELS "env")

