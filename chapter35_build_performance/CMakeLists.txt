# Preamble
cmake_minimum_required(VERSION 3.21)
project(project_build_performance)
enable_testing()
option(CMAKE_UNITY_BUILD "Enable unity builds")
# Project wide setup
list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_LIST_DIR}/cmake)
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED YES)
set(CMAKE_CXX_EXTENSIONS NO)

# Main targets built by this project
add_subdirectory(src)