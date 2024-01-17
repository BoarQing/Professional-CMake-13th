message("Child:")
if(NOT CMAKE_CURRENT_SOURCE_DIR STREQUAL CMAKE_SOURCE_DIR)
    message("CMAKE_CURRENT_SOURCE_DIR != CMAKE_SOURCE_DIR at ${CMAKE_CURRENT_SOURCE_DIR}")
endif()

message("PROJECT_SOURCE_DIR (before) = ${PROJECT_SOURCE_DIR}")
project(child)
message("PROJECT_SOURCE_DIR (after) = ${PROJECT_SOURCE_DIR}")
message("child_SOURCE_DIR = ${child_SOURCE_DIR}")

if(NOT PROJECT_IS_TOP_LEVEL)
    message("${CMAKE_CURRENT_SOURCE_DIR} is not top level")
endif()