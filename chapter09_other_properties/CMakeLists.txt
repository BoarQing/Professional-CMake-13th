cmake_minimum_required(VERSION 3.22.1)
project(other_properties
		VERSION 1.0.0
		LANGUAGES C CXX)

add_executable(hello hello.cpp)


set_directory_properties(PROPERTIES first_property first second_property second)

get_directory_property(resultVar first_property)
message("first_property = ${resultVar}")
get_directory_property(resultVar second_property)
message("second_property = ${resultVar}")

define_property(
    DIRECTORY
    PROPERTY dir_properties
    BRIEF_DOCS testing_variable
    FULL_DOCS testing_variable2
)
set(second "a varialbe in this scope")
get_directory_property(resultVar DEFINITION second)
message("definition = ${resultVar}")


set_target_properties(hello
    PROPERTIES
    first_property first
    second_property second
)
get_target_property(resultVar hello first_property)
message("first_property = ${resultVar}")
get_target_property(resultVar hello second_property)
message("second_property = ${resultVar}")

set_source_files_properties(hello.cpp
    PROPERTIES
    first_property first
    second_property second
)
get_source_file_property(resultVar hello first_property)
message("first_property = ${resultVar}")
get_source_file_property(resultVar hello second_property)
message("second_property = ${resultVar}")

# set_tests_properties(test1 [test2...]
#     PROPERTIES
#     propertyName1 value1
#     [propertyName2 value2] ...
# )
# get_test_property(resultVar test propertyName)