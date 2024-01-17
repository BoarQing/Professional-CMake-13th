cmake_minimum_required(VERSION 3.22.1)
project(project_library
        VERSION 1.0.0
        LANGUAGES C CXX)
add_library(print_lib SHARED print.cpp)
set_target_properties(print_lib PROPERTIES
    VERSION 2.4.3
    SOVERSION 2
)

add_library(print_lib_3 SHARED print.cpp)
set_target_properties(print_lib_3 PROPERTIES
    VERSION 3.4.3
    SOVERSION 3
)
# use find_library VERSION 3

add_library(print_inter SHARED print.cpp)
set_target_properties(print_inter PROPERTIES
  COMPATIBLE_INTERFACE_BOOL SSL_SUPPORT
  INTERFACE_SSL_SUPPORT YES
)
add_library(print_inter2 SHARED print2.cpp)
set_target_properties(print_inter2 PROPERTIES
  COMPATIBLE_INTERFACE_BOOL SSL_SUPPORT
  INTERFACE_SSL_SUPPORT YES # if false, CMake Error is throwed
)

add_executable(main_inter main2.cpp)
target_link_libraries(main_inter print_inter print_inter2)



target_compile_definitions(main_inter PRIVATE
  $<$<BOOL:$<TARGET_PROPERTY:SSL_SUPPORT>>:HAVE_SSL>)

add_library(print_inter2_pub_3 SHARED print3.cpp)
set_target_properties(print_inter2_pub_3 PROPERTIES
  COMPATIBLE_INTERFACE_BOOL SSL_SUPPORT
  INTERFACE_SSL_SUPPORT YES
)

add_library(print_inter2_pub SHARED print.cpp)
set_target_properties(print_inter2 PROPERTIES
  COMPATIBLE_INTERFACE_BOOL SSL_SUPPORT
  INTERFACE_SSL_SUPPORT NO
)
target_link_libraries(print_inter2_pub_3 PUBLIC print_inter2_pub)

add_executable(main_inter_pub main3.cpp) #transitive link HAVE_SSL not set
target_link_libraries(main_inter_pub print_inter2_pub_3)
target_compile_definitions(main_inter PRIVATE
  $<$<BOOL:$<TARGET_PROPERTY:SSL_SUPPORT>>:HAVE_SSL>)