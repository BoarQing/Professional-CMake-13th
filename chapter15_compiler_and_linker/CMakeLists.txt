cmake_minimum_required(VERSION 3.22.1)
project(compiler_and_linker
        VERSION 1.0.0
        LANGUAGES C CXX)
# for purpose of learning, used some code from chapter 4

string(APPEND CMAKE_CXX_FLAGS " -Wall -Wextra")


add_library(print_dep print_dep.cpp)
#this is transitive
target_include_directories(print_dep PUBLIC ${PROJECT_SOURCE_DIR}/../chapter4_public_library)
add_library(print print.cpp)
#itself will not have the def, but everything it links to will
target_compile_definitions(print INTERFACE NEWPT)
#depends on print_dep when link to print_dep
target_link_libraries(print PUBLIC print_dep)

add_executable(hello_print)
target_sources(hello_print PRIVATE hello.cpp)
target_compile_options(hello_print PRIVATE -O2)
target_compile_definitions(hello_print PRIVATE INCRE)
target_link_libraries(hello_print PRIVATE print)

set_target_properties(hello_print PROPERTIES
    LINK_OPTIONS LINKER:-stats # timing
)
target_compile_options(hello_print PRIVATE
$<$<COMPILE_LANGUAGE:CXX>:-fno-exceptions>
)

get_property(include_dir
    TARGET print_dep
    PROPERTY INCLUDE_DIRECTORIES
)
message("print_dep INCLUDE_DIRECTORIES = ${include_dir}")

get_property(interface_include_dir
    TARGET print_dep
    PROPERTY INTERFACE_INCLUDE_DIRECTORIES
)
message("print_dep INTERFACE_INCLUDE_DIRECTORIES = ${interface_include_dir}")

get_property(compile_def
    TARGET hello_print
    PROPERTY COMPILE_OPTIONS
)
message("print COMPILE_OPTIONS = ${compile_def}")

get_property(interface_compile_def
    TARGET hello_print
    PROPERTY INTERFACE_COMPILE_OPTIONS
)
message("print INTERFACE_COMPILE_OPTIONS = ${interface_compile_def}")

get_property(target_sources
    TARGET hello_print
    PROPERTY SOURCES)

message("hello_print SOURCES = ${target_sources}")




