cmake_minimum_required(VERSION 3.26.4)
project(project_external_project VERSION 1.0.0 LANGUAGES C CXX)

include(FetchContent)
FetchContent_Declare(googletest
  GIT_REPOSITORY https://github.com/google/googletest.git
  GIT_TAG f8d7d77c06936315286eb55f8de22cd23c188571 # release-1.8.0
  FIND_PACKAGE_ARGS NAMES GTest
)
FetchContent_MakeAvailable(googletest)


enable_testing()
add_executable(test_main test_main.cpp)
target_link_libraries(test_main GTest::gtest_main)