cmake_minimum_required(VERSION 3.22.1)
project(global_properties
		VERSION 1.0.0
		LANGUAGES C CXX)

#math
set(x 3)
set(y 7)
math(EXPR z "(${x}+${y}) * 2")


get_cmake_property(all_var VARIABLES)
foreach(loopVar IN LISTS all_var)
    message("property variable ${loopVar}")
endforeach()

get_cmake_property(all_var CACHE_VARIABLES)
foreach(loopVar IN LISTS all_var)
    message("property cache variable ${loopVar}")
endforeach()

get_cmake_property(all_var COMMANDS)
foreach(loopVar IN LISTS all_var)
    message("property commands ${loopVar}")
endforeach()

# no components
get_cmake_property(all_var COMPONENTS)
foreach(loopVar IN LISTS all_var)
    message("property components ${loopVar}")
endforeach()

