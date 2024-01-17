cmake_minimum_required(VERSION 3.22.1)
project(project_installing VERSION 1.0.0 LANGUAGES C CXX)

set(CMAKE_VERIFY_INTERFACE_HEADER_SETS TRUE)
add_library(file_lib SHARED file_reader.cpp)
add_library(pj::file_lib ALIAS file_lib)
set_target_properties(file_lib PROPERTIES
  VERSION 2.4.3
  SOVERSION 2)
# must before add_executable!
set(CMAKE_INSTALL_RPATH $ORIGIN $ORIGIN/../lib)
add_executable(main main.cpp)
target_link_libraries(main file_lib)
include(GNUInstallDirs)
set(CMAKE_INSTALL_PREFIX "${CMAKE_CURRENT_SOURCE_DIR}/install")
set(CMAKE_INSTALL_BINDIR ${CMAKE_INSTALL_PREFIX}/runtime)

target_sources(file_lib
  PUBLIC
    FILE_SET HEADERS
    FILES
      file_reader.hpp
      #error.hpp this would raise an error as vector is not included
)

install(TARGETS file_lib
  EXPORT pj
  DESTINATION ${CMAKE_INTALL_LIBDIR}
  FILE_SET HEADERS)


install(TARGETS main
  DESTINATION ${CMAKE_INSTALL_BINDIR}
)


install(EXPORT pj
  DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/pj
  NAMESPACE pj::
  FILE pjConfig.cmake
)
install(DIRECTORY data
  DESTINATION "${CMAKE_INSTALL_PREFIX}/data")