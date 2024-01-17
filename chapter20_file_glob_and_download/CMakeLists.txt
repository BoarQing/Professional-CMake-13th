cmake_minimum_required(VERSION 3.22.1)
project(project_file_glob_and_download
        VERSION 1.0.0
        LANGUAGES C CXX)

# do not use glob for sources file of a build
# glob does not rerun when files are removed
# CONFIGURE_DEPENDS is not fully supported
file(GLOB glob_list
    RELATIVE ${CMAKE_CURRENT_SOURCE_DIR}
    *.txt)

message("glob files = ${glob_list}")

file(GLOB glob_list
    *.txt)
message("glob files full path = ${glob_list}")

file(GLOB_RECURSE glob_list
    RELATIVE ${CMAKE_CURRENT_SOURCE_DIR}
    LIST_DIRECTORIES true
    *.txt)
message("glob recurseive files and directories = ${glob_list}")

file(GLOB glob_list
    LIST_DIRECTORIES true
    "/*")
message("glob files and directories from project root = ${glob_list}")

file(DOWNLOAD "https://www.python.org/ftp/python/3.9.13/python-3.9.13-embed-amd64.zip" "${CMAKE_CURRENT_BINARY_DIR}/python.zip"
    SHOW_PROGRESS
    TIMEOUT 30
)