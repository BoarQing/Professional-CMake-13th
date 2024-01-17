cmake_minimum_required(VERSION 3.26.4)
macro(highjackcted_message method dep)
    if("${method}" STREQUAL "FIND_PACKAGE")
        message("highjacked FIND_PACKAGE ${dep}")
    else()
        message("not implemented")
    endif()
endmacro()


cmake_language(
  SET_DEPENDENCY_PROVIDER highjackcted_message
  SUPPORTED_METHODS FIND_PACKAGE
)