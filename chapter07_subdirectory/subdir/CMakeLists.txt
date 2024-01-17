message("sub:CMAKE_SOURCE_DIR = ${CMAKE_SOURCE_DIR}")
message("sub:CMAKE_BINARY_DIR = ${CMAKE_BINARY_DIR}")
message("sub:CMAKE_CURRENT_SOURCE_DIR = ${CMAKE_CURRENT_SOURCE_DIR}")
message("sub:CMAKE_CURRENT_BINARY_DIR = ${CMAKE_CURRENT_BINARY_DIR}")

message("Child (before): myVar = ${myVar}")
message("Child (before): childVar = ${childVar}")
set(myVar bar)
set(childVar fuzz)
message("Child (after): myVar = ${myVar}")
message("Child (after): childVar = ${childVar}")

set(pVar level1 PARENT_SCOPE)
#one level only
add_subdirectory(subdir_subdir)
message("Child pVar = ${pVar}, parent_scope is not recursive")
