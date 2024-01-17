cmake_minimum_required(VERSION 3.22.1)
project(project_library VERSION 1.0.0 LANGUAGES C CXX)

add_library(depen SHARED depen.cpp)
add_library(print_hidden SHARED test_symbol.cpp)
target_link_libraries(print_hidden PUBLIC depen)

# objdump -t  build/libprint_all.so | sort
# objdump -t  build/libprint_hidden.so | sort
# We can see symbols are libprint_hidden.so has l visibility now!
# Meanwhile, the md5sum is different as well
set_target_properties(print_hidden PROPERTIES CXX_VISIBILITY_PRESET hidden VISIBILITY_INLINES_HIDDEN TRUE)
add_library(print_all SHARED test_symbol.cpp)
target_link_libraries(print_all PUBLIC depen)
add_executable(test_symbol_main test_symbol_main.cpp)
target_link_libraries(test_symbol_main print_all) # print_hidden would throw error
