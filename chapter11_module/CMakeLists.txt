cmake_minimum_required(VERSION 3.22.1)
project(module
		VERSION 1.0.0
		LANGUAGES C CXX)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")
# Inject code from project-provided modules
include(sub)
find_package(sub2)


include(CheckCXXSourceCompiles)
check_cxx_source_compiles("int main() { int var; }"
	unusedNotDetected
	FAIL_REGEX "[Ww]arn"
)
if(unusedNotDetected)
	message("Unused variables do not generate warnings")
endif()

include(CheckLinkerFlag)
check_linker_flag(CXX LINKER:-stats LINKER_STATS_SUPPORTED)

include(CheckCXXSymbolExists)
check_cxx_symbol_exists(std::fopen "cstdio" HAVE_STD_FOPEN)
message("symbol std::fopen existence: ${HAVE_STD_FOPEN}")

add_library(print_lib print.cpp)