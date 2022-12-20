#the current cmake version, the code should always behave like 3.25.1
cmake_minimum_required(VERSION 3.25.1)
#       LANGUAGES C XC Fortran # would raise an error for not finding Fortran.
project(a_minimal_project
        VERSION 1.0.0
        LANGUAGES C CXX)
add_executable(hello_printer hello.cpp)