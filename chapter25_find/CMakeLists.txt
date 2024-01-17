cmake_minimum_required(VERSION 3.22.1)
project(project_find VERSION 1.0.0 LANGUAGES C CXX)

set(CMAKE_FIND_DEBUG_MODE TRUE)
find_file(ls_position ls)
set(CMAKE_FIND_DEBUG_MODE FALSE)
# /usr/bin/ls
message("ls is at ${ls_position}")
# cat_position-NOTFOUN
find_file(cat_position cat
    NO_SYSTEM_ENVIRONMENT_PATH)
message("cat is at ${cat_position}")
# /usr/bin/cat
find_file(cat_position cat
    PATH "/usr/bin"
    NO_SYSTEM_ENVIRONMENT_PATH)
message("cat is at ${cat_position}")

find_library(cuda_position cuda)
message("cuda lib is at ${cuda_position}")

find_package(Thrust REQUIRED CONFIG
  PATHS /usr/local/cuda-12.3/targets/x86_64-linux/lib/cmake/thrust/)
thrust_create_target(Thrust)
if(TARGET Thrust)
  message("FOUND")
endif()