cmake_minimum_required(VERSION 3.22.1)
project(project
		VERSION 1.0.0
		LANGUAGES C CXX)

message("Top level:")
if(CMAKE_CURRENT_SOURCE_DIR STREQUAL CMAKE_SOURCE_DIR)
    message("CMAKE_CURRENT_SOURCE_DIR = CMAKE_SOURCE_DIR at ${CMAKE_CURRENT_SOURCE_DIR}")
endif()

if(PROJECT_IS_TOP_LEVEL)
    message("${CMAKE_CURRENT_SOURCE_DIR} is top level")
endif()
message("PROJECT_SOURCE_DIR = ${PROJECT_SOURCE_DIR}")
message("topLevel_SOURCE_DIR = ${project_SOURCE_DIR}")

add_subdirectory(subdir)