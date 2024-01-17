cmake_minimum_required(VERSION 3.26.4)
project(advanced_linking
        VERSION 1.0.0
        LANGUAGES C CXX)

add_library(print_dep STATIC print_dep.cpp)
add_library(print STATIC print.cpp)
target_link_libraries(print_dep PUBLIC print)
target_link_libraries(print PUBLIC print_dep)

add_executable(hello_print hello.cpp)
#resolve circular dependency
target_link_libraries(hello_print PRIVATE $<LINK_GROUP:RESCAN, print_dep, print>)


add_library(hello2_lib_dep STATIC hello2_lib_dep.cpp)
add_library(hello2_lib_dep2 STATIC hello2_lib_dep2.cpp)
add_library(hello2_lib SHARED hello2_lib.cpp)
target_link_libraries(hello2_lib PRIVATE $<LINK_LIBRARY:WHOLE_ARCHIVE, hello2_lib_dep, hello2_lib_dep2>)

add_executable(hello2_print hello2.cpp)
target_link_libraries(hello2_print PRIVATE hello2_lib)

add_executable(hello3_print hello3.cpp)
add_library(hello3_lib OBJECT hello2_lib.cpp)
add_library(hello3_lib_dep STATIC hello2_lib_dep.cpp)
set_target_properties(hello3_lib PROPERTIES
  INTERFACE_LINK_LIBRARIES_DIRECT hello3_lib_dep
)
target_link_libraries(hello3_print PRIVATE hello3_lib)

