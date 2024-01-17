cmake_minimum_required(VERSION 3.22.1)
project(version
        VERSION 5.4.3.2
        LANGUAGES C CXX)

message(${PROJECT_VERSION})
message(${PROJECT_VERSION_MAJOR})
message(${PROJECT_VERSION_MINOR})
message(${PROJECT_VERSION_PATCH})
message(${PROJECT_VERSION_TWEAK})

message(${CMAKE_PROJECT_VERSION})
message(${CMAKE_PROJECT_VERSION_MAJOR})
message(${CMAKE_PROJECT_VERSION_MINOR})
message(${CMAKE_PROJECT_VERSION_PATCH})
message(${CMAKE_PROJECT_VERSION_TWEAK})

message(${version_VERSION})
message(${version_VERSION_MAJOR})
message(${version_VERSION_MINOR})
message(${version_VERSION_PATCH})
message(${version_VERSION_TWEAK})


add_executable(print_version print_version.cpp)
add_definitions(-DPROJECT_VERSION_DEF=\"${version_VERSION}\")

add_executable(print_version_single_def print_version_single_def.cpp)
get_source_file_property(defs print_version_single_def.cpp COMPILE_DEFINITIONS)
list(APPEND defs "SINGLE_VERSION_DEF=\"${version_VERSION}\"")
set_source_files_properties(print_version_single_def.cpp PROPERTIES
  COMPILE_DEFINITIONS "${defs}"
)

configure_file(version_config.h.in version_config.h @ONLY)
add_executable(print_config print_config.cpp)
target_include_directories(print_config PRIVATE "${CMAKE_CURRENT_BINARY_DIR}")

find_package(Git REQUIRED)
execute_process(
  COMMAND ${GIT_EXECUTABLE} rev-parse HEAD
  RESULT_VARIABLE result
  OUTPUT_VARIABLE GIT_HASH
  OUTPUT_STRIP_TRAILING_WHITESPACE
)
if(result)
  message(FATAL_ERROR "Failed to get git hash: ${result}")
endif()
configure_file(git_version.cpp.in git_version.cpp @ONLY)
add_executable(git_version ${CMAKE_CURRENT_BINARY_DIR}/git_version.cpp)