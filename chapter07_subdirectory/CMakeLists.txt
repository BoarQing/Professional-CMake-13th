cmake_minimum_required(VERSION 3.22.1)
project(subdir
		VERSION 1.0.0
		LANGUAGES C CXX)

message("top:CMAKE_SOURCE_DIR = ${CMAKE_SOURCE_DIR}")
message("top:CMAKE_BINARY_DIR = ${CMAKE_BINARY_DIR}")
message("top:CMAKE_CURRENT_SOURCE_DIR = ${CMAKE_CURRENT_SOURCE_DIR}")
message("top:CMAKE_CURRENT_BINARY_DIR = ${CMAKE_CURRENT_BINARY_DIR}")

set(myVar foo)
message("Parent (before): myVar = ${myVar}")
message("Parent (before): childVar = ${childVar}")

set(pVar level0)
message("Parent pVar = ${pVar}")
add_subdirectory(subdir)
message("Parent pVar = ${pVar}")

message("Parent (after): Parent (after): myVar = ${myVar}")
message("childVar = ${childVar}")