cmake_minimum_required(VERSION 3.22.1)
project(basic_property
		VERSION 1.0.0
		LANGUAGES C CXX)
        
        
add_executable(hello hello.cpp)

#just some unused properties
set_property(
    SOURCE hello.c
    PROPERTY hello_properties first
)
get_property(
	result_property
	SOURCE hello.c
	PROPERTY hello_properties
) 
message("source property: ${result_property}")

set_property(
    TARGET hello
    PROPERTY hello_properties first
)
get_property(
	result_property
	TARGET hello
	PROPERTY hello_properties
)
message("target property: ${result_property}")

set_property(
    GLOBAL
    PROPERTY global_properties first
)
get_property(
	result_property
	GLOBAL
	PROPERTY global_properties
)
message("global property: ${result_property}")

set_property(
    DIRECTORY ${CURRRNT_SOURCE_DIR}
    PROPERTY dir_properties first second third
)
get_property(
    result_property
	DIRECTORY ${CURRENT_SOURCE_DIR}
	PROPERTY dir_properties
)
message("directory property: ${result_property}")

set_property(
    DIRECTORY ${CURRENT_SOURCE_DIR}
    APPEND
    PROPERTY dir_properties fourth 
)
get_property(
    result_property
	DIRECTORY ${CURRENT_SOURCE_DIR}
	PROPERTY dir_properties
)
message("directory property: ${result_property}")

set_property(
	DIRECTORY ${CURRENT_SOURCE_DIR}
	APPEND_STRING
	PROPERTY dir_properties fifth
)
get_property(
    result_property
	DIRECTORY ${CURRENT_SOURCE_DIR}
	PROPERTY dir_properties
)
message("directory property: ${result_property}")
get_property(
    result_property
	DIRECTORY ${CURRENT_SOURCE_DIR}
	PROPERTY dir_properties
    SET
)
set_property(
	DIRECTORY ${CURRENT_SOURCE_DIR}
	PROPERTY dir_properties true
)
message("directory property set: ${result_property}")
get_property(
    result_property
	DIRECTORY ${CURRENT_SOURCE_DIR}
	PROPERTY dir_properties
    DEFINED
)
message("directory property defined: ${result_property}")

define_property(
    DIRECTORY
    PROPERTY dir_properties
    BRIEF_DOCS testing_variable
    FULL_DOCS testing_variable2
)

get_property(
    result_property
	DIRECTORY ${CURRENT_SOURCE_DIR}
	PROPERTY dir_properties
    DEFINED
)
message("directory property defined: ${result_property}")
