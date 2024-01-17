cmake_minimum_required(VERSION 3.22.1)
project(project_external_project VERSION 1.0.0 LANGUAGES C CXX)

include(ExternalProject)
ExternalProject_Add(zlib
    SOURCE_DIR ${CMAKE_CURRENT_LIST_DIR}/zlib
    INSTALL_DIR ${CMAKE_CURRENT_BINARY_DIR}/install
    URL https://zlib.net/zlib-1.3.tar.gz
    URL_HASH SHA256=ff0ba4c292013dbc27530b3a81e1f9a813cd39de01ca5e0f8bf355702efa593e
    CMAKE_ARGS -DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR>
)
ExternalProject_Add(libpng
    SOURCE_DIR ${CMAKE_CURRENT_LIST_DIR}/libpng
    INSTALL_DIR ${CMAKE_CURRENT_BINARY_DIR}/install
    URL http://prdownloads.sourceforge.net/libpng/libpng-1.6.40.tar.gz
    URL_HASH SHA256=8f720b363aa08683c9bf2a563236f45313af2c55d542b5481ae17dd8d183bb42
    CMAKE_ARGS -DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR>
    -DCMAKE_PREFIX_PATH:PATH=<INSTALL_DIR>
)
ExternalProject_Add_StepDependencies(libpng configure zlib)
