cmake_minimum_required(VERSION 3.22.1)
project(project_copy_file
        VERSION 1.0.0
        LANGUAGES C CXX)

set(path "/workspace/a.b.c")

cmake_path(GET path ROOT_NAME root)
message("root = ${root}")
cmake_path(GET path ROOT_DIRECTORY root_directory)
message("root_directory = ${root_directory}")
cmake_path(GET path ROOT_PATH root_path)
message("root_path = ${root_path}")

cmake_path(GET path FILENAME filename)
message("filename = ${filename}")
cmake_path(GET path EXTENSION two_extension)
message("two_extension = ${two_extension}")
cmake_path(GET path STEM filename_without_extension)
message("filename_without_extension = ${filename_without_extension}")
cmake_path(GET path STEM LAST_ONLY filename_without_extension_last_only)
message("filename_without_extension_last_only = ${filename_without_extension_last_only}")

cmake_path(GET path RELATIVE_PART relative_part)
message("relative_part = ${relative_part}")
cmake_path(GET path PARENT_PATH parent_path)
message("parent_path = ${parent_path}")

cmake_path(SET path NORMALIZE "/tmp")
message("normalized path = ${path}")

# different on windows
cmake_path(IS_ABSOLUTE path is_path_absolute)
message("${path} is absolute ${is_path_absolute}")

cmake_path(IS_RELATIVE path is_path_relative)
message("${path} is relative ${is_path_relative}")

cmake_path(HAS_EXTENSION path has_extension)
message("${path} has extension ${has_extension}")

# CMAKE_CURRENT_SOURCE_DIR
cmake_path(RELATIVE_PATH path
    OUTPUT_VARIABLE res)

cmake_path(RELATIVE_PATH path
    BASE_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
    OUTPUT_VARIABLE res)
    message("relative path between ${CMA} and ${path} is ${res}")

set(base_dir "/")
message("relative path between ${CMAKE_CURRENT_SOURCE_DIR} and ${path} is ${res}")

cmake_path(ABSOLUTE_PATH path
    BASE_DIRECTORY base_dir
    OUTPUT_VARIABLE res)

message("absolute path between ${base_dir} and ${path} is ${res}")

set(path "C:/a/b/c/../")
cmake_path(NORMAL_PATH path OUTPUT_VARIABLE res)
message("normal path ${path} is ${res}")

# might be different on Windows
cmake_path(NATIVE_PATH path NORMALIZE res)
message("native path ${path} is ${res}")

set(FOO "String with spaces")
# move file to tmp directory, done at configuration
configure_file(testing_move_file "/tmp/testing_move_file")
# move to current binary directory
configure_file(testing_move_file "testing_move_file_original")
configure_file(testing_move_file "testing_move_file_no_per" NO_SOURCE_PERMISSIONS)
configure_file(testing_move_file "testing_move_file_copy_only" COPYONLY)
configure_file(testing_move_file "testing_move_file_@_only" @ONLY)
configure_file(testing_move_file "testing_move_file_no_quote" ESCAPE_QUOTES)

string(CONFIGURE "@CMAKE_CURRENT_SOURCE_DIR@" current_dir)
message("string configure @CMAKE_CURRENT_SOURCE_DIR@ to ${current_dir}")

file(CONFIGURE
  OUTPUT string_file
  CONTENT "Hey" 
)
# copy folder into
file(COPY testing_copy_folder DESTINATION ${CMAKE_CURRENT_BINARY_DIR})

# copy content
file(COPY testing_copy_folder/ DESTINATION ${CMAKE_CURRENT_BINARY_DIR})

file(COPY testing_move_file
  DESTINATION ${CMAKE_CURRENT_BINARY_DIR}
  FILE_PERMISSIONS
  OWNER_READ OWNER_WRITE OWNER_EXECUTE
  GROUP_READ GROUP_EXECUTE
  WORLD_READ WORLD_EXECUTE
)

# print install log
# up-to-date
file(INSTALL testing_move_file
  DESTINATION ${CMAKE_CURRENT_BINARY_DIR}
  FILE_PERMISSIONS
  OWNER_READ OWNER_WRITE OWNER_EXECUTE
  GROUP_READ GROUP_EXECUTE
  WORLD_READ WORLD_EXECUTE
)

# my_private.h excluded
file(COPY "testing_regex_folder"
  DESTINATION ${CMAKE_CURRENT_BINARY_DIR}
  FILES_MATCHING
  REGEX .*_private\.h EXCLUDE
  PATTERN *.txt
  PATTERN *.h
  PERMISSIONS OWNER_READ OWNER_WRITE OWNER_EXECUTE
)