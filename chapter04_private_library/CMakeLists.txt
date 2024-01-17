#the current cmake version, the code should always behave like 3.22.1
cmake_minimum_required(VERSION 3.22.1)
#       LANGUAGES C XC Fortran # would raise an error for not finding Fortran.
project(project_with_private_library
        VERSION 1.0.0
        LANGUAGES C CXX)
add_library(shared_print_lib SHARED print.cpp)
#can only run with .so
add_executable(shared_hello_printer hello.cpp)

add_library(static_print_lib STATIC print.cpp)
#can run without .a
add_executable(static_hello_printer hello.cpp)

target_link_libraries(static_hello_printer PRIVATE static_print_lib)
target_link_libraries(shared_hello_printer PRIVATE shared_print_lib)