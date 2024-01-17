cmake_minimum_required(VERSION 3.26.4)
project(project_presets VERSION 1.0.0 LANGUAGES C CXX)
include(GNUInstallDirs)
add_executable(my_proj_main main.cpp)
add_executable(my_proj::main ALIAS my_proj_main)


set_target_properties(my_proj_main PROPERTIES
    OUTPUT_NAME my_proj_main
    EXPORT_NAME main
)

install(TARGETS my_proj_main EXPORT my_proj)
install(EXPORT my_proj 
    DESTINATION ${CMAKE_INSTALL_PREFIX}/cmake/pj
    NAMESPACE my_proj::)