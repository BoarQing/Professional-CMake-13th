cmake_minimum_required(VERSION 3.22.1)
project(project_consumable
        VERSION 1.0.0
        LANGUAGES C CXX)
include(GNUInstallDirs)

add_library(MyProj_print_lib SHARED print_lib.cpp)
add_library(MyProj::print_lib ALIAS MyProj_print_lib)

set_target_properties(MyProj_print_lib PROPERTIES
    OUTPUT_NAME MyProjPrintLib # not ideal, use snake case
    EXPORT_NAME PrintLib
)
set_target_properties(MyProj_print_lib PROPERTIES
    print_lib_VERSION 1.2.3)

install(TARGETS MyProj_print_lib EXPORT MyProj)
install(EXPORT MyProj 
    DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/pj
    NAMESPACE MyProj::)

if(${PROJECT_IS_TOP_LEVEL})
    # only add test here
    message("TOP LEVEL PROJECT")
else()
    message("NOT TOP LEVEL PROJECT")
endif()
