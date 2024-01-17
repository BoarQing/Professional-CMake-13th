# Preamble
cmake_minimum_required(VERSION 3.21)
project(project_organization)
enable_testing()

# Project wide setup
list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_LIST_DIR}/cmake)
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED YES)
set(CMAKE_CXX_EXTENSIONS NO)

# Externally provided content brought into the current scope.
# See discussion below for why this is different.
include(dependencies.cmake)
# Main targets built by this project
add_subdirectory(src)

# Not typically needed if there is a parent project
if(PROJECT_IS_TOP_LEVEL)
  add_subdirectory(tests)
  add_subdirectory(packaging)
endif()
