cmake_minimum_required(VERSION 3.22.1)
project(project_packaging VERSION 1.0.0 LANGUAGES C CXX)
add_library(print SHARED print_lib.cpp)
add_executable(main main.cpp)
target_link_libraries(main print)

include(GNUInstallDirs)
set(CMAKE_INSTALL_PREFIX "${CMAKE_CURRENT_SOURCE_DIR}/install")

install(TARGETS main
  DESTINATION ${CMAKE_INSTALL_BINDIR}
)

install(TARGETS print
  EXPORT pj
  DESTINATION ${CMAKE_INTALL_LIBDIR}
  FILE_SET HEADERS)

install(EXPORT pj
  DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/pj
  NAMESPACE pj::
  FILE pjConfig.cmake
)

add_subdirectory(packaging)

