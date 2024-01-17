cmake_minimum_required(VERSION 3.22.1)
project(project_wrong_link VERSION 1.0.0 LANGUAGES C CXX)

add_library(static_lib STATIC static_lib.cpp)
add_library(dynamic_lib SHARED dynamic_lib.cpp)
target_link_libraries(dynamic_lib PRIVATE static_lib)
add_executable(x main.cpp)
target_link_libraries(x PRIVATE static_lib dynamic_lib)