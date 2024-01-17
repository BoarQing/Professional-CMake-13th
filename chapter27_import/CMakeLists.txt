cmake_minimum_required(VERSION 3.22.1)
project(project_installing VERSION 1.0.0 LANGUAGES C CXX)
find_package(pj HINTS ${CMAKE_CURRENT_LIST_DIR}/../chapter27_installing/install/lib/cmake REQUIRED file_lib)

add_executable(main main.cpp)
target_link_libraries(main pj::file_lib)