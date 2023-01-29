#the current cmake version, the code should always behave like 3.22.1
cmake_minimum_required(VERSION 3.22.1)
#       LANGUAGES C XC Fortran # would raise an error for not finding Fortran.
project(project_with_public_library
        VERSION 1.0.0
        LANGUAGES C CXX)

add_library(print_dep print_dep.cpp)
add_library(print print.cpp)
target_link_libraries(print PUBLIC print_dep)

add_executable(hello_print hello.cpp)
target_link_libraries(hello_print PRIVATE print)