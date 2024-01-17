cmake_minimum_required(VERSION 3.22.1)
project(generator_expression
		VERSION 1.0.0
		LANGUAGES C CXX)

# no .a generated!
add_library(print_debug OBJECT print_debug.cpp)
add_library(print_release OBJECT print_release.cpp)
add_executable(hello hello.cpp $<IF:$<CONFIG:Debug>, $<TARGET_OBJECTS:print_debug>, $<TARGET_OBJECTS:print_release>>)


set(dirs here there)

# OK: Whole generator expression is quoted
set_target_properties(hello PROPERTIES
    CUSTOM_INC "-I$<JOIN:${dirs}, -I>"
)
get_property(result_var
    TARGET hello
    PROPERTY CUSTOM_INC
)
message("result_var =  ${result_var}")