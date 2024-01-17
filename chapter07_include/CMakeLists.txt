cmake_minimum_required(VERSION 3.22.1)
project(include
		VERSION 1.0.0
		LANGUAGES C CXX)

add_subdirectory(subdir)
include(subdir/include.cmake)