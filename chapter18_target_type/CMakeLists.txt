#the current cmake version, the code should always behave like 3.22.1
cmake_minimum_required(VERSION 3.22.1)
project(project_target_type
        VERSION 1.0.0
        LANGUAGES C CXX)

add_library(print_lib SHARED IMPORTED GLOBAL)
set_target_properties(print_lib PROPERTIES
        IMPORTED_LOCATION ${CMAKE_CURRENT_SOURCE_DIR}/libheader_only.so)
add_executable(main main.cpp)
target_link_libraries(main PRIVATE print_lib)

add_library(print_lib2 INTERFACE header_only.hpp)
add_library(testing::print_lib2 ALIAS print_lib2) # alias is read-only
add_executable(main2 main2.cpp)
target_link_libraries(main2 PRIVATE testing::print_lib2)

add_executable(shared_main shared_main.cpp)
add_library(print_long STATIC print_long.cpp)
add_library(print_short STATIC print_short.cpp)
add_library(print_interface INTERFACE)
target_link_libraries(print_interface INTERFACE $<IF:$<CONFIG:Debug>, print_short, print_long>)
target_link_libraries(shared_main PRIVATE print_interface)